#!/usr/bin/perl

use lib 'lib';
use ToTROFF;

my $translator=ToTROFF->new;


open XML,"<$ARGV[0]";

$translator->translate(\*XML);



