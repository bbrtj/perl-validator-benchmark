package BenchmarkSetup;

sub data
{
	{
		a => 2
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

