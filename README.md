# NAME

me::inlined - EXPERIMENTAL - define multiple packages in one file, and reference them in any order

# VERSION

version 0.001

# SYNOPSIS

before:

    package Foo;

    package Bar;
    use Foo;                        # kaboom: "Can't locate Foo.pm in @INC"

after:

    package Foo;
    use me::inlined;

    package Bar;
    use Foo;                        # no kaboom!

# DESCRIPTION

If you've ever defined multiple packages in the same file, but want to `use`
one package in another, you'll have discovered why it's much
easier to simply follow best practices and define one package per file.

However, this module will let you minimize your inode usage:
simply add `<use me::inlined`\> in any package that you want to refer to in
other namespaces in the same file, and you can
(probably) safely define and use packages in any order.

This module is for demonstration purposes only, and in no way am I
recommending you use this in any production code whatsoever.

# FUNCTIONS/METHODS

There is no public API other than the `use` directive itself, which takes no
arguments.

# SUPPORT

Bugs may be submitted through [the RT bug tracker](https://rt.cpan.org/Public/Dist/Display.html?Name=me-inlined)
(or [mailto:bug-me-inlined@rt.cpan.org](mailto:bug-me-inlined@rt.cpan.org)).
I am also usually active on irc, as 'ether' at `irc.perl.org`.

# CAVEATS

There may be edge cases where this doesn't work right, or leads to infinite
looping when trying to compile modules. Use at your own risk!

# ACKNOWLEDGEMENTS

This module was inspired by a conversation witnessed on `modules@perl.org` --
credit for the idea belongs to Linda Walsh.

# SEE ALSO

- [mem](http://search.cpan.org/perldoc?mem)

# AUTHOR

Karen Etheridge <ether@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Karen Etheridge.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
