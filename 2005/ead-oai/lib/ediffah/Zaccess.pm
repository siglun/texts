package ediffah::Zaccess;
#
#

use strict;
use Net::Z3950;
use XML::LibXSLT;
use XML::LibXML;
use IO::Handle;
use Encode;
use utf8;

my $socket = '';
my $server = 'bourree.lub.lu.se:2121';

sub new {
    my $class = shift;
    my $self={};
    bless $self, $class;

    $self->{'oai_dc'}     = '/home/sigge/WWW/2005/ead-oai/oai-server/to_oai_dc.xsl';
    $self->{'marc'}       = '/home/sigge/WWW/2005/ead-oai/oai-server/to_marc.xsl';
    $self->{'ead'}        = '/home/sigge/WWW/2005/ead-oai/oai-server/to_ead.xsl';
    $self->{'root'}       = 'http://theses.lub.lu.se/undergrad';

    $self->{'parser'}     = XML::LibXML->new();
    $self->{'xslt'}       = XML::LibXSLT->new();

    $self->hits(0);
    $self->cursor(0);

    if($ENV{'REQUEST_URI'} =~ m/scripta/) {
	$self->database('scripta');
    } else {
	$self->database('xerxes');
    }

    $self;
}

sub metadata_format {
    my $self   = shift;

    if(@_) {
	my $format = shift;
	$self->{'format'} = $format;
	$self->{'xsltfile'}   = $self->{$format};
	$self->{'style_doc'}  = $self->{'parser'}->parse_file($self->{$format});
	$self->{'sheet'}      = $self->{'xslt'}->parse_stylesheet($self->{'style_doc'});
    } else {
	$self->{'format'};	
    }

}

sub database {
    my $self = shift;
    if(@_) {
	$self->{'database'} = shift;
    } else {
	$self->{'database'};
    }

}

sub hits {
    my $self = shift;

    if(@_) {
	$self->{'hits'} = shift;
    } else {
	$self->{'hits'};
    }
}

sub cursor {
    my $self = shift;

    if(@_) {
	$self->{'cursor'} = shift;
    } else {
	$self->{'cursor'};
    }
}

sub increment {
    my $self = shift;

    $self->cursor($self->cursor()+1);

}

sub init_resource_list {
    my $self            = shift;
    my $set             = shift;
    my $from            = shift;
    my $until           = shift;
    my $metadataPrefix  = shift;
    my $resumptionToken = shift;
    my $urn             = shift;

    $self->metadata_format( $metadataPrefix);
    $self->{'conn'} =
	new Net::Z3950::Connection('tcp',
				   $server,
				   'databaseName' => $self->database ) or
				   die $!;

    $from  = '0000-00-00' unless $from;
    $until = '9999-99-99' unless $until;

    my $fromdate   = ' @attr 1=1012 @attr 2=4 ';
    my $todate     = ' @attr 1=1012 @attr 2=2 ';

    my $search = '';

    if($urn) {
	my $id = '';
	if($urn =~ m/:(.+)$/) {
	    $id = $1;
	} else {
	    $id = 'blaha';
	}
	$search = ' @and @attr 1=12  @attr 4=1 '.$id.' ';
    }

    if($set) {
	$set     = join ' ',split /:/,$set;

	if( $set =~ m/lub/i) {
	    $search = ' @and @attr 1=5005 "lub" ';
	} elsif ( $set =~ m/gub/i ) {
	    $search = ' @and @attr 1=5005 "gub" ';
	} elsif ( $set =~ m/uub/i) {
	    $search = ' @and @attr 1=5005 "uub" ';
	} elsif ( $set =~ m/kb/i ) {
	    $search = ' @and @attr 1=5005 "kb"  ';
	} else {
	    $search = ' @and @attr 1=5070 "'.$set.'" ';
	}
    }

    my $term       =
	$search   . ' @and '     .
	$fromdate . '"'.$from    . '"' . 
	$todate   . '"'.$until   . '"';

#    $term = $search . ' @attr 1=1016 andersson ';

    my %sort = ("au"           => ' @attr 7=1 @attr 1=6010 "" ',
		"ti"           => ' @attr 7=1 @attr 1=4    "" ',
		"date"         => ' @attr 7=1 @attr 1=1012 "" ',
		"date-created" => ' @attr 7=1 @attr 1=1011 "" ');

    my $sortby     = 'date';
#    my $query = '@or ' . $term . $sort{$sortby};
    my $query = $term;

    $self->{'rs'} = $self->{'conn'}->search($query)
	or die $self->{'conn'}->errmsg();

    $self->{'rs'}->option(preferredRecordSyntax => "XML");
    $self->{'rs'}->option(elementSetName => "f");
    $self->hits($self->{'rs'}->size());
    $self->hits();
}

sub getRecord {
    my $self            = shift;

    $self->increment();
    my $n = $self->cursor();

    if($n <= $self->hits) {
	my $rec = $self->{'rs'}->record($n) or return ();
	my $doc        = $self->{'parser'}->parse_string($rec->rawdata());
	my $id         = $doc->findnodes('/ead/eadheader/eadid/@identifier');
	my $idstring   = $id->string_value();

	my $network;
	my $agency;
	my $idpart1;
	my $idpart2;
	($network,$agency,$idpart1,$idpart2) = split(/:/,$idstring);
	my $urn = 'oai:'.$network.'.org:'.join('-',$agency,$idpart1,$idpart2);
	my $modified
	    = $doc->findnodes('/ead/eadheader/revisiondesc/change/date[@encodinganalog="revision"]');
	my $updatedate = $modified->string_value();

	my $results    = $self->{'sheet'}->transform($doc);
	my $hit        = $self->{'sheet'}->output_string($results);

	$hit =~ s/<\?xml.*?\?>\n*//;
	return { 'urn'        => $urn,
		 'updatedate' => $updatedate,
		 'setlist'    => $self->setMembership($doc),
		 'xmlrecord'  => decode_utf8($hit) };
    } else {
	$self->close;
	return ();
    }
}

sub setMembership {
    my $self = shift;
    my $doc  = shift;

    my @setlist = ();
    my $terms = $doc->findnodes('/ead/eadheader/eadid/@mainagencycode');
    foreach my $context ($terms->get_nodelist) {
	my $term = $context->findnodes('.');
	my $set  = $term->string_value();
	push @setlist,$set;
    }
    push @setlist,($self->aggregatedSets(\@setlist));
    return \@setlist;
}

sub aggregatedSets {
   my $self    = shift;
   my $setlist = shift;

   my @aggregates = ();
   foreach my $set (@{$setlist}) {
       if($set =~ m/H000/) {
	   push @aggregates, 'HumanitiesTheology';
       } elsif($set =~ m/S110|S000/) {
	   push @aggregates, 'SocialBehaviourLaw';
       } elsif( ($set =~ m/P000:B\d\d[^6]/ ) ||
                ($set =~ m/P000:P005/) ||
                ($set =~ m/P000:P006/) ) {
	   push @aggregates, 'LifeEarthScience';
       } elsif( $set  =~ m/P000:P\d\d[^56]/) {
	   push @aggregates, 'PhysicsChemistryMaths';
       } elsif( $set  =~ m/T000/) {
	   push @aggregates, 'Technology';
       }  elsif( ($set  =~ m/B007/) && ($set !~ m/B007:B750/) ) {
	   push @aggregates, 'Medicine';
       }
   }
   return @aggregates;
}


sub GetSetList {
    my $self = shift;

     my @list = (['LUB','Lunds Universitets Bibliotek'],
		 ['GUB','Göteborgs universitetsbibliotek'],
		 ['UUB','Uppsala universitetsbibliotek'],
		 ['KB','Kungliga Biblioteket, Stockholm']);

    \@list;
}

sub close {
    my $self = shift;

    $self->{'conn'}->close();

}

1;
