package Lingua::EN::Clarity;

use Lingua::EN::Sentence qw( get_sentences add_acronyms );
use Lingua::EN::Syllable qw( syllable );
use Moose;

our $VERSION = '0.02';

has 'words'     => ( isa => 'Int', is => 'rw', default => 0 );
has 'sentences' => ( isa => 'Int', is => 'rw', default => 0 );
has 'syllables' => ( isa => 'Int', is => 'rw', default => 0 );

sub read {
    my ( $self, $text ) = @_;

    my $sentences = get_sentences( $text );
    $self->sentences( scalar( @{ $sentences } ) );

    my @words = split( ' ', $text );
    $self->words( scalar( @words ) );

    $self->syllables( syllable( $text ) );
}

sub flesch_kincaid {
    my ( $self ) = shift;

    my $sentences = $self->sentences; 
    my $words = $self->words;
    my $syllables = $self->syllables;

    die if ( $sentences == 0 || 
             $words     == 0 ||
             $syllables == 0 );

    my $grade = 0.39 * ( $words / $sentences ) +
                11.8 * ( $syllables / $words ) -
                15.59;

    if ( $grade < 1 ) {
        return 1;
    } elsif ( $grade > 12 ) {
        return 12;
    } else {
        return $grade;
    }
}

no Moose;

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Lingua::EN::Clarity - A smarter readability score

=head1 SYNOPSIS

=head1 DESCRIPTION

=head2 EXPORT

=head1 SEE ALSO

=head1 AUTHOR

Brandon Singer, E<lt>bsinger@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Brandon Singer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
