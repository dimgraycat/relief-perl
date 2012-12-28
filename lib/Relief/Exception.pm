package Relief::Exception;
use strict;
use warnings;

use Carp qw/ croak /;
use Exporter qw/ import /;

our @EXPORT_OK = qw/ throw /;

sub throw {
    my $message = shift;
    croak($message);
}

1;
