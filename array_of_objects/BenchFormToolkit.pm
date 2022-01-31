package BenchFormToolkit;

package Form::Toolkit::Field::ArrayOfObjects {
	use Moose;
	extends qw/Form::Toolkit::Field/;

	has '+value' => (
		isa => 'ArrayRef[HashRef]'
	);

	sub validate
	{
		my ($self) = @_;

		$self->SUPER::validate();

		for my $hash ($self->value->@*) {
			$self->validate_each($hash);
		}
	}

	sub validate_each {}

	# HACK: make this a Set short class, since we don't really want to write our own Clerk
	__PACKAGE__->meta->short_class('Set');
	__PACKAGE__->meta->make_immutable;
}

package Form::Toolkit::FieldRole::Subform {
	use Moose::Role;
	with qw'Form::Toolkit::FieldRole';

	has 'subform' => (
		is => 'ro',
		isa => 'Form::Toolkit::Form',
	);

	requires qw(validate_each);

	after 'validate_each' => sub {
		my ($self, $value) = @_;

		my $subform = $self->subform;
		$subform->clear;
		$subform->fill_hash($value);
		if ($subform->has_errors) {
			# NOTE: we would have to traverse all the field errors and form errors,
			# which would not give us any benefit in this benchmark
			$self->add_error('Subform is invalid');
		}
	}
}

package FormToolkitInner {
	use Moose;
	extends 'Form::Toolkit::Form';

	sub build_fields {
		my ($self) = @_;
		$self->add_field('Integer', 'b')
			->add_role('Mandatory');
		$self->add_field('String', 'c')
			->add_role('Mandatory');
	}

	__PACKAGE__->meta->make_immutable();
}

use feature 'state';
use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	state $fields = do {
		my $subform = FormToolkitInner->new;
		[
			$self->add_field('ArrayOfObjects', 'a')
				->add_role('Mandatory')
				->add_role('Subform', { subform => $subform }),
		]
	};

	$self->fields->@* = @$fields;
	$self->clear; # since we reuse same field objects, clear the form
}

__PACKAGE__->meta->make_immutable();
