package Relief::Converter;
use strict;
use warnings;

use Relief::Module::Loader;

sub new {
    my $class = shift;
    my $engine = shift;
    my $module = Relief::Module::Loader::load_with_prefix(
        __PACKAGE__.'::Engine', "-$engine"
    );
    return $module->new(@_);
}

sub encode {
    my $engine = shift;
    return _create($engine, 'encode', @_);
}

sub decode {
    my $engine = shift;
    return _create($engine, 'decode', @_);
}

sub _create {
    my $engine = shift;
    my $type = shift;
    my $converter = __PACKAGE__->new($engine);
    return $converter->$type(@_);
}

1;
