#!/usr/bin/env perl
use warnings;
use strict;

open(my $input, '<', 'input.dat')
  or die('Could not open input.dat.');

open(my $output, '>', 'output.dat')
  or die('Could not open output.dat.');

<$input>; # discard the header line

print($output "01234***ISA****\n");
while (my $line = <$input>) {
  my ($name, $level, $payment, $location_code, $in_network) = split(/,/, $line);
  my $record = <<"EOF";
GP*01
N1*$name
N2*$level
N3*$payment*$location_code*$in_network
EOF
  chomp($record);
  print($output $record);
}

close($output);
close($input);
