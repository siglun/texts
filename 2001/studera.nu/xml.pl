#!/usr/bin/perl -w
#
# A simple demo parsing smil pages
#

use strict;
use XML::Parser;
use Unicode::String qw(utf8 latin1);

my $parser = new XML::Parser;

$parser->setHandlers(
		     'Start' => \&startTag,
		     'End' => \&endTag,
		     'Char' => \&chars,
		     );

$parser->parsefile($ARGV[0],ProtocolEncoding => 'ISO-8859-1');

sub default {
    my ($parserx, $string) = @_;
    print "Default: [" , $string, "]";
}

sub startTag {
    my ($parserx, $element, %attribs) = @_;
	
    print "Start $element\n";
    my $key;
    my $val;
    if(%attribs) {
	my @attrs = keys %attribs;
	while($key = shift @attrs) {
	    print "\t$key $attribs{$key}\n";
	}
    }
}

sub endTag {
    my ($parserx, $element, %attribs) = @_;
    print "End $element";
}

sub chars {
    my ($parserx, $string) = @_;

#	$parserx->in_element('code');
    $string = &utf8($string)->latin1;
    print $string."\n";

}

