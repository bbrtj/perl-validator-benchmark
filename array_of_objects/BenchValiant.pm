package BenchValiant;

package ValiantInner {
	use Moo;
	use Valiant::Validations;
	use Types::Standard qw(Str);

	has 'b' => (
		is => 'ro'
	);

	has 'c' => (
		is => 'ro'
	);

	validates 'b',
		presence => 1,
		numericality => 'integer';

	validates 'c',
		presence => 1,
		check => Str;
}

use Moo;
use Valiant::Validations;

has '_a' => (
	is => 'ro',
	init_arg => 'a'
);

has 'a' => (
	init_arg => undef,
	is => 'ro',
	required => 1,
	lazy => 1,
	builder => '_build_a');

sub _build_a
{
	return [
		map {
			ValiantInner->new($_);
		} @{$_[0]->_a}
	];
}

validates 'a',
	presence => 1,
	array => +{ validations => [object => 1] };

1;

__END__

Shorter, but much slower version:

	use Moo;
	use Valiant::Validations;
	use Types::Standard qw(Str);

	has 'a' => (
		is => 'ro',
	);

	validates a => (
		presence => 1,
		array => {
			validations => [
				hash => [
					[b => presence => 1, numericality => { is_integer => 1 }],
					[c => presence => 1, check => Str],
				]
			],
		}
	);
