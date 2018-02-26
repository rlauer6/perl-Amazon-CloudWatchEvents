#!/usr/bin/perl

use strict;
use warnings;

use Amazon::CloudWatchEvents;
use Data::Dumper;
use JSON qw/from_json/;

my $rule_name = shift || 'test-event-name';

my $cwe = new Amazon::CloudWatchEvents( { debug => 0 } );

my $output = eval {
  $cwe->DescribeRule({Name => $rule_name});
};


if ( $@ && ref($@) =~/API::Error/ ) {
  print Dumper([ $@->get_response, $@->get_error ])
}
elsif ($@) {
  die $@;
}
else {
  my $rule = from_json($output);
  $rule->{EventPattern} = from_json($rule->{EventPattern});
  print Dumper [ $rule ];
}
