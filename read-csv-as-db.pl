#!/usr/bin/env perl
use warnings;
use strict;
use DBI;

my $create = <<CREATE;
CREATE TABLE pharmacies
(
  Id INTEGER,
  Name CHAR(10),
  Location CHAR(10),
  Phone CHAR(10),
  Hours VARCHAR(10)
)
CREATE

my $insert = <<INSERT;
INSERT INTO pharmacies
VALUES(?, ?, ?, ?, ?)
INSERT

my $dbh = DBI->connect("dbi:CSV:", undef, undef, {
  f_dir => "./data", # Tells DBI where to read/write the CSV files
  f_ext => ".csv/r",  # Tells DBI to add the ".csv" extension to the files
  csv_sep_char => "*",
  csv_quote_char => "@"
})
  or die("Could not create this 'database'.");

$dbh->do("DROP TABLE pharmacies");
$dbh->do($create)
  or die("Something bad: $dbh-errstr");
$dbh->do($insert, undef, 1, 'CVS', 'Over there', 'No landline.', '24-hours')
  or die("INSERT failed: $dbh->errstr");
$dbh->do($insert, undef, 2, 'Walgreens', 'New York City', 'None', '9-10am')
  or die("INSERT failed: $dbh->errstr");
$dbh->do("UPDATE pharmacies SET Phone = '' WHERE Id = 1")
  or die("The UPDATE statement failed much to Aruna's chagrin. $dbh->errstr");

my $sth = $dbh->prepare("SELECT Id, Name, Phone FROM pharmacies")
  or die("SELECT FAILED! YOU SUCK! $dbh->errstr");
$sth->execute();
while(my @row = $sth->fetchrow_array) {
  print(join(" | ", @row), "\n");
}




# Ignore this line, Bryan, Aruna. You guys
# are always asking questions and making
# intelligent remarks. I can't take it,
# anymore.
