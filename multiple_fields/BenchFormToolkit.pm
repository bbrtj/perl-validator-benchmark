package BenchFormToolkit;

use feature 'state';
use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	state $fields = do {
		[
			$self->add_field('String', 'a')
				->add_role('Mandatory'),

			$self->add_field('String', 'b')
				->add_role('Mandatory'),

			$self->add_field('String', 'c')
				->add_role('Mandatory'),

			$self->add_field('String', 'd')
				->add_role('Mandatory'),

			$self->add_field('String', 'e')
				->add_role('Mandatory'),
		]
	};

	$self->fields->@* = @$fields;
	$self->clear; # since we reuse same field objects, clear the form
}

__PACKAGE__->meta->make_immutable();

