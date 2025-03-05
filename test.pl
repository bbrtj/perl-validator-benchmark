#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';

use Utils;
use Test::More;
use Test::Exception;

my $which = shift;
die "usage: benchmark.pl <benchmark_name>"
	unless $which;
die "no benchmark case $which"
	unless -d $which;

unshift @INC, $which;
require BenchmarkSetup;

my $cases = Utils::get_benchmark_runners(
	BenchmarkSetup->bad_data,
	BenchmarkSetup->participants,
);

foreach my $case_name (sort keys %$cases) {
	dies_ok sub { $cases->{$case_name}->() }, "$case_name ok";
}

done_testing;

