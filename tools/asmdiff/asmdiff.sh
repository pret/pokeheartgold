#!/usr/bin/env bash

MYDIR=$(dirname $0)

DEFAULT_BASEROM=baserom.nds
DEFAULT_ARM9BUILDDIR=build/heartgold.us
DEFAULT_ARM7BUILDDIR=sub/build

# Build ntruncompbw on demand
[[ $MYDIR/ntruncompbw -nt $MYDIR/ntruncompbw.c ]] || gcc -O3 -g -o $MYDIR/ntruncompbw $MYDIR/ntruncompbw.c

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
    echo "Usage: $0 [-h] [-7] [-m OVERLAY] [-r BASEROM] [-d BUILDDIR] [START [END]]"
    echo ""
    echo "Arguments:"
    echo "  START, END    Start and end virtual addresses to diff"
    echo ""
    echo "Options:"
    echo "  -7            Diff the ARM7 module (default: ARM9)"
    echo "  -m OVERLAY    Diff the indicated overlay module (default: static module)"
    echo "  -r BASEROM    Use the indicated baserom (default: baserom.nds)"
    echo "  -d BUILDDIR   Look for compiled binaries in this directory (default: build/heartgold.us)"
    echo "  -t            Force THUMB instructions (default: ARM)"
    echo "  -h            Show this message and exit"
    exit 0
    ;;
  -7)
    proc=armv4t
    builddir=${builddir:-$DEFAULT_ARM7BUILDDIR}
    basestem=${basestem}.sub
    shift
    ;;
  -m)
    [[ -n $overlay ]] && { echo can only do one overlay at a time; exit 1; }
    mode=overlay
    overlay="$2"
    basestem=${basestem}.o${overlay}
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
builddir=${builddir:-$DEFAULT_ARM9BUILDDIR}
baserom=${baserom:-$DEFAULT_BASEROM}

basefile=${baserom}${basestem}.sbin

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
  vma=$(getword "$baserom" "$((ovtoff+32*overlay+4))")
  size=$(getword "$baserom" "$((ovtoff+32*overlay+8))")
  [[ -f $basefile ]] || {
    fileid=$(getword "$baserom" "$((ovtoff+32*overlay+24))")
    param=$(getword "$baserom" "$((ovtoff+32*overlay+28))")
    fatoff=$(getword "$baserom" 72)
    fileoff=$(getword "$baserom" "$((fatoff+8*fileid))")
    filesize=$(($(getword "$baserom" "$((fatoff+8*fileid+4))")-fileoff))
    dd if="$baserom" of="$basefile" bs=1 skip="$fileoff" count="$filesize" 2>/dev/null
    (( param & 16777216 )) && {
      compsize=$((param & 16777215))
      $MYDIR/ntruncompbw $basefile $vma $((vma+compsize)) || { rm -f $basefile; exit 1; }
    }
  }
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

  [[ -f $basefile ]] || {
    dd if="$baserom" of="$basefile" bs=1 skip="$fileoff" count="$size" 2>/dev/null
    [[ $proc == armv5te ]] && {
      _start_ModuleParams=$(python $MYDIR/find_module_params.py ${basefile})
      compstatend=$(getword "$basefile" $((_start_ModuleParams+20)))
      [[ $compstatend != "0" ]] && {
        $MYDIR/ntruncompbw $basefile $vma $compstatend || { rm -f $basefile; exit 1; }
        dd if=/dev/zero of="$basefile" bs=1 seek="$((_start_ModuleParams+20))" count=4 conv=notrunc 2>/dev/null
      }
    }
  }
  buildfile=${builddir}/${compname}.sbin
}

[[ -n "$1" ]] && start=$(($1)) || start=$vma
[[ -n "$2" ]] && size=$(($2)) || size=$(wc -c <$basefile)
do-objdump () {
  arm-none-eabi-objdump -Drz -bbinary -m$proc $thumb --adjust-vma=$vma --start-address=$start --stop-address=$((start+size)) $1
}
diff -u <(do-objdump $basefile) <(do-objdump $buildfile)
