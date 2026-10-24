#!/usr/bin/env python3

### This tool creates a file which maps overlay section names and source file names to overlay IDs.
### custom GDB build then processes this source map and uses it to identify what overlay a source file belongs to.
### (This makes it a lot easier to identify which overlapping overlay is used for a given input location).
import subprocess
import os
import shutil
import sys

try:
    os.remove("overlay.map")
except:
    pass

source = sys.argv[1]
dest = sys.argv[2]

# TERRIBLE but necessary to allow using the LSF file
def base_path(path):
    splitted = path.split("_")
    maybe_path = ""
    found_dir = ".." # need to escape builddir because this sucks
    while len(splitted) > 1:
        segment = splitted[0]
        splitted = splitted[1:]
        maybe_path += segment
        if os.path.isdir(found_dir + "/" + maybe_path):
            found_dir = found_dir + "/" + maybe_path
            maybe_path = ""
        else:
            maybe_path += "_"
    maybe_path += splitted[0]
    return maybe_path[:-2] # remove '.o'

# VERY inflexible parsing!
overlays = {}
sources = {}
overlay_index = 0
current_overlay = None
in_block = False
with open(source) as f:
    for line in f.readlines():
        if current_overlay == None and not in_block and line.strip().startswith("Overlay"):
            current_overlay = line.strip().replace("Overlay ", "")
            overlays[current_overlay] = overlay_index
            overlay_index += 1
        elif not in_block and line.strip() == "{":
            in_block = True
        elif in_block and line.strip() == "}":
            in_block = False
            current_overlay = None
        elif current_overlay != None and in_block and line.strip().startswith("Object"):
            obj_name = base_path(line.strip().replace("Object ", "").split("/")[-1])
            sources[obj_name] = current_overlay

with open(dest, mode="w") as f:
    for ovly in overlays:
        f.write(f"OVERLAY {ovly}:{overlays[ovly]}\n")
    f.write("\n")
    for s in sources:
        f.write(f"SOURCE {s}:{sources[s]}\n")