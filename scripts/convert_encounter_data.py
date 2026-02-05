#!/usr/bin/env python

import csv
import json
import pathlib

basedir = pathlib.Path(__file__).parent.parent / "files" / "fielddata" / "encountdata"
g_enc_file = basedir / "g_enc_data.csv"
s_enc_file = basedir / "s_enc_data.csv"
out_json = basedir / "gs_enc_data.json"


def get_value(g_enc_row: dict, s_enc_row: dict, key: str, typ: type = str):
    val_g = typ(g_enc_row[key])
    val_s = typ(s_enc_row[key])
    if val_g == val_s:
        return val_g
    return {
        "HEARTGOLD": val_g,
        "SOULSILVER": val_s,
    }


with g_enc_file.open() as g_fp, s_enc_file.open() as s_fp:
    data = {
        "encounters": [
            {
                "map": get_value(g_enc_row, s_enc_row, "mapname"),
                "land": {
                    "rate": get_value(g_enc_row, s_enc_row, "rate_walk", int),
                    "mons": [
                        {
                            "level": get_value(
                                g_enc_row, s_enc_row, f"land_lvl{i}", int
                            ),
                            "species": {
                                time: get_value(
                                    g_enc_row, s_enc_row, f"land_species_{time}{i}"
                                )
                                for time in ("morn", "day", "nite")
                            },
                        }
                        for i in range(12)
                        if get_value(g_enc_row, s_enc_row, f"land_lvl{i}", int) != 0
                    ],
                },
                "surf": {
                    "rate": get_value(g_enc_row, s_enc_row, "rate_surf", int),
                    "mons": [
                        {
                            "level": {
                                "min": get_value(
                                    g_enc_row, s_enc_row, f"lvl_min_surf{i}", int
                                ),
                                "max": get_value(
                                    g_enc_row, s_enc_row, f"lvl_max_surf{i}", int
                                ),
                            },
                            "species": get_value(
                                g_enc_row, s_enc_row, f"species_surf{i}"
                            ),
                        }
                        for i in range(5)
                        if get_value(g_enc_row, s_enc_row, f"species_surf{i}")
                        != "SPECIES_NONE"
                    ],
                },
                "rock_smash": {
                    "rate": get_value(g_enc_row, s_enc_row, "rate_smash", int),
                    "mons": [
                        {
                            "level": {
                                "min": get_value(
                                    g_enc_row, s_enc_row, f"lvl_min_smash{i}", int
                                ),
                                "max": get_value(
                                    g_enc_row, s_enc_row, f"lvl_max_smash{i}", int
                                ),
                            },
                            "species": get_value(
                                g_enc_row, s_enc_row, f"species_smash{i}"
                            ),
                        }
                        for i in range(2)
                        if get_value(g_enc_row, s_enc_row, f"species_smash{i}")
                        != "SPECIES_NONE"
                    ],
                },
                "fishing": {
                    "old_rod": {
                        "rate": get_value(g_enc_row, s_enc_row, "rate_oldrod", int),
                        "mons": [
                            {
                                "level": {
                                    "min": get_value(
                                        g_enc_row, s_enc_row, f"lvl_min_oldrod{i}", int
                                    ),
                                    "max": get_value(
                                        g_enc_row, s_enc_row, f"lvl_max_oldrod{i}", int
                                    ),
                                },
                                "species": get_value(
                                    g_enc_row, s_enc_row, f"species_oldrod{i}"
                                ),
                            }
                            for i in range(5)
                            if get_value(g_enc_row, s_enc_row, f"species_oldrod{i}")
                            != "SPECIES_NONE"
                        ],
                    },
                    "good_rod": {
                        "rate": get_value(g_enc_row, s_enc_row, "rate_goodrod", int),
                        "mons": [
                            {
                                "level": {
                                    "min": get_value(
                                        g_enc_row, s_enc_row, f"lvl_min_goodrod{i}", int
                                    ),
                                    "max": get_value(
                                        g_enc_row, s_enc_row, f"lvl_max_goodrod{i}", int
                                    ),
                                },
                                "species": get_value(
                                    g_enc_row, s_enc_row, f"species_goodrod{i}"
                                ),
                            }
                            for i in range(5)
                            if get_value(g_enc_row, s_enc_row, f"species_goodrod{i}")
                            != "SPECIES_NONE"
                        ],
                    },
                    "super_rod": {
                        "rate": get_value(g_enc_row, s_enc_row, "rate_superrod", int),
                        "mons": [
                            {
                                "level": {
                                    "min": get_value(
                                        g_enc_row,
                                        s_enc_row,
                                        f"lvl_min_superrod{i}",
                                        int,
                                    ),
                                    "max": get_value(
                                        g_enc_row,
                                        s_enc_row,
                                        f"lvl_max_superrod{i}",
                                        int,
                                    ),
                                },
                                "species": get_value(
                                    g_enc_row, s_enc_row, f"species_superrod{i}"
                                ),
                            }
                            for i in range(5)
                            if get_value(g_enc_row, s_enc_row, f"species_superrod{i}")
                            != "SPECIES_NONE"
                        ],
                    },
                },
                "hoenn": [
                    get_value(g_enc_row, s_enc_row, f"hoenn{i+1}")
                    for i in range(2)
                    if get_value(g_enc_row, s_enc_row, f"hoenn{i+1}") != "SPECIES_NONE"
                ],
                "sinnoh": [
                    get_value(g_enc_row, s_enc_row, f"sinnoh{i+1}")
                    for i in range(2)
                    if get_value(g_enc_row, s_enc_row, f"sinnoh{i+1}") != "SPECIES_NONE"
                ],
                "swarm": [
                    get_value(g_enc_row, s_enc_row, f"swarm_species{i}")
                    for i in range(4)
                ],
            }
            for g_enc_row, s_enc_row in zip(csv.DictReader(g_fp), csv.DictReader(s_fp))
        ]
    }

with out_json.open("w") as ofp:
    json.dump(data, ofp, indent=4)
