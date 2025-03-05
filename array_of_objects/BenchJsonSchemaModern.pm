package BenchJsonSchemaModern;

use parent 'JSON::Schema::Modern';

sub validate
{
	my ($self, $data) = @_;

	return $self->evaluate($data, {
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
	})->valid;
}

1;

