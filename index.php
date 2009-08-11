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
	  title="Subscribe to new conent"
	  rel="alternate"/>

    <link href="http://sigfridlundbergsstuff.disqus.com/latest.rss"
	  type="application/rss+xml"
	  title="Subscribe to comments"
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
	       border="0"/>Subscribe to all my Stuff</a>
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

