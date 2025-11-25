#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';

use Utils;
use Test::More;
use Test::Exception;

my $which = shift;
die "usage: test.pl <benchmark_name>"
	unless $which;
die "no benchmark case $which"
	unless -d $which;

unshift @INC, $which;
require BenchmarkSetup;

my $cases_good = Utils::get_benchmark_runners(
	BenchmarkSetup->data,
	BenchmarkSetup->participants,
);

foreach my $case_name (sort keys %$cases_good) {
	lives_ok sub { $cases_good->{$case_name}->() }, "good $case_name ok";
}

my $cases_bad = Utils::get_benchmark_runners(
	BenchmarkSetup->bad_data,
	BenchmarkSetup->participants,
);

foreach my $case_name (sort keys %$cases_bad) {
	dies_ok sub { $cases_bad->{$case_name}->() }, "bad $case_name ok";
}

done_testing;

