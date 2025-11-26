package BenchJsonSchemaValidate;

use parent 'JSON::Schema::Validate';

sub new
{
	my ($class) = @_;

	return $class->SUPER::new({
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
}

1;

