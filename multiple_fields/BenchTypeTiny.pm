package BenchTypeTiny;

use Types::Standard qw(Dict Str);

sub new
{
	my ($class) = @_;

	my $check = Dict[
		a => Str,
		b => Str,
		c => Str,
		d => Str,
		e => Str,
	];

	return bless \$check, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return ${$self}->check($data);
}

1;

