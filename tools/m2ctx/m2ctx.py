#!/usr/bin/python3

import os
import sys
import subprocess
import tempfile
import argparse
from pathlib import Path

script_dir = os.path.dirname(os.path.realpath(__file__))
root_dir = script_dir + "/../../"
src_dir = root_dir + "src/"

PREDEFINED_MACROS = [
    "__STDC__", "__STDC_VERSION__", "__STDC_VERSION__", "__STDC_HOSTED__"]

def get_c_dir(dirname):
    for root, dirs, files in os.walk(src_dir):
        for directory in dirs:
            if directory == dirname:
                return os.path.join(root, directory)


def get_c_file(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".c") and "data" not in file:
                return file

# Returns the name of a temporary file where #include statements have been
# extracted.
def extract_imports(in_file):
    in_file = os.path.relpath(in_file, root_dir)
    tmp_file = tempfile.NamedTemporaryFile(
        prefix="c-includes-", suffix=".c", delete=False)

    cmd = ["grep", "^#include ", in_file]
    output = subprocess.check_output(cmd, cwd=root_dir, encoding="utf-8")

    outfile = open(tmp_file.name, 'wt')
    outfile.write(output)
    outfile.close()
    return outfile.name

def preprocess_imports(in_file):
    # Contains mwccarm.exe defines and include paths
    includes = [
        "-Iinclude", "-Iinclude/library", "-Ifiles", "-Ilib/include", "-include", "global.h"
        ]
    defines = [
        "-DHEARTGOLD", "-DGAME_REMASTER=0", "-DENGLISH", "-DPM_KEEP_ASSERTS", "-DSDK_ARM9",
        "-DSDK_CODE_ARM", "-DSDK_FINALROM"
        ]
    cpp_command =["gcc", "-E", "-P", "-dD", "-undef"] + includes + defines + [in_file]
    try:
        return subprocess.check_output(cpp_command, cwd=root_dir, encoding="utf-8")
    except subprocess.CalledProcessError:
        print(
            "Failed to preprocess input file, when running command:\n"
            + cpp_command,
            file=sys.stderr,
        )
        sys.exit(1)

# Remove predefined macros from preprocessed output. If not removed, mwccarm
# generates compiler warnings.
def remove_predefined(preprocessed):
    output = []
    for line in preprocessed.splitlines():
        if any(macro in line for macro in PREDEFINED_MACROS):
            continue
        output.append(line)
    return "\n".join(output)

def main():
    parser = argparse.ArgumentParser(usage="./m2ctx.py path/to/file.c",
                                     description="Creates a ctx.c file for decomp.me.")
    parser.add_argument('filepath', help="path of c file to be processed")
    args = parser.parse_args()

    if args.filepath:
        c_file_path = args.filepath
        print("Using file: {}".format(c_file_path))
    else:
        this_dir = Path.cwd()
        c_dir_path = get_c_dir(this_dir.name)
        if c_dir_path is None:
            sys.exit(
                "Cannot find appropriate c file dir. In argumentless mode, run this script from the c file's corresponding asm dir.")
        c_file = get_c_file(c_dir_path)
        c_file_path = os.path.join(c_dir_path, c_file)
        print("Using file: {}".format(c_file_path))

    tmp_file = extract_imports(c_file_path)
    preprocessed = preprocess_imports(tmp_file)
    os.remove(tmp_file)

    output = remove_predefined(preprocessed)

    with open(os.path.join(root_dir, "ctx.c"), "w", encoding="UTF-8") as f:
        f.write(output)


if __name__ == "__main__":
    main()
