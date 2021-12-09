import collections
import glob
import os.path
import re


# Design spec
# Read the names of all script commands from asm/fieldmap.s::gScriptCmdTable
# Look up each of them in the xmap
# Load the C or ASM file
# Track calls to GetScriptByte, GetScriptHalfword, and GetScriptWord
class ScriptReadByteStateMachine:
    _state: int

    def __init__(self):
        self.reset()
        self._regs = {'r0'}
        self._rdbyte_reg = ''
        self._next_rdbyte_reg = ''

    def reset(self):
        self._state = 0

    def process(self, line: str) -> bool:
        insn = re.match(r'\t(?P<opcode>\w+) (?P<args>(\S+?(, )?)+)', line)
        if insn is None:
            return False
        opcode = insn['opcode']
        args = insn['args'].split(', ')
        if opcode == 'add' and args[1] in self._regs and len(args) == 3 and args[2] == '#0':
            self._regs.add(args[0])
        elif opcode == 'mov' and args[1] in self._regs:
            self._regs.add(args[0])
        elif opcode in ('bl', 'blx'):
            self._regs -= {'r0', 'r1', 'r2', 'r3'}
            if self._rdbyte_reg in {'r0', 'r1', 'r2', 'r3'}:
                self._rdbyte_reg = ''
        elif not opcode.startswith('str'):
            self._regs -= {args[0]}
        if opcode == 'ldr' and len(args) == 3 and args[1][1:] in self._regs and args[2] == '#8]':
            self._rdbyte_reg = args[0]
        elif opcode == 'add' and len(args) == 3 and args[1] == self._rdbyte_reg and args[2] == '#1':
            self._rdbyte_reg = args[0]
            return True
        elif self._rdbyte_reg == args[0] and not opcode.startswith('str'):
            self._rdbyte_reg = ''
        return False


def parse_args_asm_single(fp):
    args = []
    machine = ScriptReadByteStateMachine()
    while not (line := next(fp)).startswith('\tthumb_func_end'):
        # Parse the instruction
        # If it is a move instruction, add the dest to ctx_reg
        # If a ctx_reg is overwritten, remove it
        # Look for the ScriptReadByte macro
        if machine.process(line):
            args.append(1)
        elif 'ScriptReadHalfword' in line:
            args.append(2)
        elif 'ScriptReadWord' in line:
            args.append(4)
    return args


def parse_args_c_single(fp):
    args = []
    while (line := next(fp)) != '}\n':
        if 'ScriptReadByte' in line:
            args.append(1)
        elif 'ScriptReadHalfword' in line:
            args.append(2)
        elif 'ScriptReadWord' in line:
            args.append(4)
    return args


def parse_args_asm(scrcmds, filename, syms):
    pat = re.compile(rf'^(?P<symbol>{"|".join(syms)}):')
    with open(filename) as fp:
        for line in fp:
            if (m := pat.match(line)) is not None:
                args = parse_args_asm_single(fp)
                for x in scrcmds:
                    if x[0] == m['symbol']:
                        x[1] = args


def parse_args_c(scrcmds, filename, syms):
    pat = re.compile(rf'^BOOL (?P<symbol>{"|".join(syms)})\(SCRIPTCONTEXT\s*\*\s*ctx\) {{')
    with open(filename) as fp:
        for line in fp:
            if (m := pat.match(line)) is not None:
                args = parse_args_c_single(fp)
                for x in scrcmds:
                    if x[0] == m['symbol']:
                        x[1] = args


def main():
    scrcmds = []
    objects = collections.defaultdict(list)
    with open('asm/fieldmap.s') as fp:
        # seek to gScriptCommandTable
        for line in fp:
            if line.startswith('gScriptCmdTable:'):
                break
        # read the pointer table
        while (line := next(fp)).startswith('\t.word'):
            scrcmds.append([line.split()[1], []])

    pat = re.compile(r'\s+[0-9A-F]{8}\s+[0-9A-F]{8}\s+\.text\s+(?P<symbol>\w+)\s+\((?P<object>\S+)\)')
    with open('build/heartgold.us/main.nef.xMAP') as fp:
        for line in fp:
            if (m := pat.match(line)) is not None and any(x[0] == m['symbol'] for x in scrcmds):
                objects[m['object']].append(m['symbol'])

    for obj, syms in objects.items():
        if os.path.exists(filename := os.path.join('asm', obj.replace('.o', '.s'))):
            parse_args_asm(scrcmds, filename, syms)
        elif os.path.exists(filename := os.path.join('src', obj.replace('.o', '.c'))):
            parse_args_c(scrcmds, filename, syms)
        else:
            raise OSError('no source file found for %s' % obj)

    # Special case: scrcmd 465
    # Calls and jumps
    call_jumps = {
        22: 0,
        23: 1,
        24: 1,
        25: 1,
        26: 0,
        28: 1,
        29: 1,
        225: 0
    }

    os.system('tools/knarc/knarc -d files/fielddata/script/scr_seq -u files/fielddata/script/scr_seq.narc')
    for file in glob.glob('files/fielddata/script/scr_seq/scr_seq_*.bin'):
        bname = os.path.basename(file).replace('.bin', '')
        print(bname)
        with open(file, 'rb') as fp, open(file.replace('.bin', '.s'), 'wt') as ofp:
            offsets = []
            print('\t.include "macros/script.inc"', file=ofp)
            print('\t.text', file=ofp)
            while (word := fp.read(4)) != b'' and (offset := int.from_bytes(word, 'little')) & 0xFFFF != 0xFD13:
                offset += fp.tell()
                print(f'\tscrdef {bname}_{offset:04X}', file=ofp)
                offsets.append(offset)

            fp.seek(-2, os.SEEK_CUR)
            print('\tscrdef_end\n', file=ofp)
            if fp.tell() not in offsets:
                ofp.truncate(0)
                continue
            addr = fp.tell()
            lines = {}
            while (short := fp.read(2)) != b'':
                cmd = int.from_bytes(short, 'little')
                if cmd >= len(scrcmds):
                    fp.seek(-2, os.SEEK_CUR)
                    if fp.tell() & 15:
                        ba = fp.read(16 - (fp.tell() & 15))
                        lines[addr] = f'\t.byte {", ".join("0x%02X" % b for b in ba)}'
                        addr = fp.tell()
                    while (ba := fp.read(16)) != b'':
                        lines[addr] = f'\t.byte {", ".join("0x%02X" % b for b in ba)}'
                        addr = fp.tell()
                    break
                name, args = scrcmds[cmd]
        
                name = name.replace('ScrCmd_', '').replace('_', '').lower()
                if name.isnumeric():
                    name = f'scrcmd_{name}'
                params = []
                for i, arg in enumerate(args):
                    params.append(int.from_bytes(fp.read(arg), 'little'))
                    if cmd in call_jumps:
                        offsets.append(params[i] + fp.tell())
                    elif cmd == 465:
                        if params[0] != 6:
                            params.append(int.from_bytes(fp.read(2), 'little'))
                            if params[0] <= 3:
                                params.append(int.from_bytes(fp.read(2), 'little'))
                        break
                print(f'\t{name} {", ".join(map(str, params))}')
                lines[addr] = f'\t{name} {", ".join(map(str, params))}'
                if fp.tell() + 1 in offsets:
                    if fp.read(1) == b'\0':
                        lines[fp.tell() - 1] = '\t.byte 0'
                    else:
                        fp.seek(-1, os.SEEK_CUR)
                addr = fp.tell()
            for addr, line in sorted(lines.items()):
                if addr in offsets:
                    print(f'{bname}_{addr:04X}:', file=ofp)
                print(line, file=ofp)


if __name__ == '__main__':
    main()
