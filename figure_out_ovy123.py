import struct


SDK_OVERLAY_OVY_123_TEXT_START = 0x0225F020
SDK_OVERLAY_OVY_123_SINIT_START = 0x02260BDC
SDK_OVERLAY_OVY_123_BSS_START = 0x02260C00


def ov123_0225FD5C(word):
    hi = (word >> 24) & 0xFF
    if (hi & 0xE) == 10:
        if (hi & 0xF0) == 0xF0:
            return 1
        elif hi & 1:
            return 2
        else:
            return 3
    return 0


def decode_range(buffer, start, end):
    while start < end:
        word, = struct.unpack_from('<L', buffer, start - SDK_OVERLAY_OVY_123_TEXT_START)
        mode = ov123_0225FD5C(word)
        if mode in (1, 2):
            word = ((word & 0xFF000000) ^ 0x01000000) | (((word & ~0xFF000000) - 0x1300) & ~0xFF000000)
        elif mode == 3:
            word = ((word & 0xFF000000) ^ 0x01000000) | (((word & ~0xFF000000) - 0x4C2) & ~0xFF000000)
        else:
            word = ((((word >> 0) & 0xFF) ^ 0x56) << 0) | ((((word >> 8) & 0xFF) ^ 0x65) << 8) | ((((word >> 16) & 0xFF) ^ 0x56) << 16) | ((((word >> 24) & 0xFF) ^ 0xF0) << 24)
        struct.pack_into('<L', buffer, start - SDK_OVERLAY_OVY_123_TEXT_START, word & 0xFFFFFFFF)
        start += 4


def ov123_0225FD98(buffer, offset):
    print(f'__PICTAB_{offset:08X}')
    while True:
        start, end = struct.unpack_from('<LL', buffer, offset - SDK_OVERLAY_OVY_123_TEXT_START)
        if start == 0:
            break
        size = end - SDK_OVERLAY_OVY_123_BSS_START - 0x1300
        start -= 0x1300
        end = start + (size & ~3)
        print(f'\t0x{start:08X}-0x{end:08X}')
        decode_range(buffer, start, end)
        offset += 8


if __name__ == '__main__':
    with open('overlays/123/module_123.sbin', 'rb') as raw:
        buffer = bytearray(raw.read())
    sinit = SDK_OVERLAY_OVY_123_SINIT_START

    while True:
        offset, = struct.unpack_from('<L', buffer, sinit - SDK_OVERLAY_OVY_123_TEXT_START)
        if offset == 0:
            break
        ov123_0225FD98(buffer, offset + 16)
        sinit += 4
    with open('mod123_decoded.sbin', 'w+b') as out:
        out.write(buffer)
