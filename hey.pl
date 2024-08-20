# Add to @INC list
use FindBin qw($RealBin);
use lib $RealBin;

use stuff::hello qw(greet);

if ($#ARGV < 1) {
    die "No argument set"
}
for my $name (@ARGV) {
    my $phrase = stuff::hello::greet($name);
    print("$phrase\n");
}
