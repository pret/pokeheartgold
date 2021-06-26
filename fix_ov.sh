#!/usr/bin/env bash

OV=$1

echo "sed -r -f <(grep -wE \"(thumb|arm)_func_start\" overlays/${OV}/module_${OV}.dump.s | grep -oE \"\w+$\" | xargs | sed -r -e 's/ FUN_/|/g' -e 's/^(MOD'${OV}')_/s\/\(FUN\|\1\)_\(/' -e 's/$/\)\/ov'${OV}'_\\2\/g/') overlays/${OV}/module_${OV}.dump.s > overlays/${OV}/module_${OV}.s"
sed -r -f <(grep -wE "(thumb|arm)_func_start" overlays/${OV}/module_${OV}.dump.s | grep -oE "\w+$" | xargs | sed -r -e 's/ FUN_/|/g' -e 's/^(MOD'${OV}'|FUN)_/s\/\(FUN\|\1\)_\(/' -e 's/$/\)\/ov'${OV}'_\\2\/g/') overlays/${OV}/module_${OV}.dump.s > overlays/${OV}/module_${OV}.s
