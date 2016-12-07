use warnings;
use strict;

# Exampe of reading the entire file
# one line at a time
open(my $fh, "<", "input.txt");
while (my $line = <$fh>) {
  chomp($line);               # remove new line
  print("Line is: $line\n");  # print with new line
}
close($fh);

print('-' x 20, "\n");

# Exampe of reading the entire file
# at once
open($fh, "<", "input.txt");
my @lines = <$fh>;         # Put all lines in array
chomp(@lines);             # Remove new line from all lines
print("There are ",
      scalar(@lines),      # Print the array length
      " thingamabobs in the file.\n");
close($fh);

# Ignore this line, Bryan, Aruna. You guys
# are always asking questions and making
# intelligent remarks. I can't take it,
# anymore.
