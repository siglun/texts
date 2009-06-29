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
    <xsl:element name="ead">
      <xsl:attribute name="xmlns"><xsl:text>urn:isbn:1-931666-00-8</xsl:text></xsl:attribute>
      <xsl:attribute
	name="xsi:schemaLocation"><xsl:text>http://diglib.princeton.edu/ead/dtd/2002/ead.xsd</xsl:text></xsl:attribute>
      <xsl:copy select="ead/@*" />
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ead">
    <xsl:apply-templates/>
  </xsl:template>
    

  <xsl:template match="z:idzebra" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


<!--

$Log$
Revision 1.1  2009/06/29 11:08:43  sigfrid
Initial revision

Revision 1.1  2005/04/26 07:51:19  sigge
Initial revision


-->


</xsl:stylesheet>

