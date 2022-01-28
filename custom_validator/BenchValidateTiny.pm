package BenchValidateTiny;

use Moo;
use Validate::Tiny ':all';
use Types::Standard qw(Str);

my $rules = {
	fields => [qw(a)],
	checks => [
		[qw(a)] => is_required(),

		a => sub {
			my $value = shift;
			return 'must be a string' unless Str->check($value);
			return 'must be short' if length $value > 64;
			return;
		}
	],
};

sub valid
{
	my ($self, $data) = @_;
	return validate($data, $rules);
}

1;

