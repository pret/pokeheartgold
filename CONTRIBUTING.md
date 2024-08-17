# Contributing to pret/pokeheartgold

<!--toc:start-->
- [Code Formatting](#code-formatting)
<!--toc:end-->

This document provides a synopsis and loose guidelines for how to contribute to this project. It is a work in progress. Maintainers should expand this document.

## Code Formatting

This repository includes an opinionated `clang-format` specification to ensure that we maintain a common code style. For convenience, a pre-commit hook is also provided in `.githooks` which will run `clang-format` against any staged changes prior to executing a commit.

### Requirements

- `clang-format@17` or newer

### Usage

To set up the pre-commit hook:

```sh
git config --local core.hooksPath .githooks/
```

To run the formatter on the full source tree:

```bash
./format.sh
```

### Nonmatching functions

clang-format does not recognize the syntax for inline asm that is required by mwccarm, so it should be disabled for non-matching functions specifically. clang-format accepts directives via comments of the form `// clang-format [on|off]`. Example:

```c
#ifdef NONMATCHING
void func() {
    // ...
}
#else
// clang-format off
asm void func() {
    push {lr}
    // ...
    pop {pc}
}
// clang-format on
#endif // NONMATCHING
```
