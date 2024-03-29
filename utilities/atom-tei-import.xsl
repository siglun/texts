<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:h="http://www.w3.org/1999/xhtml"
               xmlns:t="http://www.tei-c.org/ns/1.0"
               xmlns="http://www.w3.org/1999/xhtml"
               xmlns:a="http://www.w3.org/2005/Atom"
               xmlns:dc="http://purl.org/dc/elements/1.1/"
	       exclude-result-prefixes="a h t"
               version="1.0">

  <xsl:import href="render.xsl"/>
  <xsl:param name="tdoc" select="''"/>

  <xsl:variable name="teidoc" select="document($tdoc)"/>

  <xsl:template match="/a:entry">
    <xsl:message>         <xsl:value-of select="$tdoc"/> </xsl:message>
    <entry xmlns="http://www.w3.org/2005/Atom"
           xmlns:dc="http://purl.org/dc/elements/1.1/">
      <xsl:apply-templates mode="atom" select="a:author|a:title|a:link|a:summary"/>
      <xsl:apply-templates select="a:content"/>
      <xsl:apply-templates mode="atom" select="dc:date|a:category|a:updated|a:id"/>
    </entry>
  </xsl:template>

  <xsl:template match="a:content">
    <content  xmlns="http://www.w3.org/2005/Atom"  type="xhtml">
      <div xmlns="http://www.w3.org/1999/xhtml">
        <xsl:comment>  shit comes below </xsl:comment>
        <xsl:apply-templates select="$teidoc/t:TEI/t:text/*"/>
      </div>
    </content>
  </xsl:template>
  
  <xsl:template mode="atom" match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates mode="atom" select="@* | node()" />
    </xsl:copy>
  </xsl:template>

     
</xsl:transform>
