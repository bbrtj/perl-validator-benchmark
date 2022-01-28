#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';

use Benchmark qw(cmpthese);
use Utils;

my $which = shift;
die "usage: benchmark.pl <benchmark_name>"
	unless $which;
die "no benchmark case $which"
	unless -d $which;

unshift @INC, $which;
require BenchmarkSetup;

cmpthese(-3 => Utils::get_benchmark_runners(
	BenchmarkSetup->data,
	BenchmarkSetup->participants,
));
