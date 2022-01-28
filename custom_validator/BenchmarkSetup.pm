package BenchmarkSetup;

sub data
{
	{
		a => 'is this field shorter than 64 characters?'
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
