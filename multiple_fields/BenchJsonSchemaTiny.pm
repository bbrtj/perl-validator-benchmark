package BenchJsonSchemaTiny;

use v5.12;
use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	state $schema = {
		type => 'object',
		required => ['a', 'b', 'c', 'd', 'e'],
		properties => {
			a => { type => 'string' },
			b => { type => 'string' },
			c => { type => 'string' },
			d => { type => 'string' },
			e => { type => 'string' },
		}
	};

	return evaluate($data, $schema);
}

1;

