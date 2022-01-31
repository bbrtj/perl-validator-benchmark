package BenchValidateTiny;

use Validate::Tiny ':all';

my $rules = {
	fields => [qw(a)],
	checks => [
		[qw(a)] => is_required(),
	],
};

sub valid
{
	my ($self, $data) = @_;
	return validate($data, $rules);
}

1;

