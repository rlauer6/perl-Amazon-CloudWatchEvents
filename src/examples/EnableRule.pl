#!/usr/bin/perl

use strict;
use warnings;

use Amazon::CloudWatchEvents;
use Data::Dumper;

my $cwe = new Amazon::CloudWatchEvents( { debug => 0 } );

eval {
  $cwe->EnableRule('{ "Name": "cwe-test" }', 'application/x-amz-json-1.1');
};

if ( $@ && ref($@) =~/API::Error/ ) {
  print Dumper([ $@->get_response, $@->get_error ])
}
elsif ($@) {
  die $@;
}
