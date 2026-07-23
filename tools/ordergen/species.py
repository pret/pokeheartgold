#!/usr/bin/env python3

import argparse
import os

SPECIES_DIRS = os.environ['SPECIES'].split(';')

#
# Generates:
# pokefoot.order
#

argparser = argparse.ArgumentParser(
    prog='species order files generator',
    description='Generates the order files used for Pokemon graphics'
)
argparser.add_argument('pokefoot', help='Path to the pokefoot output order file')
args = argparser.parse_args()

with (
    open(args.pokefoot, "w", encoding="utf-8") as order_pokefoot,
):
    print('footprint.NCLR', file=order_pokefoot)
    print('footprint_anim.NANR.lz', file=order_pokefoot)
    print('footprint_cell.NCER.lz', file=order_pokefoot)
    for i, subdir in enumerate(SPECIES_DIRS):
        # Do not attempt to process either egg or bad_egg
        if subdir in ['egg', 'bad_egg']:
            continue

        print(f'{subdir}/footprint.NCGR.lz', file=order_pokefoot)
