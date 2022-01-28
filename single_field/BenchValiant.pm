package BenchValiant;

use Moo;
use Valiant::Validations;

has 'a' => (
	is => 'ro',
);

validates a => (
	presence => 1,
);

1;
