<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       version="1.0">



  <xsl:output method="xml"
	      indent="yes"
	      encoding="UTF-8"/>

  <xsl:param name="terms">
    <xsl:element name="entry">
      <xsl:for-each select="//f:category">
	<xsl:sort data-type="text" select="@term"/>
	<xsl:variable name="term">
	  <xsl:value-of select="@term"/>
	</xsl:variable>
	<xsl:element name="category">
	  <xsl:attribute name="term">
	    <xsl:value-of select="@term"/>
	  </xsl:attribute>
	  <xsl:attribute name="label">
	    <xsl:value-of select="@term"/>
	  </xsl:attribute>
	</xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:param>

  <xsl:template match="/">
    <entry>
      <xsl:apply-templates select="exsl:node-set($terms)//f:category[1]"/>
    </entry>
  </xsl:template>

  <xsl:template match="f:category">
    <xsl:variable name="term" select="@term"/>
    <xsl:element name="category">
      <xsl:attribute name="term">
	<xsl:value-of select="$term"/>
      </xsl:attribute>
      <xsl:attribute name="label">
	<xsl:value-of select="$term"/>
      </xsl:attribute>
      <xsl:attribute name="n">
	<xsl:value-of select="1+count(following-sibling::f:category[@term=$term])"/>
      </xsl:attribute>
    </xsl:element>
    <xsl:apply-templates select="following-sibling::f:category[not(@term=$term)][1]"/>
  </xsl:template>

</xsl:transform>
