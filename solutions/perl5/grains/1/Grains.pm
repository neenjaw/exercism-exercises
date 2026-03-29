package Grains;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);
use bigint;

sub grains_on_square {
  my ($square) = @_;

  return (2 ** ($square - 1));
}

sub total_grains {
  my @squares = (1..64);
  my $total = 0;

  foreach my $s (@squares) {
    $total += grains_on_square($s);
  }
  
  return $total;
}

1;
