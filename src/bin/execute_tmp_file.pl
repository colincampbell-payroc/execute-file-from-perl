#!/usr/bin/perl

use strict;
use warnings;

use File::Temp qw(tempfile);

my ( $fh, $fn ) = tempfile( UNLINK => 0 );

print $fh <<'EOF';
#!/usr/bin/perl

use strict;
use warnings;

print "Hello from local file\n";
EOF

close($fh);

chmod 0750, $fn;

my $retval = `$fn`;

print "retval: $retval";
