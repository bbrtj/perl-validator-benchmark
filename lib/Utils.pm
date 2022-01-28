package Utils;

use strict;
use warnings;

sub get_benchmark_runners
{
	my ($data, @classes) = @_;

	my %runners = (
		BenchFormToolkit => sub {
			my $form = BenchFormToolkit->new;
			$form->fill_hash($data);
			die if $form->has_errors;
		},
		BenchFormTiny => sub {
			my $form = BenchFormTiny->new;
			$form->set_input($data);
			die unless $form->valid;
		},
		BenchDataMuForm => sub {
			my $form = BenchDataMuForm->new;
			die unless $form->check(data => $data);
		},
		BenchHtmlFormHandler => sub {
			my $form = BenchHtmlFormHandler->new;
			$form->process(params => $data);
			die unless $form->validated;
		},
		BenchJsonSchemaTiny => sub {
			die unless BenchJsonSchemaTiny->validate($data)->{valid};
		},
		BenchValidateTiny => sub {
			my $form = BenchValidateTiny->new;
			die unless $form->valid($data)->{success};
		},
		BenchValiant => sub {
			my $form = BenchValiant->new($data);
			$form->validate;
			die unless $form->valid;
		},
	);

	my %out;
	for my $class (@classes) {
		die "unknown benchmark class: $class"
			unless exists $runners{$class};

		eval "require $class";
		$out{$class =~ s/^Bench//r} = $runners{$class};
	}

	return \%out;
}

1;
