#!/usr/bin/perl

print "Content-type: text/html; charset=iso-8859-1\n\n";

if($ARGV[0]) {
    open(REV,"rlog $ARGV[0]|");

    print "<pre>\n";
    while ( my $line = <REV> ) {
	print $line;
    }
    print "</pre>\n";
} else {
    print <<"END";

      <h1>Sorry!</h1>
      <pre>
	You forgot to tell me about for what you wanted to see
	the revision history!.
      </pre>

END
}
