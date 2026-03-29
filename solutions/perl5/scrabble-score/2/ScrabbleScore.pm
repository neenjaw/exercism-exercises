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
  return {
    'A' => 1, 
    'E' => 1, 
    'I' => 1, 
    'O' => 1, 
    'U' => 1, 
    'L' => 1, 
    'N' => 1, 
    'R' => 1, 
    'S' => 1, 
    'T' => 1, 
    'D' => 2, 
    'G' => 2, 
    'B' => 3, 
    'C' => 3, 
    'M' => 3, 
    'P' => 3,
    'F' => 4, 
    'H' => 4, 
    'V' => 4, 
    'W' => 4, 
    'Y' => 4,
    'K' => 5,
    'J' => 8, 
    'X' => 8, 
    'Q' => 10, 
    'Z' => 10
  };
}

1;
