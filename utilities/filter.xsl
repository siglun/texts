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
    <xsl:apply-templates select="f:feed"/>
  </xsl:template>

  <xsl:template match="f:feed">
    <feed>
      <xsl:apply-templates select="f:author|f:title|f:id|f:link"/>
      <updated><xsl:value-of select="f:entry[1]/f:updated"/></updated>
      <xsl:apply-templates select="f:entry"/>
    </feed>
  </xsl:template>

  <xsl:template match="f:entry">
    <entry>
      <xsl:apply-templates/>
    </entry>
  </xsl:template>

  <xsl:template match="f:link">
    <xsl:element name="link">
      <xsl:if test="@rel">
	<xsl:attribute name="rel">
	  <xsl:value-of select="@rel"/>
	</xsl:attribute>
      </xsl:if>
      <xsl:attribute name="href">
	<xsl:choose>
	  <xsl:when test="contains(@href,'http')">
	    <xsl:value-of select="@href"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="concat('http://sigfrid-lundberg.se',@href)"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
