package BenchmarkSetup;

use strict;
use warnings;

use parent 'BenchmarkSetupBase';

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

1;

