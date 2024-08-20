# Add to @INC list
use FindBin qw($RealBin);
use lib "$RealBin/stuff";

use hello qw(greet);

my $phrase = stuff::hello::greet("Jay");
printf("$phrase\n");
