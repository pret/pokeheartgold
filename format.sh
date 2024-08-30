#!/bin/sh
set -e

find src include -name "*.c" -or -name "*.cpp" -or -name "*.h" -or -name "*.hpp" | xargs clang-format -i --verbose
