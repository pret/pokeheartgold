import collections
import json
import struct
import re
import os
import glob
import csv
import typing


def unpack_narc(filename: str):
    with open(filename, 'rb') as fp:
        header = struct.unpack('<4sHHLHH', fp.read(16))
        assert header[0] == b'NARC' and header[1] == 0xFFFE and header[2] == 0x0100 and header[4] == 16
        fatident, fatsize, nfile = struct.unpack('<4sLH2x', fp.read(12))
        assert fatident == b'BTAF' and fatsize == nfile * 8 + 12
        fat = list(struct.iter_unpack('<LL', fp.read(nfile * 8)))
        fntident, fntsize = struct.unpack('<4sL', fp.read(8))
        assert fntident == b'BTNF'
        fp.seek(fntsize - 8, os.SEEK_CUR)
        imgident, imgsize = struct.unpack('<4sL', fp.read(8))
        assert imgident == b'GMIF'
        img = fp.read()
        assert len(img) == imgsize - 8
    for start, end in fat:
        yield img[start:end]


def parse_c_header(filename: str, prefix='', as_list=False) -> typing.Union[list[tuple[int, str]], dict[int, str]]:
    with open(filename) as fp:
        data = fp.read()
    pat = re.compile(rf'#define\s+({prefix}\w+)\s+(\d+|0x[0-9a-fA-F]+)\n')
    if as_list:
        return [(int(m[2], 0), m[1]) for m in pat.finditer(data)]
    return {int(m[2], 0): m[1] for m in pat.finditer(data)}


class NamedStruct(struct.Struct):
    def __init__(self, cls_name, _format, fields):
        super().__init__(_format)
        self._fields = fields

        def _subclass__init__(self, values):
            for field, value in zip(fields, values):
                setattr(self, field, value)

        def _subclass__repr__(self):
            return '<' + cls_name + '(' + ', '.join(field + '=' + repr(getattr(self, field)) for field in fields) + ')'

        self._cls = type(cls_name, (object,), {'__init__': _subclass__init__, '__repr__': _subclass__repr__})

    def _make(self, values):
        return self._cls(values)

    def _to_tuple(self, obj):
        assert obj.__class__.__name__ == self._cls.__name__
        return tuple(getattr(obj, name) for name in self._fields)

    def __call__(self, *args):
        return self._make(args)

    def unpack(self, buffer):
        return self._make(super().unpack(buffer))

    def unpack_from(self, buffer, offset=0):
        return self._make(super().unpack_from(buffer, offset=offset))

    def iter_unpack(self, buffer):
        for tup in super().iter_unpack(buffer):
            yield self._make(tup)

    def pack(self, obj):
        return super().pack(self._to_tuple(obj))

    def pack_into(self, buffer, offset, obj):
        super().pack_into(buffer, offset, self._to_tuple(obj))

    @property
    def cls(self):
        return self._cls


BgEvent = NamedStruct('BgEvent', '<HHLLLL', (
    'scr',
    'type',
    'x',
    'y',
    'z',
    'dir'
))
ObjectEvent = NamedStruct('ObjectEvent', '<14HL', (
    'id',
    'ovid',
    'mvt',
    'type',
    'flag',
    'scr',
    'dirn',
    'eye',
    'unk10',
    'unk12',
    'xrange',
    'yrange',
    'x',
    'y',
    'z',
))
WarpEvent = NamedStruct('WarpEvent', '<HHHHL', (
    'x',
    'y',
    'header',
    'anchor',
    'height',
))
CoordEvent = NamedStruct('CoordEvent', '<HHHHHHHH', (
    'scr',
    'x',
    'y',
    'w',
    'h',
    'z',
    'val',
    'var',
))

my_dir = os.path.join(os.path.dirname(__file__), '../..')
maps = parse_c_header(os.path.join(my_dir, 'include/constants/maps.h'), 'MAP_')
flags = parse_c_header(os.path.join(my_dir, 'include/constants/flags.h'), 'FLAG_')
variables = parse_c_header(os.path.join(my_dir, 'include/constants/vars.h'), 'VAR_')
sprites = parse_c_header(os.path.join(my_dir, 'include/constants/sprites.h'), 'SPRITE_')
std_scripts = parse_c_header(os.path.join(my_dir, 'include/constants/std_script.h'), 'std_')


def main():
    for file in sorted(glob.glob(os.path.join(my_dir, 'files/fielddata/eventdata/zone_event/*.bin'))):
        event_header = re.sub(r'fielddata/eventdata/zone_event/\d+_(\w+)\.bin', r'fielddata/script/scr_seq/event_\1.h', file).replace('DUMMY', 'EVERYWHERE')
        name = os.path.basename(event_header).replace('event_', '')
        try:
            scripts = parse_c_header(event_header, '_EV_')
            objects = parse_c_header(event_header, 'obj_', as_list=True)
        except FileNotFoundError:
            scripts = {}
            objects = None

        def scr_get(id_):
            return std_scripts.get(id_, scripts.get(id_, id_))

        with open(file, 'rb') as fp:
            nbg = int.from_bytes(fp.read(4), 'little')
            bgs = list(BgEvent.iter_unpack(fp.read(nbg * BgEvent.size)))
            nob = int.from_bytes(fp.read(4), 'little')
            obs = list(ObjectEvent.iter_unpack(fp.read(nob * ObjectEvent.size)))
            nwp = int.from_bytes(fp.read(4), 'little')
            wps = list(WarpEvent.iter_unpack(fp.read(nwp * WarpEvent.size)))
            ncd = int.from_bytes(fp.read(4), 'little')
            cds = list(CoordEvent.iter_unpack(fp.read(ncd * CoordEvent.size)))
        if objects is None:
            objects = []
            with open(event_header, 'w') as ofp:
                guard = f'SCR_SEQ_{name}_H_'.upper()
                print(f'#ifndef {guard}', file=ofp)
                print(f'#define {guard}', file=ofp)
                print('', file=ofp)
                seen = collections.Counter()
                for ob in obs:
                    sprite = sprites[ob.ovid].replace('SPRITE_', '')
                    obname = f'obj_{name}_{sprite}'.lower()
                    seen[obname] += 1
                    if seen[obname] > 1:
                        obname = f'{obname}_{seen[obname]}'
                    print(f'#define {obname:<32s} {ob.id: 5d}', file=ofp)
                    objects.append((ob.id, obname))
                print('', file=ofp)
                print(f'#endif //{guard}', file=ofp)
        ret = {'header': os.path.relpath(event_header, os.path.join(my_dir, 'files'))}
        if bgs:
            ret['bgs'] = [
                {
                    'scr': scr_get(bg.scr),
                    'type': bg.type,
                    'x': bg.x,
                    'y': bg.y,
                    'z': bg.z,
                    'dir': bg.dir
                } for bg in bgs
            ]
        if obs:
            if objects is not None:
                assert all(ob.id == objects[i][0] for i, ob in enumerate(obs))
            ret['objects'] = [
                {
                    'id': ob.id if objects is None else objects[i][1],
                    'ovid': sprites[ob.ovid],
                    'mvt': ob.mvt,
                    'type': ob.type,
                    'flag': flags[ob.flag],
                    'scr': scr_get(ob.scr),
                    'dirn': ob.dirn,
                    'eye': ob.eye,
                    'unk10': ob.unk10,
                    'unk12': ob.unk12,
                    'xrange': ob.xrange,
                    'yrange': ob.yrange,
                    'x': ob.x,
                    'y': ob.y,
                    'z': ob.z,
                } for i, ob in enumerate(obs)
            ]
        if wps:
            ret['warps'] = [
                {
                    'x': wp.x,
                    'y': wp.y,
                    'header': maps.get(wp.header, wp.header),
                    'anchor': wp.anchor,
                    'height': wp.height,
                } for wp in wps
            ]
        if cds:
            ret['coords'] = [
                {
                    'scr': scr_get(cd.scr),
                    'x': cd.x,
                    'y': cd.y,
                    'w': cd.w,
                    'h': cd.h,
                    'z': cd.z,
                    'val': cd.val,
                    'var': variables[cd.var]
                } for cd in cds
            ]
        with open(file.replace('.bin', '.json'), 'wt') as ofp:
            json.dump(ret, ofp, indent=2)


if __name__ == '__main__':
    main()
