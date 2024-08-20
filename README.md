In [Beyond "Hello World" - comparing starter code in C, Rust, Python, TypeScript and more](https://dev.to/taikedz/polydev-a-better-hello-world-for-polyglot-devs-37p2),
Tai Kedzierski proposed the "Hello Y'All" program as a beefed-up version of the classic "Hello World":

> - The example takes at least one command line argument, and handles the event of no-arguments
> - The example requires a function to be placed in a second file in a subfolder
> - The function returns a value
> - The example loops over CLI arguments, calling one at a time to the function, and each time prints the returned value, concatenated to other text
> - Include the overall bare-minimum instructions include how to build the program (if necessary) and run it

Unfortunately, some languages make splitting code into several files annoyingly difficult (this is the point of including that in the spec!). When he got to Perl he gave up and pleaded:

> This is just a sample of the hair-pulling infuriation trying to hunt down how
> to import a damn file from a subfolder. It seems this is forbidden voodoo.
> Perlists, please prove me wrong, I beg of you...

This repo copies his Perl code, gets the import working, and finishes the rest
of his spec by handling command-line arguments. I am a very rusty Perl hacker
and I don't think this is very idiomatic: in particular, Perl *deliberately*
excludes the script's directory from `@INC` for security reasons, so adding it
back is unlikely to be a good idea. It's Perl, though, so it's not gonna *stop*
you. The main thing Tai was missing was the need to use `Exporter` in the
module file; without that, symbols aren't exported into the importing namespace
when you call `use`.

Why do things like that? Well, Perl's `use` function `require`s a module
(loading it in from the filesystem) and then calls its `import` method, which
is just an ordinary static method call. That means you can do *anything* in
that method, and have it happen at compile time. See
[SVG::GD](https://metacpan.org/pod/SVG::GD) or
[Lingua::Romana::Perligata](https://metacpan.org/pod/Lingua::Romana::Perligata)
for the kind of thing this makes possible. The standard `Exporter` module
provides (in ordinary Perl code) an `import` method that implements the usual
export semantics; people have written several alternative exporters and put
them on CPAN.
