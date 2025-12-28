#!/usr/bin/env python

import argparse
import struct
import typing


class NNSHeader(typing.NamedTuple):
    magic: bytes
    bom: int
    version: int
    filesize: int
    header_size: int
    num_sections: int


class G2dCharacterData(typing.NamedTuple):
    H: int
    W: int
    pixelFmt: int
    mappingType: int
    characterFmt: int
    szByte: int
    pRawData: int


class Namespace(argparse.Namespace):
    files: list[typing.BinaryIO]

    @classmethod
    def from_cli(cls, args=None):
        parser = argparse.ArgumentParser()
        parser.add_argument("files", type=argparse.FileType("rb"), nargs="+")
        return parser.parse_args(args, cls())


def main():
    args = Namespace.from_cli()
    for file in args.files:
        assert file.name.endswith(".NCGR")
        nns_header = NNSHeader._make(struct.unpack("<4sHHLHH", file.read(16)))
        assert nns_header.magic == b"RGCN"
        assert nns_header.bom == 0xFEFF
        assert nns_header.header_size == 16
        has_sopc = False
        clobbersize = None
        mapping_type = None

        for _ in range(nns_header.num_sections):
            magic, size = struct.unpack("<4sL", file.read(8))
            rest = file.read(size - 8)
            if magic == b"SOPC":
                has_sopc = True
            elif magic == b"RAHC":
                char_header = G2dCharacterData._make(
                    struct.unpack_from("<HHLLLLL", rest)
                )
                assert char_header.szByte == size - 0x20
                assert not (char_header.H == 0xFFFF) ^ (char_header.W == 0xFFFF)
                clobbersize = char_header.H == 0xFFFF
                mapping_type = char_header.mappingType
            else:
                raise ValueError(f"unrecognized section magic: {magic.decode()}")
        assert clobbersize is not None
        flags = []
        if clobbersize:
            flags.append("-clobbersize")
        if has_sopc:
            flags.append("-sopc")
        if nns_header.version == 0x101:
            flags.append("-version101")
        if mapping_type != 0:
            flags.append("-mappingtype")
            flags.append(32 * (2 ** (mapping_type >> 20)))
        print(
            "tools/nitrogfx/nitrogfx",
            file.name.replace(".NCGR", ".png"),
            "tmp.NCGR",
            *flags,
            "&&",
            "cmp",
            file.name,
            "tmp.NCGR",
            ";",
            "rm",
            "-rf",
            "tmp.NCGR",
        )


if __name__ == "__main__":
    main()
