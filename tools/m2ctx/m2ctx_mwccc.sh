#!/usr/bin/env bash

OUT_FILE=ctx.c

GCC=tools/metroskrew/bin/mwccarm
FLAGS="-wrap:sdk 2.0/sp2p2 -EP -nosyspath"
INCLUDES="-Iinclude -Ifiles -Isubprojects/NitroSDK-4.2.30001/include -Isubprojects/NitroSDK-4.2.30001/include/nitro/ctrdg/ARM9 -Ibuild/subprojects/NitroSDK-4.2.30001/gen -Ilib/include -Isubprojects/NitroSystem-071126.1/include"
DEFINES="-DHEARTGOLD -DGAME_REMASTER=0 -DENGLISH -DPM_KEEP_ASSERTS -DSDK_ARM9 -DSDK_CODE_ARM -DSDK_FINALROM -DNO_PRINTF"
SRCS=()

if [ "$(uname -s)" == "Darwin" ]; then
	SED="$(which gsed)"
else
	SED="$(which sed)"
fi

generate-ctx () {
    # Remove any line containing a predefined macro. If not removed, mwccarm
    # generates compiler warnings.

    grep "^#include " "$1" > ctx.c
    $GCC $FLAGS $INCLUDES $DEFINES ctx.c | ${SED} '/__STDC__\|__STDC_VERSION__\|__STDC_VERSION__\|__STDC_HOSTED__/d' | ${SED} '/^#pragma*\|^#line*/d'
}

usage () {
    echo "Generate a context file for decomp.me."
    echo "Usage: $0 [-h] [FILEPATH]"
    echo ""
    echo "Arguments:"
    echo "  FILEPATH      Source file used to generate ctx.c"
    echo ""
    echo "Options:"
    echo "  -h            Show this message and exit"
}

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  -h)
    usage
    exit 0
    ;;
  -o)
    OUT_FILE="$2"
    shift 2 ;;
  *)
    SRCS+=("$1")
    shift ;;
  esac
done

if [ "${#SRCS[@]}" -ne 1 ]; then
  echo "error: specify exactly one source file"
  exit 255
else
  src="${SRCS[0]}"
fi

if [ "$OUT_FILE" != "-" ]; then
  exec 1>$OUT_FILE
fi

generate-ctx "$src"
