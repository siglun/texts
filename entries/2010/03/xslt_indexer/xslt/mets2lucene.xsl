<?xml version="1.0" encoding="UTF-8" ?>
<!--

This is a xslt script that perform lucene indexing of METS documents using the
utility xsl_index. The core of this is a java class, IndexLoader, which is called
from inside this script. The index loader can create a new or update an existing
Lucene index and can then index arbitrary XML documents by creating lucene documents
while the xslt processor traverses the document.

Author Sigfrid Lundberg slu@kb.dk

Last updated $Date$ by $Author$

$Id$

-->
<xsl:transform version="1.0"
	       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:m="http://www.loc.gov/METS/"
	       xmlns:xlink="http://www.w3.org/1999/xlink" 
	       xmlns:md="http://www.loc.gov/mods/v3"
	       xmlns:xalan="http://xml.apache.org/xslt"
	       xmlns:java="http://xml.apache.org/xslt/java"
	       xmlns:str="http://exslt.org/strings"
	       xmlns:IndexLoader="xalan://dk.kb.dup.xsltIndexer.IndexLoader">

  <xsl:output encoding="UTF-8"
	      method="text"/>

  <xsl:param name="mode"            select="'create'"   />
  <xsl:param name="index_directory" select="'/dev/null'"/>
  <xsl:param name="debug_level"     select="'0'"        />
  <xsl:param name="datasource"      select="''"         />
  <xsl:param name="sourcefield"     select="''"         />
  <xsl:param name="reader"          select="''"         />
  <xsl:param name="writer"          select="''"         />
  <xsl:param name="analyzer"        select="''"         />

  <xalan:component
      prefix="IndexLoader"
      functions="open_index open_document setAnalyzer setIndexReader setIndexWriter add_field close_document close_index delete_documents encode_uri">
    <xalan:script lang="javaclass" src="xalan://dk.kb.dup.xsltIndexer.IndexLoader"/>
  </xalan:component>

  <xsl:template match="/">

    <xsl:value-of 
	select="IndexLoader:setAnalyzer($analyzer)"/>
    <xsl:value-of 
	select="IndexLoader:setIndexReader($reader)"/>
    <xsl:value-of 
	select="IndexLoader:setIndexWriter($writer)"/>

    <xsl:value-of 
	select="IndexLoader:open_index($mode,$index_directory,$debug_level)"/>

    <!-- Both the datasource and the corresponding source field come from
	 the indexing driver.
         This function call ensures that the lucene documents from a given
	 XML document are deleted prior to indexing. This is our way to
	 implement incremental update -->

    <xsl:if test="$mode='update' and $datasource and $sourcefield">
       <xsl:value-of 
	   select="IndexLoader:delete_documents($sourcefield,$datasource)"/>
    </xsl:if>
    <xsl:apply-templates select="m:mets"/>
    <xsl:value-of select="IndexLoader:close_index()"/>
  </xsl:template>

  <xsl:template match="m:mets">
    <xsl:apply-templates select="m:structMap[@type='physical']"/>
  </xsl:template>

<!--

Our METS-files contain a dirty hack, which leads to the complexity in the task
performed below. Below m:structMap there is a hierarchy of m:div elements; in
our case where the only structure described is the physical one this hierarchy is
fairly shallow.

The complexity arose from the fact that we had a single multilingual mods
description, but also multilingual order labels. Not knowing how to handle this we
took the unwise decision to repeat each div for each language. This means that the
ID isn't unique, but for the root div. Instead we have unique combinations of xml:lang
and ID.

In the root m:div we have no knowledge about the range of languages available, so
we deduce that from the range of languages available for the whole work which can be
found in a m:dmdSec with the hard coded ID md-root.

-->

  <xsl:template match="m:structMap">
    <xsl:for-each
	select="/m:mets/
		 m:dmdSec[@ID='md-root']/
		 m:mdWrap/
		 m:xmlData/
		 md:mods/
		 md:titleInfo">
      <xsl:variable name="lang">
	<xsl:value-of select="@xml:lang"/>
      </xsl:variable>
      <xsl:apply-templates select="/m:mets/m:structMap[@type='physical']/m:div">
	<xsl:with-param name="lang">
	  <xsl:value-of select="$lang"/>
	</xsl:with-param>
      </xsl:apply-templates>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="m:div">
    <xsl:param name="lang" select="'dan'"/>

    <xsl:variable name="language">
      <xsl:choose>
	<xsl:when test="@xml:lang">
	  <xsl:value-of select="@xml:lang"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$lang"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:value-of select="IndexLoader:open_document()"/>
    <!-- Both the field and the data comes from the indexing driver.
         The function call must be present in order to permit incremental
         update -->
    <xsl:if test="$datasource and $sourcefield">
      <xsl:value-of 
	  select="IndexLoader:add_field($sourcefield,
		                        $datasource,
					'store.yes',
					'un_tokenized')"/>
    </xsl:if>

    <xsl:if test="@ID">
      <xsl:value-of select="IndexLoader:add_field('divid',
			                          @ID,
			                          'store.yes',
						  'un_tokenized')"/>
    </xsl:if>
    <xsl:if test="@ORDERLABEL">
      <xsl:value-of select="IndexLoader:add_field('orderlabel',
			                          @ORDERLABEL,
						  'store.yes',
						  'un_tokenized')"/>
    </xsl:if>

    <xsl:value-of select="IndexLoader:add_field('record_lang',
                                                $language,
						'store.yes',
						'tokenized')"/>
    <xsl:call-template name="generateURI">
      <xsl:with-param name="lang">
	<xsl:value-of select="$language"/>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:if test="@DMDID">
      <xsl:variable name="goto_id" select="@DMDID"/>
      <xsl:apply-templates
	  select="//m:dmdSec[@ID=$goto_id]/m:mdWrap/m:xmlData/md:mods">
	<xsl:with-param name="lang">
	  <xsl:value-of select="$language"/>
	</xsl:with-param>
      </xsl:apply-templates>
    </xsl:if>
    <xsl:value-of select="IndexLoader:close_document()"/>
    <xsl:apply-templates select="m:div[@xml:lang=$language]"/>
  </xsl:template>

  <xsl:template match="md:mods">
    <xsl:param name="lang" select="'dan'"/>
    <xsl:apply-templates select="md:titleInfo[@xml:lang=$lang]"/>
    <xsl:apply-templates select="md:note[@xml:lang=$lang]"/>
    <xsl:apply-templates select="md:name[@xml:lang=$lang]"/>
    <xsl:apply-templates select="md:identifier"/>
  </xsl:template>

  <xsl:template match="md:titleInfo">
    <xsl:apply-templates select="md:title"/>
  </xsl:template>

  <xsl:template match="md:title">
    <xsl:value-of select="IndexLoader:add_field('title',
                                                .,
						'store.yes',
						'tokenized')"/>
  </xsl:template>

  <xsl:template match="md:note">
    <xsl:variable name="description">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:value-of select="IndexLoader:add_field('description',
			                        $description,
						'store.yes',
						'tokenized')"/>
  </xsl:template>

  <xsl:template match="md:name">
    <xsl:variable name="description">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:value-of select="IndexLoader:add_field('creator',
			                        $description,
						'store.yes',
						'tokenized')"/>
  </xsl:template>


  <xsl:template match="md:identifier[@type='signature']">
    <xsl:value-of select="IndexLoader:add_field('signature',
                                                .,
						'store.yes',
						'tokenized')"/>
  </xsl:template>

  <xsl:template match="md:relatedItem"/>

  <xsl:template name="generateURI">
    <xsl:param name="lang" select="'dan'"/>
    <xsl:variable name="application">
      <xsl:value-of select="substring-before(/m:mets/@OBJID,':')"/>
    </xsl:variable>
    <xsl:variable name="document">
      <xsl:value-of select="substring-after(/m:mets/@OBJID,':')"/>
    </xsl:variable>
    <xsl:variable name="orderlabel">
      <xsl:if test="@ORDERLABEL">
	<xsl:value-of select="concat(IndexLoader:encode_uri(@ORDERLABEL),'/')"/>
      </xsl:if>
    </xsl:variable>
    <xsl:value-of select="IndexLoader:add_field('identifier',
			              concat('http://www.kb.dk/permalink/2006/',
				      $application,'/',
				      $document,'/',
				      $lang,'/',
				      $orderlabel),
				      'store.yes',
				      'un_tokenized')"/>
  </xsl:template>

</xsl:transform>

