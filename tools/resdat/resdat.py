#!/usr/bin/env python3

import argparse
import json
import struct
import typing

RESDAT_KIND = [
    'char',
    'pltt',
    'cell',
    'anim',
    'multicell',
    'multianim',
]


class Args(argparse.Namespace):
    infile: typing.TextIO
    outfile: typing.BinaryIO


class ResdatGraphicsEntry(typing.TypedDict):
    narc: int | str
    file: int | str
    compressed: bool
    id: int
    extra: list[int]


class ResdatResourceEntry(typing.TypedDict):
    graphics: int
    palette: int
    cell: int
    anim: int
    multicell: int
    multianim: int
    transfer: int
    priority: int


class ResdatJson(typing.TypedDict):
    kind: str
    graphics: list[ResdatGraphicsEntry]
    entries: list[ResdatResourceEntry]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('infile', type=argparse.FileType())
    parser.add_argument('outfile', type=argparse.FileType('wb'))
    args: Args = parser.parse_args()
    data: ResdatJson = json.load(args.infile)
    bindat = b''
    if data['kind'] is not None:
        bindat = RESDAT_KIND.index(data['kind']).to_bytes(4, 'little')
        for entry in data['graphics']:
            narc = entry['narc']
            file = entry['file']
            if isinstance(narc, str):
                raise TypeError('Assembing NARC names not implemented')
            if isinstance(file, str):
                raise TypeError('Assembling NARC member names not implemented')
            compressed = entry['compressed']
            id = entry['id']
            extra = entry['extra']
            bindat += struct.pack('<llllll', narc, file, compressed, id, *extra)
        bindat += struct.pack('<llllll', -2, -2, -2, -2, -2, -2)
    else:
        for entry in data['entries']:
            graphics = entry['graphics']
            palette = entry['palette']
            cell = entry['cell']
            anim = entry['anim']
            multicell = entry.get('multicell', -1)
            multianim = entry.get('multianim', -1)
            transfer = entry['transfer']
            priority = entry['priority']
            bindat += struct.pack('<llllllll', graphics, palette, cell, anim, multicell, multianim, transfer, priority)
        bindat += struct.pack('<llllllll', -2, -2, -2, -2, -2, -2, -2, -2)
    args.outfile.write(bindat)


if __name__ == '__main__':
    main()
