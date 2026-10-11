#!/usr/bin/env python3

import argparse
import os
import pathlib
import shutil
import subprocess

argparser = argparse.ArgumentParser(
    prog='pokegra.narc packer',
    description='Packs the archive containing Pokemon graphics'
)
argparser.add_argument('-n', '--nitrogfx',
                       required=True,
                       help='Path to nitrogfx executable')
argparser.add_argument('-k', '--narc',
                       required=True,
                       help='Path to narc executable')
argparser.add_argument('-s', '--source-dir',
                       required=True,
                       help='Path to the source directory (res/pokemon)')
argparser.add_argument('-p', '--private-dir',
                       required=True,
                       help='Path to the private directory (where binaries will be made)')
argparser.add_argument('-o', '--output-dir',
                       required=True,
                       help='Path to the output directory (where the NARC will be made)')
args = argparser.parse_args()

source_dir = pathlib.Path(args.source_dir)
private_dir = pathlib.Path(args.private_dir)
output_dir = pathlib.Path(args.output_dir)

private_dir.mkdir(parents=True, exist_ok=True)

# TODO - base this off the species enum instead of hardcoding it
for i in range(0, 494):
    subdir = f'{i:04}'
    j = 0
    for face in ['back', 'front']:
        pal_flag = False
        for gender in ['female', 'male']:
            source_file = source_dir / subdir /  gender /f'{face}.png'
            target_file = private_dir / f'{i:04}-{j:02}.NCGR'

            if source_file.exists():
                subprocess.run([
                    args.nitrogfx,
                    source_file,
                    target_file,
                    '-scanfronttoback',
                    '-handleempty',
                ])
            else:
                subprocess.run(['touch', target_file])
            
            if not pal_flag and os.stat(source_file).st_size != 0:
                if face == 'front':
                    # Normal palette from front sprite
                    subprocess.run([
                        args.nitrogfx,
                        source_file,
                        private_dir / f'{i:04}-04.NCLR',
                        '-bitdepth', '8',
                        '-nopad',
                        '-comp', '10'
                    ])
                else:
                    # Shiny palette from back sprite
                    subprocess.run([
                        args.nitrogfx,
                        source_file,
                        private_dir / f'{i:04}-05.NCLR',
                        '-bitdepth', '8',
                        '-nopad',
                        '-comp', '10'
                    ])
                pal_flag = True

            j += 1

    if i == 0:  # species none has special palette files
        shutil.copy(source_dir / '0000/4_0004.NCLR', private_dir / '0000-04.NCLR')
        shutil.copy(source_dir / '0000/4_0005.NCLR', private_dir / '0000-05.NCLR')
        continue

    

subprocess.run([
    args.narc,
    '--create',
    '--file', output_dir / 'pokegra.narc',
    private_dir
])
