package BenchTypeTiny;

use Types::Standard qw(Dict Any);
use feature 'state';

sub validate
{
	my ($self, $data) = @_;
	state $dict = Dict[a => Any];
	
	return $dict->check($data);
}

1;
