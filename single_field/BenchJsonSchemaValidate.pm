package BenchJsonSchemaValidate;

use v5.12;
use JSON::Schema::Validate;

sub validate
{
	my ($self, $data) = @_;

	state $object = JSON::Schema::Validate->new({
		type => 'object',
		required => ['a'],
	})->compile;

	return $object->validate($data);
}

1;

