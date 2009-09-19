<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Edit footnote</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" href="/css-style/html.css"/>
    <script type="text/javascript">
      <?php
	$uri='';
	if(!empty($_REQUEST["uri"])) {
	   $uri=$_REQUEST["uri"];
	   $anchor=$_REQUEST["anchor"];
	   print "var disqus_url='".$uri."?anchor=".$anchor."';\n";
	}
      ?>
//      var disqus_developer=1;
    </script>
  </head>
  <body>

    <p>When you're ready with your comment (footnote) just close using the
    link above. The form doesn't return as expected :-(</p>

    <div id="disqus_thread">
    </div>

    <p style="margin-left:+1%;">
      <a href="http://disqus.com" class="dsq-brlink">blog comments powered
      by <span class="logo-disqus">Disqus</span></a>
    </p>

    <script type="text/javascript" 
	    src="http://disqus.com/forums/sigfridlundbergsstuff/embed.js">
    </script>

    <noscript>
      <a href="http://sigfridlundbergsstuff.disqus.com/?url=http://sigfrid-lundberg.se">
	View the discussion thread
      </a>
    </noscript>

    <script type="text/javascript">//<!--
    (function() {
    var links = document.getElementsByTagName('a');
    var query = '?';
    for(var i = 0; i < links.length; i++) {
       if(links[i].href.indexOf('#disqus_thread') >= 0) {
          query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
       }
    }
    document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/sigfridlundbergsstuff/get_num_replies.js' + query + '"></' + 'script>');
    })();
    //--></script>

  </body>
</html>
