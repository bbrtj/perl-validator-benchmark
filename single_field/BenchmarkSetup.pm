package BenchmarkSetup;

sub data
{
	{
		a => 2
	}
}

sub bad_data
{
	{
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
	);
}

1;

