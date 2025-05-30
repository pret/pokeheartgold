#!/usr/bin/env bash

import json
import pathlib
import struct

project_dir = pathlib.Path(__file__).parent.parent
mmodel_dir = project_dir / "files/data/mmodel/mmodel"
binfiles = [mmodel_dir / f"mmodel_{i:08d}.bin" for i in range(280, 297)]

for binfile in binfiles:
    json_file = binfile.with_suffix(".json")
    with binfile.open("rb") as fp:
        count = int.from_bytes(fp.read(4), "little")
        unk0 = [x for x, in struct.iter_unpack("<H", fp.read(2 * count))]
        unk1 = list(fp.read(count))
        unk2 = list(fp.read(count))
    assert count == len(unk0) == len(unk1) == len(unk2)
    data = list({"unk0": a, "unk1": b, "unk2": c} for a, b, c in zip(unk0, unk1, unk2))
    with json_file.open("w") as ofp:
        json.dump({"data": data}, ofp, indent=4)
