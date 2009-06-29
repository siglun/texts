#!/usr/bin/perl -w

use XML::LibXSLT;
use XML::LibXML;
use IO::Handle; 

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();
 
my $rq='\\(rq';
#my $lq='\\(lq'; # English
my $lq='\\(rq';  # Swedish
my $em='\\(em';

my $temp = 'strunt'.time.'.txt';

open (IN,"<$ARGV[0]") or die "cannot open $ARGV[0]";
open (OUT,">$temp") or die "cannot open temp";

while(<IN>) {
#    s/&quot;/$rq/gi;
    s/([^!])--([^>])/$1$em$2/gi;
    print OUT;
}

close IN;
close OUT;
my $source = $parser->parse_file($temp);

my $xsltfile='SCRIPTS/to_roff.xsl';

my $style_doc = $parser->parse_file($xsltfile);
my $stylesheet = $xslt->parse_stylesheet($style_doc);
my $results = $stylesheet->transform($source);
my $roff=$stylesheet->output_string($results); 

my $line = '';

my @content = split (/\s*\n+\s*/,$roff);
my $text = '';

while($line = shift @content) {
    if($line !~ /^\./) {
	if($text !~ m|^\s*$|) {
	    $text = join ' ',$text,$line;
	} else {
	    $text = $line;
	}
    } else {
	$line =~ s/\.gif$/.eps/;
	if($text =~ m|.+|) {
	    $text =~ s/([\.\,\;\:\?\!][\"])[\s\n]+/$1\n/g;
	    $text =~ s/([^\.\,\;\:\?\!][\.\,\;\:\?\!][\"]?)[\s\n]+/$1\n/g;
	    $text =~ s/\n\./\n\\&./g;
	    $text =~ s/\"/$rq/g;
	    print $text;
	    $text = '';
	    print "\n" unless ($text =~ m|\n$|);
	}
	print "$line\n";
    }
}
if($text =~ m|.+|) {
    print $text;
    print "\n" unless ($text =~ m|\n$|);
}

unlink $temp;

# $Id$'
#
# $Log$
# Revision 1.1  2009/06/29 11:06:29  sigfrid
# Initial revision
#
# Revision 1.3  2001/10/07 16:49:08  siglun
# Rewritten script to 'massage' text so that all lines end with
# some kind of punctuation, which makes *roff formatting nicer.
#
# Revision 1.2  2001/10/01 17:26:35  siglun
# Fixat så att alla textrader slutar på skiljetecken '.,!?:' eller
# '"'. Bytt ut xslt-processorn sablotron mot libxslt.
#








