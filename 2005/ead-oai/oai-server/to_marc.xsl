<?xml version="1.0" encoding="ISO-8859-1"?>
<!--

   $Id$

-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:z="http://www.indexdata.dk/zebra/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="z xsl"
  version="1.0">

 <xsl:output omit-xml-declaration="yes"
    method="xml"
    media-type="application/xml"
    encoding="utf-8"
    />

  <xsl:template match="/">
    <xsl:element name="record">
      <xsl:attribute name="xmlns">http://www.loc.gov/MARC21/slim</xsl:attribute>
      <xsl:attribute
	name="xsi:schemaLocation">http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd</xsl:attribute>

      <xsl:apply-templates/>

    </xsl:element>
  </xsl:template>

  <xsl:template match="ead">

    <xsl:if test="@identifier"><xsl:text>
      </xsl:text>
      <xsl:element name="controlfield">
	<xsl:attribute name="tag">001</xsl:attribute>
	<xsl:value-of select="@identifier"/>
      </xsl:element>
    </xsl:if>

    <xsl:for-each select="archdesc/did/langmaterial">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag"  select="'041'"/>
	<xsl:with-param name="ind1" select="'0'"  />
	<xsl:with-param name="ind2" select="'#'"  />
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code" select="'a'"  />
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each select="archdesc/did/origination/persname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag"  select="'100'" />
	<xsl:with-param name="ind1" select="'0'"   />
	<xsl:with-param name="ind2" select="'#'"   />
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code" select="'a'"   />
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each select="archdesc/did/origination/famname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag"  select="'100'"/>
	<xsl:with-param name="ind1" select="'3'"/>
	<xsl:with-param name="ind2" select="'#'"/>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code" select="'a'"/>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each select="archdesc/did/origination/corpname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">110</xsl:with-param>
	<xsl:with-param name="ind1">2</xsl:with-param>
	<xsl:with-param name="ind2">#</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>


    <xsl:if test="archdesc/did/unittitle|archdesc/did/unitdate">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">130</xsl:with-param>
	<xsl:with-param name="ind1"></xsl:with-param>
	<xsl:with-param name="ind2">#</xsl:with-param>
      </xsl:call-template>

      <xsl:for-each select="archdesc/did/unittitle">
	<xsl:call-template name="subfield">
	  <xsl:with-param name="code">a</xsl:with-param>
	</xsl:call-template>
      </xsl:for-each>

      <xsl:for-each select="archdesc/did/unitdate">
	<xsl:call-template name="subfield">
	  <xsl:with-param name="code">f</xsl:with-param>
	</xsl:call-template>
      </xsl:for-each>

      <xsl:call-template name="end_marcfield"/>
    </xsl:if>

    <xsl:for-each
      select="archdesc/controlaccess/persname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">600</xsl:with-param>
	<xsl:with-param name="ind1">1</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

   <xsl:for-each
      select="archdesc/controlaccess/famname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">600</xsl:with-param>
	<xsl:with-param name="ind1">3</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/corpname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">610</xsl:with-param>
	<xsl:with-param name="ind1">1</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/geogname">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">651</xsl:with-param>
	<xsl:with-param name="ind1">#</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/subject">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">653</xsl:with-param>
	<xsl:with-param name="ind1">0</xsl:with-param>
	<xsl:with-param name="ind2">#</xsl:with-param>
      </xsl:call-template>
       <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>


    <xsl:for-each
      select="archdesc/controlaccess/genreform">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">655</xsl:with-param>
	<xsl:with-param name="ind1">#</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/occupation">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">656</xsl:with-param>
	<xsl:with-param name="ind1">#</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/function">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">657</xsl:with-param>
	<xsl:with-param name="ind1">#</xsl:with-param>
	<xsl:with-param name="ind2">7</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">2</xsl:with-param>
	<xsl:with-param
	  name="value">Ediffah</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:for-each
      select="archdesc/controlaccess/title">
      <xsl:call-template name="begin_marcfield">
	<xsl:with-param name="tag">630</xsl:with-param>
	<xsl:with-param name="ind1">0</xsl:with-param>
	<xsl:with-param name="ind2">4</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="subfield">
	<xsl:with-param name="code">a</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="end_marcfield"/>
    </xsl:for-each>

    <xsl:call-template name="begin_marcfield">
      <xsl:with-param name="tag">856</xsl:with-param>
      <xsl:with-param name="ind1">4</xsl:with-param>
      <xsl:with-param name="ind2">2</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="subfield">
      <xsl:with-param name="code">u</xsl:with-param>
      <xsl:with-param
	name="value"
	select="concat('http://sigge.lub.lu.se/2005/ediffah-search/present.cgi?record=',
	z:idzebra/z:filename[1])"/>
    </xsl:call-template>
    <xsl:call-template name="end_marcfield"/>

  </xsl:template>

  <xsl:template name="begin_marcfield">
    <xsl:param name="tag" />
    <xsl:param name="ind1" />
    <xsl:param name="ind2" />
    <xsl:text disable-output-escaping="yes">
      &lt;datafield tag=&quot;</xsl:text><xsl:value-of select="$tag"/><xsl:text
      disable-output-escaping="yes">&quot; ind1=&quot;</xsl:text><xsl:value-of
      select="$ind1"/><xsl:text 
      disable-output-escaping="yes">&quot; ind2="</xsl:text><xsl:value-of
      select="$ind2"/><xsl:text disable-output-escaping="yes">&quot;&gt;
    </xsl:text>
  </xsl:template>

  <xsl:template name="end_marcfield">
    <xsl:text disable-output-escaping="yes">
      &lt;/datafield&gt;
    </xsl:text>
  </xsl:template>

  <xsl:template name="subfield">
    <xsl:param name="code" />
    <xsl:param name="value" />
    <xsl:element name="subfield">
      <xsl:attribute name="code">
	<xsl:value-of select="$code"/>
      </xsl:attribute>
      <xsl:choose>
	<xsl:when test="$value">
	  <xsl:value-of select="$value"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="."/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>



<!--

$Log$
Revision 1.1  2009/06/29 11:08:42  sigfrid
Initial revision

Revision 1.1  2005/04/25 07:05:31  sigge
Initial revision


-->


</xsl:stylesheet>

