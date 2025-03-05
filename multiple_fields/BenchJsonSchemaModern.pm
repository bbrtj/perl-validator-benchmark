package BenchJsonSchemaModern;

use parent 'JSON::Schema::Modern';

sub validate
{
	my ($self, $data) = @_;

	return $self->evaluate($data, {
		type => 'object',
		required => ['a', 'b', 'c', 'd', 'e'],
		properties => {
			a => { type => 'string' },
			b => { type => 'string' },
			c => { type => 'string' },
			d => { type => 'string' },
			e => { type => 'string' },
		}
	})->valid;
}

1;

