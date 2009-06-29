# This is a module for cgi scripting, which is somewhat compatible
# whith the CGI module you may get from a CPAN near you. It is
# just that S. Lundberg (siglun@munin.ub2.lu.se) didn't like CGI.pm
#

package cgirequest;
use Carp;
use strict;
use vars qw ($AUTOLOAD @ISA);
use URI::Escape;
use Encode;

my @varList=(); 
my $varString = '';

sub version {
    return '$Id$';
}



sub new {
    my $class = shift;

    my $self = {};
    bless $self, $class;
    @varList = $self->getRequest;
    $varString = join '', @varList;
    $self->setJoinstring('$');
    $self;
}

sub param {
    my $self = shift;

    if(@_) {
	my $par = shift;
	if($varString =~ /$par/) {
	   return $self->{$par};
       } else {
	   return 0;
       }
    } else {
	return 0;
    }
}

sub raw_request {
    my $self    = shift;

    if(@_) {
	$self->{_raw_request_} = shift;
    } else {
	$self->{_raw_request_};
    }

}

sub getRequest {
    my $self = shift;

    my $request="";
    my @varList=(); 

    if($ENV{'REQUEST_METHOD'} !~ /(POST)|(GET)/) {
	print "Offline mode\n";
	my $l;
	while ($l=<STDIN>) {
	    $request .= $l;
	}
	$request =~ s/\n/&/g;
    }

    if($ENV{'REQUEST_METHOD'} =~ /POST/) {
	read(STDIN, $request, $ENV{'CONTENT_LENGTH'});
    } 

    if($ENV{'REQUEST_METHOD'} =~ /GET/) {
	$request=$ENV{'QUERY_STRING'};
    }

    if(length($request)>0) {
	$self->raw_request($request);
	my @param=split(/[&]/,$request);
	my ($var,$val,$parameter);
	while ($parameter = shift @param) {
	    ($var,$val)=split(/=/,$parameter);
	    next if ($parameter eq 'ignore');
	    $val =~ s/\++/ /g;
	    $val = uri_unescape($val);
	    $val = decode_utf8($val);
	    $val =~ s/^[\n\s\r]*//;
	    $val =~ s/[\n\s\r]*$//;
	    if ($self->{$var}) {
		$self->setMultipleValues($var,$val);
	    } else {
		$self->{$var}=$val;
	    }
	    push @varList,$var;
	}
	return @varList;
    } else {
	return ();
    }
}

#
# Don't want to correct that spelling mistake right now
#
sub variblelist {
    my $self = shift;

    return @varList;

}

sub variablelist {
    my $self = shift;

    return @varList;

}


sub getMultipleValues {
    my $self = shift;
    my $var  = shift;

    if($var) {
	my $c = $self->joinstring();
	return split m/$c/,$self->{$var};
    }
}

sub setMultipleValues {
    my $self = shift;
    my $var  = shift;
    my $val  = shift;

    if($var && $val) {
	my $c = $self->joinstring();
#	$self->{$var} .= $c.$val;
	$self->{$var} .= '$'.$val;
    }
}



sub setJoinstring {
    my $self = shift;

    if(@_) {
	my $c = shift;
	$self->{'__joinstring__'} = $c;
    }
}

sub joinstring {
    my $self = shift;

    return $self->{'__joinstring__'};

}



sub AUTOLOAD {
    my $self=shift;

    my $type=ref($self) || croak "$self is not an object!";
    my $name=$AUTOLOAD;

    $name =~ s/.*://;

    if(@_) {
	return $self->{$name}=shift;
    } else {
    	return $self->{$name};
    }
}


sub cgidecode {
    local($_) = @_;

    s/\+/ /g;
    s/\s+/ /g;
    s/\s*$//g;

    s/%([0-9A-F]{2})/pack('C',hex($1))/eig; 
    return decode_utf8($_);
}


1;

#
# $Log$
# Revision 1.1  2009/06/29 11:08:40  sigfrid
# Initial revision
#
# Revision 1.6  2004/11/22 13:17:14  sigge
# Hardcoded '$' as seperation string. No good idea but solved an urgent
# problem
#
# Revision 1.5  2004/11/11 10:27:53  sigge
# Added support for multiple values for one cgi variable name.
#
# Revision 1.4  2003/10/01 10:36:24  sigge
# Made the whole lot work in opera and lynx
#
# Revision 1.3  2003/09/29 13:26:59  sigge
# Certain browsers seem to require trimming of values from spaces, new lines and
# carrige returns at the beginning and end.
#
# Revision 1.2  2003/09/15 13:00:23  sigge
# Hopefulle I've got most Unicode settings correct no
#
# Revision 1.1  2003/09/10 11:19:08  sigge
# Initial revision
#
#
