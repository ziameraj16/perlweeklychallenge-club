#!/usr/bin/perl
#
# Write a script to replace the character ‘e’ with ‘E’ in the string
# ‘Perl Weekly Challenge’. Also print the number of times the
# character ‘e’ is found in the string.

my $string = 'Perl Weekly Challenge';
my $numberOfEs;
while ($string =~ /\G[^e]*e/g) {
	$numberOfEs++;
}
print "Es: $numberOfEs\n";
my $replaced = $string =~ s/e/E/g;
print "replaced: $replaced";
