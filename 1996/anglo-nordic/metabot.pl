#!/usr/bin/perl -w

use LWP::Simple;
use strict;

my $url=$ARGV[0];
my $content=get($url);

&extr_meta($content,$url);


sub extr_meta {
    my($content,$url) = @_;

    $content =~ s/\n/ /g;
    $content =~ s/\s+/ /g;
    $content =~ s/^.*?<meta//i;
    $content =~ s/<\/head.*$//i;

    my @metadata = split(/<meta/i,$content);

    print "\@DOCUMENT { $url\n";

    my ($tag,$key,$val);
    while ($tag=shift @metadata) {
	$tag =~ s/^\s*//;
	$tag =~ s/name=\"?(.+?)\"?[>\s]+//i;
	$key=$1;

	$tag =~ s/\"?\s*>.*$//;
	$tag =~ s/content=\"?(.+?)\"?\s*$//i;

	$val=$1;
	print "$key\{".length($val)."}:\t$val\n";

    }
    print "\}\n";

}
