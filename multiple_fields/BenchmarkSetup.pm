package BenchmarkSetup;

sub data
{
	{
		a => 'test1',
		b => 'test2',
		c => 'test3',
		d => 'test4',
		e => 'test5',
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
		BenchValiant
		BenchValidateTiny
		BenchValidatorLivr
	);
}

1;

