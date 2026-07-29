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
    echo " -l | --language      language of the intermediate file (default: c)"
    echo " -p | --post-script   postscript to append to the output file names"
    echo " -D | --define        defines to be used by the compiler"
    echo " -N | --narc         outputs the narc directly. For use when everything is contained in a single json file."
}

JSON_FILES=()
INCLUDES=()
DEFINES=()
JSONPROC=""
TEMPLATE=""
O2NARC=""
CC="arm-none-eabi-gcc"
OUTDIR="."
LANG="c"
POSTSCRIPT=""
BUILD_NARC=false

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
        -D|--define)
            DEFINES+=("-D$2")
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
        -l|--language)
            LANG="$2"
            shift
            shift
            ;;
        -p|--post-script)
            POSTSCRIPT="_$2"
            shift
            shift
            ;;
        -N|--narc)
            BUILD_NARC=true
            shift
            ;;
        *)
            JSON_FILES+=("$1")
            shift
            ;;
    esac
done

mkdir -p "$OUTDIR"

for json_file in "${JSON_FILES[@]}" ; do
    json_fname=${json_file##*/}
    json_noext=${json_fname%.*}
    json_noext="${json_noext}${POSTSCRIPT}"
    
    
    # Output files
    json_intr="$OUTDIR/$json_noext.c"
    if [ "$LANG" = asm ] ; then
        json_intr="$OUTDIR/$json_noext.s"
    fi
    json_obj="$OUTDIR/$json_noext.o"
    json_bin="$OUTDIR/$json_noext.bin"
    
    # Convert
    $JSONPROC "$json_file" $TEMPLATE "$json_intr"
    $CC "${INCLUDES[@]}" "${DEFINES[@]}" -c "$json_intr" -o "$json_obj" 
    if [ "$BUILD_NARC" = true ] ; then
        $O2NARC "$json_obj" "$OUTDIR/$json_noext.narc" -N -p 0xFF
    else
        $O2NARC "$json_obj" "$json_bin" -f
    fi
    rm "$json_intr" "$json_obj"
done
