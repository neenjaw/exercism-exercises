# Declare package 'Leap'
package Leap;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(is_leap_year);

sub is_leap_year {
  my ($year) = @_;

  # Method 1) Multiple return points

  # There is no year 0, not a leap year
  # return 0 if $year == 0;

  # If the year is not evenly divisible by 4, not a leap year
  # return 0 if ($year % 4) != 0;

  # If the year is evenly divisible by 100 but not 400, not a leap year
  # return 0 if (($year % 100) == 0) and (($year % 400) != 0);

  # the year is a leap year
  # return 1;

  # Method 2) Single return point

  return (
    ($year != 0) 
    and ($year % 4 == 0) 
    and ((not ($year % 100 == 0)) or ($year % 400 == 0))
  );
}

1;
