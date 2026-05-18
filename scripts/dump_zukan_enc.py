#!/usr/bin/env python

import filecmp
import json
import pathlib
import struct

basedir = (
    pathlib.Path() / "files" / "application" / "zukanlist" / "zukan_data" / "zukan_enc"
)
basedir_gold = basedir / "gold"
basedir_silver = basedir / "silver"

encounter_data = {}

with (basedir_gold / "zukan_enc_gold_00000000.bin").open("rb") as fp:
    data = fp.read()
keys = ("unk_0", "unk_1", "unk_2", "unk_3")
encounter_data["dungeons"] = [
    {key: value for key, value in zip(keys, tup)}
    for tup in struct.iter_unpack("<BBBB", data)
]

with (basedir_gold / "zukan_enc_gold_00000001.bin").open("rb") as fp:
    data = fp.read()
keys = ("unk_0", "unk_1", "unk_2", "unk_3", "unk_4")
encounter_data["overworlds"] = [
    {
        key: (list(value) if isinstance(value, bytes) else value)
        for key, value in zip(keys, tup)
    }
    for tup in struct.iter_unpack("<BBBB32s", data)
]

species = []
with (pathlib.Path() / "include" / "constants" / "species.h").open() as incl_fp:
    for line in incl_fp:
        if line.startswith("#define SPECIES_"):
            species.append(line.split()[1])

maps = []
with (pathlib.Path() / "include" / "constants" / "maps.h").open() as incl_fp:
    for line in incl_fp:
        if line.startswith("#define MAP_"):
            maps.append(line.split()[1])

encounter_data["encounters"] = {}
for i in range(8):
    method_key = f"method_{i}"
    encounter_data["encounters"][method_key] = {}
    for j in range(495):
        mon_key = species[j].replace("SPECIES_", f"mon_{j:03d}_").lower()
        file_id = i * 495 + j + 2
        gold_file = basedir_gold / f"zukan_enc_gold_{file_id:08d}.bin"
        silver_file = basedir_silver / f"zukan_enc_silver_{file_id:08d}.bin"
        assert gold_file.exists(), f"{gold_file} not found"
        assert silver_file.exists(), f"{silver_file} not found"
        cmd = ["cmp", str(gold_file.absolute()), str(silver_file.absolute())]
        with gold_file.open("rb") as fp:
            data_gold = fp.read()
        gold_maps = [x for x, in struct.iter_unpack("<L", data_gold)]
        if filecmp.cmp(gold_file, silver_file):
            encounter_data["encounters"][method_key][mon_key] = gold_maps
        else:
            with silver_file.open("rb") as fp:
                data_silver = fp.read()
            silver_maps = [x for x, in struct.iter_unpack("<L", data_silver)]
            encounter_data["encounters"][method_key][mon_key] = {
                "GOLD": gold_maps,
                "SILVER": silver_maps,
            }

with (basedir.parent / "zukan_enc.json").open("w") as ofp:
    json.dump(encounter_data, ofp, indent=4)
