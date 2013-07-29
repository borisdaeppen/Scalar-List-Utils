#!./perl

use strict;
use Test::More tests => 8;
use List::Util qw(pairgrep pairmap pairs);

is_deeply( [ pairgrep { $b % 2 } one => 1, two => 2, three => 3 ],
           [ one => 1, three => 3 ],
           'pairgrep list' );

is( scalar( pairgrep { $b & 2 } one => 1, two => 2, three => 3 ),
    2,
    'pairgrep scalar' );

is_deeply( [ pairgrep { $a } 0 => "zero", 1 => "one", 2 ],
           [ 1 => "one", 2 => undef ],
           'pairgrep pads with undef' );

is_deeply( [ pairmap { uc $a => $b } one => 1, two => 2, three => 3 ],
           [ ONE => 1, TWO => 2, THREE => 3 ],
           'pairmap list' );

is_deeply( [ pairmap { $a => @$b } one => [1,1,1], two => [2,2,2], three => [3,3,3] ],
           [ one => 1, 1, 1, two => 2, 2, 2, three => 3, 3, 3 ],
           'pairmap list returning >2 items' );

is_deeply( [ pairmap { $b } one => 1, two => 2, three => ],
           [ 1, 2, undef ],
           'pairmap pads with undef' );

is_deeply( [ pairs one => 1, two => 2, three => 3 ],
           [ [ one => 1 ], [ two => 2 ], [ three => 3 ] ],
           'pairs' );

is_deeply( [ pairs one => 1, two => ],
           [ [ one => 1 ], [ two => undef ] ],
           'pairs pads with undef' );
