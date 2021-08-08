import struct
import os
import subprocess
import argparse


class StructReader(struct.Struct):
    def read(self, file):
        return self.unpack(file.read(self.size))

    def read_iter(self, file, count=-1):
        yield from self.iter_unpack(file.read(max(count * self.size, -1)))


def parse_fat(raw_table):
    FATEntry = StructReader('<LL')
    return list(FATEntry.iter_unpack(raw_table))


def parse_fnt(raw_table, root='files'):
    FNTEntry = StructReader('<LHH')
    first_dir, first_file, nfiles = FNTEntry.unpack_from(raw_table)
    assert first_dir == nfiles * FNTEntry.size
    dir_table = list(FNTEntry.iter_unpack(raw_table[:nfiles * FNTEntry.size]))
    dirs = {0xF000: [root, None]}
    files = []
    for i, (offset, file_id, parent_or_count) in enumerate(dir_table):
        if parent_or_count & 0xF000:
            dirs[parent_or_count].append(i | 0xF000)
        while (lencode := raw_table[offset]) != 0:
            is_dir = (lencode & 0x80) != 0
            name_len = lencode & 0x7F
            offset += 1
            name = raw_table[offset:offset + name_len].decode()
            offset += name_len
            if is_dir:
                dir_id = int.from_bytes(raw_table[offset:offset + 2], 'little')
                dirs[dir_id] = [name, i | 0xF000]
                offset += 2
            else:
                while len(files) <= file_id:
                    files.append([''])
                files[file_id] = name
                dirs[i | 0xF000].append(file_id)
                file_id += 1
    return dirs, files


def parse_overlays(raw_table):
    OverlayInfo = StructReader('<LLLLLLLL')
    return list(OverlayInfo.iter_unpack(raw_table))


CARDRomRegion = StructReader('<LL')


def read_table(rom, ofs):
    rom.seek(ofs)
    off, size = CARDRomRegion.read(rom)
    rom.seek(off)
    return rom.read(size)


def dump_files(dirs, files, allocs, rom, print_only=True):
    for dir_id, (name, parent, *members) in dirs.items():
        while parent is not None:
            name = dirs[parent][0] + '/' + name
            parent = dirs[parent][1]
        if not print_only:
            os.makedirs(name, exist_ok=True)
        for member in members:
            if not member & 0xF000:
                start, end = allocs[member]
                filename = name + '/' + files[member]
                if print_only:
                    print(member, filename, '0x{:08X}'.format(start), '0x{:08X}'.format(end - start), sep='\t')
                else:
                    with open(filename, 'wb') as ofp:
                        rom.seek(start)
                        ofp.write(rom.read(end - start))


def dump_overlays(proc, table, allocs, rom, make_files=False):
    for ovy_id, ram_start, size, bsssize, sinit_start, sinit_end, file_id, flag in table:
        if make_files:
            outdir = f'{proc}/overlays_ss/{ovy_id:02d}'
            os.makedirs(outdir, exist_ok=True)
            with open(f'{outdir}/module_{ovy_id:02d}.cfg', 'w') as cfg:
                print('thumb_func', f'0x{ram_start:08X}', f'MOD{ovy_id:02d}_{ram_start:08X}', file=cfg)
            start, end = allocs[file_id]
            rom.seek(start)
            raw_ovy = rom.read(end - start)
            with open(f'{outdir}/module_{ovy_id:02d}.sbin', 'wb') as ofp:
                ofp.write(raw_ovy)
            sbp_args = [
                '../ndsdisasm/ndsdisasm',
                '-Du', f'{outdir}/module_{ovy_id:02d}.sbin',
                '-m', str(ovy_id),
                '-c', f'{outdir}/module_{ovy_id:02d}.cfg',
                '-d',
                'baserom.nds'
            ]
            if proc == 'arm7':
                sbp_args.append('-7')
            with open(f'{outdir}/module_{ovy_id:02d}.s', 'w') as ofp:
                subprocess.run(sbp_args, stdout=ofp)
    #     else:
    #         print('Overlay', ovy_id)
    #         print('{')
    #         print('    Address', hex(ram_start))
    #         print('    ### Size', hex(size), '###')
    #         print('    ### BSS Size', hex(bsssize), '###')
    #         print('    ### SINIT Start', hex(sinit_start), '###')
    #         print('    ### SINIT End', hex(sinit_end), '###')
    #         print('    ### Compressed?', (flag & 0x01000000) != 0, '###')
    #         if (flag & 0x01000000) != 0:
    #             print('    ### Compressed size', hex(flag & 0x00FFFFFF), '###')
    #         print('}')
    #         print('')
    # if not make_files:
    #     for key, values in itertools.groupby(sorted(table, key=operator.itemgetter(1, 0)), key=operator.itemgetter(1)):
    #         print(hex(key), [x[0] for x in values])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('rom', type=argparse.FileType('rb'))
    parser.add_argument('--no-dump-overlays', dest='dump_overlays', action='store_false')
    parser.add_argument('--no-dump-files', dest='dump_files', action='store_false')
    parser.add_argument('--fsroot', default='files')
    parser.add_argument('--arm9-root', default='.')
    parser.add_argument('--arm7-root', default='sub')
    args = parser.parse_args()
    fnt_raw = read_table(args.rom, 0x40)
    fat_raw = read_table(args.rom, 0x48)
    ovy9_raw = read_table(args.rom, 0x50)
    ovy7_raw = read_table(args.rom, 0x58)

    allocs = parse_fat(fat_raw)
    dirs, files = parse_fnt(fnt_raw, root=args.fsroot)
    ovy9 = parse_overlays(ovy9_raw)
    ovy7 = parse_overlays(ovy7_raw)

    dump_files(dirs, files, allocs, args.rom, print_only=not args.dump_files)

    dump_overlays(args.arm9_root, ovy9, allocs, args.rom, make_files=args.dump_overlays)
    dump_overlays(args.arm7_root, ovy7, allocs, args.rom, make_files=args.dump_overlays)


if __name__ == '__main__':
    main()
