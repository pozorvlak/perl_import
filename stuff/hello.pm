package stuff::hello;
use Exporter 'import';
our @EXPORT_OK = qw(greet); # symbols to export on requiest

our sub greet {
    my $name = shift(@_);
    return "Howdy, $name!";
}

1;
