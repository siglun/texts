#!/usr/bin/perl

# we are about to make a table from data looking like
# 5;a;Implementation of view application;7,8,9,10

use strict;
my $offset = 0;

my $table = "<table>\n";
$table   .= '<tr><th rowspan="2" style="vertical-align:top">Task</th><th rowspan="2" style="vertical-align:top">Task name</th>';
$table   .= '<th colspan="12">Month</th></tr>'."\n";

$table .= "<tr>";
foreach my $week (1..12) {
    my $w = $offset + $week;

    $table .= '<th>'.$w.'</th>';
}

$table .= "</tr>\n";

while(my $line = <>) {
    next if $line =~ m/^#/;
    my ($task,$milestone,$title,$weeks) = split /\;/,$line;
    $table .= "  <tr>";
    $table .= "    <td valign='top'>$task ";
    $table .= "$milestone</td>\n";
    $table .= "    <td width='40%' valign='top'>$title</td>\n";
    foreach my $week (1..12) {
      if(length($week)<2) {
	$week = '0'.$week;
      }

	if($weeks =~ m/$week[,\n]/) {
	    $table .= '   <td valign="center" style="background-color:black"><img src="./black.gif" alt="#" style="width:15px;height:15px"/></td>'."\n";
	} else {
	    $table .= '   <td style="background-color:white"></td>'."\n";
	}
    }
    $table .= "   </tr>\n";
}
$table .= "</table>\n";

print $table;
