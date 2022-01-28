package BenchHtmlFormHandler;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has_field 'a' => (
	type => 'Text',
	required => 1,
);

sub validate_a {
	my ($self, $field) = @_;

	if (length $field->value > 64) {
		$field->add_error('must be short');
	}
}

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
