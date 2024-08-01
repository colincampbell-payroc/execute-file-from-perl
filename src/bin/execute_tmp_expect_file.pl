#!/usr/bin/perl

use strict;
use warnings;

use File::Temp qw(tempfile);

my ( $fh, $fn ) = tempfile( UNLINK => 0 );

print $fh <<'EOF';
#!/usr/bin/expect -f
set timeout 300
spawn /usr/bin/sftp -oConnectTimeout=300 -F/home/report/.ssh/ssh_config user\@remote
expect "sftp>";
send "cd outbox/prod\\n";
expect "sftp>";
send "put data\\n";
expect "sftp>";
send "quit\\n";
EOF

close($fh);

chmod 0750, $fn;

my $retval = `$fn`;

print "retval: $retval";
