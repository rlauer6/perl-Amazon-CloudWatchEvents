package Amazon::CloudWatchEvents::Events;

use strict;
use warnings;

use parent qw/Class::Accessor/;

__PACKAGE__->follow_best_practice;
__PACKAGE__->mk_accessors(qw/detail detail_type resources source time/);

use Data::Dumper;
use Date::Format;
use JSON;
use Scalar::Util qw/reftype/;

sub encode {
  my $self = shift;

  my $args_out = {
		  Entries => [
			      {
			       $self->get_detail()    ? (Detail     => to_json($self->get_detail())) : (),
			       $self->get_detail_type ? (DetailType => $self->get_detail_type()) : (),
			       $self->get_resources() ? (Resources  => $self->get_resources()) : (),
			       $self->get_source()    ? (Source     => $self->get_source()) : (),
			       Time  => time
			       #$self->get_time() || $self->current_time_rfc3339()
			      }
			     ]
		  };
  
  return $args_out
}

sub current_time_rfc3339 {
  return time2str("%Y-%m-%dT%H:%M:%s%Z", time, 'Z');
}

1;
