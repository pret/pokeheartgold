#!/usr/bin/env bash

gcc -O3 -g -o ntruncompbw ntruncompbw.c

getword() {
  od -j "$2" -N 4 -A n -t u "$1" | awk '{$1=$1};1'
}

[[ -n "$DEVKITARM" ]] && export PATH=${DEVKITARM}/bin:${PATH}

POSITIONAL=()

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  -h)
    echo "Diff segments of a Nintendo DS ROM"
    echo "Usage: $0 [-h] [-7] [-a AUTOLOAD] [-m OVERLAY] [-r BASEROM] [-d BUILDDIR] START END"
    echo ""
    echo "Arguments:"
    echo "  START, END    Start and end virtual addresses to diff"
    echo ""
    echo "Options:"
    echo "  -7            Diff the ARM7 module (default: ARM9)"
    echo "  -a AUTOLOAD   Diff the indicated autoload module (default: static module)"
    echo "  -m OVERLAY    Diff the indicated overlay module (default: static module)"
    echo "  -r BASEROM    Use the indicated baserom (default: baserom.nds)"
    echo "  -d BUILDDIR   Look for compiled binaries in this directory (default: build/heartgold.us)"
    echo "  -t            Force THUMB instructions (default: ARM)"
    echo "  -h            Show this message and exit"
    exit 0
    ;;
  -7)
    proc=armv4t
    builddir=sub/build
    shift
    ;;
  -a)
    mode=autoload
    autoload="$2"
    shift
    shift
    ;;
  -m)
    mode=overlay
    overlay="$2"
    shift
    shift
    ;;
  -r)
    baserom="$2"
    shift
    shift
    ;;
  -t)
    thumb=-Mforce-thumb
    shift
    ;;
  -d)
    builddir="$2"
    shift
    shift
    ;;
  *)
    POSITIONAL+=("$1")
    shift
    ;;
  esac
done

set -- "${POSITIONAL[@]}"

mode=${mode:-static}
proc=${proc:-armv5te}
builddir=${builddir:-build/heartgold.us}
baserom=${baserom:-baserom.nds}

[[ -n "${autoload}" && -n "${overlay}" ]] && echo warning: -m and -a conflict. will run in $mode mode

tmpfile=$(mktemp)
[[ "$mode" == overlay ]] && {
  case $proc in
  armv4t)
    ovt=88
    ;;
  armv5te)
    ovt=80
    ;;
  esac
  ovtoff=$(getword "$baserom" "$ovt")
  fatoff=$((getword "$baserom" 72))
  vma=$(getword "$baserom" "$((ovtoff+32*overlay+4))")
  size=$(getword "$baserom" "$((ovtoff+32*overlay+8))")
  fileid=$(getword "$baserom" "$((ovtoff+32*overlay+24))")
  param=$(getword "$baserom" "$((ovtoff+32*overlay+28))")
  fileoff=$(getword "$baserom" "$((fatoff+8*fileid))")
  dd if="$baserom" of="$tmpfile" bs=1 skip="$fileoff" count="$size" 2>/dev/null
  buildfile=$builddir/OVY_${overlay}.sbin
} || {
  case $proc in
  armv4t)
    romtab=48
    compname=sub
    ;;
  armv5te)
    romtab=32
    compname=main
    ;;
  esac

  fileoff=$(getword "$baserom" "$romtab")
  vma=$(getword "$baserom" "$((romtab+8))")
  size=$(getword "$baserom" "$((romtab+12))")

  dd if="$baserom" of="$tmpfile" bs=1 skip="$fileoff" count="$size" 2>/dev/null
  ntrcodebe=$(grep -bao "$(printf "\x21\x06\xc0\xde")" ${tmpfile} | head -n1 | cut -d: -f1)
  compstatend=$(getword "$tmpfile" $((ntrcodebe-8)))
  [[ $compstatend != "0" ]] && { ./ntruncompbw $tmpfile $vma $compstatend || exit 1; }
  buildfile=${builddir}/${compname}.sbin
}

[[ -n "$1" ]] && start=$(($1)) || start=$vma
[[ -n "$2" ]] && size=$(($2))
do-objdump () {
  arm-none-eabi-objdump -Drz -bbinary -m$proc $thumb --adjust-vma=$vma --start-address=$start --stop-address=$((start+size)) $1
}
diff -u <(do-objdump $tmpfile) <(do-objdump $buildfile)
rm -f $tmpfile
