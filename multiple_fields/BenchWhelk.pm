package BenchWhelk;

use feature 'state';
use Whelk::Schema;

sub validate
{
	my ($self, $data) = @_;

	state $validator = Whelk::Schema->build(
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

	return !defined $validator->inhale($data);
}

1;

