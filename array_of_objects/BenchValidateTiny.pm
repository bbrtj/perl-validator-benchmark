package BenchValidateTiny;

use parent 'Validate::Tiny';

sub new
{
	my ($class) = @_;

	my $self = $class->SUPER::new;

	my $rules_nested = {
		fields => [qw(b c)],
		checks => [
			[qw(b c)] => $self->is_required(),

			b => Validate::Tiny::is_like(qr{^-?\d+$}, 'not an int'),
			c => sub {
				return 'not a string' if ref shift;
			},
		],
	};

	$self->{nested_rules} = BenchValidateTinyNested->new;
	$self->{rules} = {
		fields => [qw(a)],
		checks => [
			[qw(a)] => $self->is_required(),

			a => sub {
				my $value = shift;

				return 'not an array'
					unless ref $value eq 'ARRAY';

				for my $el ($value->@*) {
					return 'bad nested object'
						unless $self->{nested_rules}->valid($el);
				}

				return;
			},
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

package BenchValidateTinyNested;

use parent 'Validate::Tiny';

sub new
{
	my ($class) = @_;

	my $self = $class->SUPER::new;

	$self->{rules} = {
		fields => [qw(b c)],
		checks => [
			[qw(b c)] => $self->is_required(),

			b => Validate::Tiny::is_like(qr{^-?\d+$}, 'not an int'),
			c => sub {
				return 'not a string' if ref shift;
			},
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

