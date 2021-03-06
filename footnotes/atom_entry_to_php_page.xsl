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
    Builds entries
    Author Sigfrid Lundberg (siggelundberg@gmail.com)
    $Revision$ last modified $Date$
    $Id$
  -->

  <xsl:include href="php_macros.xsl"/>

  <xsl:param name="debug" select="''"/>
  
  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="yes"
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

	<xsl:processing-instruction name="php">
	  <![CDATA[
	   $uri = "http://sigfridlundbergsstuff.disqus.com/latest.rss";
	   $handle = @fopen($uri, "r");
	   $doc  = "";
	   if ($handle) {
              while (!feof($handle)) {
		   $buffer = fgets($handle, 4096);
		   $doc .= $buffer;
	      }
              fclose($handle);
           }
	   $domdoc = DOMDocument::loadXML($doc);
	  ]]>
	</xsl:processing-instruction>

	<script type="text/javascript" src="show_anchors.js">
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
      </head>

      <xsl:element name="body">
	<div class="left_box">
	  <div style="text-align:left;width=90%;">
	    <xsl:call-template name="php_include_html_file">
	      <xsl:with-param name="file" select="'div_top_left_box.xml'"/>
	    </xsl:call-template>
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

	    <xsl:call-template name="php_include_html_file">
	      <xsl:with-param name="file" select="'subjects.xml'"/>
	    </xsl:call-template>

	    <xsl:call-template name="php_include_html_file">
	      <xsl:with-param name="file" select="'me.xml'"/>
	    </xsl:call-template>

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
	    <a id="footnotesbutton" 
	       href="javascript:showAnchors();">Show Anchors</a> 
	    ||
	    <a class="addthis_button"
	       href="http://www.addthis.com/bookmark.php?v=250&amp;pub=siggelundberg">
	      <img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif"
		   width="125" 
		   height="16" 
		   alt="Bookmark and Share" 
		   style="border:0"/></a>
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

	  <div>
	    <h2>Footnotes</h2>
	    <xsl:processing-instruction name="php">
	      <![CDATA[
                 $xslt_file = "make_note_list.xsl";
	         $xh = new XSLTProcessor();
		 $xh->importStyleSheet( DOMDocument::load($xslt_file));
		 $result = $xh->transformToXML($domdoc);
		 print $result;

	      ]]>
	    </xsl:processing-instruction>
	  </div>


	  <div style="clear:both">
	    <xsl:text> 
	    </xsl:text>
	  </div>

	  <script type="text/javascript">
	    var usedAnchorIds = new Array();
	    var noteTexts     = new Array();
	    <xsl:processing-instruction name="php">
	      <![CDATA[
                 $xslt_file = "make_javascript.xsl";
	         $jxh = new XSLTProcessor();
		 $jxh->importStyleSheet( DOMDocument::load($xslt_file));
		 $result = $jxh->transformToXML($domdoc);
		 print $result;
	      ]]>
	    </xsl:processing-instruction>
	    printNotes(usedAnchorIds,noteTexts);
	  </script>



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

	<xsl:call-template name="php_include_html_file">
	  <xsl:with-param name="file" select="'js/urchin.js'" />
	</xsl:call-template>

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

