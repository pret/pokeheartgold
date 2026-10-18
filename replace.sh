#!/bin/bash
# $1: phrase to find
# $2: phrase to replace $1

set -euo pipefail

force=
dryrun=no
quiet=no
usage="Usage: $0 [-y|--force] [-n|--dry-run] [-q|--quiet] [-h|--help] [--] <PATTERN> <REPLACEMENT>"
help="$usage

Performs a search-and-replace for whole-word matches of PATTERN in the
repository. PATTERN may be a POSIX regular expression.

  Options:
    -y, --force
        Skip the confirmation prompt

    -n, --dry-run
        Perform all the usual checks, but don't actually execute the rename

    -q, --quiet
        By default, this script will print out the replacement

    -h, --help
        Show this message and exit"
args=()
for arg; do
    shift
    case $arg in
        -y|--force )
            force=1 ;;
        -n|--dry-run )
            dryrun=yes ;;
        -q|--quiet )
            quiet=yes ;;
        -h|--help )
            echo -e "$help"
            exit 0 ;;
        -- )
            args=("$@")
            break ;;
        -* )
            echo -e "Unrecognized option: $arg

Hint: If your pattern starts with a literal hyphen, insert a '--' between
the last flag and the pattern, example:

    $0 -q -- PATTERN REPLACEMENT
"
            exit 1 ;;
        * )
            args+=("$arg") ;;
    esac
done

if [ "${#args[@]}" -ne 2 ]; then
    echo -e "$usage"
    exit 1
fi

if [ "$(uname -s)" == "Darwin" ]; then
    SED="$(which gsed)"
else
    SED="$(which sed)"
fi

tmp_in=$(mktemp)
trap 'rm -f $tmp_in' EXIT
if ! git grep -owP "${args[0]}" | cut -d: -f2- | sort -u >"$tmp_in"; then
    echo "nothing to do"
    exit 0
fi

sed_cmd="s/\<${args[0]}\>/${args[1]}/g"
if [ $quiet != yes ]; then
    echo -e "Would replace the following:"
    paste "$tmp_in" <("$SED" -r "$sed_cmd" "$tmp_in")
fi
if git grep -wf <("$SED" -r "$sed_cmd" "$tmp_in") >/dev/null; then
    echo -e "WARNING: Replacement symbol(s) already exist." >&2
fi
if [ -z "$force" ] && [ $dryrun != yes ]; then
    read -r -p "Okay to proceed? [y/N] " yn
    case $yn in
        [yY] )
            ;;
        * )
            echo Aborting.
            exit 0 ;;
    esac
fi

if [ $dryrun = yes ]; then
    echo "Dry run, exiting"
    exit 0
fi
# shellcheck disable=SC2046
$dryrun "${SED}" -i -r "$sed_cmd" $(git grep -IlwrP "${args[0]}")
