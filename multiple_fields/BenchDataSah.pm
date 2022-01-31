package BenchDataSah;

use v5.12;
use Data::Sah qw(gen_validator);

sub validate
{
	my ($self, $data) = @_;
	state $validator = gen_validator([
		'hash*',
		req_keys => [qw(a b c d e)],
		keys => {
			a => 'str*',
			b => 'str*',
			c => 'str*',
			d => 'str*',
			e => 'str*',
		},
	]);


	return $validator->($data);
}

1;
