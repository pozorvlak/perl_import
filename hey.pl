# Add to @INC list
use lib './stuff';

# Import from anywhere in the @INC list
use hello;

# Results in "undefined subroutine &hello::greet"
my $phrase = hello::greet("Jay");
printf("$phrase\n");
