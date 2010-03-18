<?xml version="1.0" encoding="UTF-8" ?>
<!--
This is a xslt script that perform lucene indexing of Text Encoding Initiative
Documents using the utility xsl_index.

The truth is, however, that this a special case indexing script customized for
indexing the transcription of the Guaman Poma manuscript.

The core of this is a java class, IndexLoader, which is called from inside this
script. The index loader can create a new or update an existing Lucene index and
can then index arbitrary XML documents by creating lucene documents while the
xslt processor traverses the document.

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

    <!-- The lucene java objects, analyzer, reader and writer are instantiated
	 by the driver and are reused through the indexing process. This is
	 because we do not want to reopen the index for each lucene document
	 (there may be much more of them than there are XML documents).

         For the Poma manuscript there is just one manuscript, but we create one
	 lucene document per page. -->

    <xsl:value-of 
	select="IndexLoader:setAnalyzer($analyzer)"/>
    <xsl:value-of 
	select="IndexLoader:setIndexReader($reader)"/>
    <xsl:value-of 
	select="IndexLoader:setIndexWriter($writer)"/>

    <!-- The IndexLoader:open_index doesn't really open the index (it did at any
	 early stage) but passes some parameters to the IndexLoader... -->

    <xsl:value-of 
	select="IndexLoader:open_index($mode,$index_directory,$debug_level)"/>

    <!-- Both the datasource and the corresponding source field come
         from the indexing driver.  This function call ensures that all
         the lucene documents created from from a given XML document are
	 deleted prior to indexing. This is our way to implement incremental
         update. -->

    <xsl:if test="$mode='update' and $datasource and $sourcefield">
       <xsl:value-of 
	   select="IndexLoader:delete_documents($sourcefield,$datasource)"/>
    </xsl:if>
    <xsl:apply-templates select="TEI.2"/>
    <xsl:value-of select="IndexLoader:close_index()"/>
  </xsl:template>

  <xsl:template match="TEI.2">
    <xsl:apply-templates  select="text/body/div1"/>
  </xsl:template>

  <xsl:template match="div1">
    <xsl:apply-templates select="div2[@id and @n]"/>
  </xsl:template>

  <xsl:template match="div2">

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

    <xsl:variable name="title">
<xsl:text>
</xsl:text>
      <xsl:apply-templates select="div3[@type='mspagenumber']"/>
      <xsl:apply-templates select="div3[@type='runninghead']"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$title">
	<xsl:value-of select="IndexLoader:add_field('title',
			      $title,
			      'store.yes',
			      'tokenized')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="IndexLoader:add_field('title',
			      'title missing',
			      'store.yes',
			      'tokenized')"/>
      </xsl:otherwise>
    </xsl:choose>


    <xsl:variable name="body">
<xsl:text>
</xsl:text>
      <xsl:apply-templates select="div3[@type='main']"/>
      <xsl:apply-templates select="div3[@type='addition']"/>    
      <xsl:apply-templates select="div3[@type='imgheader']"/>
      <xsl:apply-templates select="div3[@type='imgtexts']"/>
    </xsl:variable>

    <xsl:if test="$body">
	<xsl:value-of select="IndexLoader:add_field('body',
			      $body,
			      'store.yes',
			      'tokenized')"/>
    </xsl:if>

    <xsl:variable name="quechua">     
      <xsl:apply-templates select="div3[@type='quechua']/node()"/>     
    </xsl:variable>

    <xsl:if test="$quechua">     
	<xsl:value-of select="IndexLoader:add_field('quechua',
			      $quechua,
			      'store.yes',
			      'tokenized')"/>
    </xsl:if>

    <xsl:variable name="editorial_text">     
      <xsl:apply-templates select="div3[@type='notes']/node()"/>
      <xsl:apply-templates select="div3[@type='commentary']/node()"/>
    </xsl:variable>

    <xsl:if test="$editorial_text">     
	<xsl:value-of select="IndexLoader:add_field('editorial_text',
			      $editorial_text,
			      'store.yes',
			      'tokenized')"/>
    </xsl:if>


    <xsl:call-template name="generateURI">
      <xsl:with-param name="lang">
	<xsl:value-of select="'es'"/>
      </xsl:with-param>
      <xsl:with-param name="page">
	<xsl:choose>
	  <xsl:when test="@n = 'titlepage'"><xsl:text>0</xsl:text></xsl:when>
	  <xsl:otherwise><xsl:value-of select="@n"/></xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:value-of select="IndexLoader:close_document()"/>
  </xsl:template>


  <xsl:template name="generateURI">
    <xsl:param name="lang" select="'es'"/>
    <xsl:param name="page" select="'0'"/>
    <xsl:value-of select="IndexLoader:add_field('identifier',
			              concat('http://www.kb.dk/permalink/2006/',
				      'poma/',
				      $page,'/'),
				      'store.yes',
				      'un_tokenized')"/>
  </xsl:template>

  <xsl:template match="hi[@rend='sup']"/>

<!--
$Log$
Revision 1.1  2010/03/18 06:48:55  sigfrid
checking in

Revision 1.8  2007/04/23 10:58:22  slu
Removed debug print outs

Revision 1.7  2007/04/23 09:20:42  slu
Ported the script to the new versions of Driver and IndexLoader, which
creates the Lucene IndexWriter, IndexReader and Analyzer in the Driver
and reuse these objects through the entire life of the xslt processor.

Revision 1.6  2007/04/12 09:55:17  slu
removed foot note indicators (eg <hi rend="sup">1</hi>) from the indexing

Revision 1.5  2007/04/12 09:33:46  slu
Removed the <lang>/text/ part of the generated identifiers. No good
idea to hard code the UI language in the search result.
-->


</xsl:transform>

