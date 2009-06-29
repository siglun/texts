<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       exclude-result-prefixes="xsl f dc"
	       extension-element-prefixes="exsl"
	       version="1.0">
  
  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="yes"
	      encoding="UTF-8"/>

  <xsl:template match="/">
    <h3>
      stuff by
      <a href="#open" onclick="closeopen('browsebycategory')">category</a> 
      ||
      <a href="#open" onclick="closeopen('browsebydate')">date</a>
    </h3>
    <ul id="browsebycategory" style="display:block;">
      <xsl:for-each
	  select="//f:category[not(@label = preceding::f:category/@label)]">
	<xsl:sort case-order="upper-first" select="@label"/>
	<xsl:variable name="term" select="@label"/>
	<xsl:if test="@label">
	  <li>
	    <xsl:element name="a">
	      <xsl:attribute name="href">
		<xsl:value-of 
		    select="concat('/subjects/',@label,'/')"/>
	      </xsl:attribute>
	      <xsl:apply-templates select="@term"/>
	    </xsl:element>
	  </li>
	</xsl:if>
      </xsl:for-each>
    </ul>
    <ul id="browsebydate" style="display:none;">
      <xsl:for-each
	  select="//dc:date[not(text() = preceding::dc:date/text())]">
	<xsl:sort order="descending" select="."/>
	<xsl:variable name="term" select="@term"/>
	<xsl:if test="text()">
	  <li>
	    <xsl:element name="a">
	      <xsl:attribute name="href">
		<xsl:value-of 
		    select="concat('/',.,'/')"/>
	      </xsl:attribute>
	      <xsl:apply-templates select="."/>
	    </xsl:element>
	  </li>
	</xsl:if>
      </xsl:for-each>
    </ul>
  </xsl:template>

</xsl:transform>

