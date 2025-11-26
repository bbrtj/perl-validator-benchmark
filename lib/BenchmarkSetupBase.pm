package BenchmarkSetupBase;

use v5.12;
use warnings;

sub data { ... }
sub bad_data { ... }

# generic runners that cache objects (full set)
sub get_runners
{
	my ($class, $data) = @_;

	return {
		BenchFormToolkit => sub {
			state $form = BenchFormToolkit->new;
			$form->clear;
			$form->fill_hash($data);
			die if $form->has_errors;
		},
		BenchFormTiny => sub {
			state $form = BenchFormTiny->new;
			$form->set_input($data);
			die unless $form->valid;
		},
		BenchDataMuForm => sub {
			state $form = BenchDataMuForm->new;
			die unless $form->check(data => $data);
		},
		BenchDataSah => sub {
			state $form = BenchDataSah->new;
			die unless $form->validate($data);
		},
		BenchHtmlFormHandler => sub {
			state $form = BenchHtmlFormHandler->new;
			$form->process(params => $data);
			die unless $form->validated;
		},
		BenchJsonSchemaTiny => sub {
			state $form = BenchJsonSchemaTiny->new;
			die unless $form->validate($data);
		},
		BenchJsonSchemaModern => sub {
			state $form = BenchJsonSchemaModern->new;
			die unless $form->validate($data);
		},
		BenchTypeTiny => sub {
			state $form = BenchTypeTiny->new;
			die unless $form->validate($data);
		},
		BenchValidateTiny => sub {
			state $form = BenchValidateTiny->new;
			die unless $form->valid($data);
		},
		BenchValiant => sub {
			state $form = BenchValiant->new($data);
			$form->validate;
			die unless $form->valid;
		},
		BenchValidatorLivr => sub {
			state $form = BenchValidatorLivr->new;
			die unless $form->validate($data);
		},
		BenchWhelk => sub {
			state $form = BenchWhelk->new;
			die unless $form->validate($data);
		},
		BenchJsonSchemaValidate => sub {
			state $form = BenchJsonSchemaValidate->new;
			die unless $form->validate($data);
		},
	};
}

sub initial_runs { 200 }

1;

