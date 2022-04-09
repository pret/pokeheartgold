#!/usr/bin/python3.10

import collections
import json
import struct
import os
import traceback
import typing
import warnings
import enum
import abc
import re
from progressbar import progressbar
from xml.etree import ElementTree
import csv

from typing import Union, BinaryIO, TextIO, Optional
import argparse

project_root = os.path.realpath(os.path.join(os.path.dirname(__file__), '../..'))


def parse_c_header(filename: str, prefix='', as_list=False) -> typing.Union[list[tuple[int, str]], dict[int, str]]:
    with open(filename) as fp:
        data = fp.read()
    pat = re.compile(rf'#define\s+({prefix}\w+)\s+(\d+|0x[0-9a-fA-F]+)\n')
    return (list if as_list else dict)((int(m[2], 0), m[1]) for m in pat.finditer(data))


class ScriptType(enum.Enum):
    normal = 0
    special = 1
    __MAX__ = 2

    @classmethod
    def convert(cls, arg: str):
        if arg.isnumeric():
            return cls(int(arg))
        elif arg in cls.__members__:
            return cls.__members__[arg]
        else:
            raise TypeError


class Namespace(argparse.Namespace):
    binfile: BinaryIO
    scrfile: TextIO
    name: str
    mode: ScriptType


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
ObjectEvent = NamedStruct('ObjectEvent', '<HHHHHHhHHHhhHHl', (
    'id',
    'ovid',
    'mvt',
    'type',
    'flag',
    'scr',
    'dirn',
    'eye',
    'unk10',
    'tsure_poke_color',
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

assert BgEvent.size == 20, BgEvent.size
assert ObjectEvent.size == 32, ObjectEvent.size
assert WarpEvent.size == 12, WarpEvent.size
assert CoordEvent.size == 16, CoordEvent.size


class ScriptParserBase(abc.ABC):
    def __init__(self, header: str, raw: bytes, prefix='_EV'):
        self.c_header = header
        self.raw = raw
        self.prefix = prefix
        self.is_parsed = False

    @abc.abstractmethod
    def parse_all(self):
        return NotImplemented

    @abc.abstractmethod
    def __str__(self):
        return NotImplemented

    def __repr__(self):
        return f'<{self.__class__.__name__}(raw=bytes({len(self.raw)}), prefix={self.prefix!r})>'


class NormalScriptParser(ScriptParserBase):
    def __init__(self, header: str, raw: bytes, events: str, gmm: str, prefix='_EV'):
        super().__init__(header, raw, prefix)
        with open(os.path.join(os.path.dirname(__file__), 'scrcmd.json')) as jsonfp:
            scrcmds = json.load(jsonfp)
        self.constants = {key: parse_c_header(os.path.join(project_root, value['header']), value['prefix']) for key, value in scrcmds['argtypes'].items()}
        self.constants['stdscr'] |= {
            x + 2999: f'std_trainer({y})' for x, y in self.constants['trainer'].items()
        } | {
            x + 4999: f'std_trainer_2({y})' for x, y in self.constants['trainer'].items()
        }
        self.commands: list[dict[str, Union[str, int, list[int], dict[str, list[int]]]]] = scrcmds.get('commands', [])
        self.commands_d = {x['name']: x for x in self.commands}
        self.movement_cmds = scrcmds.get('movement_commands', [])
        self.exported = []
        self.labels = {}
        self.lines = {}
        self.movement_scripts = set()
        self.header_end = 0
        self.pc_history = []

        self.messages = []
        self.objects = [
            (253, 'obj_partner_poke'),
            (255, 'obj_player'),
        ]
        self.events_json = events
        if gmm:
            self.messages = [row.get('id') for row in ElementTree.parse(gmm).iter('row')]
            self.gmm_header = os.path.relpath(gmm.replace('.gmm', '.h'), os.path.join(project_root, 'files'))
        else:
            self.gmm_header = None

        # Convenience macros
        def handle_itemspace(macro, *arg_idxs):
            itemgrp, quantgrp, *_ = arg_idxs

            def inner(m: re.Match):
                grps = list(m.groups())
                if grps[itemgrp].isnumeric():
                    grps[itemgrp] = self.constants['item'].get(int(grps[itemgrp]), grps[itemgrp])
                return f'\t{macro} {", ".join(grps[i] for i in arg_idxs)}\n'
            return inner

        def replace_case_compare(m: re.Match):
            case = m[1]
            if case.isnumeric():
                case = int(case)
                if case >= 0x8000:
                    case -= 0x10000
            return f'\tcase {case}, {m[2]}\n'

        self.macros = [
            (re.compile(
                r'\t(set|copy)var VAR_SPECIAL_x8004, (\w+)\n'
                r'\t(set|copy)var VAR_SPECIAL_x8005, (\w+)\n'
                r'\tcallstd std_give_item_verbose\n'
            ), handle_itemspace('giveitem_no_check', 1, 3)),
            (re.compile(
                r'\t(set|copy)var VAR_SPECIAL_x8004, (\w+)\n'
                r'\t(set|copy)var VAR_SPECIAL_x8005, (\w+)\n'
                r'\ttakeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT\n'
            ), handle_itemspace('takeitem_no_check', 1, 3)),
            (re.compile(
                r'\t(set|copy)var VAR_SPECIAL_x8004, (\w+)\n'
                r'\t(set|copy)var VAR_SPECIAL_x8005, (\w+)\n'
                r'\thasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT\n'
                r'\tcompare_var_to_value VAR_SPECIAL_RESULT, 0\n'
                r'\tgoto_if eq, (\w+)\n'
            ), handle_itemspace('goto_if_no_item_space', 1, 3, 4)),
            (re.compile(
                r'\t(set|copy)var VAR_SPECIAL_x8004, (\w+)\n'
                r'\t(set|copy)var VAR_SPECIAL_x8005, (\w+)\n'
                r'\thasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT\n'
                r'\tcomparevartovalue VAR_SPECIAL_RESULT, 1\n'
                r'\tgoto_if ne, (\w+)\n'
            ), handle_itemspace('goto_if_no_item_space_2', 1, 3, 4)),
            (re.compile(
                r'\tcopyvar VAR_SPECIAL_x8008, (\w+)\n'
            ), r'\tswitch \1\n'),
            (re.compile(
                r'\tcompare_var_to_value VAR_SPECIAL_x8008, (\w+)\n'
                r'\tgoto_if eq, (\w+)\n'
            ), replace_case_compare),
            (re.compile(
                r'\tcompare_var_to_(var|value) '
            ), '\tcompare '),
            (re.compile(
                r'\tcheckflag (\w+)\n'
                r'\t(goto|call)_if FALSE, (\w+)\n'
            ), r'\t\2_if_unset \1, \3\n'),
            (re.compile(
                r'\tcheckflag (\w+)\n'
                r'\t(goto|call)_if TRUE, (\w+)\n'
            ), r'\t\2_if_set \1, \3\n'),
            (re.compile(
                r'\t(goto|call)_if (eq|ne|lt|le|gt|ge), (\w+)\n'
            ), r'\t\1_if_\2 \3\n'),
            (re.compile(
                r'\tchecktrainerflag (\w+)\n'
                r'\t(goto|call)_if TRUE, (\w+)\n'
            ), r'\t\2_if_defeated \1, \3\n'),
            (re.compile(
                r'\tchecktrainerflag (\w+)\n'
                r'\t(goto|call)_if FALSE, (\w+)\n'
            ), r'\t\2_if_not_defeated \1, \3\n'),
            (re.compile(
                r'\tplay_se SEQ_SE_DP_SELECT\n'
                r'\tlockall\n'
                r'\tfaceplayer\n'
                r'\tnpc_msg (\w+)\n'
                r'\twait_button_or_walk_away\n'
                r'\tclosemsg\n'
                r'\treleaseall\n'
            ), r'\tsimple_npc_msg \1\n'),
        ]

    def get_object(self, id_: int):
        for i, name in self.objects:
            if i == id_:
                return name
        # warnings.warn(f'{self.prefix}: failed to find object ident {id_}')
        return str(id_)

    def parse_header(self):
        for i in range(0, len(self.raw), 4):
            if self.raw[i:i + 2] == b'\x13\xfd':
                self.header_end = i + 2
                break
            self.exported.append(int.from_bytes(self.raw[i:i + 4], 'little') + i + 4)
            assert(self.exported[-1] < len(self.raw))
        if self.header_end != 4 * len(self.exported) + 2:
            raise ValueError('malformatted script file')
        self.labels |= {addr: False for addr in self.exported}

    def make_events_json(self):
        if not self.events_json:
            return

        def scr_get(id_):
            if id_ in self.constants['stdscr']:
                return self.constants['stdscr'][id_]
            if 0 <= id_ - 1 < len(self.exported):
                return f'_EV_{self.prefix}_{id_ - 1:03d} + 1'
            return id_

        ret = {'header': self.c_header}
        with open(self.events_json.replace('.json', '.bin'), 'rb') as fp:
            nbg = int.from_bytes(fp.read(4), 'little')
            bgs = list(BgEvent.iter_unpack(fp.read(nbg * BgEvent.size)))
            nob = int.from_bytes(fp.read(4), 'little')
            obs = list(ObjectEvent.iter_unpack(fp.read(nob * ObjectEvent.size)))
            nwp = int.from_bytes(fp.read(4), 'little')
            wps = list(WarpEvent.iter_unpack(fp.read(nwp * WarpEvent.size)))
            ncd = int.from_bytes(fp.read(4), 'little')
            cds = list(CoordEvent.iter_unpack(fp.read(ncd * CoordEvent.size)))

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
            obj_prefix = self.prefix.replace('scr_seq_', 'obj_')
            seen_objects = collections.Counter()
            for obj in obs:
                sprite = self.constants['sprites'][obj.ovid].replace('SPRITE_', '').lower()
                obj_name = f'{obj_prefix}_{sprite}'
                seen_objects[obj_name] += 1
                if seen_objects[obj_name] > 1:
                    obj_name = f'{obj_name}_{seen_objects[obj_name]}'
                self.objects.append((obj.id, obj_name))

            ret['objects'] = [
                {
                    'id': self.objects[i + 2][1],
                    'ovid': self.constants['sprites'][ob.ovid],
                    'mvt': ob.mvt,
                    'type': ob.type,
                    'flag': self.constants['flag'][ob.flag],
                    'scr': scr_get(ob.scr),
                    'dirn': ob.dirn,
                    'eye': ob.eye,
                    'unk10': ob.unk10,
                    'tsure_poke_color': ob.tsure_poke_color,
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
                    'header': self.constants['maps'].get(wp.header, wp.header),
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
                    'var': self.constants['var'][cd.var]
                } for cd in cds
            ]
        with open(self.events_json, 'wt') as ofp:
            json.dump(ret, ofp, indent=2)

    def get_arg(self, size: typing.Union[int, str], pc: int) -> tuple[typing.Union[int, str], int]:
        if isinstance(size, int):
            assert size in [1, 2, 4]
            return int.from_bytes(self.raw[pc:pc + size], 'little'), pc + size
        match size:
            case 'object1' | 'object2':
                try:
                    size = int(size[-1])
                    value = int.from_bytes(self.raw[pc:pc + size], 'little')
                    pc += size
                    if size == 2 and value in self.constants['var']:
                        return self.constants['var'][value], pc
                    return self.get_object(value), pc
                except Exception:
                    traceback.print_exc()
                    exit(1)
            case 'message':
                value = int.from_bytes(self.raw[pc:pc + 1], 'little')
                pc += 1
                assert value < len(self.messages)
                return self.messages[value], pc
            case 'message_var':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                if value in self.constants['var']:
                    return self.constants['var'][value], pc
                assert value < len(self.messages)
                return self.messages[value], pc
            case 'bool1' | 'bool2' | 'bool4':
                size = int(size[-1])
                value = int.from_bytes(self.raw[pc:pc + size], 'little')
                pc += size
                return ['FALSE', 'TRUE'][value], pc
            case 'hex1' | 'hex2' | 'hex4':
                size = int(size[-1])
                value = int.from_bytes(self.raw[pc:pc + size], 'little')
                pc += size
                return (f'0x{{:0{size * 2}X}}').format(value), pc
            case 'addr' | 'script' | 'movement':
                value = int.from_bytes(self.raw[pc:pc + 4], 'little')
                pc += 4
                value += pc
                value &= 0xFFFFFFFF
                assert self.header_end <= value < len(self.raw)
                if size == 'movement':
                    self.movement_scripts.add(value)
                if value not in self.labels:
                    self.labels[value] = (size != 'script')
                else:
                    self.labels[value] |= (size != 'script')
                return self.make_label(value), pc
            case 'condition':
                value = self.raw[pc]
                pc += 1
                if len(self.pc_history) >= 2 and value < 2 and self.lines[self.pc_history[-2]][0] in ('checkflag', 'checktrainerflag'):
                    conds = ['FALSE', 'TRUE']
                else:
                    conds = ['lt', 'eq', 'gt', 'le', 'ge', 'ne']
                return conds[value], pc
            case 'var' | 'flag':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                return self.constants[size].get(value, value), pc
            case 'species' | 'item' | 'move' | 'sound' | 'ribbon' | 'stdscr' | 'trainer' | 'phone_contact' | 'spawn' | 'maps' | 'badge' | 'direction':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                return self.constants['var'].get(value, self.constants[size].get(value, value)), pc
            case 'rgb':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                if value == 0:
                    ret = 'RGB_BLACK'
                elif value == 0x7FFF:
                    ret = 'RGB_WHITE'
                else:
                    r = value & 0x1F
                    g = (value >> 5) & 0x1F
                    b = (value >> 10) & 0x1F
                    ret = f'RGB({r}, {g}, {b})'
                    if value & 0x8000:
                        ret += ' | 0x8000'
                return ret, pc
            case 'player_transition':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                if value == 0:
                    ret = '0'
                else:
                    ret = ' | '.join(key for mask, key in self.constants['player_transition'].items() if value & mask)
                return ret, pc
            case _:
                raise ValueError('unknown arg type: ' + size)
    
    def parse_script(self, pc: int, warn=True):
        self.pc_history.clear()
        while not self.labels.get(pc, False) and pc < len(self.raw):
            if pc in self.labels:
                self.labels[pc] = True
            self.pc_history.append(pc)
            cmd_i = int.from_bytes(self.raw[pc:pc + 2], 'little')
            if cmd_i >= len(self.commands):
                if warn:
                    warnings.warn(f'script parser hit illegal command {cmd_i} at position {pc} ({self.prefix})')
                return False
            pc += 2
            args = []
            cmd_struct = self.commands[cmd_i]
            name = cmd_struct['name']
            arg_sizes = cmd_struct['args']
            special = cmd_struct.get('cases')
            switch_arg: Optional[int] = cmd_struct.get('switch_arg')
            try:
                for size in arg_sizes:
                    arg, pc = self.get_arg(size, pc)
                    args.append(arg)
                if special is not None and switch_arg is not None:
                    for size in special[str(args[switch_arg])]:
                        arg, pc = self.get_arg(size, pc)
                        args.append(arg)
            except (ValueError, KeyError):
                if warn:
                    warnings.warn(f'script parser hit illegal command args to {cmd_i} at position {self.pc_history[-1]} '
                                  f'(command {name}, arg {len(args)}, last good arg: {None if not args else args[-1]}) ({self.prefix})')
                return True
            self.lines[self.pc_history[-1]] = (name, args, pc)
            if cmd_struct.get('is_abs_branch'):
                break
        return False

    def parse_all(self):
        self.parse_header()
        self.make_events_json()
        while not all(self.labels.values()):
            for label in sorted(self.labels):
                self.parse_script(label)
        self.is_parsed = True
        return self

    def make_gap_internal(self, pc, nextpc):
        if pc == nextpc:
            return ''
        s = ''
        if pc in self.movement_scripts:
            if pc & 1:
                pc += 1
            while pc < nextpc:
                cmd = int.from_bytes(self.raw[pc:pc + 2], 'little')
                if cmd == 254:
                    s += '\tstep_end\n'
                    pc += 4
                    break
                if cmd < len(self.movement_cmds):
                    cmd = self.movement_cmds[cmd]
                duration = int.from_bytes(self.raw[pc + 2:pc + 4], 'little')
                s += f'\tstep {cmd}, {duration}\n'
                pc += 4
            if pc == nextpc:
                return s
        if pc & 15:
            gap = min(16 - (pc & 15), nextpc - pc)
            s += '\t.byte ' + ', '.join(map('0x{:02x}'.format, self.raw[pc:pc + gap])) + '\n'
            pc += gap
        while pc < nextpc:
            gap = min(16, nextpc - pc)
            s += '\t.byte ' + ', '.join(map('0x{:02x}'.format, self.raw[pc:pc + gap])) + '\n'
            pc += gap
        return s

    def make_gap(self, pc, nextpc):
        if pc == nextpc or (nextpc == len(self.raw) and all(x == 0 for x in self.raw[pc:nextpc])):
            return ''
        s = ''
        labels = sorted({x for x in self.labels if pc <= x < nextpc} | {pc, nextpc})
        for x, y in zip(labels[:-1], labels[1:]):
            if (label := self.make_label(x)) is not None:
                s += f'\n{label}:\n'
            s += self.make_gap_internal(x, y)
        return s

    def make_label(self, addr: int):
        if addr in self.exported:
            return f'{self.prefix}_{self.exported.index(addr):03d}'
        if addr in self.labels:
            return f'_{addr:04X}'

    def __str__(self):
        if not self.is_parsed:
            return repr(self)
        s = '#include "constants/scrcmd.h"\n'
        if self.c_header is not None:
            s += f'#include "{self.c_header}"\n'
        if self.gmm_header is not None:
            s += f'#include "{self.gmm_header}"\n'
        s += '\t.include "asm/macros/script.inc"\n\n'
        s += '\t.rodata\n\n'
        for i, addr in enumerate(self.exported):
            s += f'\tscrdef {self.prefix}_{i:03d}\n'
        s += '\tscrdef_end\n\n'
        if not self.lines:
            s += self.make_gap(self.header_end, len(self.raw))
        else:
            if self.header_end not in self.lines:
                s += self.make_gap(self.header_end, min(self.lines))
            lines = sorted(self.lines.items())
            lines.append((len(self.raw), ('', [], -1)))
            for i, (pc, (name, args, nextpc)) in enumerate(lines[:-1]):
                if pc != nextpc:
                    args = list(args)
                    if (label := self.make_label(pc)) is not None:
                        if self.exported.count(pc) > 1:
                            for idx, addr in enumerate(self.exported):
                                if addr == pc:
                                    s += f'{self.prefix}_{idx:03d}:\n'
                        else:
                            s += f'{label}:\n'
                    if args:
                        s += f'\t{name} ' + ', '.join(map(str, args)) + '\n'
                    else:
                        s += f'\t{name}\n'
                    if nextpc in self.labels and name in self.commands_d and self.commands_d[name].get('is_abs_branch'):
                        s += '\n'
                if nextpc != lines[i + 1][0]:
                    s += self.make_gap(nextpc, lines[i + 1][0])
        s += '\t.balign 4, 0\n'
        for pattern, replacement in self.macros:
            s = pattern.sub(replacement, s)
        return s

    def make_header(self):
        s = f'#ifndef {self.prefix.upper()}_H_\n'
        s += f'#define {self.prefix.upper()}_H_\n\n'
        for i, addr in enumerate(self.exported):
            name = f'_EV_{self.prefix}_{i:03d}'
            s += f'#define {name:<32s} {i: 5d}\n'
        s += '\n'
        for i, name in self.objects:
            if i not in (253, 255):
                s += f'#define {name:<32s} {i: 5d}\n'
        s += f'\n#endif //{self.prefix.upper()}_H_\n'
        return s


class SpecialScriptParser(ScriptParserBase):
    def __init__(self, header: str, raw: bytes, prefix='_EV'):
        super().__init__(header, raw, prefix)
        header_path = os.path.join(os.path.dirname(__file__), '../..')
        self.vars = parse_c_header(os.path.join(header_path, 'include/constants/vars.h'), 'VAR_')
        self.std_scripts = parse_c_header(os.path.join(header_path, 'include/constants/std_script.h'), 'std_')
        self.map_scripts = parse_c_header(os.path.join(project_root, 'files', self.c_header), '_EV_')
        self.table: list[tuple[int, int, int]] = []
        self.init_offset: int = -1
        self.init_vars: list[tuple[int, int, int]] = []

    def parse_all(self):
        i = 0
        for i in range(0, len(self.raw), 5):
            if self.raw[i] == 0:
                break
            if self.raw[i] == 1:
                self.init_offset = i + 5 + int.from_bytes(self.raw[i + 1:i + 5], 'little')
                self.table.append((1, -1, -1))
            else:
                self.table.append((
                    self.raw[i],
                    int.from_bytes(self.raw[i + 1:i + 3], 'little'),
                    int.from_bytes(self.raw[i + 3:i + 5], 'little')
                ))
        if self.init_offset != -1:
            for i in range(self.init_offset, len(self.raw), 6):
                if (a := int.from_bytes(self.raw[i:i + 2], 'little')) == 0:
                    break
                self.init_vars.append((
                    a,
                    int.from_bytes(self.raw[i + 2:i + 4], 'little'),
                    int.from_bytes(self.raw[i + 4:i + 6], 'little')
                ))
            i += 2
        else:
            i += 1
        assert ((i + 3) & ~3) == len(self.raw)
        self.is_parsed = True
        return self

    def get_script(self, id_):
        if 0 <= id_ - 1 < len(self.map_scripts):
            return f'{self.map_scripts[id_ - 1]} + 1'
        return self.std_scripts.get(id_, id_)

    def __str__(self):
        if not self.is_parsed:
            return repr(self)
        s = '#include "constants/scrcmd.h"\n'
        if self.c_header is not None:
            s += f'#include "{self.c_header}"\n'
        s += '\t.rodata\n\t.option alignment off\n\n'
        for kind, val1, val2 in self.table:
            if kind == 1:
                s += f'\t.byte 1\n\t.word {self.prefix}_map_scripts_2-.-4\n'
            else:
                val1 = self.get_script(val1)
                s += f'\t.byte {kind}\n\t.short {val1}, {val2}\n'
        s += '\t.byte 0\n\n'
        if self.init_offset != -1:
            s += f'{self.prefix}_map_scripts_2:\n'
            for flex1, flex2, script in self.init_vars:
                script = self.get_script(script)
                s += f'\t.short {self.vars.get(flex1, flex1)}, {self.vars.get(flex2, flex2)}, {script}\n'
            s += '\t.short 0\n\n'
        s += '\t.balign 4, 0\n'
        return s


def parse_map(events, scripts, header, gmm):
    if events:
        events = os.path.join(project_root, events)
    scripts = os.path.join(project_root, scripts)
    scripts_bin = os.path.splitext(scripts)[0] + '.bin'
    if header:
        header = os.path.join(project_root, header)
        header_bin = os.path.splitext(header)[0] + '.bin'
    else:
        header_bin = None
    gmm = os.path.join(project_root, gmm)
    scr_pref = os.path.splitext(os.path.basename(scripts))[0]
    scr_pref = re.sub(r'scr_seq_\d{4}_', 'scr_seq_', scr_pref)

    if not events or 'DUMMY' in events:
        c_header_abs = (re.sub(r'scr_seq_\d{4}_', 'scr_seq_', os.path.splitext(scripts)[0]) + '.h').replace('scr_seq_', 'event_')
    else:
        c_header_abs = re.sub(r'eventdata/zone_event/\d{3}_', 'script/scr_seq/event_', os.path.splitext(events)[0] + '.h')
    c_header = os.path.relpath(c_header_abs, os.path.join(project_root, 'files'))
    assert not c_header.startswith('..')
    with open(scripts_bin, 'rb') as fp:
        parser = NormalScriptParser(c_header, fp.read(), events, gmm, prefix=scr_pref).parse_all()
    with open(scripts, 'wt') as ofp:
        print(parser, file=ofp, end='')
    with open(c_header_abs, 'wt') as ofp:
        print(parser.make_header(), file=ofp, end='')
    if header:
        with open(header_bin, 'rb') as fp:
            h_parser = SpecialScriptParser(c_header, fp.read(), prefix=scr_pref).parse_all()
        with open(header, 'wt') as ofp:
            print(h_parser, file=ofp, end='')


def main():
    with open(os.path.join(os.path.dirname(__file__), 'event_mapping.csv')) as fp:
        for row in progressbar(csv.reader(fp)):
            parse_map(*row)


if __name__ == '__main__':
    main()
