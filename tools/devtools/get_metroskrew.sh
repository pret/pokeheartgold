#!/usr/bin/env bash

# Usage: Run this script from the project root and provide the following environment variables:
#   - SKREW_SYS - controls the distribution downloaded; either `windows`, `linux`, or `wine`
#   - SKREW_VER - the release version of the metroskrew archive to be downloaded
#   - SKREW_DIR - the subproject directory in which metroskrew shall be stored

set -euxo pipefail

case "$SKREW_SYS" in
windows)
    SKREW_EXT=".7z"
    EXTRACTOR="p7zip -d"
    ;;

linux | wine)
    SKREW_EXT=".tar.xz"
    EXTRACTOR="tar xf"
    ;;

*)
    echo "Unrecognized platform $SKREW_SYS"
    exit 1
    ;;
esac

TMP="/tmp"

SKREW="metroskrew"
SKREW_GH="https://github.com/mid-kid/$SKREW"
SKREW_ARC="metroskrew-$SKREW_SYS$SKREW_EXT"
SKREW_URL="$SKREW_GH/releases/download/$SKREW_VER/$SKREW_ARC"
SKREW_TMP="$TMP/$SKREW"

rm -rf "$SKREW_DIR"

# We extract the archive to `/tmp` to ensure that Windows does not muddle with permissions.
pushd "$TMP" >/dev/null
wget --quiet --show-progress -O "$SKREW_ARC" "$SKREW_URL"
$EXTRACTOR "$SKREW_ARC"
popd >/dev/null

mv "$SKREW_TMP" "$SKREW_DIR"
