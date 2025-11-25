package BenchJsonSchemaValidate;

use v5.12;
use JSON::Schema::Validate;

sub validate
{
	my ($self, $data) = @_;

	state $object = JSON::Schema::Validate->new({
		type => 'object',
		required => ['a', 'b', 'c', 'd', 'e'],
		properties => {
			a => { type => 'string' },
			b => { type => 'string' },
			c => { type => 'string' },
			d => { type => 'string' },
			e => { type => 'string' },
		}
	})->compile;

	return $object->validate($data);
}

1;

