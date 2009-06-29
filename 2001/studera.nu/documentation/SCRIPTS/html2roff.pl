#!/usr/bin/perl -w

use strict;
use XML::Sablotron qw( :all ); 
my $xsltfile='./SCRIPTS/to_roff.xsl';
my $xslt = `cat $xsltfile`;
my $html=`cat $ARGV[0]`;

my $roff='';

$html =~ s/([\n\s\(]+)&quot;/$1\\(lq/g;
$html =~ s/&quot;([\n\s\),;:\.]+)/\\(rq$1/g;
$html =~ s|<img\s+src="([^\.]+)\...."|<img src="$1.eps"|g;

&ProcessStrings($xslt, $html, $roff); 

while($roff =~ s/^(.*)\n+//) {
    my $line = $1;
    $line =~ s|\\/|\\\\/|g;
    $line =~ s|--|\\(em|g;
    print $line."\n";
}



