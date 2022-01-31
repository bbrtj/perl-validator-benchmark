package BenchJsonSchemaTiny;

use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	return evaluate($data, {
		type => 'object',
		required => ['a', 'b', 'c', 'd', 'e'],
		properties => {
			a => { type => 'string' },
			b => { type => 'string' },
			c => { type => 'string' },
			d => { type => 'string' },
			e => { type => 'string' },
		}
	});
}

1;
