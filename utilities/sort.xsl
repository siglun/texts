<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.w3.org/2005/Atom"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       extension-element-prefixes="exsl"
	       exclude-result-prefixes="exsl xsl f"
	       version="1.0">

  <xsl:output method="xml"
	      indent="yes"
	      encoding="UTF-8"/>


  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="/f:feed">
    <feed>
      <xsl:apply-templates select="f:author|f:title|f:updated|f:id|f:link|f:summary"/>
      <xsl:apply-templates select="f:entry[dc:date&gt;=2009]">
	<xsl:sort order="descending" select="f:updated"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="f:entry[dc:date&lt;2009]">
	<xsl:sort order="descending" select="dc:date"/>
      </xsl:apply-templates>
    </feed>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
