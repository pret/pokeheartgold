#!/usr/bin/env python3

import argparse
import os
import pathlib

TRAINER_CLASSES_DIRS = os.environ['TRAINER_CLASSES'].split(';')

#
# Generates:
# trfgra.order
# trbgra.order
#

argparser = argparse.ArgumentParser(
    prog='trainer graphics order files generator',
    description='Generates the order files used for trainer graphics'
)
argparser.add_argument('source_dir', help='Path to the source directory (res/trainers/classes)')
argparser.add_argument('trfgra', help='Path to the trfgra output order file')
argparser.add_argument('trbgra', help='Path to the trbgra output order file')
args = argparser.parse_args()

source_dir = pathlib.Path(args.source_dir)

with (
    open(args.trfgra, "w", encoding="utf-8") as order_trfgra,
    open(args.trbgra, "w", encoding="utf-8") as order_trbgra,
):
    for i, subdir in enumerate(TRAINER_CLASSES_DIRS):
        print(f'{subdir}/front.NCGR', file=order_trfgra)
        print(f'{subdir}/front.NCLR', file=order_trfgra)
        print(f'{subdir}/front_cell.NCER', file=order_trfgra)
        print(f'{subdir}/front_anim.NANR', file=order_trfgra)
        print(f'{subdir}/front_scan.NCGR', file=order_trfgra)

        if (source_dir / subdir / 'back.png').exists():
            print(f'{subdir}/back.NCGR', file=order_trbgra)
            print(f'{subdir}/back.NCLR', file=order_trbgra)
            print(f'{subdir}/back_cell.NCER', file=order_trbgra)
            print(f'{subdir}/back_anim.NANR', file=order_trbgra)
            print(f'{subdir}/back_scan.NCGR', file=order_trbgra)
    print('dp_rival/back.NCGR', file=order_trbgra)
    print('dp_rival/back.NCLR', file=order_trbgra)
    print('dp_rival/back_cell.NCER', file=order_trbgra)
    print('dp_rival/back_anim.NANR', file=order_trbgra)
    print('dp_rival/back_scan.NCGR', file=order_trbgra)
