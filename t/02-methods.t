use strict;
use warnings;

use Test::More;

use Lingua::EN::Clarity;
use Lingua::EN::Syllable;

my $test = Lingua::EN::Clarity->new;

my $text = "I don't know who you are. I don't know what you want. 
            If you are looking for ransom, I can tell you I don't 
            have money. But what I do have are a very particular 
            set of skills; skills I have acquired over a very long 
            career. Skills that make me a nightmare for people 
            like you. If you let my daughter go now, that'll be 
            the end of it. I will not look for you, I will not 
            pursue you. But if you don't, I will look for you, I 
            will find you, and I will kill you.";

$test->read( $text );

is( $test->sentences, 8, "Sentence count" );
is( $test->words, 99, "Word count" );
is( $test->syllables, 124, "Syllable count" );
is( $test->flesch_kincaid, 4, "Flesch-Kincaid" );

done_testing;
