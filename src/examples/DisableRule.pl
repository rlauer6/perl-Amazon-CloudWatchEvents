#!/usr/bin/perl

use strict;
use warnings;

use Amazon::CloudWatchEvents;
use Data::Dumper;

my $cwe = new Amazon::CloudWatchEvents( { debug => 0 } );

eval {
  $cwe->DisableRule({ "Name" => "cwe-test" });
};

if ( $@ && ref($@) =~/API::Error/ ) {
  print Dumper([ $@->get_response, $@->get_error ])
}
elsif ($@) {
  die $@;
}

