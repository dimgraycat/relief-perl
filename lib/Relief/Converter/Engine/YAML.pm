package Relief::Converter::Engine::YAML;
use strict;
use warnings;
use base 'Relief::Converter::Engine';

use YAML;
use Relief::Exception qw/ throw /;

sub encode {
    my $self = shift;
    return _encode_check( YAML::Dump(@_) );
};

sub decode {
    my $self = shift;
    return YAML::Load(@_);
}

sub _encode_check {
    my $string = shift;
    throw($string) unless ( $string =~ m/\n\Z/s );
    return $string;
}

1;
