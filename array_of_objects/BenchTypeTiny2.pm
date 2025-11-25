package BenchTypeTiny2;

use Types::Standard qw(ArrayRef Str Int Dict);
use Types::Standard::Dict 2.008 MyDict => { of => [
	a => ArrayRef[
		Dict[
			b => Int,
			c => Str,
		]
	]
] };

sub validate
{
	my ($self, $data) = @_;
	return is_MyDict($data);
}

1;
