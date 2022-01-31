package BenchDataSah;

use v5.12;
use Data::Sah qw(gen_validator);

sub validate
{
	my ($self, $data) = @_;
	state $validator = gen_validator([
		'hash*',
		req_keys => [qw(a)],
		keys => {
			a => [
				'array*',
				of => [
					'hash*',
					req_keys => [qw(b c)],
					keys => {
						b => 'int*',
						c => 'str*',
					}
				],
			]
		},
	]);


	return $validator->($data);
}

1;
