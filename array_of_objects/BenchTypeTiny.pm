package BenchTypeTiny;

use Types::Standard qw(ArrayRef Dict Str Int);
use feature 'state';

sub validate
{
	my ($self, $data) = @_;
	state $dict = Dict[
		a => ArrayRef[
			Dict [
				b => Int,
				c => Str,
			]
		]
	];

	return $dict->check($data);
}

1;
