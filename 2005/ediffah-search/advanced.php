<?php
require('./globals.php');	
require('./forms_and_searching.php');

initservice();

require('./fragments.php');
print ($sidhuvud_avancerad);

for ($p = 1; $p <= $maxfields; $p++) {
    $searchfield[$p] = 'any';
    $searchterm[$p]  = ' ';
    if($p < $maxfields) {
	$boolean[$p]     = 'and';
    }
}
printform( $search,$fields,$searchterm,$searchfield,$boolean,$maxfields,1,10);

print ($sidfot);
?>
