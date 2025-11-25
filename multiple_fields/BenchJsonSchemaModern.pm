package BenchJsonSchemaModern;

use parent 'JSON::Schema::Modern';

sub new
{
	my ($class, @args) = @_;

	my $self = $class->SUPER::new(@args);
	$self->add_schema('/bench' => {
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

	return $self
}

sub validate
{
	my ($self, $data) = @_;

	return $self->evaluate($data, '/bench')->valid;
}

1;

