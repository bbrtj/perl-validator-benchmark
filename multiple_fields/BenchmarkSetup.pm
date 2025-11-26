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

sub bad_data
{
	{
		a => 'test1',
		b => 'test2',
		c => {},
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
		BenchWhelk
		BenchJsonSchemaValidate
	);
}

sub initial_runs
{
	return 100;
}

1;

