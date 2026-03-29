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

sub scores {
  my %scores = (
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10,
  );

  return \%scores;
}

sub score_map {
  my $scores = scores();
  my %map;

  while ( my ( $letters, $point ) = each %$scores ) {
    $map{$_} = $point for split '', $letters;
  }

  return \%map;
}

1;
