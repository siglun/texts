#!/usr/bin/perl -w -I.
use strict;
use Encode;
binmode STDOUT,':utf8';

#  ----------------------------------------------------------------------
# | Open Archives Initiative Harvesting Framework version 2.0            |
# | Hussein Suleman                                                      |
# | June 2002                                                            |
#  ----------------------------------------------------------------------
# |  Virginia Polytechnic Institute and State University                 |
# |  Department of Computer Science                                      |
# |  Digital Library Research Laboratory                                 |
#  ----------------------------------------------------------------------


use FindBin;
use lib "$FindBin::Bin/../lib";


use ediffah::Access;


sub main
{
   chdir "$FindBin::Bin";
   my $OAI = new ediffah::Access;
   $OAI->Run;
   $OAI->dispose;
}

main;
