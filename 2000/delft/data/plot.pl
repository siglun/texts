#!/usr/bin/perl

my @incidence;
my $max=0;

while(<>) {

    my ($num,$tag) = split /\s+/;

    push @incidence,$num;

    $max = ($num>$max)?$num:$max;

}

for(my $i=0;defined $incidence[$i];$i++) {

    print "$i ".$incidence[$i]/$max."\n";

}
