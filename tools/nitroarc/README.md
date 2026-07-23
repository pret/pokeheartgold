`nitroarc`
==========

An implementation of the Nitro Archive file format used by the Nintendo DS.

This tooling is split into two core components: a C library implementing the
archive format specification and a command-line program for inspecting and
manipulating archives.

Usage
-----

The library header aims to be well-documented and cover most of the use-cases
associated with manipulating archive files. Example code for the basics is
available in [the library documentation](./doc/nitroarc.3.adoc).

The command-line tool provides help-text (`nitroarc --help`) containing a list
of available options, a summary of each option's functionality, and examples
illustrating rudimentary invocation. [A program manual](./doc/nitroarc.1.adoc)
provides detailed information on the various execution modes.

Contributing
------------

Please report bugs and submit patches to [the upstream repository](https://codeberg.org/lhearachel/nitroarc).
