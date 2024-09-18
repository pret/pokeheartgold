#!/usr/bin/env bash

# rename_header.sh
# written by PikalaxALT 16 Jul 2024

set -euo pipefail

if [ "$(uname -s)" = "Darwin" ]; then
    REALPATH=grealpath
    SED=gsed
else
    REALPATH=realpath
    SED=sed
fi

HOME_DIR="$(dirname "$("$REALPATH" -P "$(dirname ${BASH_SOURCE[0]})")")"
cd "${HOME_DIR}"

usage="usage: $(basename $0) [SRC] [DEST]"
if [ "$#" -lt 2 ]; then
    echo -e "error: insufficient arguments\n$usage" 1>&2
    exit 255
fi
SRC="$1"
DEST="$2"
if ! [ -f "$SRC" ]; then
    echo -e "error: $SRC: file not found\n$usage" 1>&2
    exit 255
fi
if [ -f "$DEST" ] || [ -d "$DEST" ]; then
    echo -e "error: $DEST: file or directory exists\n$usage" 1>&2
    exit 255
fi
SRC_REL="$("$REALPATH" -s --relative-to="$HOME_DIR" "$SRC")"
DEST_REL="$("$REALPATH" -s --relative-to="$HOME_DIR" "$DEST")"
if [ "$SRC_REL" = "$DEST_REL" ]; then
    echo -e "error: source and destination files are the same\n$usage" 1>&2
    exit 255
fi

get_header_path () {
    case "$1" in
        include/library/* )
            echo "${1//include\/library\//}" ;;
        include/* )
            echo "${1//include\//}" ;;
        files/* )
            echo "${1//files\//}" ;;
        lib/include/* )
            echo "${1//lib\/include\//}" ;;
        * )
            echo -e "error: $1 has unrecognized path\n$usage" 1>&2
            exit 255 ;
    esac
}

SRC_PAT="$(get_header_path "$SRC_REL" | "$SED" -r 's/\./\\./g')"
DEST_PAT="$(get_header_path "$DEST_REL")"
read -r -a to_modify < <(git grep -lE "#include \"$SRC_PAT\"")
git mv "$SRC_REL" "$DEST_REL"
"$SED" -i -r "s#\"$SRC_PAT\"#\"$DEST_PAT\"#g" "${to_modify[@]}"
find build -name "*.d" -exec "$SED" -i -r "s#\"$SRC_PAT\"#\"$DEST_PAT\"#g" {} +
echo 'done'
