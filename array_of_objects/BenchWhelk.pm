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
					type => 'array',
					items => {
						type => 'object',
						properties => {
							b => {
								type => 'integer',
							},
							c => {
								type => 'string',
							},
						},
					}
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

