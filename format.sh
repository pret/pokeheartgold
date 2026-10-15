#!/bin/sh
set -e

find src include lib \( -name "*.c" -or -name "*.cpp" -or -name "*.h" -or -name "*.hpp" \) -exec clang-format -i --verbose {} +
