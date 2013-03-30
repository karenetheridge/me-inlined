use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Warnings;

{
    package Foo;
    use me::inlined;
    sub foo { return 3 * shift }

    package Bar;
    use Foo;
    sub bar { return 2 * Foo::foo(shift) }
}

is($INC{'Foo.pm',}, __FILE__, '%INC is updated');

is(Bar::bar(5), 30, 'Foo can find the Bar package later in its own file');

done_testing;
