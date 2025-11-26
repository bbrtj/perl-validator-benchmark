package BenchTypeTiny;

use Types::Standard qw(Dict Any);

sub new
{
	my ($class) = @_;

	my $check = Dict[
		a => Any
	];

	return bless \$check, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return ${$self}->check($data);
}

1;

