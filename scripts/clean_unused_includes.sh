#!/usr/bin/env bash

to_remove=()
for fl in asm/include/*.inc; do
    bn=$(basename $fl)
    git grep "\.include \"$bn\"" >/dev/null || to_remove+=($fl)
done
git rm -f "${to_remove[@]}"

