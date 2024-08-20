package stuff::hello;

our sub greet {
    my $name = shift(@_);
    return "Howdy, $name!";
}

1;
