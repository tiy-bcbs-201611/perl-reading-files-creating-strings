#!/usr/bin/env perl
use warnings;
use strict;

my $value = 17;
my $name = "Curtis";

print("My value is $value\n");
print('My value is $value\n', "\n");        # Does not interpolate
print('-' x 20, "\n");                      # Prints - 20 times
print(`ls`);                                # Runs the command, prints the output
print('-' x 20, "\n");                      # Prints - 20 times
print("He said, \"Hi, $name!\"\n");
print(qq{He said, "Hi, $name!"\n});         # Same as using "..."
print('-' x 20, "\n");
print(q{He said, "Hi, $name!"\n}, "\n");    # Same as using '...'
print('-' x 20, "\n");
my @days_of_week = ("Monday", "Tuesday");
my @days_of_wk2  = qw{Monday Tuesday};      # Creates a list of strings
my @days_of_wk3  = qw/Monday Tuesday/;      # Creates a list of strings
print("Monday is $days_of_week[0]\n");      # Print the first day
print("Monday also $days_of_wk2[0]\n");     # Print the first day
print("Monday still $days_of_wk3[0]\n");    # Print the first day
print('-' x 20, "\n");
print(qx{ls});                              # Same as `ls`
print('-' x 20, "\n");
# NOTHING TO DO WITH STRINGS
# ARUNA WANTED TO KNOW HOW TO
# GET A REFERENCE TO AN EXISTING
# ARRAY.
my $days_of_ref = \@days_of_week;
print("$days_of_ref->[1]\n");

print('-' x 20, "\n");
my $nickname = substr($name, 0, 4);        # Get a substring
print(qq{My nickname is "$nickname"\n});

print('-' x 20, "\n");
substr($name, 1, 4) = "ult of Horu";
print(qq{I belong to the "$name"\n});

print('-' x 20, "\n");
print("Days of week: ", @days_of_week, "\n");                 # Ugly print
print("Days of week: @days_of_week", "\n");                   # Adds spaces
print("Days of week: ", join(",", @days_of_week), "\n");      # Put in commas
print("Days of week: ", join("☺" x 3, @days_of_week), "\n");  # Put in happy faces!

print('-' x 20, "\n");
my $string_list = "Mon,Tue,Wed,Thu,Fri";
my @string_arr = split(/,/, $string_list);
print("Days abbrevs: @string_arr\n");
print("First abbrev: @string_arr[0]\n");




# Ignore this line, Bryan, Aruna. You guys
# are always asking questions and making
# intelligent remarks. I can't take it,
# anymore.
