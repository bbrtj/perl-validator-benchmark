package BenchValidateTiny;

use Validate::Tiny ':all';
use Types::Standard qw(Str);

my $rules = {
	fields => [qw(a b c d e)],
	checks => [
		[qw(a b c d e)] => is_required(),
		[qw(a b c d e)] => sub {
			Str->validate(shift)
		}
	],
};

sub valid
{
	my ($self, $data) = @_;
	return validate($data, $rules);
}

1;

