use strict;
use warnings;
package me::inlined;
# ABSTRACT: EXPERIMENTAL - define multiple packages in one file, and reference them in any order

use Module::Runtime 'module_notional_filename';

sub import
{
    my $self = shift;
    my ($caller, $caller_file) = caller;
    my $filename = module_notional_filename($caller);
    $::INC{$filename} = $caller_file;
}

1;
__END__

=pod

=head1 SYNOPSIS

before:

    package Foo;

    package Bar;
    use Foo;                        # kaboom: "Can't locate Foo.pm in @INC"

after:

    package Foo;
    use me::inlined;

    package Bar;
    use Foo;                        # no kaboom!


=head1 DESCRIPTION

If you've ever defined multiple packages in the same file, but want to C<use>
one package in another, you'll have discovered why it's much
easier to simply follow best practices and define one package per file.

However, this module will let you minimize your inode usage:
simply add C<<use me::inlined>> in any package that you want to refer to in
other namespaces in the same file, and you can
(probably) safely define and use packages in any order.

This module is for demonstration purposes only, and in no way am I
recommending you use this in any production code whatsoever.

=head1 FUNCTIONS/METHODS

There is no public API other than the C<use> directive itself, which takes no
arguments.

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=me-inlined>
(or L<mailto:bug-me-inlined@rt.cpan.org>).
I am also usually active on irc, as 'ether' at C<irc.perl.org>.

=head1 CAVEATS

There may be edge cases where this doesn't work right, or leads to infinite
looping when trying to compile modules. Use at your own risk!

=head1 ACKNOWLEDGEMENTS

This module was inspired by a conversation witnessed on C<modules@perl.org> --
credit for the idea belongs to Linda Walsh.

=head1 SEE ALSO

-=begin :list

* L<mem>

* L<Inlined::Package>

=end :list

=cut
