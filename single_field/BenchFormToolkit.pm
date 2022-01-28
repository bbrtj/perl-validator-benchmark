package BenchFormToolkit;

use Moose;
extends 'Form::Toolkit::Form';

sub build_fields {
	my ($self) = @_;
	$self->add_field('a')
		->add_role('Mandatory');
}

__PACKAGE__->meta->make_immutable();

