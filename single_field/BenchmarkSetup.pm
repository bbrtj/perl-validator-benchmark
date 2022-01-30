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
