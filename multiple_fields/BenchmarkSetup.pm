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
		BenchDataMuForm
		BenchDataSah
		BenchFormTiny
		BenchFormToolkit
		BenchHtmlFormHandler
		BenchJsonSchemaTiny
		BenchJsonSchemaModern
		BenchTypeTiny
		BenchValiant
		BenchValidateTiny
		BenchValidatorLivr
	);
}

1;
