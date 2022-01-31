package BenchHtmlFormHandler;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

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

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
