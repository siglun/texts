#  ---------------------------------------------------------------------
#   XML -> Perl data structure
#    v1.1
#    January 2002
#  ------------------+--------------------+-----------------------------
#   Hussein Suleman  |   hussein@vt.edu   |    www.husseinsspace.com    
#  ------------------+--------------------+-+---------------------------
#   Department of Computer Science          |        www.cs.vt.edu       
#     Digital Library Research Laboratory   |       www.dlib.vt.edu      
#  -----------------------------------------+-------------+-------------
#   Virginia Polytechnic Institute and State University   |  www.vt.edu  
#  -------------------------------------------------------+-------------


package Pure::X2D;


use Pure::EZXML;


# constructor - read in XML file and convert
sub new
{
   my ($classname, $xmlfile) = @_;
   my $self = {};
   bless $self, $classname;
   
   if (-e $xmlfile)
   {
      my $parser = new Pure::EZXML;
      my $doc = $parser->parsefile ($xmlfile)->getDocumentElement;
      $self = Pure::X2D->makeHash ($doc);
      bless $self, $classname;
   }
   
   return $self;
}


# make XML data into perl data structure
sub makeHash 
{
   my ($self, $doc) = @_;
   
   my %hash = ();
   
   foreach my $elem ($doc->getElementsByTagName ('*', 0))
   {
      if ($elem->getNodeType == ELEMENT_NODE)
      {
         my $name = $elem->getNodeName;
         my $value;
         if (! exists $hash{$name})
         {
            $hash{$name} = [];
         }
         if ($elem->getElementsByTagName ('*', 0)->getLength == 0)
         {
            $value = $elem->getChildNodes->toString;
            while ($value =~ /^\s(.*)$/s) { $value = $1; }
            while ($value =~ /^(.*)\s$/s) { $value = $1; }
         }
         else
         {
            $value = $self->makeHash ($elem);
         }
         push (@{$hash{$name}}, $value);
      }
   }   
   
   \%hash;
}


# return value(s) of a tag or simple "a/b/c" xpath-like specification
sub param
{
   my ($self, $pattern, $default) = @_;
   
   my @parts = split ('/', $pattern);
   my @candidates = ( $self );
   
   # find candidate nodes for path specification
   foreach ( my $i=0; $i<=$#parts; $i++ )
   {
      my @newcandidates = ();
      foreach my $candidate (@candidates)
      {
         if (((ref ($candidate) eq 'HASH') || 
              (ref ($candidate) eq 'Pure::X2D')) && 
             (exists $candidate->{$parts[$i]}))
         {
            foreach my $elem (@{$candidate->{$parts[$i]}})
            {
               push (@newcandidates, $elem);
            }
         }
      }
      @candidates = @newcandidates;
   }
   
   # remove non-text data
   my @values = ();
   foreach my $elem (@candidates)
   {
      if (ref ($elem) ne 'HASH')
      {
         push (@values, $elem);
      }
   }
   
   # return appropriate array, scalar or default value
   if ($#values == -1)
   {
      return $default;
   }
   elsif (wantarray)
   {
      return @values;
   }
   else
   {
      return $values[0];
   }
}


# convert the data structure back into XML
sub toXML
{
   my ($self, $head, $indent) = @_;
   
   if (! defined $head)
   { $head = $self; }
   
   if (! defined $indent)
   { $indent = ''; }
   $indent .= '   ';
   
   my ($key, $i, $j, $buffer, @orderedkeys);
   $buffer = '';
   if (exists ($head->{'mdorder'}))
   { @orderedkeys = @{$head->{'mdorder'}}; }
   else
   { @orderedkeys = keys %$head; }
   
   foreach $key (@orderedkeys)
   {
      if ((exists ($head->{$key})) && (ref ($head->{$key}) eq 'ARRAY'))
      {
         foreach $i (@{$head->{$key}})
         {
            if (ref ($i) eq 'HASH')
            {
               my $nestedbuffer = $self->toXML ($i, $indent);
               if ($nestedbuffer ne '')
               {
                  $buffer .= "$indent<$key>\n$nestedbuffer$indent</$key>\n";
               }
            }
            elsif ($i ne '')
            {
               $buffer .= "$indent<$key>$i</$key>\n";
            }
         }
      }
   }

   $buffer;
}


1;


# HISTORY
#
# 1.1
#  added toXML method to convert data structure back to XML
