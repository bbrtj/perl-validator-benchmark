package BenchTypeTiny;

use Types::Standard qw(ArrayRef Dict Str Int);

sub validate
{
	my ($self, $data) = @_;

	return (
		Dict[
			a => ArrayRef[
				Dict [
					b => Int,
					c => Str,
				]
			]
		]
	)->check($data);
}

1;
