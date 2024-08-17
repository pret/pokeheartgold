#!/bin/sh
set -e

find . -name "*.{c,cpp,h,hpp}" -exec clang-format -i {} +
