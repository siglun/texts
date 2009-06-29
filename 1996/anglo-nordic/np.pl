#!/usr/bin/perl -w

use strict;

my $dirlist = `grep title slide*.shtml|sort`;

$dirlist =~ s/<\/?title>//gi;

my @dir = split(/\n/,$dirlist);

my ($doc,$fil,$tit,$i,$next,$prev);
my $meis = $ENV{'DOCUMENT_NAME'};
$meis =~ s/index.shtml/slideA.shtml/;
for($i=0;$i<=$#dir;$i++) {
    last if ($dir[$i] =~ /$meis/);
}

if($i==0) {
    ($next,$tit)=split(/:/,$dir[1],2);
    ($prev,$tit)=split(/:/,$dir[$#dir],2);
} elsif ($i==$#dir) {
    ($next,$tit)=split(/:/,$dir[0],2);
    ($prev,$tit)=split(/:/,$dir[$#dir-1],2);
} else {
    ($next,$tit)=split(/:/,$dir[$i+1],2);
    ($prev,$tit)=split(/:/,$dir[$i-1],2);
}

print <<"END";
<img src=\"netlab.gif\" alt=\"[NETLAB]\" width=100 border=0><br>
<img src=\"space.gif\" width=135 height=20><br>
<a href=\"$prev\"><img src=\"previous.gif\" alt=\"[previous]\" border=0 width=20></a><img src=\"space.gif\" width=35 height=20>
<a href=\"$next\"><img src=\"next.gif\" alt=\"[next]\" border=0 width=20></a><br>

<br clear=\"all\">
END

foreach $doc (@dir) {

    ($fil,$tit)=split(/:/,$doc,2);

    if ($fil =~ /$ENV{'DOCUMENT_NAME'}/) {
	print "<p><img src=\"cir.gif\" align=\"left\">";
	print "<small>$tit</small>\n";
    } else {
	print "<p><a href=\"$fil\"><small>$tit</small></a>\n";
    }

}

