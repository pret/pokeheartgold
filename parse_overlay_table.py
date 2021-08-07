import struct
import sys


def parse_flat_table(buffer):
    for params in struct.iter_unpack('<LLLLLLLL', buffer):
        print('Overlay {:d}\n'
              '    RAM START: 0x{:08X}\n'
              '    RAM SIZE:  0x{:08X}\n'
              '    BSS SIZE:  0x{:08X}\n'
              '    STATIC INIT START: 0x{:08X}\n'
              '    STATIC INIT END:   0x{:08X}\n'
              '    FILE ID:   {:d}'.format(*params))


if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as fp:
        buffer = fp.read()
    parse_flat_table(buffer)
