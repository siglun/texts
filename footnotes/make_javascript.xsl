<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       version="1.0">

  <xsl:output method="text"
	      encoding="UTF-8"/>
	     

  <xsl:template match="/rss">
    <xsl:apply-templates select="channel"/>
  </xsl:template>

  <xsl:template match="channel">

    <xsl:for-each select="item[contains(link,'/footnotes/')]">

<xsl:text>
usedAnchorIds[</xsl:text><xsl:value-of select="position()-1"/><xsl:text>]=</xsl:text>"<xsl:value-of select="substring-after(substring-before(link,'#'),'anchor=')"/>";
<xsl:text>
noteTexts[</xsl:text><xsl:value-of select="position()-1"/><xsl:text>]='</xsl:text><xsl:value-of disable-output-escaping="no" select="normalize-space(description)"/> (<xsl:value-of select="dc:creator"/><xsl:text>, </xsl:text><xsl:value-of select="pubDate"/>)<xsl:text>';</xsl:text>

    </xsl:for-each>
  </xsl:template>

</xsl:transform>
