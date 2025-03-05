package BenchHtmlFormHandler;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

# NOTE: this actually doesn't pass the test for some reason?

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

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;

