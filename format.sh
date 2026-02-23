#!/bin/sh
set -e

if [ $(which clang-format-18) ]; then
# WSL and old Ubuntu versions have clang-format frozen on version 10. We need at
# least version 18, which uses a separate package and a separate binary name.
# TODO: Also look for newer versions of clang-format?
CLANG_FORMAT="clang-format-18"
else
if [ $(which clang-format) ]; then
# This name should work on any other linux distro
CLANG_FORMAT="clang-format"
else
# If nothing's installed, WSL users would see that clang-format was missing and
# install the wrong thing. So print out an error message that explains the situation.
echo clang-format or clang-format-18 \(for WSL Ubuntu\) not found.
exit 1
fi
fi

find src include \( -name "*.c" -or -name "*.cpp" -or -name "*.h" -or -name "*.hpp" \) -exec $CLANG_FORMAT -i --verbose {} +
