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
    <title>Ediffah'.$redaktionen.' &mdash; S�kmaskin</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
  </head>');

$sidhuvud_search = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; S�kmaskin</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex,follow" />
  </head>');


$sidhuvud_scan = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Bl�ddra indexeringstermer</title>
    <link rel="stylesheet" href="/css-style/html.css" />
'.$adminstyle.'
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex,follow" />
  </head>');


$sidhuvud_avancerad = utf8_encode('<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Ediffah'.$redaktionen.' &mdash; Avancerade s�kning</title>
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
	   alt="Ediffah &mdash; En Digital Infrastruktur f�r Forskningsbibliotekens Arkiv- och Handskriftssamlingar" border="0"/></a>
');
$rubrik = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionen.'</b><br />&mdash; S�kmaskin</h1>');

$rubrik_scan = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionens.'</b><br />&mdash; Bl�ddra indexeringstermer</h1>');

$rubrik_avancerad = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah'.$redaktionens.'</b><br />&mdash; Avancerad s�kning</h1>');

$rubrik_redaktionssidan = utf8_encode('
      <h1 class="logo" >
	<b>Ediffah</b><br />&mdash; redaktionens sidor</h1>');


$topinfo = utf8_encode('

    <p>Detta �r en tj�nst i vardande. Allt h�r �r prelimin�rt, men kan
        f�r tillf�llet anses vara stabilt.
	Notera att posterna i databasen �r inte p� n�got s�tt �r representativa f�r f�r
	de deltagande bibliotekens samlingar.
	L�s g�rna mer <a href="http://www.lub.lu.se/ediffah/">om Ediffah</a>
	och om hur vi
	<a href="http://sigge.lub.lu.se/2004/ediffah/finding-aids/">f�rtecknar arkiv</a>.</p>
	<dl>
	<dt><strong>Prelimin�ra s�km�jligheter</strong><br/></dt>
	<dd>');

if($_SERVER['PHP_AUTH_USER']) {
    $topinfo = utf8_encode('
    <p>
       <strong>Du befinner dig nu i en del av tj�nsten som �r st�ngd f�r vanliga anv�ndare.
       H�r kan du skapa nya poster i databasen, ta bort poster ur basen eller ers�tta
       gamla poster med nya.</strong>

	<dl>
	<dt><p><strong>F�r att redigera i, eller avl�gsna, befintliga arkivf�rteckningar:
           B�rja med att g�ra en s�kning:</strong></p></dt> 
	<dd>'
);
}


$menu =  utf8_encode('
	[ '.$adminhome.' <a href="./">enkel s�kning</a> ||
	  <a href="./advanced.php">avancerad s�kning</a> ||
          <a href="./scan.php">bl�ddring bland indexeringstermerna</a> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_simple =  utf8_encode('
	[ '.$adminhome.' <strong>Enkel s�kning</strong> ||
	  <a href="./advanced.php">Avancerad s�kning</a> ||
          <a href="./scan.php">Indexeringstermer</a> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_scan =  utf8_encode('
	[ '.$adminhome.' <a href="./">Enkel s�kning</a> ||
	  <a href="./advanced.php">Avancerad s�kning</a> ||
          <strong>Indexeringstermer</strong> '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_avancerad =  utf8_encode('
	[ '.$adminhome.' <a href="./">Enkel s�kning</a> ||
	  <strong>Avancerad s�kning</strong> ||
          <a href="./scan.php">Indexeringstermer</a>  '.$loginlink.' ]
	</dd></dl>

    <br clear="all" />

');

$menu_editorial_home =  utf8_encode('
        <ul>
          <li><a href="./search/">enkel s�kning</a></li>
	  <li><a href="./search/advanced.php">avancerad s�kning</a></li>
          <li><a href="./search/scan.php">bl�ddring av indexeringstermer</a></li>
	</ul></dd><!--dt>
        <p>f�r att identifiera poster du vill ta bort eller ers�tta.</p></dt-->
        <dt><p><strong>Du kan ocks�</strong></p></dt><dd><ul>
        <li><a href="validate/">formattera (f� en preview) och validera egna</a> EAD-dokument.</li>
        <li><a href="create/">skapa en ny arkivf�rteckning</a> (EAD-dokument) f�r att
               tillg�ngligg�ra det.</li>
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
          Alla program som anv�nds i tj�nsten finns beskrivna i <a href="README.html">README</a>, och
          du kan sj�lv ladda ner dem som ett g-zippat tar-arkiv,
          <a href="./ediffah_gate.tar.gz">ediffah_gate.tar.gz</a>
        </p>
	<br />
	</div>
	<br />
  </body>
</html>
');


?>
