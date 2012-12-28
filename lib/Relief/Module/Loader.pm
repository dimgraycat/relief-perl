package Relief::Module::Loader;
use strict;
use warnings;

use UNIVERSAL::require;
use Class::Inspector;
use Data::Dump qw/ dump /;

use Relief::Exception qw/ throw /;

sub load {
    my $module = shift;
    return if not $module;
    return $module if Class::Inspector->loaded($module);
    unless ( $module->require ) {
        my $error = $@ || '';
        throw(sprintf('%s is not found: %s', dump($module), $error));
    }
    return $module;
}

sub load_with_prefix {
    my ($prefix, $module_syntax) = @_;
    return if not $module_syntax;
    return __PACKAGE__::load(_modify_package($prefix, $module_syntax));
}

sub _modify_package {
    my ($prefix, $module_syntax) = @_;
    $module_syntax =~ s/^-/$prefix\:\:/;
    return $module_syntax;
}

1;
