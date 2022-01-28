package BenchHtmlFormHandler;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has_field 'a' => (
	required => 1,
);

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
