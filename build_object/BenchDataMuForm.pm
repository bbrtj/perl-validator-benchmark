package BenchDataMuForm;

use Moo;
use Data::MuForm::Meta;
extends 'Data::MuForm';

has_field 'a' => (
	required => 1,
);

1;

