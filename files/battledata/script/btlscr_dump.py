from argparse import ArgumentParser
from collections.abc import Iterable
from enum import Enum
from pathlib import Path
from xml.etree import ElementTree as XML

import re

from consts import (
    Command,
    Battler,
    Label,
    MessageId,
    MessageTag,
    MonParamValue,
    VariableValue,
    PLAT_COMMANDS,
    HGSS_COMMANDS
)

TAGS_1_PARAM = set(map(MessageTag, range(MessageTag.TAG_NONE_SIDE_CONSCIOUS.value, MessageTag.TAG_NICKNAME_NICKNAME.value)))
TAGS_2_PARAMS = set(map(MessageTag, range(MessageTag.TAG_NICKNAME_NICKNAME.value, MessageTag.TAG_NICKNAME_NICKNAME_MOVE.value)))
TAGS_3_PARAMS = set(map(MessageTag, range(MessageTag.TAG_NICKNAME_NICKNAME_MOVE.value, MessageTag.TAG_NICKNAME_ABILITY_NICKNAME_MOVE.value)))
TAGS_4_PARAMS = set(map(MessageTag, range(MessageTag.TAG_NICKNAME_ABILITY_NICKNAME_MOVE.value, MessageTag.TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME.value)))

def count_message_params(tag: MessageTag) -> int:
    match tag:
        case _ if tag in TAGS_1_PARAM:
            return 1
        case _ if tag in TAGS_2_PARAMS:
            return 2
        case _ if tag in TAGS_3_PARAMS:
            return 3
        case _ if tag in TAGS_4_PARAMS:
            return 4
        case MessageTag.TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
            return 6
        case _:
            return 0

def parse_message_params(tag: MessageTag, chunks: Iterable[int]) -> list[str]:
    return list(map(lambda _: Battler(next(chunks)).name, range(count_message_params(tag))))

def format(param: any, chunks: Iterable, labels: dict, i: int, label_offset: int, gmm_bank: str) -> list[str]:
    params = []

    match param:
        case MessageTag():
            params.append(param.name)
            params.extend(parse_message_params(param, chunks))
        case MessageId():
            gmm_bank_parts = gmm_bank.split('_')
            gmm_bank_prefix = '_'.join([
                *gmm_bank_parts[:-1],
                f'{int(gmm_bank_parts[-1]):08}'
            ])
            params.append(f'{gmm_bank_prefix}_{param.id:05}')
        case Enum():
            params.append(param.name)
        case Label():
            label = f'_{(i + param.addr + label_offset):03}'
            labels[i + param.addr + label_offset + 1] = label
            params.append(label)
        case VariableValue():
            print(f'{param.param} -> {param.value}')
            params.append(param.name())
            params.append(param.value_s())
        case bool():
            params.append('TRUE' if param else 'FALSE')
        case _:
            params.append(str(param))
    
    return params

def count_varargs(param: any) -> int:
    match param:
        case VariableValue():
            return 1
        case MessageTag():
            return count_message_params(param)
        case _:
            return 0

def parse_commands(chunks: Iterable, cmd: list[Command], gmm_bank: str) -> tuple[list, dict]:
    parsed = []
    labels = {}
    i = 0

    for chunk in chunks:
        command = cmd[chunk]
        parsed.append(command.name)
        params = []
        j = sum(map(lambda type: 2 if type in (VariableValue, MonParamValue) else 1, command.params))

        for param_type in command.params:
            if param_type in (VariableValue, MonParamValue):
                param = param_type(next(chunks), next(chunks))
                j = j - 2
            else:
                param = param_type(next(chunks))
                j = j - 1
            
            i = i + 1 + count_varargs(param)
            params.extend(format(param, chunks, labels, i, j, gmm_bank))            
        
        parsed.append(params)
        i = i + 1
    
    return parsed, labels

def pairwise(it: Iterable) -> Iterable:
    a = iter(it)
    return zip(a, a)

STR_VAR_PAT = re.compile(r'\{STRVAR_1 \d+, (\d+), \d+\}')

def format_txt_string(param: str, txt_root: XML.Element) -> str:
    gmm_id = int(param.split('_')[-1])
    txt = txt_root[gmm_id].find('./language[@name="English"]').text \
            .replace('\\n', ' ') \
            .replace('\\f', ' ') \
            .replace('\\r', ' ') \
            .strip()
    
    while (match := STR_VAR_PAT.search(txt)):
        txt = re.sub(STR_VAR_PAT, f'{{{match.group(1)}}}', txt, 1)
    
    return txt

def dumps(scr: bytes, cmd: list[Command], txt_root: XML.Element, gmm_bank: str) -> str:
    chunks = []
    for i in range(len(scr) // 4):
        chunks.append(int.from_bytes(scr[(i * 4):((i+1) * 4)], 'little'))

    # First pass: parse to types, convert labels to strings, record future labels
    parsed, labels = parse_commands(iter(chunks), cmd, gmm_bank)

    # Second pass: output construction
    i = 0
    lines = [
        '    .include "macros/btlcmd.inc"',
        '',
        '    .data',
        '',
        '_000:',
    ]
    for command, params in pairwise(parsed):
        if i in labels:
            lines.append(f'\n{labels[i]}:')
        print(command)
        match command:
            case 'PrintMessage' | 'PrintGlobalMessage' | 'BufferMessage':
                lines.append(f'    // {format_txt_string(params[0], txt_root)}')
            case 'BufferLocalMessage':
                lines.append(f'    // {format_txt_string(params[1], txt_root)}')
        
        lines.append(f'    {command} {", ".join(params)}')
        i = i + len(params) + sum(map(count_varargs, params)) + 1
    
    lines.append('')
    return '\n'.join(lines)

def dump(fin_name: str, fout_name: str, cmd: list[Command], txt_root: XML.Element, gmm_bank: str):
    print(f'{fin_name} -> {fout_name}')
    with open(fin_name, 'rb') as fin, open(fout_name, 'w') as fout:
        scr = fin.read()
        fout.write(dumps(scr, cmd, txt_root, gmm_bank))

def dump_batch(in_dir: Path, out_dir: Path, file_prefix: str, cmd: list[Command], txt_root: XML.Element, gmm_bank: str):
    for fin_name in in_dir.glob('*.bin'):
        fout_name = out_dir / f'{file_prefix}_{fin_name.stem.split("_")[-1][4:]}.s'
        dump(fin_name, fout_name, cmd, txt_root, gmm_bank)

def dump_all(cmd: list[Command], txt_root: XML.Element, gmm_bank: str, src_dir: Path, dst_dir: Path):
    raw_be_dir = src_dir / 'be_seq'
    dmp_be_dir = dst_dir / 'effects'
    raw_sub_dir = src_dir / 'sub_seq'
    dmp_sub_dir = dst_dir / 'subscripts'
    raw_waza_dir = src_dir / 'waza_seq'
    dmp_waza_dir = dst_dir / 'moves'

    dmp_be_dir.mkdir(exist_ok=True, parents=True)
    dmp_sub_dir.mkdir(exist_ok=True, parents=True)
    dmp_waza_dir.mkdir(exist_ok=True, parents=True)
    
    dump_batch(raw_be_dir, dmp_be_dir, 'effect_script', cmd, txt_root, gmm_bank)
    dump_batch(raw_sub_dir, dmp_sub_dir, 'subscript', cmd, txt_root, gmm_bank)
    dump_batch(raw_waza_dir, dmp_waza_dir, 'move_script', cmd, txt_root, gmm_bank)


if __name__ == '__main__':
    ARGP = ArgumentParser(
        description='Dumps bytecode sequences from Gen4 files to human-readable text'
    )
    ARGP.add_argument('-g', '--game',
                      choices=['pt', 'hg'],
                      help='from which game the input bytecode sequences originate',
                      required=True)
    ARGP.add_argument('-s', '--src-dir',
                      help='root directory containing directories of bytecode to translate',
                      required=True)
    ARGP.add_argument('-d', '--dst-dir',
                      help='root directory into which translations will be dumped',
                      required=True)
    ARGP.add_argument('-m', '--msg-dir',
                      help='root directory containing GMM definitions of message banks',
                      required=True)
    
    cmd = []
    args = ARGP.parse_args()
    match args.game:
        case 'pt':
            cmd = PLAT_COMMANDS
            bank = 368
            prefix = 'pl_msg'
        case 'hg':
            cmd = HGSS_COMMANDS
            bank = 197
            prefix = 'msg'
        case _:
            raise ValueError(f'Unexpected value {args.game}')
    
    gmm_bank = f'{prefix}_{bank:04}'
    txt_root = XML.parse(Path(args.msg_dir) / f'{prefix}_{bank:04}.gmm').getroot()
    dump_all(cmd, txt_root, gmm_bank, Path(args.src_dir), Path(args.dst_dir))
