#  ---------------------------------------------------------------------
#   Xerxes - OAI 2 data provider
#   $Id$
#   Based on Test::TestDP; by
#   Hussein Suleman  
#   hussein@vt.edu  
#


package ediffah::Access;

use Pure::EZXML;
use Pure::X2D;
use ediffah::Zaccess;

use OAI::OAI2DP;
use vars ('@ISA');
@ISA = ("OAI::OAI2DP");


# constructor
sub new
{
   my ($classname) = @_;
   my $self = $classname->SUPER::new ();

   # set configuration
   $self->{'repositoryName'} = 'Ediffah archival descriptions';
   $self->{'archiveId'} = 'Ediffah';
   $self->{'adminEmail'}= 'sigfrid.lundberg@lub.lu.se';
   my $db;
   $db = 'ediffah';

# http://diglib.princeton.edu/ead/dtd/2002/ead.xsd
   $self->{'baseURL'}= 'http://sigge.lub.lu.se/2005/ead-oai/oai-server/';
   $self->{'earliestDatestamp'} = "1990-01-01";
   $self->{'access'} = new ediffah::Zaccess;
   $self->{'access'}->database('ediffah');

   bless $self, $classname;
   return $self;
}


# destructor
sub dispose
{
   my ($self) = @_;
   $self->SUPER::dispose ();
}


# format DC record
sub FormatDC
{
   my ($self, $hashref) = @_;

   {
      title       => $hashref->{'title'},
      identifier  => $hashref->{'identifier'},
      mdorder     => [ qw (title creator subject description contributor publisher date type format identifier source language relation coverage rights) ]
   };
}


# format header for ListIdentifiers
sub Archive_FormatHeader
{
   my ($self, $hashref, $metadataFormat) = @_;
   
   $self->FormatHeader ($hashref->{'urn'},
                        $hashref->{'updatedate'},
                        '',
                        $hashref->{'setlist'}
                       );
}


# retrieve records from the source archive as required
sub Archive_FormatRecord
{
   my ($self, $hashref, $metadataFormat) = @_;
   
   if ($self->MetadataFormatisValid ($metadataFormat) == 0)
   {
      $self->AddError('cannotDisseminateFormat',
		      'The value of metadataPrefix is not supported '.
		      'by the repository');
      return '';
   }

   my $dc = $self->FormatDC ($hashref);
   
   my $header = '';
   my $footer = "";




   $self->FormatRecord ($hashref->{'urn'},                       # identifier
                        $hashref->{'updatedate'},                # datestamp
                        '',                                      # status
                        $hashref->{'setlist'},                    # Setspecs
			 $header.$hashref->{'xmlrecord'}.$footer,# metdata
                        ''                                       #about
			);
}


# get full list of mdps or list for specific identifier
sub Archive_ListMetadataFormats
{
   my ($self, $identifier) = @_;

   if($identifier) {
       my $hits = $self->{'access'}->init_resource_list('',
							'',
							'',
							'',
							'',
							$identifier);
       if($hits) {
	   return ['oai_dc','marc','ead'];
       } else {
	   $self->AddError ('idDoesNotExist',
			    'The value of the identifier argument is '.
			    'unknown or illegal in this repository');
       }
   } else {
       return [];
#       return [];
   }

}


# get full list of sets from the archive
sub Archive_ListSets {
    my $self = shift;

    $self->{'access'}->GetSetList;

}


# get a single record from the archive
sub Archive_GetRecord
{
   my ($self, $identifier, $metadataFormat) = @_;
   $self->{'access'}->metadata_format($metadataFormat);

   my $hits = $self->{'access'}->init_resource_list('',
						    '',
						    '',
						    '',
						    $metadataFormat,
						    $identifier);

   if ($hits) {
       $self->{'access'}->getRecord;
   } else {
      $self->AddError ('idDoesNotExist',
		       'The value of the identifier argument is '.
		       'unknown or illegal in this repository');
      undef;
   }
}


# list metadata records from the archive
sub Archive_ListRecords
{
   my ($self,
       $set,
       $from,
       $until,
       $metadataPrefix,
       $resumptionToken) = @_;

   my @allrows = ();

   $self->{'access'}->init_resource_list($set,
					 $from,
					 $until,
					 $metadataPrefix,
					 $resumptionToken);



   if ($self->{'access'}->hits && !$resumptionToken) {
       while($record = $self->{'access'}->getRecord) {
	   push @allrows,$record;
       }
   } elsif($resumptionToken) {
       $self->AddError ('badResumptionToken',
			'Bad resumption token ');
   } else {
       $self->AddError ('noRecordsMatch',
			'The combination of the values of arguments results '.
			'in an empty set');
   }

   ( \@allrows, '', $metadataPrefix, {} );
}


# list identifiers (headers) from the archive
sub Archive_ListIdentifiers
{
   my ($self, $set, $from, $until, $metadataPrefix, $resumptionToken) = @_;

   if (($metadataPrefix ne '') &&
       ($self->MetadataFormatisValid ($metadataPrefix) == 0))
   {
      $self->AddError ('cannotDisseminateFormat',
		       'The value of metadataPrefix is not supported '.
		       'by the repository');
      return '';
   }
   
   $self->Archive_ListRecords ($set,
			       $from,
			       $until,
			       $metadataPrefix,
			       $resumptionToken);
}


1;

