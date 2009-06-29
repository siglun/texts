#!/usr/bin/perl

print "Content-type: text/html; charset=iso-8859-1\n\n";

open(REV,"rlog infrastruktur.html.utf8|");

print "<pre>\n";
while ( my $line = <REV> ) {
	print $line;
}
print "</pre>\n";