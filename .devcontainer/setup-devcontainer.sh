#!/usr/bin/env bash

set -euo pipefail

GITHUB_WORKSPACE="${GITHUB_WORKSPACE:-"${PWD}"}"
DLDIR=$(mktemp -d)
trap 'rm -rf $DLDIR' EXIT
pushd "$DLDIR"

if ! test -d $GITHUB_WORKSPACE/tools/mwccarm; then
    wget https://github.com/pret/pokeheartgold/raw/workflows/assets/mwccarm.zip
    unzip mwccarm.zip
    mv mwccarm $GITHUB_WORKSPACE/tools
fi

if ! test -d $GITHUB_WORKSPACE/tools/bin; then
    wget https://github.com/pret/pokeheartgold/raw/workflows/assets/NitroSDK-3_2-060901.7z
    7z x NitroSDK-3_2-060901.7z
    mv NitroSDK-3_2-060901/tools/bin $GITHUB_WORKSPACE/tools
    mv NitroSDK-3_2-060901/include/nitro/specfiles/ARM7-TS.lcf.template $GITHUB_WORKSPACE/sub/
    mv NitroSDK-3_2-060901/include/nitro/specfiles/ARM9-TS.lcf.template $GITHUB_WORKSPACE/
    mv NitroSDK-3_2-060901/include/nitro/specfiles/mwldarm.response.template $GITHUB_WORKSPACE/
fi

popd

# Rebuild tools if the arch changed
tools/jsonproc/jsonproc -h &>/dev/null || { make clean-tools && make -j$(nproc) tools; }
