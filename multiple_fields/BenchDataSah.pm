package BenchDataSah;

use Data::Sah qw(gen_validator);

sub new
{
	my ($class) = @_;

	my $validator = gen_validator([
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

	return bless \$validator, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return ${$self}->($data);
}

1;

