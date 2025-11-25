package BenchJsonSchemaValidate;

use v5.12;
use JSON::Schema::Validate;

sub validate
{
	my ($self, $data) = @_;

	state $object = JSON::Schema::Validate->new({
		type => 'object',
		required => ['a'],
		properties => {
			a => {
				type => 'array',
				items => {
					type => 'object',
					required => ['b','c'],
					properties => {
						b => { type => 'integer' },
						c => { type => 'string' },
					},
				},
			},
		},
	})->compile;

	return $object->validate($data);
}

1;

