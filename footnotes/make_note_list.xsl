<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       version="1.0">

  <xsl:output method="xml"
	      encoding="UTF-8"
	      omit-xml-declaration="yes"/>

  <xsl:template match="/rss">
    <ol>
      <xsl:apply-templates select="channel"/>
    </ol>
  </xsl:template>

  <xsl:template match="channel">
    <xsl:for-each select="item[contains(link,'/footnotes/')]">
      <li>
	<xsl:attribute name="id">
	  <xsl:value-of select="concat('note',substring-after(substring-before(link,'#'),'anchor='))"/>
	</xsl:attribute>
	<p>
	  <xsl:value-of disable-output-escaping="yes" select="description"/>
	  (<xsl:value-of select="dc:creator"/><xsl:text>, </xsl:text><xsl:value-of select="pubDate"/>)

	</p>
      </li>
    </xsl:for-each>
  </xsl:template>

</xsl:transform>
