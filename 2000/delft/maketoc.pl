#!/usr/bin/perl

open(IN,"grep '<title>' *.html|");
unlink "toc.html";

@toc=();

while(<IN>) {

    my ($file,$title)=split /:/;

    $title =~ s/<\/?title>//gi;

#    print "$file $title\n";
    
    push @toc,"<li><a href=\"$file\">$title</a></li>";

}

open(TOC,">toc.html");

print TOC <<"END";
<html>
<head>
<title>Metadata harvesting: Table of Contents</title>
</head>
<body bgcolor="#FFFFFF">

<h1>Metadata harvesting: Table of Contents</h1>

<ol>

END

print TOC join "\n",@toc;

print TOC <<"END";

</ol>
</body>
</html>

END

    
