#!/bin/bash

set -euo pipefail

help() {
    echo "Syntax: ./json2narc.sh [OPTIONS] FILE..."
    echo "options:"
    echo " -c | --compiler          path to the compiler executable"
    echo " -h | --help              print this message and exit"
    echo " -i | --include           append an indclude directory for the assembler"
    echo " -J | --jsonproc          path to the jsonproc program"
    echo " -T | --template          path to the jsonproc template"
    echo " -O | --o2narc            path to the o2narc program."
    echo " -d | --out-dir           directory for output files"
    echo " -l | --language          language of the intermediate file (default: c)"
    echo " -D | --define            defines to be used by the compiler"
    echo " -N | --narc              outputs the narc directly. For use when everything is contained in a single json file."
    echo " -w | --overwrite-name    name to use for the output files instead of the original name"
    echo " -x | --overwrite-ext     extension to use for the output files instead of .bin"
    echo " -y | --obj-copy          use object copy instead of o2narc"
    echo " -p | --padding           use the specified padding. Default: 0xFF"
    echo " -a | --version-agnostic  removes the final prefix of the output naix file to normalize the hg and ss constants. Needs the shortname as an arg to take out"
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
PADDING="0xFF"
BUILD_NARC=false
OW_NAME=""
OW_NAME_FLAG=false
OW_EXT=""
OW_EXT_FLAG=false
OBJ_COPY="arm-none-eabi-objcopy"
OBJ_COPY_FLAG=false
SED="sed"
VER_AGNO=false
SHORTNAME=""

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
            PADDING="$2"
            shift
            shift
            ;;
        -N|--narc)
            BUILD_NARC=true
            shift
            ;;
        -w|--overwrite-name)
            OW_NAME="$2"
            OW_NAME_FLAG=true
            shift
            shift
            ;;
        -x|--overwrite-ext)
            OW_EXT="$2"
            OW_EXT_FLAG=true
            shift
            shift
            ;;
        -y|--obj-copy)
            OBJ_COPY_FLAG=true
            shift
            ;;
        -a|--version-agnostic)
            VER_AGNO=true
            SHORTNAME="$2"
            shift
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
    json_noext="${json_noext}"
    
    
    # Output files
    if [ "$OW_NAME_FLAG" = true ]; then        
        json_intr="$OUTDIR/$OW_NAME.c"
        if [ "$LANG" = asm ] ; then
            json_intr="$OUTDIR/$OW_NAME.s"
        fi
        json_obj="$OUTDIR/$OW_NAME.o"
        json_bin="$OUTDIR/$OW_NAME.bin"
        if [ "$OW_EXT_FLAG" = true ] ; then
            json_bin="$OUTDIR/$OW_NAME.$OW_EXT"
        fi
        narc="$OUTDIR/$OW_NAME.narc"
        naix="$OUTDIR/$OW_NAME.naix"
    else 
        json_intr="$OUTDIR/$json_noext.c"
        if [ "$LANG" = asm ] ; then
            json_intr="$OUTDIR/$json_noext.s"
        fi
        json_obj="$OUTDIR/$json_noext.o"
        json_bin="$OUTDIR/$json_noext.bin"
        if [ "$OW_EXT_FLAG" = true ] ; then
            json_bin="$OUTDIR/$json_noext.$OW_EXT"
        fi
        narc="$OUTDIR/$json_noext.narc"
        naix="$OUTDIR/$json_noext.naix"
    fi
    # Convert
    $JSONPROC "$json_file" $TEMPLATE "$json_intr"
    $CC "${INCLUDES[@]}" "${DEFINES[@]}" -c "$json_intr" -o "$json_obj" 
    if [ "$OBJ_COPY_FLAG" = true ] ; then
        $OBJ_COPY -O binary "$json_obj" "$json_bin"
    elif [ "$BUILD_NARC" = true ] ; then
        $O2NARC "$json_obj" "$narc" -N -p $PADDING
        if [ "$VER_AGNO" = true ]; then
            agnoname="${naix%_*.naix}.naix"
            $SED -r s/_"$SHORTNAME"//g "$naix" > "$agnoname"
            rm "$naix"
        fi
    else
        $O2NARC "$json_obj" "$json_bin" -f
    fi
    rm "$json_intr" "$json_obj"
done
