#!/usr/bin/env python3

import sys


def usage():
    print("Usage: text_banks.py <INFILE> <OUTFILE>")
    print()
    print("Process an input file containing a list of TEXT_BANK constants into an")
    print("output file to order the contents of msgdata.narc.")


if len(sys.argv) == 1:
    usage()
    exit(0)

if len(sys.argv) == 2:
    print("Missing positional argument OUTFILE")
    print()
    usage()
    exit(1)

with (
    open(sys.argv[1], "r", encoding="utf-8") as infile,
    open(sys.argv[2], "w", encoding="utf-8") as outfile,
):
    for bank in filter(
        lambda line: not line.startswith("#"),
        map(
            lambda line: line.split()[0].replace("NARC_msg_", "").replace("_bin", ""),
            infile.readlines(),
        ),
    ):
        print(bank, file=outfile)
