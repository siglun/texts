#!/usr/bin/perl -w

use strict;
use lib 'perl-lib';
use lib '/home/sigge/WWW/2004/ediffah/editorial-system/lib/';
use FindingAid;
use cgirequest;

binmode STDOUT, ":utf8";

print "Content-Type: text/xml;charset=UTF-8\n\n";

my $request=new cgirequest;

my $id = $request->id;
my $findingaid = new FindingAid;
$findingaid->retrieve_by_identifier($id);

print $findingaid->document->toString(1);
