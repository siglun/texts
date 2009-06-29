#!/usr/bin/perl -w

use strict;
use CGI qw/:standard/;
use XML::LibXSLT;
use XML::LibXML;
use Encode;

binmode STDOUT, ":utf8";

print "Content-Type: text/html;charset=UTF-8\n\n";

my $request=new CGI;

my $eadobject = ''; 

if ($request->param('eadobject') ) {
    my $infile = $request->param('eadobject');
    binmode $infile, ":raw";
    my $rbuffersize = 1024 * 1024;
    my $buffer;
    while (my $bytesread=read($infile,$buffer,$rbuffersize)) {
	$eadobject .= $buffer;
    }
}

if(!$eadobject) {
    print qq{
        <html>
        <head>
	<title>Master Manuscript description validator/title>
	</head>
	<body>
        <h1>Validate your MASTER document!</h1>
	<form action="./" enctype="multipart/form-data" method="post">
	  <label for="eadobject"><strong>Upload your Master file</strong>.</label>
          <input  title="Filnamn"  id="eadobject" name='eadobject' type='file' value='' />
          <input type="submit" value="Validate document" />
        </form> 
	</body>
	</html>
    };
} else {
    my $uri = '';
    my $sheet = 'master2html-static.xsl';

    my $parser = XML::LibXML->new();
    my $public_id ='';
    my $system_id = '/home/scriptorium/search/RECORDS/masterx.dtd';
    my $dtd  = XML::LibXML::Dtd->new($public_id, $system_id);
    my $xslt = XML::LibXSLT->new();
    my $source = '';
    eval {
	$source = $parser->parse_string($eadobject);
    };
    my $error = '';
    if($@) {
	$error = $@;
    }
    eval {
	$source->validate($dtd);
    };
    if($@) {
	$error .= $@;
    }

    if ($source) {
	my $style_doc = $parser->parse_file($sheet);
	my $stylesheet = $xslt->parse_stylesheet($style_doc);
	my $results = $stylesheet->transform($source);
	my $doc=$stylesheet->output_string($results); 
	$doc = decode_utf8($doc);			   

	my $num = 1;
	foreach my $term ('') {
	    $doc =~ s/([\n\s>])($term)([\.\,\n\s<])/$1<span class="hit$num">$2<\/span>$3/ig;
	    $num++;
	}

	print $doc;
        my @errorlist = split /\n/,$error;
        foreach my $error (@errorlist) {
	    print "<p>$error</p>";
	}

    } else { # No source, i.e., the xml is broken;
	print qq{<html>
                 <head>
		 <title>Ditt Masterdokument &auml;r trasigt</title>
		 </head>
		 <body>
		 <h1>Sorry</h1>
		 <p>XMLen i ditt Masterdokument &auml;r trasigt, jag kan inte l&auml;sa det.
		 H&auml;r f&aring;r du felmeddelanden:</p> 
		 <hr/>
		 <pre>
		 $error
		 </pre>
		 <hr/>
		 </body>
		 </html>};
    }
}

