#!/usr/bin/perl

#/usr/local/bin/sgrep -I -i -g xml -w 'a-zA-Z0-9/:~.%?' -c index_file.sgrep \
# extract.xml

my $m4 = '';# ' -p /usr/local/bin/m4';
my $ifile = 'index_file.sgrep';
my $index = ' -x '.$ifile;
my $xfile = 'extract.xml';
my $charset = " -w 'a-zA-Z0-9/:~.%?'";
my $sgrep = '/usr/local/bin/sgrep -i -g xml'.$m4.$charset.$index;
#my $sgrep = '/usr/local/bin/sgrep -i -D -g xml'.$m4.$charset;


chdir '/usr/local/studera/handbook/xml-fragments';

my $top = 'stag("resource") .. etag("resource")';
my $field = 'stag("identifier") .. etag("identifier")';
my $query = $ARGV[0];

my $Q;

#if ( @query = split /\s+/,$query) {
#    $Q = "($field containing \"".join ('" or "', @query).'")';
    
#} else {
$Q = "$field containing  \"$query\" ";
#}


print "#### Searching $ARGV[0] \n\n";

#my $command="$sgrep ' $top parenting $Q ' $xfile";
my $command="$sgrep ' $top parenting $Q ' ";

print "$command\n";

$result = `$command $files 2>&1`;

print "$result";

