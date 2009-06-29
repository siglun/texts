#!/usr/bin/perl -w

use strict;

use XML::LibXSLT;
use XML::LibXML;

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();

$parser->keep_blanks(0);
my $source = $parser->parse_file($ARGV[0]);
my $xsltfile='to_roff.xsl';

my $style_doc = $parser->parse_file($xsltfile);

my $stylesheet = $xslt->parse_stylesheet($style_doc);
my $results = $stylesheet->transform($source);
my $roff=$stylesheet->output_string($results);
print $roff;

my @doc = split(/\n/,$roff);

my $notindisplay=1;

foreach my $line (@doc) {

    if($line =~ m|^\.[ILR]D| ) {
	$notindisplay=0;
    }

    if($line =~ m|^\.DE| ) {
	$notindisplay=1;
    }

    next if ($notindisplay && ($line =~ m|^\s*$|));

    # These are hacks for printing computer programs
    $line =~ s|\\@|\\\\@|g;
    $line =~ s|\\n([^\(\[])|\\\\n$1|g;
    $line =~ s|n\\n"|n\\\\n"|g;

    if($line =~ m|PSPIC|) {
	$line =~ s/\.(gif)|(png)/\.eps/;
    }

    print $line."\n";
}
