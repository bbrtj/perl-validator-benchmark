package BenchTypeTiny;

use Types::Standard qw(ArrayRef Dict Str Int);

sub new
{
	my ($class) = @_;

	my $check = Dict[
		a => ArrayRef[
			Dict [
				b => Int,
				c => Str,
			]
		]
	];

	return bless \$check, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return ${$self}->check($data);
}

1;

