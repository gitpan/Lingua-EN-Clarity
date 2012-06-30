use ExtUtils::MakeMaker;

WriteMakefile (
    NAME              => 'Lingua::EN::Clarity',
    VERSION_FROM      => 'lib/Lingua/EN/Clarity.pm',
    ABSTRACT_FROM     => 'lib/Lingua/EN/Clarity.pm',
    AUTHOR            => 'Brandon Singer <bsinger@cpan.org>',
    PREREQ_PM         => { 'Test::More'           => 0,
                           'Lingua::EN::Sentence' => 0,
                           'Lingua::EN::Syllable' => 0,
                           'Math::Round'          => 0 }
);
