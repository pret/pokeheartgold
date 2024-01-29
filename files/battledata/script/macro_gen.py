from argparse import ArgumentParser

from consts import (
    PLAT_COMMANDS,
    HGSS_COMMANDS,
)

def arg_list(params: list) -> str:
    return ', '.join(list(map(lambda i: f'arg_{i}', range(len(params)))))

ARGP = ArgumentParser(
    description='Generates macro definitions for Gen4 byte-code sequences'
)
ARGP.add_argument('-g', '--game',
                  choices=['pt', 'hg'],
                  help='which command dictionary to use for macro generation',
                  required=True)

args = ARGP.parse_args()
match args.game:
    case 'pt':
        commands = PLAT_COMMANDS
    case 'hg':
        commands = HGSS_COMMANDS
    case _:
        raise ValueError(f'Unrecognized value for game: {args.game}')

lines = [
    '    .ifndef ASM_BATTLE_SCRIPT_INC',
    '    .set ASM_BATTLE_SCRIPT_INC, 1',
    '#pragma once',
    '#include "battle/btlcmd.h"',
    '    .option alignment off',
    '',
]

for i, cmd in enumerate(commands):
    if cmd.params:
        lines.append(f'    .macro {cmd.name} {arg_list(cmd.params)}')
    else:
        lines.append(f'    .macro {cmd.name}')
    lines.append(f'    .long {i}')

    for j in range(len(cmd.params)):
        lines.append(f'    .long \\arg_{j}')
    lines.append('    .endm\n')

with open('btlcmd.inc', 'w') as fout:
    fout.write('\n'.join(lines))
