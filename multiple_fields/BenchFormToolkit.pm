package BenchFormToolkit;

use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	$self->add_field('String', 'a')
		->add_role('Mandatory');

	$self->add_field('String', 'b')
		->add_role('Mandatory');

	$self->add_field('String', 'c')
		->add_role('Mandatory');

	$self->add_field('String', 'd')
		->add_role('Mandatory');

	$self->add_field('String', 'e')
		->add_role('Mandatory');
}

__PACKAGE__->meta->make_immutable();

