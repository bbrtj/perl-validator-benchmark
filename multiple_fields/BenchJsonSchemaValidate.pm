package BenchJsonSchemaValidate;

use parent 'JSON::Schema::Validate';

sub new
{
	my ($class) = @_;

	return $class->SUPER::new({
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
}

1;

