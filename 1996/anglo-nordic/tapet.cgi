#!/usr/bin/perl -w

use strict;

$ENV{'PATH'}="$ENV{'PATH'}:/usr/local/bin:/usr/local/X11R6/bin";

my ($col_len, $col, $len, $pixmap);
my $cnt=0;
my $files = "";
my $now=time;

my $query=&decode($ENV{'QUERY_STRING'});

my @qvec=split(/&/,$query);
my ($key,$val);
foreach $col_len (@qvec) {

    ($key,$val)=split(/=/,$col_len);
    ($len,$col)=split(',',$val);
    $pixmap=`ppmmake \"\#$col\" $len 1`;

    open(FILE,">/tmp/$now\_$cnt");
    print FILE $pixmap;
    close FILE;
    
    $files .= "/tmp/$now\_$cnt ";
    $cnt++;

}


$pixmap=`pnmcat -lr $files |ppmtogif 2>/dev/null`;

print "Content-type: image/gif\n\n";
print $pixmap;

system("rm $files");




sub decode {
    my($string) = @_;
    
    $string=~s/\+/ /g;
    $string=~s/%([0-9A-F]{2})/pack('C',hex($1))/eig; 
    $string;
}



