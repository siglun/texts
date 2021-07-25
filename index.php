<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
  <head>
    <title>Sigfrid Lundberg's Stuff</title>
    <script src="/js/navigation.js" type="text/javascript">
    </script>
    <meta http-equiv="content-type" 
	  content="application/xhtml+xml;charset=UTF-8" />

    <meta name="description"
	  content="contains thoughts about digital libraries, music and photography.
		   That is, I describe some of the stuff I have
		   been working on and striven for
		   the last decades." />

    <link rel ="stylesheet"
	  href="/css-style/html.css"
	  type="text/css" />

    <link rel ="stylesheet"
	  href="/css-style/responsive-html.css"
	  type="text/css" />


    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="https://feeds.feedburner.com/SigfridLundbergsStuff/?format=xml"
	  type="application/atom+xml"
	  title="Sigfrid Lundberg's Stuff"
	  rel="alternate"/>
    <?php
      $file = "./js/colorbox_include.html";
      if (file_exists($file)) {
      readfile($file);
      }
    ?>

  </head>
  <body>
    <div class="section group">
      <?php
	$top_file = "./top_div.xml";
	if (file_exists($top_file)) {
	readfile($top_file);
	}
      ?>
    </div>

    <div class="section group">
      <div class="col span_3_of_4">

	<?php
	  $file = "./google-custom-search.xml";
	  if (file_exists($file)) {
	  readfile($file);
	  }
	?>

	<?php
	  $file = "./news.xml";
	  if (file_exists($file)) {
	  readfile($file);
	  }
	?>

      </div>

      <div class="col span_1_of_4">

	<p>
	  <a href="https://feeds.feedburner.com/SigfridLundbergsStuff?format=xml"
	     type="application/atom+xml"
	     class="feed-link">
	    <img src="/images/Newsfeed-Atom.png" 
		 alt="Subscribe to Stuff from Sigfrid Lundberg"
		 border="0"/>Subscribe to my stuff</a><br/>

	      <a href="https://www.flickriver.com/photos/sigfridlundberg/popular-interesting/">
		my photostream @ flickriver
		</a><br/>

		<a href="https://www.flickr.com/photos/sigfridlundberg/">
		  my photostream @ flickr
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

	<p>
	  <a rel="license"
	     href="https://creativecommons.org/licenses/by-sa/3.0/">
	    <img alt="Creative Commons License" 
		 style="border-width:0" 
		 src="https://licensebuttons.net/l/by-sa/3.0/88x31.png" />
	    </a><br />
	    <span xmlns:dct="http://purl.org/dc/terms/" 
		  property="dct:title">Sigfrid Lundberg's Stuff</span> is licensed under a 
	    <a rel="license"
	       href="https://creativecommons.org/licenses/by-sa/3.0/">Creative Commons
	    Attribution-ShareAlike 3.0 Unported License</a>.
	</p>

      </div>

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

