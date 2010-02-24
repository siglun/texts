<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
  <head>
    <title>Sigfrid Lundberg's Stuff</title>
    <script src="/js/navigation.js" type="text/javascript">
    </script>
    <meta http-equiv="content-type" 
	  content="text/html;charset=UTF-8" />

    <meta name="description"
	  content="contains thoughts about digital libraries.
		   That is, I describe some of the stuff I've
		   been working on (and strived for)
		   during fifteen years or so." />

    <link rel ='stylesheet'
	  href='/css-style/html.css'
	  type="text/css" />

    <link href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
	  type="application/atom+xml"
	  title="Sigfrid Lundberg's Stuff"
	  rel="alternate"/>

    <link rel="stylesheet" 
	  href="http://www.google.com/cse/style/look/default.css" 
	  type="text/css" />

    <link href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
	  type="application/rss+xml"
	  title="Latest Comments"
	  rel="alternate"/>

  </head>
  <body>

    <div class="left_box">

      <?php
	$file = "./div_top_left_box.xml";
	if (file_exists($file)) {
	readfile($file);
	}
      ?>

      <p>
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
	       border="0"/>Subscribe to discussion feed
	</a><br/>

	<a href="http://nyligen.se/blogg/nc3435">
	  Sigfrid Lundgberg's Stuff@nyligen.se
	</a>

      </p>

      <?php
	$file = "./subjects.xml";
	if (file_exists($file)) {
	readfile($file);
	}
      ?>

      <?php
	$file = "./me.xml";
	if (file_exists($file)) {
	readfile($file);
	}
      ?>


    </div>

    <div class="right_box">

      
      <div id="cse" style="width: 45%;">Loading</div>
      <script src="http://www.google.com/jsapi" type="text/javascript"></script>
      <script type="text/javascript">
	google.load('search', '1', {language : 'en'});
	google.setOnLoadCallback(function(){
	var customSearchControl =
	new google.search.CustomSearchControl('014822456156750504894:ajwd07-5i_k');
	customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
	customSearchControl.draw('cse');
	}, true);
      </script>


      <?php
	$file = "./news.xml";
	if (file_exists($file)) {
	readfile($file);
	}
      ?>
    </div>

    <?php
      $file = "./js/urchin.js";
      if (file_exists($file)) {
          readfile($file);
      }
    ?>

  </body>
</html>

<!--
    $Id$
-->

