package BenchTypeTiny;

use Types::Standard qw(Dict Str);
use feature 'state';

sub validate
{
	my ($self, $data) = @_;
	state $dict = Dict[
		a => Str,
		b => Str,
		c => Str,
		d => Str,
		e => Str,
	];
	return $dict->check($data);
}

1;
