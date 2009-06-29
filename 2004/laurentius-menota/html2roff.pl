#!/usr/bin/perl -w

use strict;

use XML::LibXSLT;
use XML::LibXML;

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();

$parser->keep_blanks(0);
my $source = $parser->parse_file($ARGV[0]);
my $xsltfile='./to_roff.xsl';

my $style_doc = $parser->parse_file($xsltfile);

my $stylesheet = $xslt->parse_stylesheet($style_doc);
my $results = $stylesheet->transform($source);
my $roff=$stylesheet->output_string($results);
print $roff;

my @content = split(/\n+/,$roff);

my $preserve_space=0;

my @document=();
my $text = '';

foreach my $line (@content) {

#
#   Start of Display or table
#
    if ($line =~ m/^\.(TS|LD|ID|RD|CD|display1)/) {
        push @document,$text;
        $text='';
        push @document,$line;
        $preserve_space=1;
        next;
    }
#
#   End of Display or table
#
    if ($line =~ m/^\.DE|TE|display2/) {
        $preserve_space=0;
        push @document,$line;
        next;
    }
#
#   Handling of the rest
#
    if($preserve_space) {
        push @document,$line unless $line =~ m/^\s*$/;
        next;
    } else {

        $line =~ s/\s+/ /g;

#
#   1. The line is just an ordinary line of text. We put it in
#      the 'text' buffer.
#

        if($line !~ /^\./) {
            if($text !~ m|^\s*$|) {
                $text = join ' ',$text,$line;
            } else {
                $text = $line;
            }
            next;
        } else {

#
#   2. We've found a request or macro
#      We start by emitting the text we've got sofar
#
            if($text =~ m|.+|) {
                $text =~ s/\s+/ /g;
                $text =~ s/\.\.\./__dotty__/g;
                $text =~ s/([\.\;\:\?\!][\"])[\s\n]+/$1\n/g;
                $text =~ s/([^\.\;\:\?\!][\.\;\:\?\!][\"]?)[\s\n]+/$1\n/g;
                $text =~ s/__dotty__/.../g;
                my @r = split /\n/,$text;
                while(my $l = shift (@r)) {
                    $l =~ s/^\s*//;
                    push @document,$l if $l !~ m/^\s*$/;
                }
                $text = '';
            }
#
#     Then we emit the macro itself
#
            push @document,$line;
        }
    }
}
if($text =~ m|.+|) {
    push @document,$text;
}

my $finaldoc = join ("\n",@document)."\n";

$finaldoc =~ s|\n+\.display[12]\n+|\n|g;
$finaldoc =~ s|\n+|\n|g;

print $finaldoc;

