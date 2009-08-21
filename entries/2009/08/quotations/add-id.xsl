<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       version="1.0">

  <xsl:output
      method="xml"
      encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="node()">
    <xsl:copy>
      <xsl:if test="not(@id)">
	<xsl:attribute name="id">
	  <xsl:value-of select="generate-id(.)"/>
	</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

 <xsl:template match="@*">
   <xsl:copy-of select="."/>
 </xsl:template>

 <xsl:template match="text()">
   <xsl:copy>
     <xsl:value-of select="."/>
   </xsl:copy>
 </xsl:template>
  
</xsl:transform>
