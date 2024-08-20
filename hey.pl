# Add to @INC list
use lib "./stuff";

use hello qw(greet);

# Results in "undefined subroutine &hello::greet"
my $phrase = stuff::hello::greet("Jay");
printf("$phrase\n");
