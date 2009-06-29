<?php 

require('./globals.php');

initservice();

require('./fragments.php');
require('./forms_and_searching.php');

print($sidhuvud_scan);
if($_SERVER['PHP_AUTH_USER']) {
    print utf8_encode("<p>Bläddring är endast implementerat för den publika basen!</p>\n");
}

$presentation=$_REQUEST["presentation"];
$scanterm=$_REQUEST["scanterm"];
$position = $_REQUEST["position"];

if(!$position) {
    $position = 1;
}

if(!$scanterm) {
    $scanterm = 'a';
}

$scanfield=$_REQUEST["scanfield"];
if(!$scanfield) {
    $scanfield = 'subject';
}

$start=$_REQUEST["start"];
$number=$_REQUEST["number"];
$currentattr = $headings['subject'];

echo "<table class='navigation'><tr><td class='left'>";
echo "<dl>\n";
echo utf8_encode("<dt><strong>Välj typ av term att bläddra</strong></dt>\n");
while(list($name, $field)=each($headingfields)) {
    echo "<dd>";
    if($name == $scanfield ) {
	$currentattr = $headings[$name];
	echo "<strong>$field</strong>";
    } else {
	echo "<a href=\"scan.php?scanfield=$name\">$field</a>";
    }
    echo "</dd>\n";
}
echo "</dl>";

echo "</td><td class='right'>";
$maxfields = 10;
$test=0; #$test = 1;

echo utf8_encode("
<dl>
<dt><strong>Nuvarande bläddringsterm</strong>
(Du kan välja annan startterm här):
</dt>
<dd><form action='./scan.php' method='get'>
   <input type='hidden' name='scanfield' value='").$scanfield."'/>
   <input type='text' name='scanterm' value='$scanterm'/>
   <input type='submit' value='".utf8_encode("Använd denna term")."'/>
</form>
</dd></dl>
";

echo "</td></tr></table>\n";

$connopts['charset'] = "UTF-8";
$id = yaz_connect($zhost,$connopts);
scan_terms($id,$currentattr,$scanfield,$scanterm,$position);
print($sidfot);


function scan_terms($id, $currentattr, $field, $starterm,$position) {
    $options = array ( 'number'   => 20,
		       'position' => $position
		       );

    echo "<!-- Settings -->\n";
    echo "<!-- field=$field -->\n";
    echo "<!-- ".$currentattr . ' ' . $starterm . "-->\n";

   while(list($key,$val)=each($options)) {
	echo "<!-- Before  $key = $val  -->\n";
    }
    yaz_scan($id,"rpn", $currentattr . ' @attr 6=3 ' . $starterm, &$options);
    yaz_wait();
    $errno = yaz_errno($id);
    while(list($key,$val)=each($options)) {
	echo "<!-- After $key = $val  -->\n";
    }


    if ($errno == 0) {
	$ar = yaz_scan_result($id,&$options);
	echo "<!-- Scan ok -->\n";

	while(list($key,$val)=each($options)) {
	    echo "<!-- $key = $val  -->\n";
	}

	$members = 0;
	echo '<dl>';

	while(list($key,list($k, $term, $tcount))=each($ar)) {
	    
            if (empty($k)) continue;
	    if($members == 0) {
		$startterm = $term;
		echo '<dt><strong>'.utf8_encode("Klicka på term för att söka")."</strong></dt>\n";
	    }
	    $members++;
            echo "<dd>";
	    $search = './search.php';
	    echo "<a href=\"$search".
		'?start=1&amp;number=10&amp;searchfield%5B1%5D='.$field.'&amp;searchterm%5B1%5D=';
            echo urlencode($term);
	    echo '">';
            echo $term;
	    echo '</a> ';
            echo " ($tcount)";
	    echo "</dd>\n";
	    $endterm = $term;

	}

	echo '</dl>';

	echo "<br/><table class='navigation'>";
        echo "<tr><td class='left'>";
/*	if($members>1) {*/
	    echo "&lt;&lt; <a href=\"./scan.php?scanfield=$field";
	    echo "&amp;position=20";
	    echo "&amp;scanterm=";
	    $keywords = preg_split("/[\s,]+/",$startterm);
	    echo urlencode($keywords[0])."\">";
	    echo utf8_encode("Bläddra bakåt");
	    echo "</a> ";
/*	}*/

        echo "</td><td class='right'>";
/*	if($members>1 or $position=1) {*/
	    echo " <a href=\"./scan.php?scanfield=$field&amp;scanterm=";
            $keywords = preg_split("/[\s,]+/",$endterm);
	    echo urlencode($keywords[0])."\">";
	    echo utf8_encode("Bläddra framåt");
	    echo "</a> &gt;&gt;";
/*	}*/
	echo "</td></tr></table>";

    } else {
	echo "Scan failed. Error: " . yaz_error($id) . "<br>";
    }

}


?>


