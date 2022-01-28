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

use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	$self->add_field('String', 'a')
		->add_role('IsShort');
}

__PACKAGE__->meta->make_immutable();
