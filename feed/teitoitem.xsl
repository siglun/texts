<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.w3.org/2005/Atom"
	       xmlns:t="http://www.tei-c.org/ns/1.0"
	       exclude-result-prefixes="t"
	       version="1.0">

  <xsl:output encoding="UTF-8"
	      indent="yes"/>

  <xsl:template match="/">
    <entry>
      <xsl:apply-templates/>
    </entry>
  </xsl:template>

  <xsl:template match="t:TEI">
    <xsl:apply-templates select="t:text/t:front"/>
  </xsl:template>

  <xsl:template match="t:front">

    <xsl:element name="author">
      <xsl:element name="name">
	<xsl:apply-templates select="t:docAuthor/t:name"/>
      </xsl:element>
    </xsl:element>

    <xsl:element name="title">
      <xsl:apply-templates select="t:docTitle/t:titlePart"/>
    </xsl:element>

    <xsl:element name="summary">
      <xsl:apply-templates select="t:div[@type='abstract']/t:p"/>
    </xsl:element>

    <!-- these remain to be fixed -->

    <link href=""/>
    <updated>2008-06-22T21:20:00</updated>
    <id></id>

  </xsl:template>

</xsl:transform>
