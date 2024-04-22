#!/usr/bin/env bash

usage="usage: $0 IN OUT"
if [ $# -ne 2 ]; then
    echo -e "incorrect number of args\n$usage"
    exit -1
fi

IN="$1"
OUT="$2"
if ! [ -s "$IN" ]; then
    echo -e "file $IN missing or has no data\n$usage"
    exit -1
fi

make -q -C tools/knarc &
make -q -C tools/nitrogfx &
wait

mkdir -p "$(dirname "$OUT")"
tools/knarc/knarc -d "$OUT" -u "$IN"
for fl in "$OUT"/*.bin; do
    filehead="$(head -c4 "$fl")"
    if [[ "$(echo "$filehead" | head -c1)" == "\020" ]]; then
        mv "$fl" "$fl.lz"
        tools/nitrogfx/nitrogfx "$fl.lz" "$fl"
        filehead="$(head -c4 "$fl")"
    fi
    if [[ "$filehead" =~ 0$ ]]; then
        ext="NS$(echo "$filehead" | head -c3)"
    else
        ext="$(echo -n "$filehead" | rev)"
    fi
    mv -v "$fl" "${fl%.*}.$ext"
done
