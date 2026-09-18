#!/bin/bash

set -euo pipefail

help() {
    echo "Syntax: ./makescript.sh [OPTIONS] FILE..."
    echo "options:"
    echo " -a | --assembler         path to the assembler executable"
    echo " -d | --out-dir           directory for output files"
    echo " -i | --include           append an indclude directory for the assembler"
}

FILES=()
INCLUDES=()
OUTDIR="."
AS="arm-none-eabi-asm"
OBJ_COPY="arm-none-eabi-objcopy"

while [[ $# -gt 0 ]] ; do
    case $1 in
        -h|--help)
            help
            exit 0
            ;;
        -a|--assembler)
            AS="$2"
            shift
            shift
            ;;
        -d|--out-dir)
            OUTDIR="$2"
            shift
            shift
            ;;
        -i|--include)
            INCLUDES+=("-I$2")
            shift
            shift
            ;;
        *)
            FILES+=("$1")
            shift
            ;;
    esac
done

mkdir -p "$OUTDIR"

for file in "${FILES[@]}" ; do
    script_fname=${file##*/}
    script_noext=${script_fname%.*}

    script_bin="$OUTDIR/$script_noext".bin
    script_obj="$OUTDIR/$script_noext".o
    script_dep="$OUTDIR/$script_noext".d
    
    $AS -gccinc -g -proc arm5te -gccdep -MD -DSDK_ASM -DPM_ASM -DSDK_ARM9 -DSDK_CODE_ARM -DSDK_FINALROM -DPM_KEEP_ASSERTS "${INCLUDES[@]}" -o "$script_obj" "$file" -DSDK_ASM -DPM_ASM -DSDK_ARM9 -DSDK_CODE_ARM -DSDK_FINALROM -DPM_KEEP_ASSERTS
    $OBJ_COPY -O binary --file-alignment 4 "$script_obj" "$script_bin"
    rm "$script_obj" "$script_dep"
done