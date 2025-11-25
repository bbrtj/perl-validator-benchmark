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

sub bad_data
{
	return {
		a => [{
			b => -1,
			c => 'another text',
		}, {
			b => 1000,
			c => 'and another',
		}, (map {
			{
				b => int(rand 1000),
				c => 'text with a random number: ' . int(rand 1000)
			}
		} 1 .. 97), [
			'this is not an object'
		]]
	}
}

sub participants
{
	return qw(
		BenchJsonSchemaModern
		BenchDataMuForm
		BenchDataSah
		BenchFormTiny
		BenchFormToolkit
		BenchHtmlFormHandler
		BenchJsonSchemaTiny
		BenchTypeTiny
		BenchTypeTiny2
		BenchValiant
		BenchValidateTiny
		BenchValidatorLivr
		BenchWhelk
		BenchJsonSchemaValidate
	);
}

1;

