package BenchValidatorLivr;

use parent 'Validator::LIVR';

sub new
{
	return shift->SUPER::new({
		a => 'required',
	});
}

1;
