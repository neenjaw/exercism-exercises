
package Phrase;

use strict;
use warnings;
no warnings qw(experimental::signatures);

use feature 'signatures';

use Exporter 'import';
our @EXPORT_OK = qw(word_count);

sub word_count($phrase) {
  $phrase =~ s/[[:punct:]]//g;
  my %word_count;

  foreach (split ' ', $phrase) {
    $word_count{lc $_}++;
  }

  return \%word_count;
}

1;
