#!/usr/bin/env python

import json
import pathlib
import struct

project_root = pathlib.Path(__file__).parent.parent
arc_base = project_root / "files" / "arc" / "safari_enc"

species_names = []
with (project_root / "include" / "constants" / "species.h").open() as species_h:
    for line in species_h:
        if line.startswith("#define SPECIES_"):
            species_names.append(line.split()[1])

safari_zone_area_names = []
safari_zone_object_type_names = []
with (project_root / "include" / "constants" / "safari.h").open() as safari_areas_h:
    for line in safari_areas_h:
        if line.startswith("#define SAFARI_ZONE_AREA_") and not line.startswith(
            "#define SAFARI_ZONE_AREA_SET_"
        ):
            safari_zone_area_names.append(line.split()[1])
        elif line.startswith("#define SAFARI_ZONE_OBJECT_TYPE_"):
            safari_zone_object_type_names.append(line.split()[1])

encounter_modes = "land", "surf", "oldrod", "goodrod", "superrod"
data = {"encounters": []}
for i, area_name in enumerate(safari_zone_area_names):
    cur_map = {"area": area_name}
    with (arc_base / f"safari_enc_{i:08d}.bin").open("rb") as fp:
        bonus_counts = fp.read(8)
        for name, num_bonus in zip(encounter_modes, bonus_counts):
            cur_elem = {
                "mons": {
                    "morn": [],
                    "day": [],
                    "nite": [],
                },
                "bonus_mons": {
                    "morn": [],
                    "day": [],
                    "nite": [],
                },
                "bonus_param": [],
            }
            for time_of_day in "morn", "day", "nite":
                for i in range(10):
                    mon, level = struct.unpack("<HH", fp.read(4))
                    cur_elem["mons"][time_of_day].append(
                        {"species": species_names[mon], "level": level}
                    )
            cur_elem["bonus_mons"] = [{"conditions": []} for _ in range(num_bonus)]
            for time_of_day in "morn", "day", "nite":
                for i in range(num_bonus):
                    mon, level = struct.unpack("<HH", fp.read(4))
                    cur_elem["bonus_mons"][i][time_of_day] = {
                        "species": species_names[mon],
                        "level": level,
                    }

            for i in range(num_bonus):
                attr1, lvl1, attr2, lvl2 = fp.read(4)
                cur_elem["bonus_mons"][i]["conditions"].append(
                    {
                        "object_type": safari_zone_object_type_names[attr1],
                        "count": lvl1,
                    }
                )
                if attr2 != 0:
                    cur_elem["bonus_mons"][i]["conditions"].append(
                        {
                            "object_type": safari_zone_object_type_names[attr2],
                            "count": lvl2,
                        }
                    )
            cur_map[name] = cur_elem
    data["encounters"].append(cur_map)

with arc_base.with_suffix(".json").open("w") as ofp:
    json.dump(data, ofp, indent=4)
