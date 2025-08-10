#!/usr/bin/env bash

set -euo pipefail

dir=pokegear

# Assume that anything with the extension .bin is not yet transformed
for fl in "$dir"/*.bin; do
    fl0=$fl
    hdr=$(head -c4 "$fl")
    islz=0  # lz detection
    if [ "${hdr:0:1}" = "$(echo -ne '\020')" ]; then
        islz=1
        mv "$fl" "$fl.lz"
        # Try to unlz, fallback on reverting the prior mv
        tools/nitrogfx/nitrogfx $"fl.lz" "$fl" || mv "$fl.lz" "$fl"
        hdr=$(head -c4 "$fl")
    fi
    case $hdr in
        # NCGR, NCLR, NCER, NSCR, NANR
        R..N ) ext=$(echo "$hdr" | rev);;
        # NSBMD, NSBCA, NSBTA
        *0 ) ext=$(echo "NS$hdr" | head -c5);;
        # undetermined
        * ) ext=bin;;
    esac
    # Only move if found a graphics type
    if [ "$ext" != 'bin' ]; then
        mv "$fl" "${fl%.*}.$ext"
        fl="${fl%.*}.$ext"
    fi
    if [ $islz -eq 1 ]; then
        fl=$fl.lz
    fi
    echo "$fl0 --> $fl"
done
