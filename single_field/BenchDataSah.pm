package BenchDataSah;

use Data::Sah qw(gen_validator);

sub new
{
	my ($class) = @_;

	my $validator = gen_validator([
		'hash*',
		req_keys => ['a'],
		keys => {
			a => 'any*',
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

