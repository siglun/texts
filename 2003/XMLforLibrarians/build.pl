#!/usr/bin/perl

my $groff = "".
    "groff -T ps -U -stp -M ~/Dropbox/documents/tmac -mgs lub-settings.ms";

#
# Process document using using XSLT
#
system("scripts/tei2roff.pl  XML-for-librarians.xml > paper.ms");

#
# Compile to postscript
#
system("$groff paper.ms  > XML-for-librarians.ps ");

#
# "Distill" to pdf
#
system("ps2pdf XML-for-librarians.ps");

#
# Throw away intermediate files
#
unlink "paper.ms";

#
# Create images for using in HTML
#
if(0) {

    foreach my $image ('business_model','frbr','tree') {

	system( "$groff $image.ms > $image.ps" );
	system("pstopnm -stdout -xsize 800 -pbm $image.ps |pnmcrop -w|pnmtopng > $image.png");

    }

}
