package BenchValiant;

use Moo;
use Valiant::Validations;

has 'a' => (
	is => 'ro',
);

validates a => (
	presence => 1,
	scalar => 1
	with => sub {
		my ($self, $attribute_name, $value, $opts) = @_;
		$self->errors->add($attribute_name, 'must be short')
			if length $value > 64;
	},
);

1;
