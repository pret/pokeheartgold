import collections
import json
import os.path
import re


# Design spec
# Read the names of all script commands from asm/fieldmap_s.s::gScriptCmdTable
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
    pat = re.compile(rf'^BOOL (?P<symbol>{"|".join(syms)})\(ScriptContext\s*\*\s*ctx\) {{')
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
    project_root = os.path.join(os.path.dirname(__file__), '../..')
    with open(os.path.join(project_root, 'asm/fieldmap_s.s')) as fp:
        # seek to gScriptCommandTable
        for line in fp:
            if line.startswith('gScriptCmdTable:'):
                break
        # read the pointer table
        while (line := next(fp)).startswith('\t.word'):
            scrcmds.append([line.split()[1], []])

    pat = re.compile(r'\s+[0-9A-F]{8}\s+[0-9A-F]{8}\s+\.text\s+(?P<symbol>\w+)\s+\((?P<object>\S+)\)')
    with open(os.path.join(project_root, 'build/heartgold.us/main.elf.xMAP')) as fp:
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

    def keyfix(key: str):
        key = key.replace('ScrCmd_', '').lower()
        if key.isnumeric():
            key = f'scrcmd_{key}'
        return key

    print(json.dumps({'commands': [{'name': keyfix(key), 'args': args} for key, args in scrcmds]}, indent=2))


if __name__ == '__main__':
    main()
