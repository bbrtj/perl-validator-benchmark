package BenchJsonSchemaTiny;

use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	return evaluate($data, {
		type => 'object',
		required => ['a'],
	});
}

1;
