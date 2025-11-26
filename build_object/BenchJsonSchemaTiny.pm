package BenchJsonSchemaTiny;

use JSON::Schema::Tiny qw(evaluate);

sub new
{
	my ($class) = @_;

	my $rules = {
		type => 'object',
		required => ['a'],
	};
	return bless {rules => $rules}, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return evaluate($data, $self->{rules})->{valid};
}

1;

