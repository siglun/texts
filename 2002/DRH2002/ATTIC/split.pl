#!/usr/bin/perl

my $doc = '';
while(my $line = <> ) { $doc .= $line; }

$doc =~ s/^(.+?)<h2>/<h2>/mi;

$doc =~ s/<\/body>.*$//;

$doc =~ s/<pre>[^\&]*?<\/pre>//g;

@parts = split /<h2>/,$doc;

my $p = shift @parts;
while( $p = shift @parts ) {

    $p = "<h2>$p";

    my $sect='';

    if($p =~ m/<h2><a name="([^"]+)">/) {
       $sect = $1;
    } else {
       $sect = 'toc';
    }

    open SECT,">$sect.html";
    select SECT;
    &encapsulate($sect,$p);
    close SECT;

}

sub encapsulate {
    my $sect = shift;
    my $body = shift;

    $body =~ s/#sect(\d\d\d)/sect$1.html/g;
    $body =~ s/#links/links.html/g;
    $body =~ s/#top/toc.html/g;
    print <<"END";
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >

<html xmlns="http://www.w3.org/1999/xhtml">

  <head>

    <title>Laurentius: section $sect</title>

    <meta name="DC.creator" content="Lundberg, Sigfrid" />

  <body bgcolor="#ffffff">

$body

  </body>

</html>

END

    return 1;

}
