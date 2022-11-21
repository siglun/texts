<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:h="http://www.w3.org/1999/xhtml"
               xmlns:t="http://www.tei-c.org/ns/1.0"
               xmlns="http://www.w3.org/1999/xhtml"
               xmlns:a="http://www.w3.org/2005/Atom"
               xmlns:dc="http://purl.org/dc/elements/1.1/"
               extension-element-prefixes="exsl"
               xmlns:exsl="http://exslt.org/common"
               version="1.0">

  <xsl:import href="render.xsl"/>
  <xsl:param name="tdoc" select="''"/>
  <!-- xsl:param name="teidoc" select="exsl:node-set(document($tdoc))"/ -->
  <xsl:variable name="teidoc" select="document($tdoc)"/>

  <xsl:template match="/a:entry">
    <xsl:message>         <xsl:value-of select="$tdoc"/> </xsl:message>
    <entry xmlns="http://www.w3.org/2005/Atom"
           xmlns:dc="http://purl.org/dc/elements/1.1/">
      <xsl:apply-templates mode="atom" />
    </entry>
  </xsl:template>

  <xsl:template match="a:content">
    <content  xmlns="http://www.w3.org/2005/Atom"  type="xhtml">
      <div xmlns="http://www.w3.org/1999/xhtml">
        <xsl:comment>  shit comes below </xsl:comment>
        <xsl:value-of select="$tdoc"/>
        <xsl:apply-templates select="$teidoc/t:TEI"/>
      </div>
    </content>
  </xsl:template>
  
  <xsl:template mode="atom" match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>

     
</xsl:transform>
