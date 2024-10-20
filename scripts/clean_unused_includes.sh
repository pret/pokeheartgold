#!/usr/bin/env bash

set -euo pipefail

if [ "$(uname -s)" = "Darwin" ]; then
    if ! type brew &>/dev/null; then
        echo "ERR: running on macOS requires homebrew" 1>&2
        exit 255
    fi
    SED="$(brew --prefix)/bin/gsed"
else
    SED=sed
fi

dry_run=
usage="usage: $(basename $0) [OPTIONS]

options
    -h         Print this message and exit
    -n         Dry run (print what would be deleted)
    -f         Force (actually delete the files)"
while getopts ":hnf" arg; do
    case $arg in
        h )
            echo -e "$usage"
            exit 0 ;;
        n )
            dry_run=yes ;;
        f )
            dry_run=no ;;
        \? )
            echo -e "error! invalid option\n$usage" 1>&2
            exit 255 ;;
    esac
done
shift $((OPTIND-1))
set +u
if [ -n "$1" ]; then
    echo -e "unexpected argument\n$usage" 1>&2
fi
set -u

if ! [ -n "$dry_run" ]; then
    echo -e "must supply -n or -f\n$usage" 1>&2
    exit 255
fi

function get_includes () {
    comm -23 \
        <(cd asm/include; find . -name "*.inc" | $SED -r 's/\.\///' | sort -u) \
        <(git grep -E "\.include \".+\"" | grep -oE "\"\S+\.inc\"" | $SED -r 's/"//g' | sort -u) \
    | $SED -r 's#^#asm/include/#g'
}

to_remove=($(get_includes))

if [ ${#to_remove[@]} -eq 0 ] ; then
    echo -e "nothing to do"
    exit 0
fi

if [ "$dry_run" = "no" ]; then
    git rm -f "${to_remove[@]}"
else
    echo -e "Would remove: ${to_remove[*]}"
fi

