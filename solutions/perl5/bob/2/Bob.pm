# Declare package 'Bob'
package Bob;

use strict;
use warnings;
no warnings qw(experimental::signatures);

use feature 'signatures';

use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey($msg = '') {
  if (silence($msg)) {
        return q{Fine. Be that way!}
  }
  
  if (has_letters($msg) and yell($msg) and question($msg)) {
    return q{Calm down, I know what I'm doing!};
  }

  if (has_letters($msg) and yell($msg)) {
    return q{Whoa, chill out!};
  }

  if (question($msg)) {
    return q{Sure.};
  }

  return q{Whatever.};
}

sub silence($msg) {
  return ($msg =~ /^\s*$/);
}

sub has_letters($msg) {
  # return ((uc $msg) ne (lc $msg)) and (length $msg)
  return $msg =~ /[a-z]/i
}

sub yell($msg) {
  return $msg eq (uc $msg);
}

sub question($msg) {
  $msg =~ s/\s+$//g; # trim trailing whitespace
  my $trailing = substr $msg, -1;

  return ($trailing eq '?');
}

1;
