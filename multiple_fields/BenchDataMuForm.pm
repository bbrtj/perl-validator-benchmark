package BenchDataMuForm;

use Moo;
use Data::MuForm::Meta;
extends 'Data::MuForm';

has_field 'a' => (
	required => 1,
	type => 'Text',
);

has_field 'b' => (
	required => 1,
	type => 'Text',
);

has_field 'c' => (
	required => 1,
	type => 'Text',
);

has_field 'd' => (
	required => 1,
	type => 'Text',
);

has_field 'e' => (
	required => 1,
	type => 'Text',
);

1;

