package ETL;
use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(transform);

use Data::Dumper;

sub transform {
  my ($old_data_ref) = @_;
  my %old_data = %{$old_data_ref};

  my %transformed_data;
  my @data_keys = keys %old_data;

  foreach my $key (@data_keys) {

    my @letters = @{$old_data{$key}};
    
    # print Dumper \@letters;
    # print Dumper \%transformed_data;

    foreach my $letter (@letters) {
      # print "----- adding $letter to hash\n";

      my $lowered_letter = lc $letter;    
      $transformed_data{$lowered_letter} = $key;
      
      # print Dumper \%transformed_data;
    } 
  }

  return \%transformed_data;
}

1;