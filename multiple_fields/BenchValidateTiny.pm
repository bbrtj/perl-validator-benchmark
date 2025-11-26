package BenchValidateTiny;

use parent 'Validate::Tiny';

sub new
{
	my ($class) = @_;

	my $self = $class->SUPER::new;
	$self->{rules} = {
		fields => [qw(a b c d e)],
		checks => [
			[qw(a b c d e)] => $self->is_required(),
			[qw(a b c d e)] => sub {
				# already defined by is_required
				return 'not a string' if ref shift;
			}
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

