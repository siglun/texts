<?php

if($_SERVER['PHP_AUTH_USER']) {
    $adminstyle = "<style>
body {
color: black;
background-color: #f8c1ce;
font-size: 100%;
font-weight: normal;
margin-top: 5%;
margin-left: 5%;
margin-right:5%;}</style>";
    $adminhome   = '<a href="../">Redaktionens hemsida</a> ||';
    $loginurl    = '';
    $redaktionen = 'redaktionen';
} else {
    $adminstyle = '';
    $adminhome  = '';
    $redaktionen= '';
    $loginlink  = ' || <a href="http://sigge.lub.lu.se/2004/ediffah/editorial-system/">'.
	'Redaktionenens sidor</a>';
}


$sidhuvud = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Sökmaskin</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
  </head>');

$sidhuvud_search = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Sökmaskin</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex,follow" />
  </head>');


$sidhuvud_scan = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Bläddra indexeringstermer</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex,follow" />
  </head>');


$sidhuvud_avancerad = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Avancerade sökning</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
  </head>');


$rubrikinfo = utf8_encode('

  <body>

    <div class="box">    
    <a href="./">
       <img src="/2004/ediffah/ediffah.jpg"
           class="right"
	   alt="Ediffah &mdash; En Digital Infrastruktur för Forskningsbibliotekens Arkiv- och Handskriftssamlingar" border="0"/></a>
');
$rubrik = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionen.'</b><br />&mdash; Sökmaskin</h1>');

$rubrik_scan = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionens.'</b><br />&mdash; Bläddra indexeringstermer</h1>');

$rubrik_avancerad = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionens.'</b><br />&mdash; Avancerad sökning</h1>');

$rubrik_redaktionssidan = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah</b><br />&mdash; redaktionens sidor</h1>');


$topinfo = utf8_encode('

    <p>Detta är en tjänst i vardande. Allt här är preliminärt, men kan
        för tillfället anses vara stabilt.
	Notera att posterna i databasen är inte på något sätt är representativa för för
	de deltagande bibliotekens samlingar.
	Läs gärna mer <a href="http://www.lub.lu.se/ediffah/">om Ediffah</a>
	och om hur vi
	<a href="http://sigge.lub.lu.se/2004/ediffah/finding-aids/">förtecknar arkiv</a>.</p>
	<dl>
	<dt><strong>Preliminära sökmöjligheter</strong><br/></dt>
	<dd>');

if($_SERVER['PHP_AUTH_USER']) {
    $topinfo = utf8_encode('
    <p>
       <strong>Du befinner dig nu i en del av tjänsten som är stängd för vanliga användare.
       Här kan du skapa nya poster i databasen, ta bort poster ur basen eller ersätta
       gamla poster med nya.</strong>

	<dl>
	<dt><p><strong>För att redigera i, eller avlägsna, befintliga arkivförteckningar:
           Börja med att göra en sökning:</strong></p></dt> 
	<dd>'
);
}


$menu =  utf8_encode('
	[ '.$adminhome.' <a href="./">enkel sökning</a> ||
	  <a href="./advanced.php">avancerad sökning</a> ||
          <a href="./scan.php">bläddring bland indexeringstermerna</a> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_simple =  utf8_encode('
	[ '.$adminhome.' <strong>Enkel sökning</strong> ||
	  <a href="./advanced.php">Avancerad sökning</a> ||
          <a href="./scan.php">Indexeringstermer</a> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_scan =  utf8_encode('
	[ '.$adminhome.' <a href="./">Enkel sökning</a> ||
	  <a href="./advanced.php">Avancerad sökning</a> ||
          <strong>Indexeringstermer</strong> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_avancerad =  utf8_encode('
	[ '.$adminhome.' <a href="./">Enkel sökning</a> ||
	  <strong>Avancerad sökning</strong> ||
          <a href="./scan.php">Indexeringstermer</a>  '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_editorial_home =  utf8_encode('
        <ul>
          <li><a href="./search/">enkel sökning</a></li>
	  <li><a href="./search/advanced.php">avancerad sökning</a></li>
          <li><a href="./search/scan.php">bläddring av indexeringstermer</a></li>
	</ul></dd><!--dt>
        <p>för att identifiera poster du vill ta bort eller ersätta.</p></dt-->
        <dt><p><strong>Du kan också</strong></p></dt><dd><ul>
        <li><a href="validate/">formattera (få en preview) och validera egna</a> EAD-dokument.</li>
        <li><a href="create/">skapa en ny arkivförteckning</a> (EAD-dokument) för att
               tillgängliggöra det.</li>
        </ul>
        </dd></dl>

    <br clear="all" />
');

if($_SERVER['PHP_AUTH_USER']) {
    $sidhuvud_redaktion = $sidhuvud.$rubrikinfo.
	$rubrik_redaktionssidan.
	$topinfo.$menu_editorial_home;
} else {
    $sidhuvud_redation = '';
}

$sidhuvud_simple = $sidhuvud.$rubrikinfo.$rubrik.$topinfo.$menu_simple;
$sidhuvud = $sidhuvud.$rubrikinfo.$rubrik.$topinfo.$menu;
$sidhuvud_scan = $sidhuvud_scan.$rubrikinfo.$rubrik_scan.$topinfo.$menu_scan;
$sidhuvud_search = $sidhuvud_search.$rubrikinfo.$rubrik.$topinfo.$menu;
$sidhuvud_avancerad = $sidhuvud_avancerad.$rubrikinfo.$rubrik_avancerad.$topinfo.$menu_avancerad;

$sidfot = utf8_encode('
	 <br />
       </div>
    <pre>

    </pre>
  </body>
</html>
');

$sidfot_start = utf8_encode('
	<br />
        <p>
          Alla program som används i tjänsten finns beskrivna i <a href="README.html">README</a>, och
          du kan själv ladda ner dem som ett g-zippat tar-arkiv,
          <a href="./ediffah_gate.tar.gz">ediffah_gate.tar.gz</a>
        </p>
	<br />
	</div>
	<br />
  </body>
</html>
');


?>
