package BenchFormToolkit;

package Form::Toolkit::FieldRole::IsShort {
	use Moose::Role;
	with qw'Form::Toolkit::FieldRole';

	after 'validate' => sub {
		my ($self) = @_;

		if (length $self->value > 64) {
			$self->add_error('must be short');
		}
	}
}

use feature 'state';
use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	state $fields = do {
		[
			$self->add_field('String', 'a')
				->add_role('Mandatory')
				->add_role('IsShort'),
		]
	};

	$self->fields->@* = @$fields;
	$self->clear; # since we reuse same field objects, clear the form
}

__PACKAGE__->meta->make_immutable();
