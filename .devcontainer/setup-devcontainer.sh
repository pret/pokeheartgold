#!/usr/bin/env bash

set -euo pipefail

GITHUB_WORKSPACE="${GITHUB_WORKSPACE:-"${PWD}"}"
DLDIR=$(mktemp -d)
trap 'rm -rf $DLDIR' EXIT
pushd "$DLDIR"

popd

# Rebuild tools if the arch changed
tools/jsonproc/jsonproc -h &>/dev/null || { make clean-tools && make -j$(nproc) tools; }
