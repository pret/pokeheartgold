#!/usr/bin/env python

import json
import re
import struct
import typing
from collections.abc import Mapping


@typing.overload
def parse_c_header(
    filename: str, prefix: str = ..., as_list: typing.Literal[False] = ...
) -> Mapping[int, str]: ...


@typing.overload
def parse_c_header(
    filename: str, prefix: str = ..., as_list: typing.Literal[True] = ...
) -> list[tuple[int, str]]: ...


def parse_c_header(filename: str, prefix="", as_list=False):
    with open(filename) as fp:
        data = fp.read()
    pat = re.compile(rf"#define\s+({prefix}\w+)\s+(\d+|0x[0-9a-fA-F]+)(\s*//.*)?\n")
    return (list if as_list else dict)((int(m[2], 0), m[1]) for m in pat.finditer(data))


trainer_classes = parse_c_header("include/constants/trainer_class.h", "TRAINERCLASS_")
trainer_ids = parse_c_header("include/constants/trainers.h", "TRAINER_")
map_ids = parse_c_header("include/constants/maps.h", "MAP_")
phone_contacts = parse_c_header("include/constants/phone_contacts.h", "PHONE_CONTACT_")
phone_scripts = parse_c_header("include/constants/phone_scripts.h", "PHONE_SCRIPT_")
items = parse_c_header("include/constants/items.h", "ITEM_")
weekday = [
    "RTC_WEEK_SUNDAY",
    "RTC_WEEK_MONDAY",
    "RTC_WEEK_TUESDAY",
    "RTC_WEEK_WEDNESDAY",
    "RTC_WEEK_THURSDAY",
    "RTC_WEEK_FRIDAY",
    "RTC_WEEK_SATURDAY",
    "RTC_WEEK_MAX",
]
time_of_day = [
    "TIMEOFDAY_WILD_MORN",
    "TIMEOFDAY_WILD_DAY",
    "TIMEOFDAY_WILD_NITE",
    "TIMEOFDAY_WILD_MAX",
]

PMTelBook = struct.Struct("<BBBBHHHHBBBBBBBB")
keys = (
    "id",
    "type",
    "unk2",
    "trainerClass",
    "trainerId",
    "mapId",
    "gift",
    "phoneScriptIfLocal",
    "unkC",
    "rematchWeekday",
    "rematchTimeOfDay",
    "unkF",
    "sortParam",
)
array_keys = {"sortParam": 4}

arr = []
with open("files/tel/pmtel_book.dat", "rb") as infile:
    count = int.from_bytes(infile.read(4), "little")
    assert count == 75
    for i in range(count):
        tup = PMTelBook.unpack(infile.read(PMTelBook.size))
        it = iter(tup)
        d = {}
        for key in keys:
            if key in array_keys:
                d[key] = [next(it) for _ in range(array_keys[key])]
            else:
                d[key] = next(it)
        d["id"] = phone_contacts[d["id"]]
        d["trainerClass"] = trainer_classes[d["trainerClass"]]
        d["trainerId"] = trainer_ids[d["trainerId"]]
        d["mapId"] = map_ids[d["mapId"]]
        d["gift"] = items[d["gift"]]
        d["rematchWeekday"] = weekday[d["rematchWeekday"]]
        d["rematchTimeOfDay"] = time_of_day[d["rematchTimeOfDay"]]
        d["phoneScriptIfLocal"] = phone_scripts[d["phoneScriptIfLocal"]]
        arr.append(d)
with open("files/tel/pmtel_book.json", "w") as ofp:
    json.dump({"pmtel_book": arr}, ofp, indent=4)
