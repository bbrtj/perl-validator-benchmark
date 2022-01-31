package BenchValidateTiny;

use Validate::Tiny ':all';
use Types::Standard qw(Str Int);

my $rules2 = {
	fields => [qw(b c)],
	checks => [
		[qw(b c)] => is_required(),

		b => sub {
			Int->validate(shift);
		},
		c => sub {
			Str->validate(shift);
		},
	],
};

my $rules = {
	fields => [qw(a)],
	checks => [
		[qw(a)] => is_required(),

		a => sub {
			my $value = shift;

			return 'not an array'
				unless ref $value eq 'ARRAY';

			for my $el ($value->@*) {
				return 'not a hash'
					unless ref $el eq 'HASH';

				my $validated = validate($el, $rules2);
				return $validated->{error}
					unless $validated->{success};
			}

			return;
		},
	],
};

sub valid
{
	my ($self, $data) = @_;
	return validate($data, $rules);
}

1;

