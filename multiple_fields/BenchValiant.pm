package BenchValiant;

use Moo;
use Valiant::Validations;

has 'a' => (
	is => 'ro',
);

has 'b' => (
	is => 'ro',
);

has 'c' => (
	is => 'ro',
);

has 'd' => (
	is => 'ro',
);

has 'e' => (
	is => 'ro',
);

validates a => (
	presence => 1,
	scalar => 1,
);

validates b => (
	presence => 1,
	scalar => 1,
);

validates c => (
	presence => 1,
	scalar => 1,
);

validates d => (
	presence => 1,
	scalar => 1,
);

validates e => (
	presence => 1,
	scalar => 1,
);

1;
