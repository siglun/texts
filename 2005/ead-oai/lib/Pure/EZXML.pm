#  ---------------------------------------------------------------------
#   XML DOM1 pure-perl implementation
#    v1.11
#    January 2002
#  ------------------+--------------------+-----------------------------
#   Hussein Suleman  |   hussein@vt.edu   |    www.husseinsspace.com    
#  ------------------+--------------------+-+---------------------------
#   Department of Computer Science          |        www.cs.vt.edu       
#     Digital Library Research Laboratory   |       www.dlib.vt.edu      
#  -----------------------------------------+-------------+-------------
#   Virginia Polytechnic Institute and State University   |  www.vt.edu  
#  -------------------------------------------------------+-------------

# This module can replace most of the functionality of XML::DOM with a 
# single file that does not need any installation.
# It supports simple ASCII/UTF8 files without any external entity 
# processing. The DOM functions have the same names and parameters 
# as XML::DOM so for the limited subset implemented, this ought to 
# be a drop-in replacement.

# Example:
#  my $parser = new Pure::EZXML;
#  my $document = $parser->parsefile ('boeing.xml');
#  print $document->getDocumentElement->getElementsByTagName ('field')->item(0)->getTagName;

# internal data structure format:
#  node       -> [ nodetype, value, { parameter, ... }, [ 'LIST', node, ... ] ]  
#  nodetype   -> DOCUMENT | XML | COMMENT | DTD | PROCESS | TEXT | ELEMENT
#  value      -> String
#  parameters -> Name => Value


package Pure::EZXML;


use strict;
use vars qw ( @ISA @EXPORT );


BEGIN {
   @ISA = qw ( Exporter );
 
   @EXPORT = qw (
      UNKNOWN_ELEMENT
      ELEMENT_NODE
      ATTRIBUTE_NODE
      TEXT_NODE
      CDATA_SECTION_NODE
      ENTITY_REFERENCE_NODE
      ENTITY_NODE
      PROCESSING_INSTRUCTION_NODE
      COMMENT_NODE 
      DOCUMENT_NODE
      DOCUMENT_TYPE_NODE
      DOCUMENT_FRAGMENT_NODE
      NOTATION_NODE
      ELEMENT_DECL_NODE 
      ATT_DEF_NODE 
      XML_DECL_NODE
      ATTLIST_DECL_NODE
   );
}


# constants for node types
use constant UNKNOWN_NODE => 0;
use constant ELEMENT_NODE => 1;
use constant ATTRIBUTE_NODE => 2;
use constant TEXT_NODE => 3;
use constant CDATA_SECTION_NODE => 4;
use constant ENTITY_REFERENCE_NODE => 5;
use constant ENTITY_NODE => 6;
use constant PROCESSING_INSTRUCTION_NODE => 7;
use constant COMMENT_NODE => 8;
use constant DOCUMENT_NODE => 9;
use constant DOCUMENT_TYPE_NODE => 10;
use constant DOCUMENT_FRAGMENT_NODE => 11;
use constant NOTATION_NODE => 12;
use constant ELEMENT_DECL_NODE => 13;
use constant ATT_DEF_NODE => 14;
use constant XML_DECL_NODE => 15;
use constant ATTLIST_DECL_NODE => 16;


# constructor
sub new
{
   my ($classname, $taglist, $root) = @_;
   my $self = {};
   if (defined $taglist)
   {
      $self->{taglist} = $taglist;
      $self->{root} = $root;
   }
   bless $self, $classname;
   return $self;
}


# destructor
sub dispose 
{
   my ($self) = @_;
   
   undef $self->{taglist};
}


# get errors that occured during parsing
sub getError
{
   my ($self) = @_;
   
   if (defined $self->{parseerror})
   { return $self->{parseerror}; }
   else
   { return undef; }
}


# remove entities by converting them to regular characters
sub deEntity
{
   my ($self, $s) = @_;
   
   $s =~ s/&lt;/</go;
   $s =~ s/&gt;/>/go;
   $s =~ s/&apos;/'/go;
   $s =~ s/&quot;/"/go;
   $s =~ s/&amp;/&/go;

   $s;
}


# reinsert entities for escaped XML characters
sub reEntity
{
   my ($self, $s) = @_;
   
   $s =~ s/&(?!((#[0-9]*)|(#x[0-9a-fA-F]*)|(amp)|(lt)|(gt)|(apos)|(quot));)/&amp;/go;
   $s =~ s/</&lt;/go;
   $s =~ s/>/&gt;/go;
   $s =~ s/'/&apos;/go;
   $s =~ s/"/&quot;/go;

   $s;
}


# convert UTF-8 data into ASCII with unicode entities where necessary
sub deUTF8
{
   my ($self, $xmldata) = @_;

   $xmldata =~ s/([\xC0-\xDF])([\x80-\xBF])/sprintf ("&#x%04X;", ((ord ($1)&31)<<6)+(ord ($2)&63))/goe;
   $xmldata =~ s/([\xE0-\xEF])([\x80-\xBF])([\x80-\xBF])/sprintf ("&#x%04X;", ((ord ($1)&15)<<12)+((ord ($2)&63)<<6)+(ord ($3)&63))/goe;
   
   $xmldata;
}


# parse XML data and create tree structure
sub parse
{
   my ($self, $xmldata, $condense) = @_;

   my $pointer = 0;
   my $endpoint = length ($xmldata);
   
   my $taglist = [ 'DOCUMENT', 'xml', {}, [ 'LIST' ] ];
   my @tagstack = ( $taglist->[3] );
   my $lasttext = undef;
   
   while ($pointer < $endpoint)
   { 
      if (substr ($xmldata, $pointer, 1) eq '<')
      {
         if (($pointer+4 < $endpoint) && 
             (lc (substr ($xmldata, $pointer+1, 4)) eq '?xml'))
         { # xml declaration
            my $tstart = $pointer + 2;
            $pointer += 5;
            while (($pointer+1 < $endpoint) && 
                   (substr ($xmldata, $pointer, 2) ne '?>'))
            {
               $pointer++;
            }
            if ($pointer+1 == $endpoint)
            { $self->{parseerror} = 'EZXML: incomplete xml declaration'; return undef; }
            $pointer += 2;
            my $tlength = $pointer - $tstart - 2;
            my $parent = $tagstack[-1];
            my $xmldecl = substr ($xmldata, $tstart, $tlength);
            push (@{$parent}, [ 'XML', $xmldecl, {}, [ 'LIST' ] ] );
            # post-process for UTF-8 conversion
            if ($xmldecl =~ /encoding\s*=\s*['"](utf-8|UTF-8)['"]/)
            {
               $xmldata = $self->deUTF8 ($xmldata);
               $endpoint = length ($xmldata);
            }
         }
         elsif (($pointer+1 < $endpoint) && 
             (substr ($xmldata, $pointer+1, 1) eq '?'))
         { # processing instructions
            if (defined $lasttext)
            {
               # zap whitespace and empty text
               if ((defined $condense) && ($condense == 1))
               {
                  $lasttext =~ s/^[\s]*(.+)[\s]*$/$1/;
                  $lasttext =~ s/^[\s]+$//;
               }
               if ($lasttext ne '')
               {
                  my $parent = $tagstack[-1];
                  push (@{$parent}, [ 'TEXT', $lasttext, {}, [ 'LIST' ] ] );
               }
               $lasttext = undef;
            }

            my $tstart = $pointer + 2;
            $pointer += 2;
            while (($pointer+1 < $endpoint) && 
                   (substr ($xmldata, $pointer, 2) ne '?>'))
            {
               $pointer++;
            }
            if ($pointer+1 == $endpoint)
            { $self->{parseerror} = "EZXML: incomplete processing instruction at position $tstart"; return undef; }
            $pointer += 2;
            my $tlength = $pointer - $tstart - 2;
            my $parent = $tagstack[-1];
            push (@{$parent}, [ 'PROCESS', substr ($xmldata, $tstart, $tlength), {}, [ 'LIST' ] ] );
         }
         elsif (($pointer+3 < $endpoint) &&
                (substr ($xmldata, $pointer+1, 3) eq '!--'))
         { # comments
            if (defined $lasttext)
            {
               # zap whitespace and empty text
               if ((defined $condense) && ($condense == 1))
               {
                  $lasttext =~ s/^[\s]*(.+)[\s]*$/$1/;
                  $lasttext =~ s/^[\s]+$//;
               }
               if ($lasttext ne '')
               {
                  my $parent = $tagstack[-1];
                  push (@{$parent}, [ 'TEXT', $lasttext, {}, [ 'LIST' ] ] );
               }
               $lasttext = undef;
            }

            my $tstart = $pointer + 4;
            $pointer += 4;
            while (($pointer+2 < $endpoint) &&
                   (substr ($xmldata, $pointer, 3) ne '-->'))
            {
               $pointer++;
            }
            if ($pointer+2 == $endpoint)
            { $self->{parseerror} = "EZXML: incomplete comment at position $tstart"; return undef; }
            $pointer += 3;
            my $tlength = $pointer - $tstart - 3;
            my $parent = $tagstack[-1];
            push (@{$parent}, [ 'COMMENT', substr ($xmldata, $tstart, $tlength), {}, [ 'LIST' ] ] );
         }
         elsif (($pointer+8 < $endpoint) &&
                (substr ($xmldata, $pointer+1, 8) eq '!DOCTYPE'))
         { # dtds
            if (defined $lasttext)
            {
               # zap whitespace and empty text
               if ((defined $condense) && ($condense == 1))
               {
                  $lasttext =~ s/^[\s]*(.+)[\s]*$/$1/;
                  $lasttext =~ s/^[\s]+$//;
               }
               if ($lasttext ne '')
               {
                  my $parent = $tagstack[-1];
                  push (@{$parent}, [ 'TEXT', $lasttext, {}, [ 'LIST' ] ] );
               }
               $lasttext = undef;
            }

            my $tstart = $pointer + 8;
            $pointer += 8;
            my $numdtdelems = 0;
            while (($pointer < $endpoint) &&
                   ((substr ($xmldata, $pointer, 1) ne '>') ||
                    ($numdtdelems > 0)))
            {
               if (substr ($xmldata, $pointer, 1) eq '>')
               {
                  $numdtdelems--; 
               }
               if (substr ($xmldata, $pointer, 1) eq '<')
               {
                  $numdtdelems++;
               }
               $pointer++;
            }
            if ($pointer == $endpoint)
            { $self->{parseerror} = "EZXML: incomplete DTD at position $tstart"; return undef; }
            $pointer++;
            my $tlength = $pointer - $tstart - 1;
            my $parent = $tagstack[-1];
            push (@{$parent}, [ 'DTD', substr ($xmldata, $tstart, $tlength), {}, [ 'LIST' ] ] );
         }
         else
         { # tags
            if (defined $lasttext)
            {
               # zap whitespace and empty text
               if ((defined $condense) && ($condense == 1))
               {
                  $lasttext =~ s/^[\s]*(.+)[\s]*$/$1/;
                  $lasttext =~ s/^[\s]+$//;
               }
               if ($lasttext ne '')
               {
                  my $parent = $tagstack[-1];
                  push (@{$parent}, [ 'TEXT', $lasttext, {}, [ 'LIST' ] ] );
               }
               $lasttext = undef;
            }
            $pointer++;
            my $tstart = $pointer;
            my $tag = '';
            while (($pointer < $endpoint) &&
                   (substr ($xmldata, $pointer, 1) ne '>'))
            {
               $tag .= substr ($xmldata, $pointer, 1);
               $pointer++;
            }
            if ($pointer == $endpoint)
            { $self->{parseerror} = "EZXML: incomplete tag at position $tstart"; return undef; }
            $pointer++;

            # figure out tag type
            $tag =~ s/^[\s]*([^\s]+)[\s]*$/$1/;
            my $tagtype = 0;
            if ($tag =~ /^\//)
            {
               $tagtype = 1;
               $tag = substr ($tag, 1);
            }
            if ($tag =~ /\/$/)
            {
               $tagtype = 2;
               $tag = substr ($tag, 0, -1);
            }
            
            # separate out attributes
            my $attributes = $tag;
            $tag =~ s/^[\s]*([^\s]+)(.*)/$1/s;
            $attributes =~ s/^[\s]*[^\s]+[\s]*(.*)/$1/s;
            my $attrlist = {};
            while ($attributes ne '')
            {
               my $attrname = $attributes;
               $attrname =~ s/^[\s]*([^ =]+)(.*)/$1/s;
               $attributes =~ s/^[\s]*[^=]+=(.*)/$1/s;
               my $attrvalue = $attributes;
               if ($attrvalue =~ /^[\s]*'/)
               {
                  $attrvalue =~ s/^[\s]*'([^']*)'(.*)/$1/s;
                  $attributes =~ s/^[\s]*'[^']*'(.*)/$1/s;
               }
               else
               {
                  $attrvalue =~ s/^[\s]*"([^"]*)"(.*)/$1/s;
                  $attributes =~ s/^[\s]*"[^"]*"(.*)/$1/s;
               }
               $attributes =~ s/^[\s]+$//s;
               # ignore namespace
               if ($attrname =~ /([^:]+):(.*)/)
               {
                  $attrname = $2;
               }
               $attrlist->{$attrname} = $self->deEntity ($attrvalue);
            }
            
            # ignore namespace
            if ($tag =~ /([^:]+):(.*)/)
            {
               $tag = $2;
            }

            if ($tagtype == 2 )
            { # empty tag
               my $parent = $tagstack[-1];
               my $child = [ 'LIST' ];
               push (@{$parent}, [ 'ELEMENT', $tag, $attrlist, $child ] );
            }
            elsif ($tagtype == 1)
            { # end tag
               pop (@tagstack);
            }
            else
            { # start tag
               my $parent = $tagstack[-1];
               my $child = [ 'LIST' ];
               push (@{$parent}, [ 'ELEMENT', $tag, $attrlist, $child ] );
               push (@tagstack, $child);
            }
         }
      }
      else 
      { # cdata sections
         my $cdata = '';
         while (($pointer < $endpoint) && 
                (substr ($xmldata, $pointer, 1) ne '<'))
         {
            $cdata .= substr ($xmldata, $pointer, 1);
            $pointer++;
         }
         if (defined $lasttext)
         {
            $lasttext .= $self->deEntity ($cdata);
         }
         else
         {
            $lasttext = $self->deEntity ($cdata);
         }
      }
   }
   
   $self->{taglist} = $taglist;
   $self->{root} = $taglist;

   return $self;
}


# parse an XML file
sub parsefile
{ 
   my ($self, $infile, $condense) = @_;
   
   open (FILE, "<$infile");
   my @lines = <FILE>;
   close (FILE);
   my $xmldata = join ('', @lines);

   return $self->parse ($xmldata, $condense);
}


# -------------- DOCUMENT -------------------


# get top-level XML element node in document
sub getDocumentElement
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   for ( my $i=1; $i<=$#{$self->{root}->[3]}; $i++ )
   {
      if ($self->{root}->[3]->[$i]->[0] eq 'ELEMENT')
      {
         return new Pure::EZXML ($self->{root}->[3]->[$i], $self->{root});
      }
   }
   
   warn "EZXML: no root document element could be found";
   return undef;
}


# -------------- NODE -------------------


# get type of the node as a constant integer
sub getNodeType
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'DOCUMENT')
   {
      return DOCUMENT_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'ELEMENT')
   {
      return ELEMENT_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'TEXT')
   {
      return TEXT_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'COMMENT')
   {
      return COMMENT_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'PROCESS')
   {
      return PROCESSING_INSTRUCTION_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'XML')
   {
      return XML_DECL_NODE;
   }
   elsif ($self->{taglist}->[0] eq 'DTD')
   {
      return DOCUMENT_TYPE_NODE;
   }
   
   warn "EZXML: undefined node type for getNodeType";
   return 0;
}


# get string with the name of the node type
sub getNodeName 
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'DOCUMENT')
   {
      return '#document';
   }
   elsif ($self->{taglist}->[0] eq 'ELEMENT')
   {
      return $self->{taglist}->[1];
   }
   elsif ($self->{taglist}->[0] eq 'TEXT')
   {
      return '#text';
   }
   elsif ($self->{taglist}->[0] eq 'COMMENT')
   {
      return '#comment';
   }
   elsif ($self->{taglist}->[0] eq 'PROCESS')
   {
      return '#process';
   }
   elsif ($self->{taglist}->[0] eq 'XML')
   {
      return '#xml-declaration';
   }
   elsif ($self->{taglist}->[0] eq 'DTD')
   {
      return '#dtd';
   }
   
   warn "EZXML: undefined node type for getNodeName";
   return undef;
}


# get the value of a text or comment node
sub getNodeValue
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { print "EZXML: no parsed document found"; return undef; }
   
   if (($self->{taglist}->[0] eq 'COMMENT') ||
       ($self->{taglist}->[0] eq 'TEXT'))
   {
      return $self->{taglist}->[1];
   }
   
   warn "EZXML: cannot return node value for non-comment/non-text node";
   return undef;
}


# set the value of a comment or text node
sub setNodeValue
{
   my ($self, $newvalue) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if (($self->{taglist}->[0] eq 'COMMENT') ||
       ($self->{taglist}->[0] eq 'TEXT'))
   {
      $self->{taglist}->[1] = $newvalue;
      return $self->{taglist}->[1];
   }
   
   warn "EZXML: cannot set node value for non-comment/non-text node";
   return undef;
}


# get the parent node
sub getParentNode
{
   my ($self, $ancestor) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get parent of NodeList"; return undef; }
   
   if (! exists $self->{root})
   {
      return undef;
   }
   
   if (! defined $ancestor)
   {
      $ancestor = $self->{root};
   }
   
   for ( my $i=1; $i<=$#{$ancestor->[3]}; $i++ )
   {
      if ($self->{taglist} eq $ancestor->[3]->[$i])
      {
         return new Pure::EZXML ($ancestor, $self->{root});
      }
      my $childresult = $self->getParentNode ($ancestor->[3]->[$i]);
      if (defined $childresult)
      {
         return $childresult;
      }
   }
   return undef;
}


# get a list of children nodes (or a reference to a list in scalar context)
sub getChildNodes
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get child nodes for NodeList"; return undef; }

   if (wantarray)
   {
      my @elemlist = ();
      for ( my $i=1; $i<=$#{$self->{taglist}->[3]}; $i++ )
      {
         push (@elemlist, new Pure::EZXML ($self->{taglist}->[3]->[$i], $self->{root}));
      }
      return @elemlist;
   }
   else
   {
      my @newnodes = @{$self->{taglist}->[3]};
      shift @newnodes;
      return new Pure::EZXML ([ 'LIST', @newnodes ], $self->{root});
   }
}


# get the first child in the list of children nodes
sub getFirstChild
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get first child for NodeList"; return undef; }

   if ($#{$self->{taglist}->[3]} == -1)
   { warn "EZXML: no children"; return undef; }
   else
   {
      return new Pure::EZXML ($self->{taglist}->[3]->[1], $self->{root});
   }
}


# get the last child in the list of children nodes
sub getLastChild
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get last child for NodeList"; return undef; }

   if ($#{$self->{taglist}->[3]} == -1)
   { warn "EZXML: no children"; return undef; }
   else
   {
      return new Pure::EZXML ($self->{taglist}->[3]->[-1], $self->{root});
   }
}


# get the previous sibling if there is one
sub getPreviousSibling
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get sibling for NodeList"; return undef; }

   my $parent = $self->getParentNode;
   if (! defined $parent)
   { warn "EZXML: parent cannot be found"; return undef; }
   
   for ( my $i=2; $i<=$#{$parent->{taglist}->[3]}; $i++ )
   {
      if ($parent->{taglist}->[3]->[$i] eq $self->{taglist})
      {
         return new Pure::EZXML ($parent->{taglist}->[3]->[$i-1], $self->{root});
      }
   }
   
   return undef;
}


# get the next sibling if there is one
sub getNextSibling
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get sibling for NodeList"; return undef; }

   my $parent = $self->getParentNode;
   if (! defined $parent)
   { warn "EZXML: parent cannot be found"; return undef; }
   
   for ( my $i=1; $i<$#{$parent->{taglist}->[3]}; $i++ )
   { 
      if ($parent->{taglist}->[3]->[$i] eq $self->{taglist})
      {
         return new Pure::EZXML ($parent->{taglist}->[3]->[$i+1], $self->{root});
      }
   }
   
   return undef;
}


# get the document node that is owner of the current node
sub getOwnerDocument
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   return new Pure::EZXML ($self->{root}, $self->{root});
}


# insert a node before the specified child of the current node
sub insertBefore
{
   my ($self, $newchild, $refchild) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot insert/append child for NodeList"; return undef; }

   # remove new child(ren) from old position if exists
   if (defined $newchild->{root})
   {
      if ($newchild->{taglist}->[0] eq 'LIST')
      {
         for ( my $j=1; $j<=$#{$newchild->{taglist}->[3]}; $j++ )
         {
            my $newchildparent = $newchild->{taglist}->[3]->[$j]->getParentNode;
            if (defined $newchildparent)
            {
               $newchildparent->removeChild ($newchild->{taglist}->[3]->[$j]);
            }
         }
      }
      else
      {
         my $newchildparent = $newchild->getParentNode;
         if (defined $newchildparent)
         {
            $newchildparent->removeChild ($newchild);
         }
      }
   }
   
   # search for insertion position
   my $i;
   if (defined $refchild)
   {  
      # find old child
      my $child = undef;
      for ( $i=1; $i<=$#{$self->{taglist}->[3]}; $i++ )
      {
         if ($self->{taglist}->[3]->[$i] eq $refchild->{taglist})
         {
            $child = $refchild;
            last;
         }
      }
      
      if (! defined $child)
      { warn "EZXML: old child node not found for $self->{taglist}->[1]"; return undef; }
   }
   else
   {
      $i = $#{$self->{taglist}->[3]}+1;
   }

   # set owner of new node tree to current tree
   $newchild->{root} = $self->{root};
   
   # splice in new child(ren);
   if ($newchild->{taglist}->[0] eq 'LIST')
   {
      my @nodestoinsert = @{$newchild->{taglist}};
      shift @nodestoinsert;
      splice (@{$self->{taglist}->[3]}, $i, 0, @nodestoinsert);
   }
   else
   {
      splice (@{$self->{taglist}->[3]}, $i, 0, $newchild->{taglist});
   }

   return $newchild;     
}


# replace the specified child of the current node with a new node
sub replaceChild
{
   my ($self, $newchild, $oldchild) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot replace child for NodeList"; return undef; }

   # find old child
   my $child = undef;
   my $i;
   for ( $i=1; $i<=$#{$self->{taglist}->[3]}; $i++ )
   {
      if ($self->{taglist}->[3]->[$i] eq $oldchild->{taglist})
      {
         $child = $oldchild;
         last;
      }
   }
   
   if (! defined $child)
   { warn "EZXML: old child node not found"; return undef; }

   # remove new child from old position if exists
   if ((defined $newchild->{root}) && ($newchild->{root} eq $self->{root}))
   {
      my $newchildparent = $newchild->getParentNode;
      if (defined $newchildparent)
      {
         $newchildparent->removeChild ($newchild);
      }
   }
   
   # set owner of new node tree to current tree
   $newchild->{root} = $self->{root};
   
   # splice in new child;
   $self->{taglist}->[3]->[$i] = $newchild->{taglist};

   return $oldchild;     
}


# remove a spcified child
sub removeChild
{
   my ($self, $oldchild) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot remove child for NodeList"; return undef; }
   
   my $child = undef;
   for ( my $i=1; $i<=$#{$self->{taglist}->[3]}; $i++ )
   {
      if ($self->{taglist}->[3]->[$i] == $oldchild->{taglist})
      {
         $child = $oldchild;
         splice (@{$self->{taglist}->[3]}, $i, 1);
         last;
      }
   }
   
   if (! defined $child)
   { warn "EZXML: child node not found"; }
   return $child;
}


# add a new node to the end of the child list
sub appendChild
{
   my ($self, $newchild) = @_;
   
   return $self->insertBefore ($newchild);
}


# create a copy of the node (subtree)
sub cloneNode
{
   my ($self, $deep) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot check if children exist for NodeList"; return undef; }
   
   my %newattrlist = %{$self->{taglist}->[2]};
   my @childlist = ('LIST');
   my $newtaglist = [ $self->{taglist}->[0], $self->{taglist}->[1], \%newattrlist, \@childlist ];
   if ((defined $deep) && ($deep eq 'true'))
   {
      my $tnode = new Pure::EZXML;
      for ( my $i=1; $i<=$#{$self->{taglist}->[3]}; $i++ )
      {
         $tnode->{taglist} = $self->{taglist}->[3]->[$i];
         my $clonechild = $tnode->cloneNode ($deep)->{taglist};
         push (@childlist, $clonechild);
      }
   }
   
   my $newnode = new Pure::EZXML;
   $newnode->{taglist} = $newtaglist;
   return $newnode;
}


# check if the node has children
sub hasChildNodes
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot check if children exist for NodeList"; return undef; }

   if ($#{$self->{taglist}->[3]} == 0)
   {
      return 0;
   }
   else
   {
      return 1;
   }
}


# perform a pre-order traversal to search for nodes in the tree
sub preOrderMatch
{
   my ($self, $node, $name, $recurse) = @_;

   my @nodes = ();
   
   for ( my $i=1; $i<=$#{$node->[3]}; $i++ )
   {
      if (($node->[3]->[$i]->[0] eq 'ELEMENT') &&
          (($node->[3]->[$i]->[1] eq $name) || ($name eq '*')))
      {   
         push (@nodes, $node->[3]->[$i]);
      }
      if ((! defined $recurse) || ($recurse == 1))
      {
         push (@nodes, $self->preOrderMatch ($node->[3]->[$i], $name, $recurse));
      }
   }
   
   return @nodes;
}


# find elements based on their names and return a list (or ref)
sub getElementsByTagName
{
   my ($self, $name, $recurse) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get elements by tag name for NodeList"; return undef; }

   my @nodes = ();
   push (@nodes, $self->preOrderMatch ($self->{taglist}, $name, $recurse));

   if (wantarray)
   {
      return map { new Pure::EZXML ($_, $self->{root}) } @nodes;
   }
   else
   {
      unshift (@nodes, 'LIST');
      return new Pure::EZXML (\@nodes, $self->{root});
   }
}


# convert the node (subtree) to a string, in XML or text format
sub toString
{
   my ($self, $raw, $array) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if (! defined $raw)
   {
      $raw = '';
   }

   if (! defined $array)
   {
      $array = $self->{taglist}; 
   }
   
   if ($array->[0] eq 'LIST')
   { 
      my $output = '';
      for ( my $i=1; $i<=$#$array; $i++ )
      {
         $output .= $self->toString ($raw, $array->[$i]);
      }
      return $output;
   }
   elsif ($array->[0] eq 'DOCUMENT')
   {
      my $output = '';
      for ( my $i=1; $i<=$#{$array->[3]}; $i++ )
      {
         $output .= $self->toString ($raw, $array->[3]->[$i]);
      }
      return $output;
   }
   elsif (($array->[0] eq 'XML') && ($raw eq ''))
   {
      return "<?".$array->[1]."?>";
   }
   elsif (($array->[0] eq 'PROCESS') && ($raw eq ''))
   {
      return "<?".$array->[1]."?>";
   }
   elsif (($array->[0] eq 'DTD') && ($raw eq ''))
   {
      return "<!DOCTYPE".$array->[1].">";
   }
   elsif (($array->[0] eq 'COMMENT') && ($raw eq ''))
   {
      return "<!--".$array->[1]."-->";
   }
   elsif ($array->[0] eq 'TEXT')
   {
      return $self->reEntity ($array->[1]);
   }
   elsif ($array->[0] eq 'ELEMENT')
   {
      my $output = '';
      if ($raw eq '')
      { $output .= "<$array->[1]"; }
      foreach my $attkey (keys %{$array->[2]})
      {
         my $data = $self->reEntity ($array->[2]->{$attkey});
         if ($raw eq '')
         { $output .= " $attkey=\""; }
         $output .= $data;
         if ($raw eq '')
         { $output .= "\""; }
      }
      if (($#{$array->[3]} == 0) && ($raw eq ''))
      {
         if ((exists $self->{root}) && ($self->{root}->[1] eq 'xml'))
         { $output .= "/"; }
         else
         { $output .= "></$array->[1]"; }
      }
      if ($raw eq '')
      { $output .= ">"; }
      for ( my $i=1; $i<=$#{$array->[3]}; $i++ )
      {
         $output .= $self->toString ($raw, $array->[3]->[$i]);
      }
      if (($#{$array->[3]} ne 0) && ($raw eq ''))
      {
         $output .= "</$array->[1]>";
      }
      return $output;
   }
   
   return '';
}


# -------------- NODELIST -------------------


# get the number of nodes in the list
sub getLength
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] ne 'LIST')
   { warn "EZXML: cannot get Length of single Node"; return undef; }
   
   return ($#{$self->{taglist}});
}


# retrieve an individual item from the list by position
sub item
{
   my ($self, $number) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] ne 'LIST')
   { warn "EZXML: cannot get item from single Node"; return undef; }   

   return new Pure::EZXML ($self->{taglist}->[$number+1], $self->{root});
}


# -------------- ELEMENT -------------------


# get the name of the tag node
sub getTagName
{
   my ($self) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get tag name for NodeList"; return undef; }

   if ($self->{taglist}->[0] ne 'ELEMENT')
   { warn "EZXML: getTagName only applies to elements"; return undef; }
   
   return $self->{taglist}->[1];
}


# get the value of an attribute specified by name
sub getAttribute
{
   my ($self, $name) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot get attribute from NodeList"; return undef; }   

   if (exists $self->{taglist}->[2]->{$name})
   {
      return $self->{taglist}->[2]->{$name};
   }
   else
   {
      return '';
   }
}


# set the value of an attribute specified by name
sub setAttribute
{
   my ($self, $name, $value) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot set attribute for NodeList"; return undef; }
   
   $self->{taglist}->[2]->{$name} = $value;
}


# remove an existing attribute
sub removeAttribute
{
   my ($self, $name) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot remove attribute from NodeList"; return undef; }   

   if (exists $self->{taglist}->[2]->{$name})
   {
      delete $self->{taglist}->[2]->{$name};
   }
}


# set the tag name of the node
sub setTagName
{
   my ($self, $newtagname) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }
   
   if ($self->{taglist}->[0] eq 'LIST')
   { warn "EZXML: cannot set tag name for NodeList"; return undef; }

   if ($self->{taglist}->[0] ne 'ELEMENT')
   { warn "EZXML: setTagName only applies to elements"; return undef; }
   
   $self->{taglist}->[1] = $newtagname;
}


# -------------- TEXT -------------------


# get the text data that corresponds to a text node
sub getData
{
   my ($self, $name) = @_;
   if (! defined $self->{taglist})
   { warn "EZXML: no parsed document found"; return undef; }

   if ($self->{taglist}->[0] ne 'TEXT')
   { warn "EZXML: can only get data for text nodes"; return undef; }

   return $self->{taglist}->[1];
}


1;


# HISTORY
#
# 1.11
#  namespace stripping for attributes as well
