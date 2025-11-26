#!/usr/bin/env perl

use v5.12;
use warnings;
use lib 'lib';

use Dumbbench;
use List::Util qw(max sum);
use Utils;

my $which = shift;
die "usage: benchmark.pl <benchmark_name>"
	unless $which;
die "no benchmark case $which"
	unless -d $which;

unshift @INC, $which;
require BenchmarkSetup;

my $bench = Dumbbench->new(
	target_rel_precision => 0.01,
	initial_runs => BenchmarkSetup->initial_runs,
);

my $runners = Utils::get_benchmark_runners(
	BenchmarkSetup->data,
	BenchmarkSetup->participants,
);

$bench->add_instances(
	map { Dumbbench::Instance::PerlSub->new(name => $_, code => $runners->{$_}) } keys %$runners,
);

$bench->run;
my @bench_results = sort { $b->{time} <=> $a->{time} }
	map { get_rate($_) }
	$bench->instances;

my $last_rate;
my @results = (['', 'Rate', 'Error margin', 'Speedup vs previous']);
for my $n (keys @bench_results) {
	my $res = $bench_results[$n];

	my $error_precision = 100;
	my $error_percent = int($res->{error} * 100 * $error_precision) / $error_precision;
	$error_percent = '< ' . (1 / $error_precision)
		if $error_percent == 0;
	my @row = (
		$res->{name},
		$res->{rate} . '/s',
		"$error_percent%",
	);

	if (!defined $last_rate) {
		push @row, '--';
	}
	else {
		push @row, int($res->{rate} / $last_rate * 100 - 100) . '%';
	}
	$last_rate = $res->{rate};

	push @results, \@row;
}

# paddings
pad(0, !!1);
pad($_) for 1 .. 3;

my @lines = map { join '  ', $_->@* } @results;
say for @lines;

sub get_rate
{
	my ($instance) = @_;
	my $result = $_->result;

	my ($time, $precision) = $result =~ m{(.+) \Q+/-\E (.+)};

	my $rate = 1 / $time;
	$rate = $rate > 10 ? int($rate) : int($rate * 10) / 10;

	return {
		name => $_->name,
		time => $time,
		precision => $precision,
		rate => $rate,
		error => $precision / $time,
	};
}

sub pad
{
	my ($col, $append) = @_;

	my $min_len = 1 + max map { length $_->[$col] } @results;
	for my $row (@results) {
		if ($append) {
			$row->[$col] .= ' ' x ($min_len - length $row->[$col]);
		}
		else {
			$row->[$col] = sprintf "%${min_len}s", $row->[$col];
		}
	}
}

