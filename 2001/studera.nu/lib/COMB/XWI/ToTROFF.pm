#
# A translator for making troff MS out of xhtml documents
#

package ToTROFF;

use strict;
use XML::Parser;
use Unicode::String qw(utf8 latin1);

use Exporter   ();
use vars       qw(@ISA @EXPORT );

#
# $content is for storing the part of the object being translated 
#

my $content='';

#
# Standard groff initialization
#

my $grinit =<<'END';
.nr LL 16c
.nr HM 2.5c
.nr FM 2.5c
.nr PL 29.7c
.nr PO 2.5c
.nr PS 12
.nr VS 14
.nr FI 1.0c
.nr FL 13.5c
.nr PI 1.0c
.ds marker "\s+1\(bu\s-1
END

#
# For handling of foot notes
#

my $addnote='';

#
# lists
#

my $listtype='';
my $itemnumber;

#
# In preformatted text we have to allow empty lines
#

my $preformatted = 0;

#
# Skipping output
#

my $divert = 0;

#
# Heading levels
#

my $hprevious = 1;
my $hcurrent;
my $hlevel = 1;

#
# paragraph end markup, if needed.
#

my $endparagraph = '';

#
# Sometimes we need to collect information from the content of an element,
# and the result from analysing that information has to be printed before that
# content. This is done making $callfunction a reference to a function. This
# is done in tables.
#

my $callfunction;

#
# A set of variables needed for the formatting of tables
#

my $columns=0;
my $rows=0;
my $cells=0;
my $format='';
my $thformat = ' lb10';
my $tdformat = ' l10';

#
# a dirty space, that cannot be removed by s/\ *// ;)
#
my $space = '###';

#
# Sometimes a start tag knows that the endtag should suppress
# a newline when the tag ends
#

my $nonewline=0;

#
# This is a hash containing all actions to be performed when a tag opens
#

my %beginactions = (
		    'head' => sub {},
		    'body' => sub {},
		    'html' => sub { $content .= $grinit; },
		    'title' => sub { $divert=1; },
		    'p' => sub {
			my $attribs = shift;

			$content .= ".LP\n";
			while(my ($key,$val) = each %$attribs ) {
			    if( $key eq 'class' ) {
				if ($val eq 'docinfo') {
				    $content .= ".RD\n\\s-1";
				    $endparagraph = "\n.DE";
				    return;
				}
				if( ($val eq 'abstract') ||
				    ($val eq 'caption') ) {
				    $content .= ".IP\n";
				    return;
				}
			    }
			}
			$content .= ".LP\n";
		    },
    
		    'link' => \&startnoop,
                    'a' => sub {
			my $attribs = shift;

			while(my ($key,$val) = each %$attribs ) {
			    if($key eq 'href') {
				$addnote=$val;
			    }
			}
		    },
		    'br' => sub { $content .= ' '; },
		    'table' => sub {
			$format .= ".TS\n";
			$format .= "allbox expand tab(;);\n";
#			$format .= "allbox tab(;);\n";
			$callfunction = \&tableformat;
		    },
		    'tr' => sub { $rows++; },
		    'th' => sub {
			$format .= $thformat;
			$content .= "T{\n.na\n\\fB\\s-2";
			$cells++;
		    },
		    'td' => sub {
			$format .= $tdformat;
			$content .= "T{\n.na\n\\s-2";
			$cells++;
		    },
		    'h1' => sub {
			my $attribs = shift;

			while(my ($key,$val) = each %$attribs ) {
			    if( $key eq 'class' ) {
				if ($val eq 'title') {
				    $content .= ".TL\n";
				    return;
				}
			    }
			}
			&heading(1);

		    },
		    'h2' => sub { &heading(2); },
		    'h3' => sub { &heading(3); },
		    'h4' => sub { &heading(4); },
		    'h5' => sub { &heading(5); },
		    'h6' => sub { &heading(6); },
		    'h7' => sub { &heading(7); },
		    'pre' => sub {
			$content .= ".ID\n\\f(CR";
			$preformatted=1;
		    },
		    'ol' => sub { $listtype='ol'; },
		    'ul' => sub { $listtype='ul'; },
		    'li' => sub {
			if($listtype eq 'ol') {
			    $itemnumber++;
			    $content .= ".IP $itemnumber\n";
			    return;
			}
			if($listtype eq 'ul') {
			    $itemnumber++;
			    $content .= ".IP \\*[marker]\n";
			    return;
			}
		    },
		    'em' => sub { $content .= "\\fI"; },
		    'strong' => sub { $content .= "\\fB"; },
		    'i' => sub { $content .= "\\fI"; },
		    'b' => sub { $content .= "\\fB"; },
		    );


#
# This is a hash containing all actions to be performed when a tag closes
#


my %endactions = (
		  'head' => sub {},
		  'body' => sub {},
		  'html' => sub {},
		  'title' => sub { $divert=0; },
		  'p' => sub {
		      if ($endparagraph ne '') {
			  $content .= $endparagraph;
			  $endparagraph = '';
		      }
		  },
		  'link' => \&endnoop,
		  'a' => sub {
		      if ($addnote ne '') {
			  $content .= '\**';
			  $content .= "\n.FS\n$addnote\n.FE";
			  $addnote = '';
		      }
		  },
		  'br' => \&endnoop,
		  'table' => sub {
                        $content =~ s/;$//;
                        $content .= ".TE\n";
                   },
		  'tr' => sub {
		      $format .= "\n";
		      $content =~ s/;\s*$//;
		      $content .= "\n";
		  },
		  'td' => sub { $content .= "\nT};"; },
		  'th' => sub { $content .= "\nT};"; },
		  'h1' => \&endnoop,
		  'h2' => \&endnoop,
		  'h3' => \&endnoop,
		  'h4' => \&endnoop,
		  'h5' => \&endnoop,
		  'h6' => \&endnoop,
		  'h7' => \&endnoop,
		  'pre' => sub {
		      $content .= "\n.DE\n";
		      $preformatted = 0;
		  },
		  'ol' => sub { $listtype=''; $itemnumber=0; },
		  'ul' => sub { $listtype=''; },
		  'li' => \&endnoop,
		  'i' => sub { $content .= "\\fP"; },
		  'em' => sub { $content .= "\\fP"; },
		  'strong' => sub { $content .= "\\fP"; },
		  'b' => sub { $content .= "\\fP"; },
		  );
    

@ISA = qw(XML::Parser);

sub new {
    my $type = shift;

    my $self = new XML::Parser;

    $self->setHandlers(  'Start' => \&startTag,
                         'End' => \&endTag,
                         'Char' => \&chars,
                         );

    bless $self, $type;

    $self;

}

#
# For the time being this is the method that will do the job
# In the end it should return the result as a string
#

sub translate {
    my $self = shift;
    my $xml = shift;

    $self->parse($xml);

}

#
# I feel that a no operation function might be needed
#

sub startnoop {
    my $element=shift;
}

sub endnoop {
    my $element=shift;
}

#
# Headings with numbers. The thing is that people (like myself) use <hx>,
# with x=1.. 7, without thinking
#

sub heading {
    $hcurrent = shift;

    if($hprevious > $hcurrent) {
	$hlevel--;
	$hlevel = $hlevel<1?1:$hlevel;
    } elsif ($hprevious < $hcurrent) {
	$hlevel++;
    }

    $hprevious = $hcurrent;
    $content .= ".NH $hlevel\n";
}

#
# While walking through the cells of a table we collect format information.
# That is, is a cell a <th> or a <td>?
#

sub tableformat {
    
    my $element = shift;

    return 0 unless ($element eq 'table');

#    $columns = $cells/$rows;

#    print STDERR "Size (cols cells rows) $columns $cells $rows\n";

    my $tf = $format;

    $tf =~ s/$/$space./;

    $columns=$cells=$rows=0;
    $format='';
    return $tf;
}

#
# Not used
#

sub default {
    my ($parserx, $string) = @_;
#    print STDERR "Default: [" , $string, "]";
}

#
# startTag, endTag and char are callback functions given to the 
# XML parser to be called when it finds tags or character data
#

sub startTag {
    my ($parserx, $element, %attribs) = @_;

    if(defined $beginactions{$element}) {
	&{$beginactions{$element}}(\%attribs);
    } else {
	print STDERR "Begin unsupported element: $element\n";
	my $key;
	my $val;
	if(%attribs) {
	    my @attrs = keys %attribs;
	    while($key = shift @attrs) {
		print STDERR "\t$key $attribs{$key}\n";
	    }
	}
    }

}

sub endTag {
    my ($parserx, $element, %attribs) = @_;

    if(ref $callfunction ) {
	my $something = &$callfunction($element);
	if ( $something ) {
	    if(defined $endactions{$element}) {
		&{$endactions{$element}}(%attribs);
	    }
	    &printcontent($something.$content);
	    $content='';
	    $callfunction = '';
	} else {
	    &{$endactions{$element}}(%attribs);
	}
    } else {
	if(defined $endactions{$element}) {
	    &{$endactions{$element}}(%attribs);
	} else {
	    print STDERR "End unsupported element: $element\n";
	}
	&printcontent($content);
	$content='';
    }
}

sub printcontent {

    my $text = shift;

    $text =~ s/\n\s*/\n/g;
    $text =~ s/\ *\././g;
    $text =~ s/$space/ /g;


    print $text;

    if($nonewline) {
	$nonewline=0;
    } else {
	print "\n";
    }
}

sub chars {
    my ($parserx, $string) = @_;

    $string = &utf8($string)->latin1;

    return if (!$preformatted && ($string =~ /^\s*$/) );
    return if ($divert);

    unless($preformatted) {
	$string =~ s/\n/ /g;
    }
    $content .= $string;

}

