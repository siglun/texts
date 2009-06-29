<?php

$searchtop = '/home/sigge/WWW/2005/ediffah-search/';

$fragments = "$searchtop/fragments";
$huvud     = "$fragments/sid_huvud.text";
$fot       = "$fragments/sid_fot.text";

$search='./search.php';
$maxfields = 3;

$num_hosts = count ($host);
$zhosts = array ('ediffah'  => 'bourree.lub.lu.se:2121/ediffah',
		 'internal' => 'bourree.lub.lu.se:2121/internal');

$zhost = $zhosts['ediffah'];

$xslt_file          = "$searchtop/ediffah-hit.xsl";
$xslt_file_detailed = "$searchtop/ediffah-hit-detailed.xsl";

$fields	= array ("any"            => utf8_encode('Alla fält'),
		 "genreform"      => utf8_encode('Typer av handlingar'),
		 "occupation"     => utf8_encode('Yrkesbeteckning'),
		 "origination"    => utf8_encode('Arkivbildare'),
		 "persname"       => utf8_encode('Personnamn'),
		 "persnameagg"    => utf8_encode('Samtliga personnamn'),
		 "corpname"       => utf8_encode('Organisationsnamn'),
		 "set"            => utf8_encode('Arkivinstitution'),
		 "corpnameagg"    => utf8_encode('Samtliga Organisationsnamn'),
/*		 "title"          => utf8_encode('Titel'),*/
		 "unittitle"      => utf8_encode('Titel'),
		 "subject"        => utf8_encode('Ämnesord'),
		 "description"    => utf8_encode('Sammanfattning'),
		 );



$headingfields	= array ("genreform"      => utf8_encode('Typer av handlingar'),
			 "occupation"     => utf8_encode('Yrkesbeteckning'),
			 "persname"       => utf8_encode('Personnamn'),
/*			 "persnameagg"    => utf8_encode('Samtliga personnamn'),*/
/*			 "corpname"       => utf8_encode('Organisation'),*/
/*			 "famname"        => utf8_encode('Familjenamn'),*/
/*			 "function"       => utf8_encode('Funktion'),*/
			 "geogname"       => utf8_encode('Geografiskt namn'),
			 "origination"    => utf8_encode('Arkivbildare'),
			 "subject"        => utf8_encode('Ämnesord'),
/*			 "heading-title"  => utf8_encode('Verkstitel')*/
			 );


$headings = array ("genreform"  => '@attr 1=5090  @attr 4=6 @attr 2=102 @attr 6=1',
		   "occupation" => '@attr 1=5110  @attr 4=6 @attr 2=102 @attr 6=1',
		   "persname"   => '@attr 1=5120  @attr 4=6 @attr 2=102 @attr 6=1',
		   "persnameagg"=> '@attr 1=1     @attr 4=6 @attr 2=102 @attr 6=1',
		   "corpnameagg"=> '@attr 1=2     @attr 4=6 @attr 2=102 @attr 6=1',
		   "famname"    => '@attr 1=5070  @attr 4=6 @attr 2=102 @attr 6=1',
		   "function"   => '@attr 1=5080  @attr 4=6 @attr 2=102 @attr 6=1',
		   "geogname"   => '@attr 1=5100  @attr 4=6 @attr 2=102 @attr 6=1',
		   "subject"    => '@attr 1=5130  @attr 4=6 @attr 2=102 @attr 6=1',
		   "origination"=> '@attr 1=5160  @attr 4=6 @attr 2=102 @attr 6=1',
		   "any"        => '@attr 1=1016  @attr 4=6 @attr 2=102 @attr 6=1',
		   "author"     => '@attr 1=5160  @attr 4=6 @attr 2=102 @attr 6=1',
		   "title"      => '@attr 1=4     @attr 4=6 @attr 2=102 @attr 6=1',
		   "unittitle"  => '@attr 1=5240  @attr 4=6 @attr 2=102 @attr 6=1',
		   "description"=> '@attr 1=62    @attr 4=6 @attr 2=102 @attr 6=1',
		   "set"        => '@attr 1=5005',
		   );

$attributes = $headings;



$cclfields = array ("ti" => $attributes['title'],
		    "au" => $attributes['author'],
		    "ab" => $attributes['description'],
		    "su" => $attributes['subject'],
		    "pu" => $attributes['publisher']);


function initservice() {

header("Content-type: text/html; charset=UTF-8");

return 1;

}

?>
