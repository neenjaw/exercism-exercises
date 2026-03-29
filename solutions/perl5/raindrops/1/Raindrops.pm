package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;

  my $result = '';

  if (is_factor($number, 3)) { 
    $result .= 'Pling'
  }

  if (is_factor($number, 5)) { 
    $result .= 'Plang'
  }

  if (is_factor($number, 7)) { 
    $result .= 'Plong'
  }

  return $result ? $result : $number
}

sub is_factor {
  my ($number, $factor) = @_;

  return $number % $factor == 0;
}

1;
