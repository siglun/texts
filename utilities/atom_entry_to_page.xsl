<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:dc="http://purl.org/dc/elements/1.1/"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns="http://www.w3.org/1999/xhtml"
	       xmlns:h="http://www.w3.org/1999/xhtml"
	       xmlns:addthis="http://www.addthis.com/help/api-spec"
	       exclude-result-prefixes="xsl f dc h"
	       extension-element-prefixes="exsl"
	       version="1.0">

  <!--
    Builds entries
    Author Sigfrid Lundberg (siggelundberg@gmail.com)
    $Revision$ last modified $Date$
    $Id$
  -->

  <xsl:param name="debug" select="''"/>

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


	<link href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
	      type="application/atom+xml"
	      title="Sigfrid Lundberg's Stuff"
	      rel="alternate"/>

	<link href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
	      type="application/rss+xml"
	      title="Latest Comments"
	      rel="alternate"/>

	<meta http-equiv="Content-Type"
	      content="text/html;charset=UTF-8" />

	<script src="/js/navigation.js" type="text/javascript">
	  <xsl:text> 
	  </xsl:text>
	</script>

	<xsl:if test="$debug">
	  <script type="text/javascript">
	    <xsl:text>
	      var disqus_developer=1;
	    </xsl:text>
	  </script>
	</xsl:if>

	<meta http-equiv="Content-Type" 
	      content="text/html;charset=UTF-8"/>
	<link rel="stylesheet" href="/css-style/html.css" />

	<xsl:comment>#include virtual="/js/colorbox_include.html" </xsl:comment>

      </head>

      <xsl:element name="body">
	<div class="outer_box">

	  <xsl:comment>#include virtual="/top_div.xml" </xsl:comment>

	  <div class="left_box">
	    <div style="text-align:left;width=90%;">
	      <xsl:comment>#include virtual="/div_top_left_box.xml" </xsl:comment>
	    </div>
	    <div style="text-align:left;width=90%;">
	      <p>
		<a href="/">Home</a><br/>
		<a href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
		   type="application/atom+xml"
		   class="feed-link">
		  <img src="/images/Newsfeed-Atom.png" 
		       alt="Subscribe to Stuff from Sigfrid Lundberg"
		       border="0"/>Subscribe to my stuff</a><br/>

	      <a href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
		 type="application/rss+xml"
		 class="feed-link">
		<img src="/images/Newsfeed-Atom.png" 
		     alt="Subscribe to Stuff from Sigfrid Lundberg"
		     border="0"/>Subscribe to discussion feed</a>

	    </p>
	    <xsl:comment>#include virtual="/subjects.xml" </xsl:comment>
	    <xsl:comment>#include virtual="/me.xml" </xsl:comment>

	    <p><small>
	      <a rel="license" 
		 href="http://creativecommons.org/licenses/by-sa/3.0/">
		<img alt="Creative Commons License" 
		     style="border-width:0" 
		     src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
		</a>
		<br />
		This entry (<em><span xmlns:dct="http://purl.org/dc/terms/"
		property="dct:title"> <xsl:value-of
		select="f:title"/></span></em>) within Sigfrid Lundberg's Stuff,

		by <a xmlns:cc="http://creativecommons.org/ns#" 
		   property="cc:attributionName" 
		   rel="cc:attributionURL">
		  <xsl:attribute name="href">
		    <xsl:value-of 
			select="concat('http://sigfrid-lundberg.se',f:link/@href)"/>
		  </xsl:attribute>
		  Sigfrid Lundberg
		</a>
		is licensed under a 
		<a rel="license"
		   href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons
		Attribution-ShareAlike 3.0 Unported License</a>.
	      </small></p>


	  </div>
	</div>

	<div class="right_box">

	  <h1 style="font-family: sans-serif; width: 55%; float: left;text-align: left;">
	    <xsl:value-of select="f:title"/>
	  </h1>

	  <p style="width: 38%; float: left;text-align: right">
	    <em>
	      <strong>
		<xsl:text>Sigfrid Lundberg's Stuff </xsl:text>
		<xsl:value-of select="substring-before(f:updated,'T')"/>
	      </strong>
	    </em>
	    <br/>
	    <br/>
	    <!-- AddThis Button BEGIN -->
	    <xsl:element name="a">
	      <xsl:attribute name="class">addthis_button</xsl:attribute>
	      <xsl:attribute name="addthis:title"><xsl:value-of select="f:title"/></xsl:attribute>
	      <!--xsl:attribute name="addthis:description"><xsl:value-of select="f:summary"/></xsl:attribute-->
	      <xsl:attribute name="addthis:url">
		<xsl:value-of 
		    select="concat('http://sigfrid-lundberg.se',f:link/@href)"/>
	      </xsl:attribute>
	      <xsl:attribute name="href">http://www.addthis.com/bookmark.php?v=250&amp;pub=siggelundberg</xsl:attribute>
	      <img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif"
		   width="125" 
		   height="16" 
		   alt="Bookmark and Share" 
		   style="border:0"/>
	    </xsl:element>
	      <script type="text/javascript" 
		      src="http://s7.addthis.com/js/250/addthis_widget.js?pub=siggelundberg">
		<xsl:text>
		</xsl:text>
	      </script>
	      <!-- AddThis Button END -->
	  </p>

	  <div style="clear:both">
	    <xsl:text>
	    </xsl:text>
	  </div>



	  <xsl:apply-templates mode="copy" select="f:content[@type='xhtml']"/>


	  <div style="clear:both">
	    <xsl:text> 
	    </xsl:text>
	  </div>

	  <div id="disqus_thread">
	    <xsl:text>
	    </xsl:text>
	  </div>
	  <p style="margin-left:+1%;">
	    <a href="http://disqus.com" class="dsq-brlink">blog comments powered
	    by <span class="logo-disqus">Disqus</span>
	    </a>
	  </p>

	</div>
	</div>
	<script type="text/javascript" src="http://disqus.com/forums/sigfridlundbergsstuff/embed.js">
	  <xsl:text>
	  </xsl:text>
	</script>
	<noscript>
	  <xsl:element name="a">
	    <xsl:attribute name="href">
	      <xsl:value-of 
		  select="concat('http://sigfridlundbergsstuff.disqus.com/',
			  '?url=',
			  'http://sigfrid-lundberg.se',
			  f:link/@href)"/>
	    </xsl:attribute>
	      View the discussion thread
	  </xsl:element>
	</noscript>

	<script type="text/javascript">
	  <xsl:text disable-output-escaping="yes">//&lt;!--</xsl:text>
	  <xsl:text disable-output-escaping="yes">
	  (function() {
	      var links = document.getElementsByTagName('a');
	      var query = '?';
	      for(var i = 0; i &lt; links.length; i++) {
		  if(links[i].href.indexOf('#disqus_thread') >= 0) {
		      query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&amp;';
		  }
	      }
	      document.write('&lt;script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/sigfridlundbergsstuff/get_num_replies.js' + query + '">&lt;/' + 'script>');
	  })();
	  </xsl:text>
	  <xsl:text disable-output-escaping="yes">//--&gt;</xsl:text>
	</script>

	<xsl:comment>#include virtual="/js/urchin.js" </xsl:comment>

      </xsl:element>
    </html>

  </xsl:template>

  <xsl:template mode="copy" match="f:content">
    <xsl:apply-templates mode="copy"/>
  </xsl:template>

  <xsl:template mode="copy" match="h:a[h:img]">
    <xsl:choose>
      <xsl:when test="@rel">
	<xsl:element name="a">
	  <xsl:apply-templates mode="copy" select="@*|node()"/>
	</xsl:element>
      </xsl:when>
      <xsl:otherwise>
	<xsl:element name="a">
	  <xsl:attribute name="rel">viewer</xsl:attribute>
	  <xsl:choose>
	    <xsl:when test="not(contains(h:a/@href,'jpg') 
			    or contains(h:a/@href,'jpeg')
			    or contains(h:a/@href,'png'))">
	      <xsl:copy-of select="@*"/>
	      <xsl:attribute name="href">
		<xsl:value-of select="h:img/@src"/>
	      </xsl:attribute>
	    </xsl:when>
	  </xsl:choose>
	  <xsl:apply-templates mode="copy" select="h:img" />
	</xsl:element>
	<div>
	  <small>
	    <xsl:element name="a">
	      <xsl:attribute name="href">
		<xsl:value-of select="@href"/>
	      </xsl:attribute>
	      <xsl:value-of select="@title"/>
	    </xsl:element>
	  </small>
	</div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template mode="copy" match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates mode="copy" select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>

