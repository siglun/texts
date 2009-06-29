#!/usr/bin/perl

# -w
#use strict;

if($#ARGV < 0) {

    print <<'USAGE';
A simple reference Handling program for HTML documents. 

Usage:
    
    notes.pl [-n note_file] [-o out_file] [-h] source_file_list

References are stored in the 'note_file'. If the option -n isn't
given, the program will look for a file called noter.txt.
note_file should have the following format:

not:LABLE<TAB>TEXT

For instance:

not:GEM		The Gateway to Educational Materials <http://gem.syr.edu/>
not:IMS		Instructional Management Systems <http://www.imsproject.org/>

Lines beginning with a '#' are interpreted as comments.

The source_file_list having names such as name_base.html (for instance
a_base.html, b_base.html, c_base.html ...). Notes are embedded in the
source files as [not:LABLE]. Notes.pl replaces those with note numbers
such as [1] or [42].

The program will write the result in a.html, b.html, c.html.

If no -o option is given notes.pl will replace the string <references>
with the gathered notes. If several <references> are given in the same
document, it will do this for the notes gathered since the last occurence of 
<references>.

If -o option is given, then the notes will be written in the single
file given as the argument of option -o.

The -h option will create section numbering automatically, and will
create a table of contents in any place in the document marked with
<contents>.

Example:


    notes.pl -o endnotes.html userguide_base.html eldes_base.html

Reads userguide_base.html eldes_base.html, produces userguide.html
eldes.html while writing all notes (collected from noter.txt) in the
file endnotes.html

    notes.pl 111_base.html

Reads the file noter.txt collects notes prints 111.html and replaces
<references> with a reference list.
USAGE

}

use Getopt::Std;

getopts('o:n:h');

if ($opt_n) {
    open(NOTER,"<$opt_n") or die "Hittar inte $opt_n";
} else {
    open(NOTER,"<noter.txt") or die "Hittar inte noter.txt"; 
}

my %bibliografi;
my ($key,$val);


while(<NOTER>) {
    unless (/^#/||/^\s*$/) {
        if(($key,$val)=split(/\t+/)) {
	    $bibliografi{$key}=$val;
	}
    }
}

my @notlista=();
my %notnummer=();
my $referenser="<table border=\"0\" class=\"toc\">\n";
my $num=0;
my $notnum=0;
my $max=8;
my $toc = '';
my $text = '';
my ($inname,$outname);


while($inname=shift @ARGV) {

    print STDERR "Doing $inname\n";

    open(IN,"<$inname") or warn "Cannot open $innanme\n";

    $outname=$inname;
    if ($outname !~ s/_base//) {
	die "Infile does not contain _base\n";
    }
    open(OUT,">$outname") or warn "Cannot open $outname\n";

    while(<IN>) {

	if (/<h([2-9])>/i && $opt_h) {
            $num = $1;
	    /<h[2-9]>(.*?)<\/h/i;
	    my $toctext=$1;
            # increment the (sub)section number
            $numbs[$num]++;
            # reset the numbers of lower level headings
            for ($i = $num + 1; $i <= $max; $i++)
            {
                $numbs[$i] = 0;
            }
            # assemble the new number, with dots between
            $numstr = '';
            for ($i = $min; $i <= $num; $i++)
            {
                $numstr .= $numbs[$i] . '.';
            }
            # knock off trailing dot
            $numstr =~ s/\.*$//;
            $numstr =~ s/^\.*//;
            # insert into the line, removing existing number if any
            # a nbsp is inserted to make it look better
            # eg "<h3>2.3 &nbsp; Banana Biscuits</h3>"
            s/<h$num>[0-9. ]*(&nbsp;)* */<h$num>$numstr /i;
	    s/>$numstr/><a name="sect$numstr">$numstr<\/a>/i;

	    $toc .= "<tr><td class=\"tocnum\">$numstr</td><td class=\"tocitem\"><a href=\"#sect$numstr\">$toctext</a></td></tr>\n";
        }

	while(/\[(not:.+?)\]/) {
	    $key=$1;

	    $bibliografi{$key} =~ /(.+)\s*<(.*)>/;
	    my ($tit,$uri)=($1,$2);	    
	    unless( defined $notnummer{$key} ) {
		$notnum++;
		push(@notlista,$key);
		$notnummer{$key}=$notnum;

		$referenser .= "<tr><td valign=\"top\" class=\"endnotes\">";
		$referenser .= "$notnum</td>";
		$referenser .= "<td class=\"endnotes\">$tit";
		if($2 !~ /^\s*$/) {
		    $referenser .= " &lt;<a ";
		    $referenser .= " name=\"not$notnum\" href=\"$uri\">";
		    $referenser .= "$uri</a>&gt;";
		} else {
		  $referenser .= " <a name=\"not$notnum\" >";
		  $referenser .= " </a>";
		}
				  
		$referenser .= "</td></tr>\n";
	    }
	    s/\[$key\]/<a title="$tit" uri="$uri" href="#not$notnummer{$key}">[$notnummer{$key}]<\/a>/;
	}
	unless($opt_o) {
	    if(s/<references\/?>/$referenser<\/table>\n/) {
		@notlista=();
		%notnummer=();
		$referenser="<table border=0>\n";
		$notnum=0;
	    }
	}
	s/\]\s*?\[/, /g;
	$text .= $_;
    }			
    $toc = '<table class="toc">'.$toc.'</table>';
    $text =~ s/<contents\/?>/$toc/;
    print OUT $text;
# For x-bithack in Appache server
    print STDERR `chmod a+x $outname`;

}




if( $opt_o ) {
    $outname=$opt_n;
    open(OUTNOTES,">$opt_o") or warn "Cannot open $opt_o\n";
    print OUTNOTES $referenser."\n</table>\n";
}
