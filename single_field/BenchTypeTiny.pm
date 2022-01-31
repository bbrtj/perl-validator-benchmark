package BenchTypeTiny;

use Types::Standard qw(Dict Any);

sub validate
{
	my ($self, $data) = @_;

	return (
		Dict[a => Any]
	)->check($data);
}

1;
