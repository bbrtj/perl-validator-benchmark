package BenchFormTiny;

use Form::Tiny;
use Types::Standard qw(Str);

form_field 'a' => (
	required => 1,
	type => Str,
);

form_field 'b' => (
	required => 1,
	type => Str,
);

form_field 'c' => (
	required => 1,
	type => Str,
);

form_field 'd' => (
	required => 1,
	type => Str,
);

form_field 'e' => (
	required => 1,
	type => Str,
);

1;

