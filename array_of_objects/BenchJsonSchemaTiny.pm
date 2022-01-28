package BenchJsonSchemaTiny;

use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	return evaluate($data, {
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
	});
}

1;
