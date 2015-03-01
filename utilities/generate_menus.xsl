<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns="http://www.w3.org/1999/xhtml"
	       exclude-result-prefixes="xsl f dc"
	       extension-element-prefixes="exsl"
	       version="1.0">

  <!--
      $Id$
  -->
  
  <xsl:output method="xml"
	      indent="yes"
	      encoding="UTF-8"/>

  <xsl:template match="/">

    <xsl:for-each
	select="//dc:date[not(text() = preceding::dc:date/text())]">
      <xsl:sort case-order="upper-first" select="."/>
      <xsl:call-template name="print_doc">
	<xsl:with-param name="vocabulary" select="'date'"/>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each
	select="//f:category[not(@label = preceding::f:category/@label)]">
      <xsl:sort case-order="upper-first" select="."/>
      <xsl:call-template name="print_doc">
	<xsl:with-param name="vocabulary" select="'category'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="print_doc">
    <xsl:param name="vocabulary" select="'category'"/>
    
    <xsl:variable name="menue">
      <xsl:choose>
	<xsl:when test="$vocabulary = 'category'">
	  <xsl:value-of select="concat('subjects/',@label,'/index.shtml')"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="concat(.,'/index.shtml')"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <exsl:document
	href="{$menue}"
	method="xml"
	version="1.0"
	encoding="UTF-8">
      <html>
	  <head>
	    <title>
	      <xsl:choose>
		<xsl:when test="$vocabulary = 'category'">
		  <xsl:value-of select="@term"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:apply-templates select="."/>
		</xsl:otherwise>
	      </xsl:choose>
	      <xsl:text>: </xsl:text>Sigfrid Lundberg's Stuff
	    </title>

	    <meta http-equiv="Content-Type"
		  content="text/html;charset=UTF-8" />

	    <script src="/js/navigation.js" type="text/javascript">
	      <xsl:text> 
	      </xsl:text>
	    </script>

	    <link href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
		  type="application/atom+xml"
		  title="Sigfrid Lundberg's Stuff"
		  rel="alternate"/>

	    <link href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
		  type="application/rss+xml"
		  title="Latest Comments"
		  rel="alternate"/>

	    <meta http-equiv="Content-Type" 
		  content="text/html;charset=UTF-8"/>

	    <link rel="stylesheet" 
		  href="/css-style/html.css" 
		  type="text/css" />

	    <link rel ="stylesheet"
		  href="/css-style/responsive-html.css"
		  type="text/css" />

	  </head>

	  <xsl:element name="body">
	    <xsl:if test="$vocabulary = 'date'">
	      <xsl:attribute name="onload">
		<xsl:text>closeopen('browsebydate')</xsl:text>
	      </xsl:attribute>
	    </xsl:if>

	  <div class="section group">
	    <div class="col span_4_of_4">
	      <xsl:comment>#include virtual="/top_div.xml" </xsl:comment>
	    </div>
	  </div>

	  <div class="section group">
	    <div class="col span_3_of_4">
	      <h1 style="width: 58%; float: left;text-align: left">
		<xsl:choose>
		  <xsl:when test="$vocabulary = 'category'">
		    <xsl:value-of select="@term"/>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:apply-templates select="."/>
		  </xsl:otherwise>
		</xsl:choose>
	      </h1>
	      <p style="width: 38%; float: left;text-align: right">
		<em><strong>Sigfrid Lundberg's Stuff</strong></em>
	      </p>



	      <div style="width:100%;">
		<xsl:choose>
		  <xsl:when test="$vocabulary = 'category'">
		    <xsl:call-template name="subject_template">
		      <xsl:with-param name="term" select="@label"/>
		      <xsl:with-param name="vocabulary" select="'category'"/>
		    </xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:call-template name="date_template">
		      <xsl:with-param name="date" select="."/>
		      <xsl:with-param name="vocabulary" select="'date'"/>
		    </xsl:call-template>
		  </xsl:otherwise>
		</xsl:choose>
	      </div>
	    </div>


	    <div class="col span_1_of_4">
	      <div style="text-align:left;width=90%;">
		<xsl:comment>#include virtual="/div_top_left_box.xml" </xsl:comment>
	      </div>
	      <div style="text-align:left;width=90%;">
		<p>
		  <a href="/"><strong>Home</strong></a>
		</p>
		<p>
		  <a href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
		     type="application/atom+xml" class="feed-link">
		    <img src="/images/Newsfeed-Atom.png" 
			 alt="Subscribe to Stuff from Sigfrid Lundberg"
			 border="0"/>
		    <xsl:text>Subscribe to more Stuff</xsl:text>
		  </a><br/>
		  <a href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
		     type="application/rss+xml"
		     class="feed-link">
		    <img src="/images/Newsfeed-Atom.png" 
			 alt="Subscribe to Stuff from Sigfrid Lundberg"
			 border="0"/>Subscribe to discussion feed</a>
		</p>
		<xsl:comment>#include virtual="/subjects.xml" </xsl:comment>
		<xsl:comment>#include virtual="/me.xml" </xsl:comment>
	      </div>
	    </div>


	    <div style="clear:both">
	      <xsl:text>
		&#160;
	      </xsl:text>
	    </div>

	    </div>
	    <xsl:comment>#include virtual="/js/urchin.js" </xsl:comment>
	  </xsl:element>
      </html>
    </exsl:document>

  </xsl:template>

  <xsl:template name="subject_template">
    <xsl:param name="vocabulary" select="'category'"/>
    <xsl:param name="term"/>
    <xsl:apply-templates 
	select="//f:entry[$term = f:category/@label]">
      <xsl:sort order="descending" select="f:updated"/>
      <xsl:with-param name="vocabulary" select="'category'"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="date_template">
    <xsl:param name="vocabulary" select="'date'"/>
    <xsl:param name="date"/>
    <xsl:apply-templates 
	select="//f:entry[$date = dc:date/text()]">
      <xsl:sort order="ascending" select="f:title"/>
      <xsl:with-param name="vocabulary" select="'date'"/>
    </xsl:apply-templates>
  </xsl:template>


  <xsl:template match="f:entry">
    <xsl:param name="vocabulary" select="'category'"/>

    <p>
      <xsl:if test="$vocabulary = 'category'">
	<xsl:choose>
	  <xsl:when test="dc:date &lt; 2009">
	    <xsl:value-of 
		select="dc:date"/><xsl:text>: </xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of 
		select="substring-before(f:updated,'T')"/><xsl:text>: </xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:if>
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
	  <xsl:value-of select="@term"/>
	  </xsl:element><xsl:if test="not(position()=last())"><xsl:text>,
	</xsl:text></xsl:if>
      </xsl:for-each>

      <xsl:if test="dc:date">
	<xsl:if test="f:category">, </xsl:if>
	<xsl:element name="a">
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat('/',dc:date)"/>
	  </xsl:attribute>
	  <xsl:value-of select="dc:date" />
	</xsl:element>
      </xsl:if>

    </p>
  </xsl:template>

</xsl:transform>

