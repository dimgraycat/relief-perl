package Relief::Converter::Engine;
use strict;
use warnings;

use File::Slurp;
use Relief::Exception qw/ throw /;

sub new {
    my ($class, %options) = @_;
    return bless { options => \%options }, $class;
}

sub options { return shift->{options}; }

sub encode { throw('please override'); }
sub decode { throw('please override'); }

sub decode_file {
    my ($self, $file_path ) = @_;
    throw(q{can't find %s}, $file_path) if (not -e $file_path);
    my $file_data = File::Slurp::read_file($file_path);
    return $self->decode($file_data);
}

1;
