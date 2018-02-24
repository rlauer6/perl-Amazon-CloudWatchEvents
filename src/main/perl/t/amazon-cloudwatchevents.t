# Test Amazon::CloudWatchEvents

use Test::More tests => 2;

use Amazon::CloudWatchEvents;
use Amazon::Credentials;

my $api = eval {
    Amazon::CloudWatchEvents->new( { aws_access_key_id => '<your-access-key>', aws_secret_access_key => '<your-secret-key>' });
};

ok(defined($api), "constructor returned a value") or diag($@);
isa_ok($api, "Amazon::CloudWatchEvents");
