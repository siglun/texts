<?php 

require('./globals.php');

initservice();

require('./fragments.php');
require('./forms_and_searching.php');

print($sidhuvud_search);

$presentation=$_REQUEST["presentation"];


$searchterm = $_REQUEST["searchterm"];
$searchfield= $_REQUEST["searchfield"];
$boolean    = $_REQUEST["boolean"];
$start      = $_REQUEST["start"];
$number     = $_REQUEST["number"];
$db         = $_REQUEST["db"];

if($_SERVER['PHP_AUTH_USER'] && $_REQUEST["db"]) {
    $zhost = $zhosts[$db];
}

$xstyle = file_get_contents($xslt_file);

$connopts['charset'] = "UTF-8";

$id = yaz_connect($zhost,$connopts);


yaz_syntax($id,"xml");
yaz_range($id,$start,$number);


$yazsearch = '';
$termcount = 0;
$termlist  = '';
for ($p = 1; $p <= $maxfields; $p++) {
    if(!empty($searchterm[$p]) and !($searchterm[$p] == ' ') ) {
	$termcount = $termcount+1;

// sterm = Search term
// mterm = match term
	$sterm = $searchterm[$p];
	$mterm = $searchterm[$p];
	$truncation = '';
	if(strpos($searchterm[$p],'*')) {
	    $pattern = "/\*/";
	    $search_replacement = '#';
	    $sterm = preg_replace($pattern, $search_replacement, $sterm);
	    $match_replacement  = '[^\s\.\,\!]+';
	    $mterm = preg_replace($pattern,  $match_replacement, $mterm);
	    $pattern = "/^\s/";
	    $match_replacement  = '';
	    $mterm = preg_replace($pattern,  $match_replacement, $mterm);
	    $pattern = "/\s/";
	    $match_replacement  = '\\\\s';
	    $mterm = preg_replace($pattern,  $match_replacement, $mterm);
	    $truncation = ' @attr 5=101 ';
	}
	
	$yazsearch = ' '.$attributes[$searchfield[$p]] . $truncation 
	    .' "'.$sterm.'" '.$yazsearch;

	if($termlist) {
	    $termlist = "$termlist;".$mterm;
	} else {
	    $termlist = $mterm;
	}
	if($termcount > 1 ) {
	    $yazsearch = '@'. $boolean[$p-1].' '.$yazsearch;
	}
    }
}
echo "<dl>";
echo "<dt><strong>".utf8_encode("Du kan förfina Din sökning här").":</strong></dt>"; 
echo "<dd>";
//if($termcount < $maxfields) {
//    $boolean[$termcount]='and';
//    $searchterm[$termcount+1]=' ';
//    printform( $search,$fields,$searchterm,$searchfield,$boolean,$maxfields,1,10);
//} else {
    printform( $search,$fields,$searchterm,$searchfield,$boolean,$maxfields,1,10);
//}
echo "</dd>";
echo "</dl>";


echo "<!--";
echo $yazsearch;
echo "-->";

yaz_search($id,"rpn",'@term string ' . $yazsearch );
    
yaz_wait();

$error = yaz_error($id);
if (!empty($error)) {
    echo "Error: $error";
} else {
    $hits = yaz_hits($id);
    if($start+10>$hits) {
	$end=$hits;
    } else {
	$end = $start+10;
    }

    echo '<div class="navigation">';

    echo '<table class="navigation"><tr>';

    echo '<td width="33%" class="left"><strong>';
    $qstring=querystring( $fields,$searchterm,$searchfield,$boolean,$maxfields);
    if($start>=10) {
	$prev = $start-$number;
	echo "&lt;&lt;\n".'<a href="'.$search."?start=$prev&amp;number=$number&amp;".
	    $qstring.
	    "\">".utf8_encode("Föregående sida")."</a> | ";
    } else {
	echo "\n";
    }

    echo '</strong></td><td width="33%" class="center"><strong>';

    if($hits == 0) {
	echo utf8_encode("inga träffar");
    } elseif($hits == 1) {
	echo utf8_encode("en träff");
    } elseif($hits <= 10) {
	echo utf8_encode("$hits träffar");
    } elseif($hits == $end) {
	echo utf8_encode("Träff $start-").$end." av $hits";
    } else {
	echo utf8_encode("Träff $start-").($end-1)." av $hits";
    }

    echo '</strong></td><td width="33%" class="right"><strong>';
    if($start+$number <= $hits) {
	echo ' | <a href="'.$search."?start=$end&amp;number=$number&amp;".
	    $qstring.
	    "\">".utf8_encode("Nästa sida")."</a>\n&gt;&gt;";
    }
    echo '</strong></td></tr></table><br />';
    echo '</div>';

    $xh = xslt_create();

    for ($p = $start; $p <= $end; $p++) {
	$rec = yaz_record($id,$p,"string");
	if (empty($rec)) continue;
 
	$result = xslt_process($xh,
			       'arg:/_xml',
			       'arg:/_xslt',
			       NULL,
			       array('/_xml'  => "$rec",
				     '/_xslt' => "$xstyle"),
			       array('present' => $presentation,
				     'termlist'=> urlencode($termlist) ) );
				   

	if (!$result) {
	    die(sprintf("Cannot process XSLT document [%d]: %s", 
			xslt_errno($xh), xslt_error($xh)));
	}

	print "\n$result\n";

    }
    xslt_free($xh);

}



print($sidfot);

?>


