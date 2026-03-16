#!/usr/bin/env python

import atexit
import json
import pathlib
import shutil
import string
import struct
import subprocess
from collections.abc import Generator
from typing import Any, TypedDict


class Giratina[T](TypedDict):
    origin: T
    altered: T


def remove_unpacked(dir: pathlib.Path):
    shutil.rmtree(dir.resolve())


species = []
with (pathlib.Path() / "include" / "constants" / "species.h").open() as incl_fp:
    for line in incl_fp:
        if line.startswith("#define SPECIES_"):
            species.append(line.split()[1])
            if species[-1] == "SPECIES_ARCEUS":
                break

zukan_data_dir = pathlib.Path() / "zukan_data"
if not zukan_data_dir.exists():
    subprocess.check_call(
        [
            "tools/knarc/knarc",
            "-u",
            "files/application/zukanlist/zkn_data/zukan_data.narc",
            "-d",
            "zukan_data",
        ]
    )
    atexit.register(remove_unpacked, zukan_data_dir)
zukan_data_gira_dir = pathlib.Path() / "zukan_data_gira"
if not zukan_data_gira_dir.exists():
    subprocess.check_call(
        [
            "tools/knarc/knarc",
            "-u",
            "files/application/zukanlist/zkn_data/zukan_data_gira.narc",
            "-d",
            "zukan_data_gira",
        ]
    )
    atexit.register(remove_unpacked, zukan_data_gira_dir)
zukan_data = {
    "mon_stats": [{"species": mon} for mon in species[:494]],
    "sorting": [
        {
            "type": "dex_order",
            "options": [],
        },
        {
            "type": "letters",
            "options": [],
        },
        {
            "type": "types",
            "options": [],
        },
        {
            "type": "body_style",
            "options": [],
        },
        {
            "type": "letter_groups",
            "options": [],
        },
    ],
}


def read_mon_stat(
    file_id: int, nbytes: int = 4, signed: bool = False
) -> Generator[int | Giratina[int], None, Any]:
    path = zukan_data_dir / f"zukan_data_{file_id:08d}.bin"
    path_gira = zukan_data_gira_dir / f"zukan_data_gira_{file_id:08d}.bin"

    with path.open("rb") as fp, path_gira.open("rb") as fp_gira:
        while fp.peek(nbytes):
            value = int.from_bytes(fp.read(nbytes), "little", signed=signed)
            value_gira = int.from_bytes(fp_gira.read(nbytes), "little", signed=signed)
            if value != value_gira:
                value = {"altered": value, "origin": value_gira}
            yield value


def load_mon_stat(name: str, file_id: int, nbytes: int = 4, signed=False) -> None:
    for i, value in enumerate(read_mon_stat(file_id, nbytes=nbytes, signed=signed)):
        zukan_data["mon_stats"][i][name] = value


def read_category(file_id: int) -> list[str] | Giratina[list[str]]:
    path = zukan_data_dir / f"zukan_data_{file_id:08d}.bin"
    path_gira = zukan_data_gira_dir / f"zukan_data_gira_{file_id:08d}.bin"

    with path.open("rb") as fp:
        values = [species[x] for x, in struct.iter_unpack("<H", fp.read())]
    with path_gira.open("rb") as fp_gira:
        values_gira = [species[x] for x, in struct.iter_unpack("<H", fp_gira.read())]
    if values != values_gira:
        values = {"altered": values, "origin": values_gira}
    return values


def load_category(name: str, file_id: int, parent="categories"):
    store = next(d for d in zukan_data["sorting"] if d["type"] == parent)
    store["options"].append({"id": name, "mons": read_category(file_id)})


load_mon_stat("height", 0, 4)
load_mon_stat("weight", 1, 4)
load_mon_stat("body_style", 2, 1)
load_mon_stat("scale_f", 3, 2, signed=True)
load_mon_stat("mon_scale_f", 4, 2, signed=True)
load_mon_stat("scale_m", 5, 2, signed=True)
load_mon_stat("mon_scale_m", 6, 2, signed=True)
load_mon_stat("ypos_f", 7, 2, signed=True)
load_mon_stat("mon_ypos_f", 8, 2, signed=True)
load_mon_stat("ypos_m", 9, 2, signed=True)
load_mon_stat("mon_ypos_m", 10, 2, signed=True)

load_category("national", 11, parent="dex_order")
load_category("johto", 12, parent="dex_order")
load_category("alphabetical", 13, parent="dex_order")
load_category("heaviest", 14, parent="dex_order")
load_category("lightest", 15, parent="dex_order")
load_category("tallest", 16, parent="dex_order")
load_category("shortest", 17, parent="dex_order")

for i, c in enumerate(string.ascii_lowercase, 18):
    load_category(c, i, parent="letters")
for i in range(44, 62):
    load_category(f"extra_{i - 44:02d}", i, parent="letters")

load_category("normal", 62, parent="types")
load_category("fighting", 63, parent="types")
load_category("flying", 64, parent="types")
load_category("poison", 65, parent="types")
load_category("ground", 66, parent="types")
load_category("rock", 67, parent="types")
load_category("bug", 68, parent="types")
load_category("ghost", 69, parent="types")
load_category("steel", 70, parent="types")
load_category("fire", 71, parent="types")
load_category("water", 72, parent="types")
load_category("grass", 73, parent="types")
load_category("electric", 74, parent="types")
load_category("psychic", 75, parent="types")
load_category("ice", 76, parent="types")
load_category("dragon", 77, parent="types")
load_category("dark", 78, parent="types")

load_category("quadruped", 79, parent="body_style")
load_category("bipedal_tailless", 80, parent="body_style")
load_category("bipedal_tail", 81, parent="body_style")
load_category("serpentine", 82, parent="body_style")
load_category("multiwing", 83, parent="body_style")
load_category("biwing", 84, parent="body_style")
load_category("insectoid", 85, parent="body_style")
load_category("head_torso", 86, parent="body_style")
load_category("head_arms", 87, parent="body_style")
load_category("head_legs", 88, parent="body_style")
load_category("tentacles", 89, parent="body_style")
load_category("fins", 90, parent="body_style")
load_category("head_only", 91, parent="body_style")
load_category("multibody", 92, parent="body_style")

load_category("abc", 93, parent="letter_groups")
load_category("def", 94, parent="letter_groups")
load_category("ghi", 95, parent="letter_groups")
load_category("jkl", 96, parent="letter_groups")
load_category("mno", 97, parent="letter_groups")
load_category("pqr", 98, parent="letter_groups")
load_category("stu", 99, parent="letter_groups")
load_category("vwx", 100, parent="letter_groups")
load_category("yz", 101, parent="letter_groups")

print(json.dumps(zukan_data, indent=4))
