<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns="http://www.w3.org/1999/xhtml"
	       exclude-result-prefixes="xsl f dc"
	       extension-element-prefixes="exsl"
	       version="1.0">
  
  <xsl:output method="xml"
	      indent="yes"
	      encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="f:entry">
    <html>
      <head>
	<title>
	  <xsl:value-of select="f:title"/><xsl:text>: </xsl:text>
	  Sigfrid Lundberg's Stuff
	</title>

	<meta http-equiv="Content-Type"
	      content="text/html;charset=UTF-8" />

	<script src="/js/navigation.js" type="text/javascript">
	  <xsl:text> 
	  </xsl:text>
	</script>

	<meta http-equiv="Content-Type" 
	      content="text/html;charset=UTF-8"/>
	<link rel="stylesheet" href="/css-style/html.css" />
      </head>

      <xsl:element name="body">
	<div class="left_box">
	  <div style="text-align:left;width=90%;">
	    <xsl:comment>#include virtual="/div_top_left_box.xml" </xsl:comment>
	  </div>
	  <div style="text-align:left;width=90%;">
	    <p><a href="/">Home</a></p>
	    <xsl:comment>#include virtual="/subjects.xml" </xsl:comment>
	    <xsl:comment>#include virtual="/me.xml" </xsl:comment>
	  </div>
	</div>

	<div class="right_box">
	  <h1 style="width: 58%; float: left;text-align: left">
	    <xsl:value-of select="f:title"/>
	  </h1>
	  <p style="width: 38%; float: left;text-align: right">
	    <em>
	      <strong>
		<xsl:text>Sigfrid Lundberg's Stuff </xsl:text>
		<xsl:value-of select="substring-before(f:updated,'T')"/>
	      </strong>
	    </em>
	  </p>

	  <div style="clear:both">
	    <xsl:text>
	    </xsl:text>
	  </div>

	  <xsl:apply-templates mode="copy" select="f:content[@type='xhtml']"/>
	</div>
	<xsl:comment>#include virtual="/js/urchin.js" </xsl:comment>
      </xsl:element>
      </html>

  </xsl:template>

  <xsl:template mode="copy" match="f:content">
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <xsl:template mode="copy" match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates mode="copy" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>

