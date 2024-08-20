In https://dev.to/taikedz/polydev-a-better-hello-world-for-polyglot-devs-37p2, 
Tai Kedzierski pleaded:

> This is just a sample of the hair-pulling infuriation trying to hunt down how
> to import a damn file from a subfolder. It seems this is forbidden voodoo.
> Perlists, please prove me wrong, I beg of you...

This repo imports his code, gets the import working, and finishes the rest of
his spec by handling command-line arguments. I am a very rusty Perl hacker and
I don't think this is very idiomatic: in particular, Perl *deliberately*
excludes the script's directory from @INC for security reasons, so adding it
back is unlikely to be a good idea. It's Perl, though, so it's not gonna *stop*
you. The main thing Tai was missing was the need to use `Exporter` in the
module file; without that, symbols aren't exported into the importing namespace
when you call `use`.
