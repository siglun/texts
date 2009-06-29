#  ---------------------------------------------------------------------
#   Replace pure-perl module to process CGI parameters
#    v1.0
#    January 2002
#  ------------------+--------------------+-----------------------------
#   Hussein Suleman  |   hussein@vt.edu   |    www.husseinsspace.com    
#  ------------------+--------------------+-+---------------------------
#   Department of Computer Science          |        www.cs.vt.edu       
#     Digital Library Research Laboratory   |       www.dlib.vt.edu      
#  -----------------------------------------+-------------+-------------
#   Virginia Polytechnic Institute and State University   |  www.vt.edu  
#  -------------------------------------------------------+-------------


package Pure::EZCGI;


use POSIX;


# constructor
sub new
{
   my ($classname) = shift;
   my $self = {};
   bless $self, $classname;
   
   # check for RFC1867 input
   if ((exists $ENV{'CONTENT_TYPE'}) && ($ENV{'CONTENT_TYPE'} =~ m'multipart/form-data;'))
   {
      $self->newMultipart;
   }
   else
   {
      $self->newURLEncoded;
   }
   $self->makeRequests;
   
   return $self;
}


# destructor to remove temporary files
sub DESTROY
{
   my ($self) = @_;
   
   foreach my $file (values %{$self->{farray}})
   {
      unlink $file;
   }
}


# url encoded input
sub newURLEncoded
{
   my ($self) = @_;

   # get variables from environment or stdio
   $self->{qstring} = defined $ENV{'QUERY_STRING'} ? $ENV{'QUERY_STRING'} : '';
   if ($self->{qstring} eq '')
   { $self->{qstring} = <STDIN>; }
   if (! defined $self->{qstring})
   {
      $self->{qstring} = '';
   }

   # split up into individual name/value pairs and process escaped chars
   my @parray=split (/[=&]/, $self->{qstring});
   for ( my $i=0; $i<=$#parray; $i++ )
   {
      $parray[$i] =~ s/\+/ /g;
      $parray[$i] =~ s/\n//g;
      $parray[$i] =~ s/%[0-9A-F][0-9A-F]/sprintf("%c", hex (substr ($&, 1)))/ge;
      while (substr ($parray[$i], 0, 1) eq ' ')
      { $parray[$i] = substr ($parray[$i], 1); }
      while ((substr ($parray[$i], length ($parray[$i])-1, 1) eq ' ') || 
             (substr ($parray[$i], length ($parray[$i])-1, 1) eq "\r") ||
             (substr ($parray[$i], length ($parray[$i])-1, 1) eq "\n"))
      { chop $parray[$i]; }
   }
   if ($#parray % 2 == 0)
   {
      push (@parray, '');
   }

   # store in array and variables
   $self->{parray} = [ @parray ];
}


# multipart MIME encoded
sub newMultipart
{
   my ($self) = @_;

   # get boundary string
   my $boundary = '--';
   if ($ENV{'CONTENT_TYPE'} =~ m'multipart/form-data; boundary=(.*)')
   {
      $boundary = '--'.$1;
   }
   
   my @parray = ();
   $self->{farray} = {};
   
   # get variables from stdio
   my $name;
   my $value = '';
   my $state = 0;
   my $aline;
   my $bline;
   my $tempname;
   while ($aline = <STDIN>)
   {
      if (($aline eq "$boundary\r\n") || ($aline eq "$boundary--\r\n"))
      {
         if ($state == 6)
         {
            chop $bline;
            chop $bline;
            syswrite (TFILE, $bline);
            close TFILE;
            $self->{farray}->{$name} = $tempname;
         }
         if (($state == 2) || ($state == 6))
         {
            while (substr ($value, -1, 1) =~ /[\r\n ]/)
            { chop $value; }
            push (@parray, ($name, $value));
         }
         last if ($aline eq "$boundary--\r\n");
         $state = 0;
      }
      else
      {
         if ($state == 0)
         {
            if ($aline =~ /name="([^"]+)"/)
            {
               $name = $1;
               if ($aline =~ /filename="([^"]+)/)
               {
                  $value = $1;
                  $state = 3;
                  $tempname = POSIX::tmpnam ();
                  open (TFILE, ">$tempname");
               }
               else
               {
                  $value = '';
                  $state = 1;
               }
            } 
         }
         elsif ($state == 1)
         {
            $state = 2;
         }
         elsif ($state == 2)
         {
            $value .= $aline;
         }
         elsif ($state == 3)
         {
            $state = 4;
         }
         elsif ($state == 4)
         {
            $state = 5;
         }
         elsif ($state == 5)
         {
            $bline = $aline;
            $state = 6;
         }
         elsif ($state == 6)
         {
            syswrite (TFILE, $bline);
            $bline = $aline;
         }
      }
   }
   
   $self->{parray} = [ @parray ];
}


# store base and request URLs
sub makeRequests
{
   my ($self) = @_;
   
   my $server_name = defined $ENV{SERVER_NAME} ? $ENV{SERVER_NAME} : 'server.name';
   my $script_name = defined $ENV{SCRIPT_NAME} ? $ENV{SCRIPT_NAME} : '/scriptname';
   my $server_port = defined $ENV{SERVER_PORT} ? $ENV{SERVER_PORT} : '80';
   if ($server_port eq '80')
   { $server_port = ''; }
   else
   { $server_port = ':'.$server_port; }
   $self->{baseURL} = "http://$server_name".$server_port.$script_name;
   $self->{requestURL} = "$self->{baseURL}?$self->{qstring}";
}


# retrieve a single value or a list of values for a given parameter
sub param
{
   my ($self, $name) = @_;
   
   if (defined $name)
   {
      my @results = ();
      for ( my $i=0; $i<=$#{$self->{parray}}; $i+=2 )
      {
         if ($self->{parray}->[$i] eq $name)
         {
            push (@results, $self->{parray}->[$i+1]);
         }
      }
      
      if (wantarray)
      {
         return @results;
      }
      else
      {
         if ($#results >= 0)
         {
            return $results[0];
         }
         else
         {
            return '';
         }
      }
   }
   else
   {
      my @results = ();
      for ( my $i=0; $i<=$#{$self->{parray}}; $i+=2 )
      {
         my $found = 0;
         foreach my $result (@results)
         {
            if ($result eq $self->{parray}->[$i])
            {
               $found = 1;
            }
         }
         if ($found == 0)
         {
            push (@results, $self->{parray}->[$i]);
         }
      }
      
      return @results;
   }
}


# get file upload handle
sub upload 
{
   my ($self, $name) = @_;
   
   if (! exists $self->{farray}->{$name})
   {
      return undef;
   }
   else
   {
      open (TFILE, $self->{farray}->{$name});
      return *TFILE;
   }
}


1;
