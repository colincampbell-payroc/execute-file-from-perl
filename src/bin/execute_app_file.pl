#!/usr/bin/perl

use strict;
use warnings;

my $fn = '../data/local_file';
open( my $fh, '>', $fn ) or die "Could not open file '$fn' $!";

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
