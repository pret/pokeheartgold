#!/usr/bin/env bash

# This script was written by PikalaxALT and is licensed under GPL 3.0.
# Modification and redistribution of this script is encouraged.
# For more information, visit https://www.gnu.org/licenses/gpl-3.0.en.html

# Version 0.1: 29 Sep 2021

# Script to merge .nef file with .sbin files into a .elf file
# compatible with objdump, with all the correct virtual addresses.
# Handles autoloads and overlays automatically.

# USAGE:
# ntr_merge_elf.sh STEM

# STEM.nef, STEM.sbin, and STEM_defs.sbin must exist

# getword FILE OFFSET
# Read a 32-bit unsigned integer from FILE starting at OFFSET
getword() {
  od -j "$2" -N 4 -A n -t u "$1" | awk '{$1=$1};1'
}

# assertFile FILE
# If FILE does not exist, panic
assertFile() {
  [[ -f "$1" ]] || { echo $1: no such file or directory; exit 1; }
}

# Prefer devkitARM, since stock ARM binutils choke on metrowerks objects
[[ -n "$DEVKITARM" ]] && export PATH="$DEVKITARM/bin:$PATH"
NM=arm-none-eabi-nm
OBJCOPY=arm-none-eabi-objcopy
STEM="$1"

# MacOS requires GNU mktemp explicitly
if [[ "$OSTYPE" == "darwin"* ]]; then
MKTEMP=gmktemp
else
MKTEMP=mktemp
fi

[[ -z "$STEM" ]] && { echo "usage: $0 [-h] STEM"; exit 1; }
[[ $STEM == "-h" ]] && {
  echo "usage: $0 [-h] STEM"
  echo ""
  echo "STEM      Prefix to the output static sbin (from running"
  echo "          mwldarm in a nitro build). For example, if you"
  echo "          output build/diamond.us/main.sbin, STEM would"
  echo "          be \"build/diamond.us/main\"."
  echo ""
  echo "-h        Print this message and exit"
  exit 0
}

assertFile $STEM.sbin
assertFile $STEM.nef
assertFile ${STEM}_defs.sbin

# Overlays
flags=
while read -r ovy; do
  assertFile $(dirname $STEM)/$ovy
  flags="$flags --update-section ${ovy//.sbin/}=$(dirname $STEM)/$ovy"
done < <(tail -c+16 ${STEM}_defs.sbin | strings)

# Find _start_ModuleParams
static_load=$(getword ${STEM}_defs.sbin 0)
static_size=$(getword ${STEM}_defs.sbin 8)
static_donecb=$(getword ${STEM}_defs.sbin 12)
static_end=$((static_load + static_size))
ptr=$((static_donecb-static_load))
while true; do
  test=$(getword ${STEM}.sbin ${ptr})
  [[ $test == $static_end ]] && { ((ptr-=4)); break; }
  ((ptr+=4))
done

# Get the autoload table and data pointers
autoload_table_start=$(($(getword ${STEM}.sbin ${ptr})-static_load))
autoload_start=$(($(getword ${STEM}.sbin $((ptr+8)))-static_load))

# Truncate the static module and dump
static_size=$autoload_start
static_sbin=$($MKTEMP --suffix=sbin)
dd if=${STEM}.sbin of=$static_sbin bs=1 count=${static_size} 2>/dev/null
flags="$flags --update-section $(basename $STEM)=$static_sbin"
to_clean=$static_sbin

# Dump autoloads
# The output of `NM -n $STEM.nef` is assumed to be sorted in the order in
# which the autoloads were placed in the static .sbin.
# Autoload table is struct { u32 load; u32 size; u32 bsssize; } table[];
while read -r name; do
  aload_text_size=$(getword ${STEM}.sbin $((autoload_table_start+4)))
  aload_sbin=$($MKTEMP --suffix=sbin)
  dd if=${STEM}.sbin of=$aload_sbin bs=1 skip=$autoload_start count=$aload_text_size 2>/dev/null
  ((autoload_start+=aload_text_size))
  ((autoload_table_start+=12))
  flags="$flags --update-section $name=$aload_sbin"
  to_clean="$to_clean $aload_sbin"
done < <($NM -n $STEM.nef | grep -E "SDK_AUTOLOAD_\w+_START" | grep -vE "_(TEXT|BSS|DATA|ARENA|SINIT|ETABLE)_" | cut -d' ' -f3 | cut -d'_' -f3- | sed 's/_START//g')

# Compile the elf
$OBJCOPY $flags $STEM.nef $STEM.elf 2>/dev/null

# Remove temporary files
rm -f $to_clean
