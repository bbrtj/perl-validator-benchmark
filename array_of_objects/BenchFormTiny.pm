package BenchFormTiny;

use Form::Tiny;
use Types::Standard qw(Str Int);

form_field 'a.*.b' => (
	type => Int,
	required => 1,
);

form_field 'a.*.c' => (
	type => Str,
	required => 1,
);

1;

