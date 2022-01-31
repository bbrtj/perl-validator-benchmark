package BenchValidatorLivr;

use parent 'Validator::LIVR';

sub new
{
	return shift->SUPER::new({
		a => ['required', 'string'],
		b => ['required', 'string'],
		c => ['required', 'string'],
		d => ['required', 'string'],
		e => ['required', 'string'],
	});
}

1;
