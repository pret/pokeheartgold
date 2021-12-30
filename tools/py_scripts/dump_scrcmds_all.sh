#!/usr/bin/env bash

MYDIR="$(dirname "$0")"
PROJ_ROOT="$(realpath --relative-to=. "${MYDIR}/../..")"

python "${MYDIR}/dump_map_events.py"
find "${PROJ_ROOT}/files/fielddata/script/scr_seq/" -name "*.bin" -exec python "${MYDIR}/dump_scrcmds.py" {} \;
