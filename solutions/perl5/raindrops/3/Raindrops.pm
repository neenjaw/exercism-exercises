package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;

  my @factor_sounds = (
    [3, 'Pling'], 
    [5, 'Plang'], 
    [7, 'Plong']
    );

  my $result = '';

  foreach my $factor_sound (@factor_sounds) {
    my ($factor, $sound) = @$factor_sound;

    if (is_factor($number, $factor)) { 
      $result .= $sound
    }
  }

  return $result || $number;
}

sub is_factor {
  my ($number, $factor) = @_;

  return $number % $factor == 0;
}

1;
