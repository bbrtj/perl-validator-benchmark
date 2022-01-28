package BenchDataMuForm;

use Moo;
use Data::MuForm::Meta;
extends 'Data::MuForm';

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

1;
