<?xml version="1.0" encoding="ISO-8859-1"?>
<!--

   $Id$

-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:z="http://www.indexdata.dk/zebra/"
  xmlns:oaidc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  exclude-result-prefixes="z xsl"
  version="1.0">

 <xsl:output omit-xml-declaration="yes"
    method="xml"
    media-type="application/xml"
    encoding="utf-8"
    />

  <xsl:template match="/">
    <xsl:element name="oaidc:dc">
      <xsl:attribute
	name="xsi:schemaLocation">http://www.openarchives.org/OAI/2.0/oai_dc/
	http://www.openarchives.org/OAI/2.0/oai_dc.xsd</xsl:attribute> 
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ead">

    <xsl:for-each select="archdesc/did/origination">
      <xsl:element name="dc:creator">
	<xsl:for-each select="persname|corpname|famname">
	  <xsl:apply-templates select="."/>
	</xsl:for-each>
      </xsl:element>
    </xsl:for-each>

    <xsl:element name="dc:title">
      <xsl:value-of select="archdesc/did/unittitle"/>
    </xsl:element>

    <xsl:element name="dc:identifier">
      <xsl:value-of
	select="concat('http://sigge.lub.lu.se/2005/ediffah-search/present.cgi?record=',
	z:idzebra/z:filename[1])"/>
    </xsl:element>

    <xsl:element name="dc:identifier">
      <xsl:value-of select="concat('SE:',eadheader/eadid)"/>
    </xsl:element>

    <xsl:element name="dc:type">
      <xsl:value-of select="availability/medium"/>
    </xsl:element>

    <xsl:element name="dc:date">
      <xsl:value-of select="archdesc/did/unitdate"/>
    </xsl:element>

    <xsl:element name="dc:language">
      <xsl:value-of select="archdesc/did/langmaterial"/>
    </xsl:element>

    <xsl:for-each
      select="archdesc/controlaccess/genreform |
              archdesc/controlaccess/occupation|
              archdesc/controlaccess/persname  |
              archdesc/controlaccess/corpname  |
              archdesc/controlaccess/famname   |
              archdesc/controlaccess/function  |	
              archdesc/controlaccess/geogname  |
              archdesc/controlaccess/subject   |
              archdesc/controlaccess/title">

      <xsl:sort select="name(.)"/>
      <xsl:call-template name="heading-search">
	<xsl:with-param name="attr" select="name(.)"/>
      </xsl:call-template>
    </xsl:for-each>

  </xsl:template>


  <xsl:template name="heading-search">
    <xsl:param name="attr" />
    <xsl:element name="dc:subject">
      <xsl:apply-templates select="."/>
    </xsl:element>
  </xsl:template>


<!--

$Log$
Revision 1.1  2009/06/29 11:08:43  sigfrid
Initial revision

Revision 1.2  2004/06/15 15:39:29  sigge
Made the description such that if the service is Scripta, then preferentially
select English summary, whereas if it Xerxes prefer the Swedish one


-->


</xsl:stylesheet>

