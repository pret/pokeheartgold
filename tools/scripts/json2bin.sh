#!/bin/bash

set -euo pipefail

help() {
    echo "Syntax: ./json2narc.sh [OPTIONS] FILE..."
    echo "options:"
    echo " -c | --compiler      path to the compiler executable"
    echo " -h | --help          print this message and exit"
    echo " -i | --include       append an indclude directory for the assembler"
    echo " -J | --jsonproc      path to the jsonproc program"
    echo " -T | --template      path to the jsonproc template"
    echo " -O | --o2narc        path to the o2narc program"
    echo " -d | --out-dir       directory for output files"
}

JSON_FILES=()
INCLUDES=()
DEFINES=()
JSONPROC=""
TEMPLATE=""
O2NARC=""
CC="arm-none-eabi-gcc"
OUTDIR="."

while [[ $# -gt 0 ]] ; do
    case $1 in
        -h|--help)
            help
            exit 0
            ;;
        -c|--compiler)
            CC="$2"
            shift
            shift
            ;;
        -i|--include)
            INCLUDES+=("-I$2")
            shift
            shift
            ;;
        -J|--jsonproc)
            JSONPROC="$2"
            shift
            shift
            ;;
        -T|--template)
            TEMPLATE="$2"
            shift
            shift
            ;;
        -O|--o2narc)
            O2NARC="$2"
            shift
            shift
            ;;
        -d|--out-dir)
            OUTDIR="$2"
            shift
            shift
            ;;
        *)
            JSON_FILES+=("$1")
            shift
            ;;
    esac
done

for json_file in "${JSON_FILES[@]}" ; do
    json_fname=${json_file##*/}
    json_noext=${json_fname%.*}
    
    # Output files
    json_c="$OUTDIR/$json_noext.c"
    json_obj="$OUTDIR/$json_noext.o"
    json_bin="$OUTDIR/$json_noext.bin"
    
    # Convert
    $JSONPROC "$json_file" $TEMPLATE "$json_c"
    $CC "${INCLUDES[@]}" -c "$json_c" -o "$json_obj" 
    $O2NARC "$json_obj" "$json_bin" -f
    rm "$json_c" "$json_obj"
done
