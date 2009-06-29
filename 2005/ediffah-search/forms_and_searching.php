<?php

function printform ( $search,$fields,$searchterm,$searchfield,$boolean,$maxfields,$start,$number) {

    echo '<table class="navigation">
            <tr>
              <td class="left"><form method="get" action="'.$search.'">'.
          utf8_encode('Sök efter ord i (du kan högertrunkera med *):').'<br />';

    for ($p = 1; $p <= $maxfields; $p++) {
	reset ($fields);
//	if(!empty($searchterm[$p])) {
	    $counter++;
	    echo "<select name=\"searchfield[$counter]\">";
	    while ( list ($key,$val) = each ($fields) ) {
		if($searchfield[$p]==$key) {
		    echo "       <option value=\"$key\" selected=\"selected\">$val</option>\n";
		} else {
		    echo "       <option value=\"$key\">$val</option>\n";
		}
	    }
	    echo '</select>';
	    if($searchterm[$p] == ' ') {
		echo "\n<input size=\"25\" ".
		    "name=\"searchterm[$counter]\" ".
		    "value=\"\"/>";
	    } else {
		echo "\n<input size=\"25\" ".
		    "name=\"searchterm[$counter]\" ".
		    "value=\"$searchterm[$p]\"/>";
	    }

//	    if($boolean[$p]) {
		    $andselected = 'selected="selected"';
		    $orselected  = ' ';
		if($boolean[$p] == 'or') {
		    $orselected = 'selected="selected"';
		    $andselected = ' ';
		}
		    if($p < $maxfields) {
		echo "<select name=\"boolean[$counter]\">\n".
		    "<option value=\"and\" ".$andselected.">Och</option>\n".
		    "<option value=\"or\" ".$orselected.">Eller</option>\n".
		    "</select>\n";}
//	    }
	    echo "<br />\n";
//	}
    }

    if($_SERVER['PHP_AUTH_USER']) {
	print "<p>";
	print utf8_encode('
              <strong>Välj databas</strong><br/>');

        print '<input name="db" type="radio" value="ediffah"';
	if( ($_REQUEST["db"] == 'ediffah') || !($_REQUEST["db"])) {
	    print 'checked="checked"';
	}
	print '/>';
	print utf8_encode('Sök i den publika databasen');
	print '<input name="db" type="radio" value="internal"';
	if( $_REQUEST["db"] == 'internal') {
	    print 'checked="checked"';
	}
	print ' />';
	print utf8_encode('Sök i den interna');
	print "</p>";
    }

    echo '<input type="hidden" name="start" value="'.$start.'"/>
          <input type="hidden" name="number" value="'.$number.'"/>
          <input type="submit" name="action" value="'.utf8_encode('Sök').'" />
          </form></td></tr></table>'."\n";
}

function querystring ( $fields,$searchterm,$searchfield,$boolean,$maxfields) {

    $str='';
    $counter=0;
    for ($p = 1; $p <= $maxfields; $p++) {
	reset ($fields);
	if(!empty($searchterm[$p])) {
	    $counter++;
	    if(!empty($str)) {
		$str .= '&amp;';
	    }
	    $str .= "searchfield[$counter]=$searchfield[$p]".
		'&amp;'."searchterm[$counter]=".rawurlencode($searchterm[$p]).
		'&amp;'."boolean[$counter]=".rawurlencode($boolean[$p]);
	}
    }

    if($_SERVER['PHP_AUTH_USER'] && $_REQUEST["db"]) {
	$str .= '&amp;db='.$_REQUEST["db"];
    }

    return $str;
    
}

?>
