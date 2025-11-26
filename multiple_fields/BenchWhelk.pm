package BenchWhelk;

use Whelk::Schema;

sub new
{
	my ($class) = @_;

	my $validator = Whelk::Schema->build(
		{
			type => 'object',
			properties => {
				a => {
					type => 'string',
				},
				b => {
					type => 'string',
				},
				c => {
					type => 'string',
				},
				d => {
					type => 'string',
				},
				e => {
					type => 'string',
				},
			},
		}
	);

	return bless \$validator, $class;
}

sub validate
{
	my ($self, $data) = @_;

	return !defined ${$self}->inhale($data);
}

1;

