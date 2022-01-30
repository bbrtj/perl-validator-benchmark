package BenchJsonSchemaModern;

use parent 'JSON::Schema::Modern';

sub validate
{
	my ($self, $data) = @_;

	return $self->evaluate($data, {
		type => 'object',
		required => ['a'],
	});
}

1;
