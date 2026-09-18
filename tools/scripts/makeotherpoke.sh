#!/bin/bash

set -euo pipefail

help() {
    echo "Syntax: ./makeotherpoke.sh [OPTIONS]"
    echo "Generates the otherpoke narc with given inputs"
    echo "options:"
    echo " -d | --out-dir                   Output directory"
    echo " -n | --nitrogfx                  Path to nitrogfx"
    echo " -g | --ncgr [file] [index]       Appends a file to process into a ncgr file"
    echo " -l | --nclr [file] [index]       Appends a file to process into a nclr file"
    echo " -e | --narc-exe                  Path to knarc"
}

FILES_NCGR=()
INDEX_NCGR=()
FILES_NCLR=()
INDEX_NCLR=()
OUTDIR="."
NITROGFX=""
NARC_EXE=""

while [[ $# -gt 0 ]] ; do
    case $1 in
        -h|--help)
            help
            exit 0
            ;;
        -d|--out-dir)
            OUTDIR="$2"
            shift
            shift
            ;;
        -n|--nitrogfx)
            NITROGFX="$2"
            shift
            shift
            ;;
        -g|--ncgr)
            FILES_NCGR+=("$2")
            INDEX_NCGR+=("$3")
            shift
            shift
            shift
            ;;
        -l|--nclr)
            FILES_NCLR+=("$2")
            INDEX_NCLR+=("$3")
            shift
            shift
            shift
            ;;
        -e|--narc-exe)
            NARC_EXE="$2"
            shift
            shift
            ;;
    esac
done

mkdir -p "$OUTDIR"

for i in "${!FILES_NCGR[@]}" ; do
    $NITROGFX "${FILES_NCGR[$i]}" $OUTDIR/"${INDEX_NCGR[$i]}".NCGR -scanfronttoback -handleempty
done

for i in "${!FILES_NCLR[@]}" ; do
    $NITROGFX "${FILES_NCLR[$i]}" $OUTDIR/"${INDEX_NCLR[$i]}".NCLR -bitdepth 8 -nopad -comp 10
done

$NARC_EXE --create --file $OUTDIR/../otherpoke.narc --index-namespace $OUTDIR