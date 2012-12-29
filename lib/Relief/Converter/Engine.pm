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
    my ($self, $file_path) = @_;
    throw(q{can't find %s}, $file_path) unless (-e $file_path);
    my $yaml_data = File::Slurp::read_file($file_path);
    return $self->decode($yaml_data);
}

1;
