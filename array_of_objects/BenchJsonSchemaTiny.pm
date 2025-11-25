package BenchJsonSchemaTiny;

use v5.12;
use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	state $schema = {
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
	};

	return evaluate($data, $schema);
}

1;

