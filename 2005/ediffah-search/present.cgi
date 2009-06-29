#!/usr/bin/perl -w

use strict;
use utf8;
use lib './perl-lib';
use lib '/home/sigge/WWW/2004/ediffah/editorial-system/lib/';
use FindingAid;
use Layout;
use XML::LibXSLT;
use XML::LibXML;
use Encode;
use cgirequest;
binmode STDOUT, ":utf8";

print "Content-Type: text/html;charset=UTF-8\n\n";

my $request=new cgirequest;
my $id   = $request->id;

my $sheet = './ediffah-hit-detailed.xsl';

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();
my $findingaid = new FindingAid;
my $layout     = new Layout;

my $doc = $findingaid->retrieve_by_identifier($id);

if(!$doc) {
    $layout->sidhuvud('Arkivförteckningen återfinns inte');
    print '<h1>Arkivförteckningen kan inte hittas i Ediffah</h1>';
    print '<p>Arkivförteckningen har avlägsnats ur Ediffah';
    print '</p><br clear="all"/>';
    $layout->sidfot();
    exit();
}

$xslt->register_function('urn:match','match',
			 sub {
			     my $line1 = shift;
			     my $line2 = shift;
			     if($line1 =~ m/$line2/i) {
				 return 'yes';
			     } else {
				 return 'no';
			     }
			 });
$xslt->register_function('urn:message','message',\&message);

sub message {
    return '' unless $ENV{'REMOTE_USER'};
    my $message = '<?xml version="1.0" encoding="UTF-8" ?>'."\n";
    $message   .= '<doc-let><div class="box">';
    $message   .= '<p>'.$layout->menu().'</p>';
    $message   .= '<table><tr><td>';
    $message   .= '<dl>';
    $message .= qq{<dt><strong>Egenskaper</strong></dt>};
    my @props = $findingaid->known_properties();
    foreach my $p (@props) {
	$message .= "<dd><strong>$p:</strong> ";
	$message .= $findingaid->property($p)."</dd>\n";
    }
    $message .= '</dl>';
    $message .= join('',('<strong><a href="',
			 './show-source.cgi?id=',
			 $findingaid->property('identifier'),
			 '">Hämta EAD XML för redigering</a></strong>',
			 "\nSpara dokumentet på din egen dator ",
			 "och redigera det. Du kan sedan ersätta ",
			 "det publicerade med din reviderade version."));
    $message .= '<br /></td><td>';
    $message .= $layout->publication_status($findingaid);
    $message .= $layout->replace($findingaid);
    $message .= $layout->remove($findingaid);
    $message .= '</td></tr></table>';
    $message .= '</div></doc-let>';
    $message  = encode_utf8($message);
    my $msg = $parser->parse_string($message);
    my $nodes = $msg->findnodes('/*');
    return $nodes;
}

#$xslt->debug_callback(sub {open NULL, ">/dev/null";
#			   print NULL @_;
#			   close NULL;
#			   return 1;
#		       } );


 
my $style_doc = $parser->parse_file($sheet);
my $stylesheet = $xslt->parse_stylesheet($style_doc);
my @termlist = split /\s*;\s*/,$request->termlist
    if $request->param('termlist');


my %parameters = ();
for(my $p=1;$p<=5;$p++) {
    if(@termlist) {
	my $term = shift(@termlist);
	$parameters{'hit'.$p} = $term;
    } else {
	$parameters{'hit'.$p} = 'qwertyuiop';
    }
}

my $remoteuser = '';
if($ENV{'REMOTE_USER'}) {
    $remoteuser = $ENV{'REMOTE_USER'};
}
my $results = $stylesheet->transform($findingaid->document(),
				     'remoteuser'  => "'".$remoteuser."'",
				     'hit1'        => "'".$parameters{'hit1'}."'",
				     'hit2'        => "'".$parameters{'hit2'}."'",
				     'hit3'        => "'".$parameters{'hit3'}."'",
				     'hit4'        => "'".$parameters{'hit4'}."'",
				     'hit5'        => "'".$parameters{'hit5'}."'");


$doc=$stylesheet->output_string($results); 
$doc = decode_utf8($doc);			   

my $num = 1;
while(my ($key,$term) = each %parameters ) {
    next unless $key =~ m/hit/;
    $doc =~ s/([\n\s>])($term)([\.\,\n\s<])/$1<span class="hit$num">$2<\/span>$3/ig;
    $num++;
}

print $doc;
