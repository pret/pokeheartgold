#!/usr/bin/env python

import json
import os
import struct

narc_stem = "files/poketool/waza/waza_tbl"
move_constants_filename = "include/constants/moves.h"
type_constants_filename = "include/constants/pokemon.h"
move_effect_constants_filename = "include/constants/move_effects.h"
contest_effect_constants_filename = "include/constants/contest.h"
waza_tbl_struct = struct.Struct("<HBBBBBBHbBBBH")
assert waza_tbl_struct.size == 16

# Load move constants
with open(move_constants_filename) as constants_file:
    move_constants: list[str] = []
    category_constants: list[str] = []
    range_constants: list[str] = []
    for line in constants_file:
        if line.startswith("#define MOVE_") and not line.startswith(
            "#define MOVE_ATTRIBUTE"
        ):
            move_constants.append(line.split()[1])
        elif line.startswith("#define CATEGORY_"):
            category_constants.append(line.split()[1])
        elif line.startswith("#define RANGE_"):
            range_constants.append(line.split()[1])

# Load type constants
with open(type_constants_filename) as constants_file:
    type_constants: list[str] = []
    for line in constants_file:
        if "NUMBER_OF_MON_TYPES" in line:
            break
        if line.startswith("#define TYPE_"):
            type_constants.append(line.split()[1])

# Load move effect constants
with open(move_effect_constants_filename) as constants_file:
    move_effect_constants: list[str] = []
    for line in constants_file:
        if line.startswith("#define MOVE_EFFECT_"):
            index = int(line.split()[2])
            while len(move_effect_constants) <= index:
                move_effect_constants.append(len(move_effect_constants))
            move_effect_constants[index] = line.split()[1]

contest_types = ["COOL", "BEAUTY", "CUTE", "SMART", "TOUGH"]

# Load contest effect constants
with open(contest_effect_constants_filename) as constants_file:
    contest_effect_constants: list[str] = []
    for line in constants_file:
        if line.startswith("#define CONTEST_EFFECT_"):
            contest_effect_constants.append(line.split()[1])


# Parse NARC
section_header = struct.Struct("<4sL")
with open(f"{narc_stem}.narc", "rb") as fp:
    header = fp.read(0x10)
    assert header.startswith(b"NARC")
    magic, size = section_header.unpack(fp.read(8))
    assert magic == b"BTAF"
    fp.seek(size - 8, os.SEEK_CUR)
    magic, size = section_header.unpack(fp.read(8))
    assert magic == b"BTNF"
    fp.seek(size - 8, os.SEEK_CUR)
    magic, size = section_header.unpack(fp.read(8))
    assert magic == b"GMIF"
    move_entries = list(waza_tbl_struct.iter_unpack(fp.read()))


for move, entry_unpacked in zip(move_constants, move_entries):
    entry_json = {
        "effect": (
            move_effect_constants[entry_unpacked[0]]
            if entry_unpacked[0] < len(move_effect_constants)
            else entry_unpacked[0]
        ),
        "category": category_constants[entry_unpacked[1]],
        "power": entry_unpacked[2],
        "type": type_constants[entry_unpacked[3]],
        "accuracy": entry_unpacked[4],
        "pp": entry_unpacked[5],
        "effectChance": entry_unpacked[6],
        "range": " | ".join(
            flag
            for i, flag in enumerate(range_constants[1:])
            if entry_unpacked[7] & (1 << i)
        )
        or range_constants[0],
        "priority": entry_unpacked[8],
        "flags": entry_unpacked[9],
        "contestEffect": contest_effect_constants[entry_unpacked[10]],
        "contestType": contest_types[entry_unpacked[11]],
    }
    move_name_lower = move.split("_", 1)[1].lower()
    os.makedirs(f"res/move/{move_name_lower}", exist_ok=True)
    with open(f"res/move/{move_name_lower}/data.json", "w") as ofp:
        json.dump(entry_json, ofp, indent=4)
