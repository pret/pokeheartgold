#!/usr/bin/env bash

case $OSTYPE in
  darwin*)
    echo "" | gcut -f1 &>/dev/null || { echo "This script requires GNU coreutils, install it via homebrew (brew install coreutils)" >&2; exit 1; }
    CUT=gcut
    ;;
  *)
    CUT=cut
    ;;
esac

MYDIR=$(dirname "$0")

mkdir -p "${MYDIR}"/.bins "${MYDIR}"/.files

DEFAULT_BASEROM=baserom.nds
DEFAULT_ARM9BUILDDIR=build/heartgold.us
DEFAULT_ARM7BUILDDIR=sub/build
DEFAULT_FSDIR=files

# Build C utils on demand
make -C "${MYDIR}" --no-print-directory

# getword FILE OFFSET
getword() {
  od -j "$2" -N 4 -A n -t u "$1" | awk '{$1=$1};1'
}

# dump_autoload SBIN PROC VMA SIZE AUTOLOAD
dump_autoload() {
  outfile="${1}_a${5}"
  # ARM9 has the start module params in the footer
  if [ "$proc" == armv5te ]; then
    _start_ModuleParams=$(($(getword "$1" $(($4-8)))-$3))
  else
    _start_ModuleParams=0
    # Have to be a bit clever for ARM7
    for i in $(seq 0 4 $4); do
      if [ $(getword "$1" $i ) == $(($3 + $4)) ]; then
        _start_ModuleParams=$((i-4))
        break
      fi
    done
  fi
  [[ $_start_ModuleParams == 0 ]] && { echo "Unable to find _start_ModuleParams" >&2; exit 1; }
  aload_list=$(($(getword "$1" $_start_ModuleParams)-$3))
  aload_list_end=$(($(getword "$1" $((_start_ModuleParams+4)))-$3))
  aload_start=$(($(getword "$1" $((_start_ModuleParams+8)))-$3))
  [[ $aload_list == $aload_list_end ]] && { echo "error: autoload index exceeds list size" >&2; exit 1; }
  for i in $(seq 1 "$5"); do
    avma=$(getword "$1" $aload_list)
    asize=$(getword "$1" $((aload_list+4)))
    ((aload_start+=asize))
    ((aload_list+=12))
    [[ $aload_list == $aload_list_end ]] && { echo "error: autoload index exceeds list size" >&2; exit 1; }
  done
  avma=$(getword "$1" $aload_list)
  asize=$(getword "$1" $((aload_list+4)))
  dd if="$1" of="$outfile" bs=1 skip=$aload_start count=$asize 2>/dev/null
  echo $outfile $avma
}

[[ -n "$DEVKITARM" ]] && export PATH=${DEVKITARM}/bin:${PATH}

POSITIONAL=()

usage () {
    echo "Diff segments of a Nintendo DS ROM"
    echo "Usage: $0 [-h] [-7] [-m OVERLAY] [-r BASEROM] [-d BUILDDIR] [START [END]]"
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
    echo "  -f FILE       Dump the indicated file, and use hexdump instead"
    echo "  -F FSDIR      Filesystem path on the home system"
    echo "  -t            Force THUMB instructions (default: ARM)"
    echo "  -h            Show this message and exit"
}

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  -h)
    usage
    exit 0
    ;;
  -7)
    proc=armv4t
    builddir=${builddir:-$DEFAULT_ARM7BUILDDIR}
    shift
    ;;
  -a)
    [[ -n $autoload ]] && { echo "can only do one autoload at a time" >&2; exit 1; }
    mode=autoload
    autoload="$2"
    shift 2
    ;;
  -m)
    [[ -n $overlay ]] && { echo "can only do one overlay at a time" >&2; exit 1; }
    mode=overlay
    overlay="$2"
    shift 2
    ;;
  -r)
    baserom="$2"
    shift 2
    ;;
  -t)
    thumb=-Mforce-thumb
    shift
    ;;
  -f)
    mode="file"
    filepath="$2"
    shift 2
    ;;
  -F)
    fsdir="$2"
    shift 2
    ;;
  -d)
    builddir="$2"
    shift 2
    ;;
  -*)
    usage
    echo unrecognized option flag: "$1"
    exit 1
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
fsdir=${fsdir:-$DEFAULT_FSDIR}

[[ -f "$baserom" ]] || { echo $0: $baserom: no such file or directory >&2; exit 1; }

basestem=
[[ $proc == armv4t ]] && basestem=${basestem}.sub
[[ $mode == overlay ]] && basestem=${basestem}.o${overlay}

basefile=${MYDIR}/.bins/${baserom}${basestem}.sbin

case "$mode" in
  overlay)
    case $proc in
    armv4t)
      ovt=88
      ;;
    armv5te)
      ovt=80
      ;;
    esac
    if [ -f "${builddir}/component.files" ]; then
      defsfile=$(${CUT} -d '' -f2 "${builddir}/component.files")
    else
      defsfile=$( cd "${builddir}"; ls *.lcf | sed 's/.lcf/_defs.sbin/' )
    fi
    if [ -n "${overlay##*[!0-9]*}" 2>/dev/null ] ; then
      ovyfile=$(tail -c+16 "${builddir}/${defsfile}" | ${CUT} -d '' -f$((overlay+1)) )
      [[ -n $ovyfile ]] || { echo "Overlay num out of range" >&2; exit 1; }
    else
      ovyfile=${overlay%.*}.sbin
      overlay=$(($(tail -c+16 "${builddir}/${defsfile}" | tr '\0' '\n' | grep -n $ovyfile | ${CUT} -d: -f1)-1))
      [[ $overlay -eq -1 ]] && { echo "Invalid overlay name" >&2; exit 1; }
    fi
    ovtoff=$(getword "$baserom" "$ovt")
    vma=$(getword "$baserom" "$((ovtoff+32*overlay+4))")
    size=$(getword "$baserom" "$((ovtoff+32*overlay+8))")
    [[ $basefile -nt $baserom ]] || {
      fileid=$(getword "$baserom" "$((ovtoff+32*overlay+24))")
      param=$(getword "$baserom" "$((ovtoff+32*overlay+28))")
      fatoff=$(getword "$baserom" 72)
      fileoff=$(getword "$baserom" "$((fatoff+8*fileid))")
      filesize=$(($(getword "$baserom" "$((fatoff+8*fileid+4))")-fileoff))
      dd if="$baserom" of="$basefile" bs=1 skip="$fileoff" count="$filesize" 2>/dev/null
      (( param & 16777216 )) && {
        compsize=$((param & 16777215))
        "$MYDIR"/ntruncompbw "$basefile" "$vma" $((vma+compsize)) || { rm -f "$basefile"; exit 1; }
      }
    }
    buildfile=$builddir/$ovyfile
    ;;
  static|autoload)
    case $proc in
    armv4t)
      romtab=48
      ;;
    armv5te)
      romtab=32
      ;;
    esac

    fileoff=$(getword "$baserom" "$romtab")
    vma=$(getword "$baserom" "$((romtab+8))")
    size=$(getword "$baserom" "$((romtab+12))")

    [[ $basefile -nt "$baserom" ]] || {
      dd if="$baserom" of="$basefile" bs=1 skip="$fileoff" count="$size" 2>/dev/null
      [[ $proc == armv5te ]] && {
        _start_ModuleParams=$(getword "$baserom" $((fileoff+size+4)))
        compstatend=$(getword "$basefile" $((_start_ModuleParams+20)))
        [[ $compstatend != "0" ]] && {
          "$MYDIR"/ntruncompbw "$basefile" "$vma" "$compstatend" || { rm -f "$basefile"; exit 1; }
          dd if=/dev/zero of="$basefile" bs=1 seek="$((_start_ModuleParams+20))" count=4 conv=notrunc 2>/dev/null
        }
      }
    }
    if [ -f "${builddir}/component.files" ]; then
      compname=$(${CUT} -d '' -f1 "${builddir}/component.files")
      defsfile=$(${CUT} -d '' -f2 "${builddir}/component.files")
    else
      compname=$( cd "${builddir}"; ls *.lcf | sed 's/lcf/sbin/' )
      defsfile=$( cd "${builddir}"; ls *.lcf | sed 's/.lcf/_defs.sbin/' )
    fi
    buildfile=${builddir}/${compname}
    if [ "$mode" == "autoload" ]; then
      resp=$( dump_autoload "$basefile" "$proc" "$vma" "$size" "$autoload" )
      basefile=$(echo $resp | cut -d' ' -f1)
      size=$( wc -c <${buildfile} )
      resp=$( dump_autoload "$buildfile" "$proc" "$vma" "$size" "$autoload" )
      buildfile=$(echo $resp | cut -d' ' -f1)
      vma=$(echo $resp | cut -d' ' -f2)
    fi
    ;;
  file)
    buildfile=${fsdir}/${filepath}
    [[ -f "${buildfile}" ]] || { echo file not found: "${buildfile}" >&2; exit 1; }
    basefile=${MYDIR}/.files/${filepath}
    [[ "${basefile}" -nt "$baserom" ]] || {
      mkdir -p $(dirname $basefile)
      "${MYDIR}"/ntrextractfile "${baserom}" "${filepath}" >"${basefile}"
    }
    cmp -s "$basefile" "$buildfile" || diff -u <(hexdump -Cv "$basefile") <(hexdump -Cv "$buildfile")
    exit 0
    ;;
esac
[[ -n "$1" ]] && start=$(($1)) || start=$vma
[[ -n "$2" ]] && size=$(($2)) || size=$(wc -c <"$basefile")
do-objdump () {
  arm-none-eabi-objdump -Drz -bbinary -m$proc $thumb --adjust-vma="$vma" --start-address="$start" --stop-address=$((start+size)) "$1"
}
cmp -s "$basefile" "$buildfile" || diff -u <(do-objdump "$basefile") <(do-objdump "$buildfile")
