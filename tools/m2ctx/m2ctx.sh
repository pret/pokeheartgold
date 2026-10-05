#!/usr/bin/env bash

OUT_FILE=ctx.c

GCC=gcc
FLAGS="-E -P -dD -undef -nostdinc"
INCLUDES="-Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_C/MSL_ARM/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_C/MSL_Common_Embedded/Math/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_C/MSL_Common/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_C++/MSL_Common/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_Extras/MSL_ARM/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_Extras/MSL_Common/Include -Itools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_Extras/MSL_Common/Include/sys -Ibuild/heartgold.us.nef.p -Ibuild -I. -Iinclude -Iasm/include -Ilib/include -Ibuild/files -Ifiles -Ibuild/src -Isrc -Ibuild/asm -Iasm -Ilib/asm/include -Ilib/NitroDWC/asm/include -Ibuild/subprojects/NitroSDK-4.2.30001/gen -Isubprojects/NitroSDK-4.2.30001/gen -Isubprojects/NitroSDK-4.2.30001/include -Isubprojects/NitroSystem-071126.1/include -Isubprojects/NitroWiFi-2.1.30003/include -Isubprojects/NitroDWC-2.2.30008/include -Isubprojects/NitroDWC-2.2.30008/include/gs -Isubprojects/NitroDWC-2.2.30008/include/base -Isubprojects/libvct-1.3.1/include -Ibuild/files/application -Ibuild/files/application/annon -Ibuild/files/application/choose_starter-Ibuild/files/application/pokegear -Ibuild/files/application/pokegear/configure -Ibuild/files/application/pokegear/map -Ibuild/files/application/pokegear/phone -Ibuild/files/application/pokegear/radio -Ibuild/files/application/record -Ibuild/files/application/zukanlist/zkn_data -Ibuild/files/arc -Ibuild/files/data -Ibuild/files/data/mmodel -Ibuild/files/demo -Ibuild/files/demo/intro -Ibuild/files/demo/opening -Ibuild/files/demo/title -Ibuild/files/graphic -Ibuild/files/graphic/bag -Ibuild/files/itemtool/itemdata -Ibuild/files/poketool/icongra/poke_icon -Ibuild/files/poketool/personal -Ibuild/files/poketool/pokefoot -Ibuild/files/poketool/pokegra -Ibuild/files/poketool/trainer -Ibuild/files/msgdata -Ibuild/files/fielddata/encountdata -Ibuild/files/fielddata/eventdata -Ibuild/files/fielddata/graphic/preview_graphic -Ibuild/files/fielddata/mapmatrix -Ibuild/files/fielddata/script -Ibuild/files/fielddata/tsurepoke -Ibuild/files/battledata/script -Ibuild/subprojects/NitroSDK-4.2.30001/gen/nitro/fx"
DEFINES="-D__arm -D__arm__ -D__has_intrinsic -D_MSL_RESTRICT= -D_NITRO -Dwchar_t=_MSL_WCHAR_T_TYPE -DSDK_CW_FORCE_EXPORT_SUPPORT -DSDK_TS -DSDK_4M -DSDK_ARM9 -DSDK_CW -DSDK_FINALROM -DSDK_CODE_ARM -DNNS_FINALROM -DPM_KEEP_ASSERTS -DHEARTGOLD"
SRCS=()

if [ "$(uname -s)" == "Darwin" ]; then
	SED="$(which gsed)"
else
	SED="$(which sed)"
fi

generate-ctx () {
    # Remove any line containing a predefined macro. If not removed, mwccarm
    # generates compiler warnings.

    grep "^#include " "$1" | $GCC $FLAGS $INCLUDES $DEFINES  -x c - | ${SED} '/__STDC__\|__STDC_VERSION__\|__STDC_VERSION__\|__STDC_HOSTED__\|__arm\|__arm__\|__has_intrinsic/d'
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
