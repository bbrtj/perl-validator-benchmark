package BenchDataSah;

use v5.12;
use Data::Sah qw(gen_validator);

sub validate
{
	my ($self, $data) = @_;
	state $validator = gen_validator([
		'hash*',
		req_keys => ['a'],
		keys => {
			a => 'any*',
		},
	]);


	return $validator->($data);
}

1;
