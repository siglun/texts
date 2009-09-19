<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.w3.org/2005/Atom"
	       xmlns:a="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:h="http://www.w3.org/1999/xhtml"
	       xmlns:str="http://exslt.org/strings"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns:math="http://exslt.org/math"
	       extension-element-prefixes="str exsl math"
	       exclude-result-prefixes="xsl dc a h"
	       version="1.0">

  <xsl:output
      method="xml"
      encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <!-- here we change mode from copy to add id -->

  <xsl:template mode="copy" match="a:content[@type='xhtml']">
    <content type="xhtml">
      <div xmlns="http://www.w3.org/1999/xhtml">
	<xsl:apply-templates mode="add_id" select="h:div/*"/>
      </div>
    </content>
  </xsl:template>

  <!-- Here we just copy nodes from input stream to output, but when doing so
       we add an ID attribute to each node -->

  <xsl:template mode="add_id" match="node()">
    <xsl:copy>
      <xsl:if test="not(@id)">
	<xsl:attribute name="id">
	  <xsl:value-of select="concat('anchor',substring-after(concat(generate-id(.),'a',position()),'id'))"/>
	</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates mode="add_id" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template mode="add_id" match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template mode="add_id" match="text()">
    <xsl:apply-templates select="str:tokenize(string(.),' ')"/>
  </xsl:template>

  <xsl:template match="token">
    <xsl:text>
    </xsl:text>
    <span xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="id">
	<xsl:value-of 
	    select="concat('anchor',substring-after(concat(generate-id(.),'b',position(),math:random()),'id'))"/>
      </xsl:attribute>
      <xsl:value-of select="normalize-space(.)"/>
    </span>
  </xsl:template>

  <xsl:template mode="add_id" match="h:pre">
    <pre xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="id">
	<xsl:value-of select="concat('anchor',substring-after(concat(generate-id(.),'c',position(),math:random()),'id'))"/>
      </xsl:attribute>
      <xsl:apply-templates mode="copy"/>
    </pre>
  </xsl:template>

  <xsl:template mode="add_id" match="h:a">
    <xsl:text> </xsl:text>
    <a xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="id">
	<xsl:value-of select="concat('anchor',substring-after(concat(generate-id(.),'d',position(),math:random()),'id'))"/>
      </xsl:attribute>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="copy"/>
    </a>
  </xsl:template>

  <!-- Here we just copy nodes from input stream to output -->

  <xsl:template mode="copy" match="node()">
    <xsl:copy>
      <xsl:apply-templates mode="copy" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


  <xsl:template mode="copy" match="@*">
    <xsl:copy-of select="@*"/>
  </xsl:template>

  <xsl:template mode="copy" match="text()">
    <xsl:copy>
      <xsl:value-of select="."/>
    </xsl:copy>
  </xsl:template>
  
</xsl:transform>
