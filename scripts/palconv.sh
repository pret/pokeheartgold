#!/usr/bin/env bash

# palconv

if [ $# -ne 1 ]; then
    echo -e "usage: $(basename "$0") RGBHEX" 1>&2
    exit 1
fi
if ! [[ $1 =~ ^(0x[0-9a-fA-F]+|[0-9]+)$ ]]; then
    echo -e "error: could not interpret color as base 10 or 16 integer" 1>&2
    exit 1
fi
printf "RGB(%d, %d, %d)\n" $((($1)&31)) $((($1>>5)&31)) $((($1>>10)&31))
