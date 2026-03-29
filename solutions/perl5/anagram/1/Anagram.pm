package Anagram;

use strict;
use warnings;
no warnings qw(experimental::signatures);

use feature 'signatures';

use Exporter 'import';
our @EXPORT_OK = qw(match);

sub match($word, $candidates_ref) {
  my $normalized_word = lc $word;
  my $sorted_word = sort_letters($normalized_word);
  my @anagrams = ();

  foreach (@$candidates_ref) {
    my $candidate = $_;
    my $normalized = lc $candidate;
    my $sorted = sort_letters($normalized);

    if (($normalized_word ne $normalized) and ($sorted_word eq $sorted)) {
      push(@anagrams, $candidate)
    }
  }

  return \@anagrams;
}

sub sort_letters($word) {
  return (join '', sort { $a cmp $b } split(//, $word));
}

1;