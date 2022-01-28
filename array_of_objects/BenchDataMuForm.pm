package BenchDataMuForm;

use Moo;
use Data::MuForm::Meta;
extends 'Data::MuForm';

has_field 'a' => (
	type => 'Repeatable',
	required => 1,
);

has_field 'a.b' => (
	type => 'Integer',
	required => 1,
);

has_field 'a.c' => (
	type => 'Text',
	required => 1,
);

1;

