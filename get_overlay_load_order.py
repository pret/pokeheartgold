import struct


class Overlay:
    def __init__(self, ovy_id, start, size, bsssize, sinit_start, sinit_end, file_id, flag):
        self.id = ovy_id
        self.start = start
        self.end = start + size + bsssize


def main():
    with open('baserom.nds', 'rb') as fp:
        buffer = fp.read()
    ovy_addr, ovy_size = struct.unpack_from('<LL', buffer, 0x50)
    ovy_table = [Overlay('main', 0x02000000, 0x111ef8, 0xd3a08, 0, 0, 0, 0)]
    ovy_table += [Overlay(*args) for args in struct.iter_unpack('<LLLLLLLL', buffer[ovy_addr:ovy_addr + ovy_size])]
    for i, a in enumerate(ovy_table[1:], 1):
        for j, b in enumerate(ovy_table[:i]):
            if a.start == b.end:
                print('Overlay', a.id, 'After', b.id)
    with open('overlay_table.sbin', 'wb') as ofp:
        ofp.write(buffer[ovy_addr:ovy_addr + ovy_size])


if __name__ == '__main__':
    main()
