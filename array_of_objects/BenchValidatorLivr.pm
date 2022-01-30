package BenchValidatorLivr;

use parent 'Validator::LIVR';

sub new
{
	return shift->SUPER::new({
		a => ['required', {
			list_of_objects => {
				b => ['required', 'integer'],
				c => ['required', 'string'],
			}
		}],
	});
}

1;
