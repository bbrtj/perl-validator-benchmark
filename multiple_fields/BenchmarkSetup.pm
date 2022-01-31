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
		BenchFormTiny
		BenchFormToolkit
		BenchHtmlFormHandler
		BenchJsonSchemaTiny
		BenchJsonSchemaModern
		BenchValiant
		BenchValidateTiny
		BenchValidatorLivr
	);
}

1;
