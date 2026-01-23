#!/usr/bin/env bash

set -euo pipefail

if [ "$(uname -s)" = Darwin ]; then
    SED=gsed
    REALPATH=grealpath
else
    SED=sed
    REALPATH=realpath
fi

HOME_DIR="$("$REALPATH" -P "$(dirname "${BASH_SOURCE[0]}")")"
REPO_DIR="$(dirname "${HOME_DIR}")"

dir=
usage="usage: $(basename "$0") [opts]

    -d <DIR>      Directory to walk"
while getopts ":hd:" opt; do
    case "$opt" in
        h )
            echo -e "$usage"
            exit 0 ;;
        d )
            dir="$OPTARG" ;;
        : )
            echo -e "ERR: -$OPTARG needs an argument\n$usage" 1>&2
            exit 1 ;;
        \? )
            echo -e "ERR: unrecognized argument\n$usage" 1>&2
            exit 1 ;;
    esac
done

if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo -e "missing required argument: -d <DIR>\n$usage" 1>&2
    exit 1
fi

for fl in "$dir"/*.bin; do
    lz=
    ch1=$(head -c1 "$fl")
    if [ $ch1 = $(echo -ne '\020') ] || [ $ch1 = $(echo -ne '\021') ]; then
        mv "$fl" "$fl.lz"
        "$REPO_DIR/tools/nitrogfx/nitrogfx" "$fl.lz" "$fl"
        lz=.lz
    fi
    ext="$(head -c4 "$fl")"
    if [[ "$ext" =~ ^B[A-Z][A-Z]0$ ]]; then
        ext="NS${ext//0/}"
    elif [[ "$ext" =~ ^R[A-Z][A-Z]N$ ]]; then
        ext="$(echo "$ext" | rev)"
    else
        echo "$fl$lz"
        continue
    fi
    mv "$fl" "${fl%.*}.$ext"
    echo "${fl%.*}.$ext$lz"
done
