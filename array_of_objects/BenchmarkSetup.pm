package BenchmarkSetup;

use strict;
use warnings;

sub data
{
	return {
		a => [{
			b => 5,
			c => 'text',
		}, {
			b => -1,
			c => 'another text',
		}, {
			b => 1000,
			c => 'and another',
		}, map {
			{
				b => int(rand 1000),
				c => 'text with a random number: ' . int(rand 1000)
			}
		} 1 .. 97]
	}
}

sub participants
{
	return qw(
		BenchDataMuForm
		BenchFormTiny
		BenchHtmlFormHandler
		BenchValiant
		BenchValidateTiny
	);
}

1;
