#!/usr/bin/perl -w

use strict;
use XML::LibXSLT;
use XML::LibXML;
my $sheet = 'db_special.xsl';

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();

my $style_doc  = $parser->parse_file($sheet);
my $stylesheet = $xslt->parse_stylesheet($style_doc);

while (my $file = <*.xml> ) {
    my $doc      = $parser->parse_file($file);
    my $html_doc = $stylesheet->transform($doc,
					  'filenames'  => "'change'");
    my $html     = $stylesheet->output_string($html_doc); 
    my $htmlfile = $file;
    $htmlfile =~ s/\.xml/.html/;
    open OUT, ">$htmlfile";
    print OUT $html;
}
