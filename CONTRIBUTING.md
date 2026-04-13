# Contributing to pret/pokeheartgold

<!--toc:start-->
- [AI Policy](#ai-policy)
- [Code Formatting](#code-formatting)
<!--toc:end-->

This document provides a synopsis and loose guidelines for how to contribute to this project. It is a work in progress. Maintainers should expand this document.

ALL PERSONS OPENING PULL REQUESTS TO THIS REPOSITORY AGREE TO ABIDE BY THE POLICIES OUTLINED IN THIS DOCUMENT.

## AI Policy

We unequivocally prohibit the use of artifical intelligence (AI) large language models (LLMs) to generate contributions to this project, meaningful or otherwise. Any pull request found to have used AI for these tasks will be closed, and the contributor will be banned from interacting with the repository. This is a zero-tolerance policy, and we do not provide any avenue for appeal.

The following use cases are deemed acceptable and stand as exceptions to the above statement, provided that they are disclosed in full. While this document is not legally binding, we do expect you to represent yourself truthfully. Undisclosed use of AI may result in a ban.
- Automating the boring stuff. So long as the task is clearly defined by a human, is boiled down to pure execution with no further creative decision-making, and is sufficiently tedious to perform by hand. you may delegate it to an AI. However, we do strongly encourage you to do as much as you can by hand or write a script to automate the task, rather than invoking an AI to do it for you.
- Asking general knowledge questions about C code, the ARM processor, Pokémon, etc.

## Code Formatting

This repository includes an opinionated `clang-format` specification to ensure that we maintain a common code style. For convenience, a pre-commit hook is also provided in `.githooks` which will run `clang-format` against any staged changes prior to executing a commit.

### Requirements

- `clang-format@18` or newer

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

### Ubuntu (WSL) Installation

On older versions of Ubuntu, clang-format will default to earlier versions.
To install clang-format-18 on Ubuntu (WSL), run the following:
```sh
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 18
sudo apt install clang-format-18
```
And then create a symbolic link:
```sh
ln -s /usr/bin/clang-format-18 /usr/bin/clang-format
```

If you're using the pre-commit hook, you also want to set up a symlink for git:
```sh
git config alias.clang-format clang-format-18
```
