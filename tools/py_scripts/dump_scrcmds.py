import json
import os
import typing
import warnings
import enum
import abc
import re

from typing import Union, BinaryIO, TextIO, Optional
import argparse


def parse_c_header(filename: str, prefix='') -> dict[int, str]:
    with open(filename) as fp:
        data = fp.read()
    pat = re.compile(rf'#define\s+({prefix}\w+)\s+(\d+|0x[0-9a-fA-F]+)\n')
    return {int(m[2], 0): m[1] for m in pat.finditer(data)}


class ScriptType(enum.Enum):
    normal = 0
    special = 1

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


class ScriptParserBase(abc.ABC):
    def __init__(self, raw: bytes, prefix='_EV'):
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
    def __init__(self, raw: bytes, prefix='_EV'):
        super().__init__(raw, prefix)
        with open(os.path.join(os.path.dirname(__file__), 'scrcmd.json')) as jsonfp:
            scrcmds = json.load(jsonfp)
        header_path = os.path.join(os.path.dirname(__file__), '../..')
        self.constants = {
            'var': parse_c_header(os.path.join(header_path, 'include/constants/vars.h'), 'VAR_'),
            'flag': parse_c_header(os.path.join(header_path, 'include/constants/flags.h'), 'FLAG_'),
            'species': parse_c_header(os.path.join(header_path, 'include/constants/species.h'), 'SPECIES_'),
            'item': parse_c_header(os.path.join(header_path, 'include/constants/items.h'), 'ITEM_'),
            'move': parse_c_header(os.path.join(header_path, 'include/constants/moves.h'), 'MOVE_'),
            'sound': parse_c_header(os.path.join(header_path, 'include/constants/sndseq.h'), 'SEQ_')
        }
        self.commands: list[dict[str, Union[str, int, list[int], dict[str, list[int]]]]] = scrcmds.get('commands', [])
        self.commands_d = {x['name']: x for x in self.commands}
        self.exported = []
        self.labels = {}
        self.lines = {}
        self.header_end = 0
    
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

    def get_arg(self, size: typing.Union[int, str], pc: int) -> tuple[typing.Union[int, str], int]:
        if isinstance(size, int):
            assert size in [1, 2, 4]
            return int.from_bytes(self.raw[pc:pc + size], 'little'), pc + size
        match size:
            case 'addr' | 'script':
                value = int.from_bytes(self.raw[pc:pc + 4], 'little')
                pc += 4
                value += pc
                value &= 0xFFFFFFFF
                assert self.header_end <= value < len(self.raw)
                if value not in self.labels:
                    self.labels[value] = (size == 'addr')
                else:
                    self.labels[value] |= (size == 'addr')
                return f'{self.prefix}_{value:08X}', pc
            case 'condition':
                value = self.raw[pc]
                pc += 1
                return ['lt', 'eq', 'gt', 'le', 'ge', 'ne'][value], pc
            case 'var' | 'flag':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                return self.constants[size].get(value, value), pc
            case 'species' | 'item' | 'move' | 'sound':
                value = int.from_bytes(self.raw[pc:pc + 2], 'little')
                pc += 2
                return self.constants['var'].get(value, self.constants[size].get(value, value)), pc
            case _:
                raise ValueError('unknown arg type: ' + size)
    
    def parse_script(self, pc: int):
        if self.labels[pc]:
            return
        while pc < len(self.raw):
            if pc in self.labels:
                self.labels[pc] = True
            prev_pc = pc
            cmd_i = int.from_bytes(self.raw[pc:pc + 2], 'little')
            if cmd_i >= len(self.commands):
                warnings.warn(f'script parser hit illegal command {cmd_i} at position {pc}')
                break
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
                warnings.warn(f'script parser hit illegal command args to {cmd_i} at position {prev_pc} '
                              f'(arg {len(args)}, last good arg: {None if not args else args[-1]})')
                break
            self.lines[prev_pc] = (name, args, pc)
            if cmd_struct.get('is_abs_branch'):
                break
        
    def parse_all(self):
        self.parse_header()
        while not all(self.labels.values()):
            for label in sorted(self.labels):
                self.parse_script(label)
        self.is_parsed = True

    def make_gap_internal(self, pc, nextpc):
        if pc == nextpc:
            return ''
        s = ''
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
        labels = sorted({x for x in self.labels if pc <= x < nextpc})
        for x, y in zip([pc] + labels, labels + [nextpc]):
            if x in labels:
                s += f'\n{self.prefix}_{x:08X}:\n'
            s += self.make_gap_internal(x, y)
        return s

    def __str__(self):
        if not self.is_parsed:
            return repr(self)
        s = '#include "constants/scrcmd.h\n'
        s += '\t.include "asm/macros/script.inc"\n\n'
        s += '\t.rodata\n\n'
        for i, addr in enumerate(self.exported):
            s += f'\tscrdef {self.prefix}_{addr:08X} ; {i:03d}\n'
        s += '\tscrdef_end\n\n'
        if not self.lines:
            s += self.make_gap(self.header_end, len(self.raw))
            return s
        if self.header_end not in self.lines:
            s += self.make_gap(self.header_end, min(self.lines))
        lines = sorted(self.lines.items())
        lines.append((len(self.raw), ('', [], -1)))
        for i, (pc, (name, args, nextpc)) in enumerate(lines[:-1]):
            args = list(args)
            if pc in self.labels:
                s += f'{self.prefix}_{pc:08X}:\n'
            if args:
                s += f'\t{name} ' + ', '.join(map(str, args)) + '\n'
            else:
                s += f'\t{name}\n'
            if lines[i + 1][0] in self.labels and self.commands_d[name].get('is_abs_branch'):
                s += '\n'
            if nextpc != lines[i + 1][0]:
                s += self.make_gap(nextpc, lines[i + 1][0])
        s += '\t.balign 4, 0\n'
        return s


class SpecialScriptParser(ScriptParserBase):
    def __init__(self, raw: bytes, prefix='_EV'):
        super().__init__(raw, prefix)
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

    def __str__(self):
        if not self.is_parsed:
            return repr(self)
        s = '\t.rodata\n\t.option alignment off\n\n'
        for kind, val1, val2 in self.table:
            if kind == 1:
                s += f'\t.byte 1\n\t.word {self.prefix}_{self.init_offset:04X}-.-5\n'
            else:
                s += f'\t.byte {kind}\n\t.short {val1}, {val2}\n'
        s += '\t.byte 0\n\n'
        if self.init_offset != -1:
            s += f'{self.prefix}_{self.init_offset:04X}:\n'
            for flex1, flex2, script in self.init_vars:
                s += f'\t.short {flex1}, {flex2}, {script}\n'
            s += '\t.short 0\n\n\t.balign 4, 0\n'
        return s


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('binfile', type=argparse.FileType('rb'))
    parser.add_argument('scrfile', type=argparse.FileType('w'), nargs='?')
    parser.add_argument('name', nargs='?')
    parser.add_argument('--mode', type=ScriptType.convert, default=ScriptType.normal)
    args = parser.parse_args(namespace=Namespace())

    if args.scrfile is None:
        scrfname = os.path.splitext(args.binfile.name)[0] + '.s'
        args.scrfile = argparse.FileType('w')(scrfname)
    if args.name is None:
        args.name = os.path.splitext(os.path.basename(args.binfile.name))[0]

    if args.mode is ScriptType.normal:
        cls = NormalScriptParser
    elif args.mode is ScriptType.special:
        cls = SpecialScriptParser
    else:
        raise TypeError(args.mode)
    parser = cls(args.binfile.read(), args.name)
    parser.parse_all()
    print(parser, file=args.scrfile, end='')


if __name__ == '__main__':
    main()
