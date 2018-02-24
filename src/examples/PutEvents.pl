#!/usr/bin/perl

use strict;
use warnings;

use Amazon::CloudWatchEvents;
use Data::Dumper;

my $cwe = new Amazon::CloudWatchEvents( { debug => 1 } );

eval {
  $cwe->PutEvents( $cwe->event({ detail      => { foo => "bar" },
				 detail_type => "foo",
				 source      => "foo-app",
				 time        => time
			       }
			      )
		 )
};

if ( $@ && ref($@) =~/API::Error/ ) {
  print Dumper([ $@->get_response, $@->get_error ])
}
elsif ($@) {
  die $@;
}
