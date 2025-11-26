package BenchValidateTiny;

use parent 'Validate::Tiny';

sub new
{
	my ($class) = @_;

	my $self = $class->SUPER::new;
	$self->{rules} = {
		fields => [qw(a)],
		checks => [
			[qw(a)] => $class->is_required(),
		],
	};

	return $self;
}

sub valid
{
	my ($self, $data) = @_;

	$self->check($data, $self->{rules});
	return $self->success;
}

1;

