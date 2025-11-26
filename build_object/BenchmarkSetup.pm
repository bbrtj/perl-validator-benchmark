package BenchmarkSetup;

use strict;
use warnings;
use parent 'BenchmarkSetupBase';

sub data
{
	{
		a => 2
	}
}

sub bad_data
{
	{
	}
}

sub get_runners
{
	my ($class, $data) = @_;

	return {
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
		BenchDataSah => sub {
			my $form = BenchDataSah->new;
			die unless $form->validate($data);
		},
		BenchHtmlFormHandler => sub {
			my $form = BenchHtmlFormHandler->new;
			$form->process(params => $data);
			die unless $form->validated;
		},
		BenchJsonSchemaTiny => sub {
			my $form = BenchJsonSchemaTiny->new;
			die unless $form->validate($data);
		},
		BenchJsonSchemaModern => sub {
			my $form = BenchJsonSchemaModern->new;
			die unless $form->validate($data);
		},
		BenchTypeTiny => sub {
			my $form = BenchTypeTiny->new;
			die unless $form->validate($data);
		},
		BenchValidateTiny => sub {
			my $form = BenchValidateTiny->new;
			die unless $form->valid($data);
		},
		BenchValiant => sub {
			my $form = BenchValiant->new($data);
			$form->validate;
			die unless $form->valid;
		},
		BenchValidatorLivr => sub {
			my $form = BenchValidatorLivr->new;
			die unless $form->validate($data);
		},
		BenchWhelk => sub {
			my $form = BenchWhelk->new;
			die unless $form->validate($data);
		},
		BenchJsonSchemaValidate => sub {
			my $form = BenchJsonSchemaValidate->new;
			die unless $form->validate($data);
		},
	};
}

1;

