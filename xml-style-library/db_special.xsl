<?xml version='1.0' encoding="UTF-8" ?>
<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  version="1.0" >

  <xsl:output omit-xml-declaration="yes"
    method="html"
    media-type="text/html"
    encoding="UTF-8" 	
    />

  <xsl:param name="footnotes">
    <xsl:element name="div">
      <xsl:for-each select="//footnoteref">
	<xsl:element name="p">
	  <xsl:variable name="noteid"><xsl:value-of
	      select="@linkend"/></xsl:variable>
	  <xsl:attribute name="id"><xsl:value-of
	      select="@linkend"/></xsl:attribute> 
	  <strong class="number">
	    <xsl:value-of select="position()"/>
	  </strong>
	  <xsl:text> </xsl:text>
	  <xsl:apply-templates select="/article/bibliography/biblioentry[@id =
	    $noteid]"/>
	</xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:param>

  <xsl:template match="/" >
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:apply-templates select="/article/articleinfo/title/node()"/>
	</xsl:element>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute name="href">./html_print.css</xsl:attribute>
	</xsl:element>
        <xsl:element name="meta">
          <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
          <xsl:attribute name="content">text/html; charset=UTF-8</xsl:attribute>
        </xsl:element>
      </xsl:element>
      <xsl:element name="body">
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:apply-templates />
	  <h2>Noter</h2>
	  <xsl:copy-of select="exsl:node-set($footnotes)/div/node()"/>
	</xsl:element>
<!--
	<script type="text/javascript">
	  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
	  try {
	  var pageTracker = _gat._getTracker("UA-9306307-1");
	  pageTracker._trackPageview();
	} catch(err) {}</script>
-->
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="article" >
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="sect1">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="sect1/title">
    <xsl:element name="h1">
      <xsl:attribute name="class">title</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sect2">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="sect2/title">
    <xsl:element name="h2"><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="para">
    <xsl:element name="p"><xsl:apply-templates/></xsl:element>
  </xsl:template>


  <xsl:template match="orderedlist">
    <xsl:element name="ol">
      <xsl:if test="parent::listitem">
	<xsl:attribute name="type">a</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="itemizedlist">
    <xsl:element name="ul">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="listitem">
    <xsl:element name="li">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="emphasis">
    <xsl:element name="em">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="articleinfo|bibliography"/>

  <xsl:template match="footnoteref">
    <xsl:variable name="thisnote"><xsl:value-of
	select="@linkend"/></xsl:variable>
    <xsl:element name="sup">
      <xsl:element name="a">
	<xsl:attribute name="href">
	  <xsl:value-of select="concat('#',$thisnote)"/>
	</xsl:attribute>
	<xsl:value-of
	  select="exsl:node-set($footnotes)/div/p[@id=$thisnote]/strong"/> 
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="biblioentry">
    <xsl:for-each select="author|authorblurb">
      <xsl:choose>
	<xsl:when test="position() > 1 and not(position() = last()) ">
	  <xsl:text>, </xsl:text>
	</xsl:when>
	<xsl:when test="position() > 1 and position() = last() ">
	  <xsl:text> and </xsl:text>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="firstname"/><xsl:text> </xsl:text>
      <xsl:apply-templates select="surname"/>
      <xsl:apply-templates select="para"/>
      <xsl:if test="affiliation">
	<xsl:text> </xsl:text>
	(<xsl:apply-templates select="affiliation"/>)
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:if test="position() = last() ">.</xsl:if>
    </xsl:for-each>
    <xsl:apply-templates select="title"/>
    <xsl:apply-templates select="abstract"/>
  </xsl:template>

  <xsl:template match="authorblurb/para">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="title">
    <xsl:element name="em">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ulink">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>



</xsl:transform>



