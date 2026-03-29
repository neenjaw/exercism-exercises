package ScrabbleScore;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(score);

sub score {
  my ( $word, %extensions ) = @_;

  # if double_word flag is defined, use it, or else false
  my $double_word = $extensions{'double_word'};

  # if double_letters hash is defined, use it, else empty hash
  my %double_letters = %{$extensions{'double_letters'} || {}};
  %double_letters = map { uc $_ => $double_letters{$_} } keys %double_letters;

  my $score_hash = score_map();
  my $score = 0;

  foreach my $char (split '', uc $word) {
    $score = $score + $score_hash->{$char};

    if ($double_letters{$char}) {
      $score += $score_hash->{$char};
      delete($double_letters{$char});
    }
  }

  if ($double_word) {
    $score = $score * 2;
  }

  return $score;
}

sub score_map {
  my %hash;

  $hash{$_} = 1  for qw(A E I O U L N R S T);
  $hash{$_} = 2  for qw(D G);
  $hash{$_} = 3  for qw(B C M P);
  $hash{$_} = 4  for qw(F H V W Y);
  $hash{$_} = 5  for qw(K);
  $hash{$_} = 8  for qw(J X);
  $hash{$_} = 10 for qw(Q Z);

  return \%hash;
}

1;
