#!/usr/bin/env perl

use v5.12;
use warnings;
use List::Util qw(max);

my @lines = <STDIN>;
chomp @lines;

$lines[0] =~ s/(?<=Rate).*//;
my $end = length $lines[0];

my @rates;
for my $row_num (1 .. $#lines) {
	$lines[$row_num] =~ m{([0-9.]+)/s};
	push @rates, $1;

	substr($lines[$row_num], $end) = '';
}

my $last_rate;
my @results = ('Speedup vs previous');
for my $n (0 .. $#rates) {
	if (!defined $last_rate) {
		push @results, '--';
	}
	else {
		push @results, int($rates[$n] / $last_rate * 100 - 100) . '%';
	}
	$last_rate = $rates[$n];
}

my $min_len = 1 + max map { length $_ } @results;
for my $row_num (0 .. $#lines) {
	$lines[$row_num] .= sprintf "%${min_len}s", $results[$row_num];
}

say for @lines;
