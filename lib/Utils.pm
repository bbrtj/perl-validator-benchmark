package Utils;

use strict;
use warnings;

sub prepare_benchmark
{
	my $runners = BenchmarkSetup->get_runners(shift);

	for my $class (keys %{$runners}) {
		my $res = eval "require $class; 1;";
		die "error loading $class: $@" unless $res;

		$runners->{$class =~ s/^Bench//r} = delete $runners->{$class};
	}

	return $runners;
}

1;

