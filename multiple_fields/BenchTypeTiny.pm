package BenchTypeTiny;

use Types::Standard qw(Dict Str);

sub validate
{
	my ($self, $data) = @_;

	return (
		Dict[
			a => Str,
			b => Str,
			c => Str,
			d => Str,
			e => Str,
		]
	)->check($data);
}

1;
