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
		BenchValiant
		BenchValidateTiny
	);
}

1;
