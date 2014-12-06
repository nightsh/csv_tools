#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use Text::CSV;
use Text::Fuzzy;

my $inFile;
my $validNames;
my $outFile;
my $help;
my $usage = "Usage: perl parsecsv.pl -i <infile.txt> --valid-names <valid_names.txt> -o <outfile.txt>\n";

GetOptions ("in=s" => \$inFile,
    "valid-names=s" => \$validNames,
    "out=s" => \$outFile,
    "help|man" => \$help) || pod2usage(2);

#Check input arguments
if (!defined $inFile) {
    print "Must supply input file name.\n";
    pod2usage(-exitval => 0, -verbose => 2, -noperldoc => 1);
} elsif (!defined $outFile) {
    print "Must supply output file name.\n";
    pod2usage(-exitval => 0, -verbose => 2, -noperldoc => 1);
} elsif (!defined $validNames) {
    print "Must supply valid names list.\n";
    pod2usage(-exitval => 0, -verbose => 2, -noperldoc => 1);
}


