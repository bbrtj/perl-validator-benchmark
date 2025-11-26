package BenchJsonSchemaTiny;

use JSON::Schema::Tiny qw(evaluate);

sub new
{
	my ($class) = @_;

	my $rules = {
		type => 'object',
		required => ['a'],
		properties => {
			a => {
				type => 'array',
				items => {
					type => 'object',
					required => ['b','c'],
					properties => {
						b => { type => 'integer' },
						c => { type => 'string' },
					},
				},
			},
		},
	};
	return bless {rules => $rules}, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return evaluate($data, $self->{rules})->{valid};
}

1;

