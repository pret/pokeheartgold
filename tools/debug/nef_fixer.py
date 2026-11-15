#!/usr/bin/env python3

### This tool is responsible for using `debugedit` to fix Wine paths in the debuginfo file to real filesystem paths.
### VSC requires the debuginfo paths to map to real filesystem paths in order for VSC to correctly open sources during a debugging session.
### (This works fine on my Linux system, but may or may not work on WSL, and will certainly not work on other systems)
import subprocess
import os
import shutil
import sys

try:
    os.remove("sources.txt")
except:
    pass

source = sys.argv[1]
dest = sys.argv[2]

print(f"Copying {source} to {dest}")
shutil.copyfile(source, dest)

print("Retrieving source file list via debugedit")
subprocess.run(["debugedit", "-l", "sources.txt", dest])

with open("sources.txt") as f:
    content = f.read()
    all_sources = content.split('\0')

print("Identifying unique source directories")
source_paths = []
for source in all_sources:
    source_parts = source.split(":")
    if len(source_parts) != 3: continue

    source_original = source_parts[0] + ":" + source_parts[1]
    source_original = source_original[:-2]
    
    if source_original not in source_paths:
        source_paths.append(source_original)

print(f"Identified {len(source_paths)} unique source directories from source file list")
for source in source_paths:
    remapped = source.replace("\\", "/")[2:]
    print(f"Remapping source path from {source} to {remapped} using debugedit.")
    subprocess.run(["debugedit", "-b", source, "-d", remapped, dest])