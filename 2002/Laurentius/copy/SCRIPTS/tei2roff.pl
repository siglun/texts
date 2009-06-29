#!/usr/bin/perl -w

use XML::LibXSLT;
use XML::LibXML;
use IO::Handle; 

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();
 
my $source = $parser->parse_file($ARGV[0]);

my $xsltfile='SCRIPTS/tei_to_roff.xsl';

my $style_doc = $parser->parse_file($xsltfile);
my $stylesheet = $xslt->parse_stylesheet($style_doc);
my $results = $stylesheet->transform($source);
my $roff=$stylesheet->output_string($results); 

my $line = '';

my @content = split (/\n+/,$roff);
my $text = '';

my $text_has_started=0;
my $preserve_space=0;

while($line = shift @content) {

    if ($line =~ m/TEXTHASSTARTED/) {
	$text_has_started=1;
    }
    if ($line =~ s/\.(TS|LD|ID|RD|CD)/\n.$1/) {
	my $macro = $1;
	$line =~ s/\n+\.$macro/\n.$macro/;
	$text_has_started=0;
	$preserve_space=1;
	print $text;
	$text='';
    }
    if ($line =~ m/^\.DE|TE/) {
	$text_has_started=1;
	$preserve_space=0;
    }
    if($text_has_started) {
	$line =~ s/\s+/ /g;
	if($line !~ /^\./) {
	    if($text !~ m|^\s*$|) {
		$text = join ' ',$text,$line;
	    } else {
		$text = $line;
	    }
	} else {
	    if($text_has_started && ($text =~ m|.+|)) {
		$text =~ s/\s+/ /g;
		$text =~ s/([\.\;\:\?\!][\"])[\s\n]+/$1\n/g;
		$text =~ s/([^\.\;\:\?\!][\.\;\:\?\!][\"]?)[\s\n]+/$1\n/g;
		print $text;
		print "\n" unless ($text =~ m|\n$|);
		$text = '';
	    }
	    print "$line\n";
	}
    } else {
	if($preserve_space) {
	    print "$line\n" if($line !~ m|^\s*$|);
	} else {
	    if($line !~ m|^\s*$|) {
		$line =~ s/^\s*//;
		print "$line\n";
	    }
	}
    }
}
if($text =~ m|.+|) {
    print $text;
    print "\n" unless ($text =~ m|\n$|);
}

# $Id$'
#
# $Log$
# Revision 1.1  2009/06/29 11:06:31  sigfrid
# Initial revision
#
# Revision 1.1  2002/03/24 09:42:08  siglun
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








