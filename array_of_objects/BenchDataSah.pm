package BenchDataSah;

use Data::Sah qw(gen_validator);

sub new
{
	my ($class) = @_;

	my $validator = gen_validator([
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

	return bless \$validator, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return ${$self}->($data);
}

1;

