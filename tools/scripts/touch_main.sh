#!/bin/bash

set -euo pipefail

help() {
    echo "Syntax: ./touch_main.sh -o OUTDIR MAIN"
    echo "Hack method since depends doesn't work for main"
    echo "options:"
    echo " -o | --outdir            output directory"
    echo " -h | --help              print this message and exit"
}

OUTDIR=""

while [[ $# -gt 0 ]] ; do
    case $1 in
        -h|--help)
            help
            exit 0
            ;;
        -o|--outdir)
            OUTDIR="$2"
            shift
            shift
            ;;
        *)
            shift
            ;;
    esac
done

mkdir -p "$OUTDIR"

OUTFILE=$OUTDIR/main.touch

"⠀⠀⠀⠀⠀⣠⠢⠔⠒⠒⠒⡒⠢⡤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" > OUTFILE
"⠀⠀⣀⣴⢞⠀⠀⠀⢀⡀⠀⠰⠀⠸⠀⠈⠒⢄⠀⠀⠀⠀⠀⠀⠀⠀" > OUTFILE
"⠀⡋⠀⠌⠁⢀⠀⠀⢷⡸⠂⠀⠀⠀⠀⡠⢄⠀⠱⡀⠀⠀⠀⠀⠀⠀" > OUTFILE
"⢰⢙⠲⠒⠀⢄⠀⠀⠀⡠⠆⡀⠀⠀⠀⠡⡀⠁⠀⠱⡀⠀⠀⠀⠀⠀" > OUTFILE
"⡇⠀⠀⠀⠀⠀⠆⠍⠀⠀⠀⠀⠁⠢⡀⠀⠈⠁⠀⠀⢃⠀⠀⠀⠀⠀" > OUTFILE
"⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢂⠐⠄⢀⡀⢸⠀⠀⠀⠀⠀" > OUTFILE
"⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠠⢈⡘⠂⣄⣀⠀⠀" > OUTFILE
"⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠠⠁⠌⠀⠀⠈⠑" > OUTFILE
"⠀⡼⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠁⠀⠀⠀⠀⣀⠜" > OUTFILE
"⠘⠂⠐⠚⠂⠄⣀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠑⢇⠠⠠⠀⠒⠊⠁⠀" > OUTFILE
"⠀⠀⠀⠀⠀⠀⠀⠈⠉⠐⠒⠒⠂⠉⠒⠤⠄⣀⠬⠂⠀⠀⠀⠀⠀⠀" > OUTFILE
