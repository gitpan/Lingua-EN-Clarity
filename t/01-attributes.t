use strict;
use warnings;

use Test::More;

use Lingua::EN::Clarity;

ok( my $test = Lingua::EN::Clarity->new, "Constructor." );
is( $test->words, 0, "Default attribute." );
ok( $test->words(3), "Changing attribute." );
is( $test->words, 3, "Changed attribute." );

done_testing;
