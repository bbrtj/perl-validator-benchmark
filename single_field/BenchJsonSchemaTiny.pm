package BenchJsonSchemaTiny;

use v5.12;
use JSON::Schema::Tiny qw(evaluate);

sub validate
{
	my ($self, $data) = @_;

	state $schema = {
		type => 'object',
		required => ['a'],
	};

	return evaluate($data, $schema);
}

1;

