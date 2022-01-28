package BenchFormTiny;

use Form::Tiny;
use Types::Standard qw(Str);

form_field 'a' => (
	type => Str,
	required => 1,
);

field_validator 'must be short' => sub {
	length pop() < 64
};

1;
