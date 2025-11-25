package BenchTypeTiny2;

use Types::Standard qw(Str);
use Types::Standard::Dict 2.008 MyDict => { of => [
		a => Str,
		b => Str,
		c => Str,
		d => Str,
		e => Str,
] };

sub validate
{
	my ($self, $data) = @_;
	return is_MyDict($data);
}

1;
