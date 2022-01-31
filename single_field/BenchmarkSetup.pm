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
