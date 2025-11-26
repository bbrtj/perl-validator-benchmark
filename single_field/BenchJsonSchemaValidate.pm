package BenchJsonSchemaValidate;

use parent 'JSON::Schema::Validate';

sub new
{
	my ($class) = @_;

	return $class->SUPER::new({
		type => 'object',
		required => ['a'],
	})->compile;
}

1;

