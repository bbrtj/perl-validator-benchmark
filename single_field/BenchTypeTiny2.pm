package BenchTypeTiny2;

use Types::Standard qw(Any);
use Types::Standard::Dict 2.008 MyDict => { of => [ a => Any ] };
use feature 'state';

sub validate
{
	my ($self, $data) = @_;
	
	return is_MyDict($data);
}

1;
