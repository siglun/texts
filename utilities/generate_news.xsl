<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns="http://www.w3.org/1999/xhtml"
	       xmlns:exsl="http://exslt.org/common"
	       extension-element-prefixes="exsl"
	       exclude-result-prefixes="exsl xsl dc f"
	       version="1.0">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="yes"
	      encoding="UTF-8"/>


  <xsl:template match="/">
    <xsl:apply-templates select="f:feed"/>
  </xsl:template>

  <xsl:template match="/f:feed">
    <div>
      <div>
	<h1 style="font-family: sans-serif; width: 55%; float: left;text-align: left;">
	  <xsl:value-of 
	      select="f:entry[not(f:category/@label = 'aboutme')][1]/f:title"/>
	</h1>
	<p style="width: 38%; float: left;text-align: right">
	  <em>
	    <strong>
	      <xsl:text>
		Sigfrid Lundberg's Stuff,
	      </xsl:text>
	      <xsl:value-of 
		  select="substring-before(
			  f:entry[not(f:category/@label = 'aboutme')][1]/f:updated,'T')"/>
	    </strong>
	  </em>
	</p>
      </div>
      <div style="clear:both;"><xsl:text> </xsl:text></div>
      <div style="width:100%;">

	<xsl:apply-templates 
	    mode="copy" 
	    select="f:entry[not(f:category/@label = 'aboutme')][1]/
		    f:content[@type='xhtml']/*"/>

	<p style="text-align: right">
	  <em>
	    <strong>
	      <xsl:text>
		Permalink:
	      </xsl:text>
	    </strong>
	  </em>
	  <xsl:element name="a">
	    <xsl:attribute name="rel">bookmark</xsl:attribute>
	    <xsl:attribute name="href">
	      <xsl:value-of 
		  select="f:entry[not(f:category/@label = 'aboutme')][1]/f:link/@href"/>
	    </xsl:attribute>
	    <xsl:value-of 
		select="concat('http://www.sigfrid-lundberg.se',
			f:entry[not(f:category/@label = 'aboutme')][1]/f:link/@href)"/>
	  </xsl:element>
	</p>

	<hr width="50%" align="center"/>
      </div>
	
      <div>
	<h1>Other, not yet obsolete stuff</h1>

	<table class="news">
	  <xsl:for-each select="f:entry[not(f:category/@label = 'aboutme')]
				       [position() &lt; 8 and position() &gt; 1]">
	    <tr><xsl:apply-templates select="."/></tr>
	  </xsl:for-each>
	</table>

      </div>
    </div>
  </xsl:template>

  <xsl:template match="f:entry">
    <td class="left">
      <xsl:value-of select="dc:date"/>
    </td>
    <td class="left">
      <xsl:element name="a">
	<xsl:attribute name="href">
	  <xsl:value-of select="f:link/@href"/>
	</xsl:attribute>
	<em><xsl:apply-templates select="f:title"/></em>
      </xsl:element>
      <br/>
      <xsl:if test="f:summary">
	<xsl:apply-templates select="f:summary"/>
	<br/>
      </xsl:if>
      <xsl:for-each select="f:category">
	<xsl:element name="a">
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat('/subjects/',@label,'/')"/>
	  </xsl:attribute>
	  <xsl:apply-templates select="@term"/>
	  </xsl:element><xsl:if test="not(position()=last())"><xsl:text>,
	</xsl:text></xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template mode="copy" match="f:content">
    <xsl:apply-templates mode="copy" select="@*|node()"/>
  </xsl:template>

  <xsl:template mode="copy" match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates mode="copy" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:transform>
