# Declare package 'Bob'
package Bob;

use strict;
use warnings;
no warnings qw(experimental::signatures);

use feature 'signatures';

use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey( $msg = '') {
  if (silence($msg)) {
        return 'Fine. Be that way!'
  }
  
  if (has_letters($msg) && yell($msg) && question($msg)) {
    return 'Calm down, I know what I\'m doing!';
  }

  if (has_letters($msg) && yell($msg)) {
    return 'Whoa, chill out!';
  }

  if (question($msg)) {
    return 'Sure.';
  }

  return 'Whatever.';
}

sub silence( $msg ) {
  $msg =~ s/\s+//g; # trim all whitespace

  return $msg eq '';
}

sub has_letters( $msg ) {
  return ((uc $msg) ne (lc $msg)) && (length $msg > 0)
}

sub yell( $msg ) {
  return $msg eq (uc $msg);
}

sub question( $msg ) {
  $msg =~ s/\s+$//g; # trim trailing whitespace
  my $trailing = substr $msg, -1;

  return ($trailing eq '?');
}

1;
