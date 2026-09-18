build_dir = meson.current_build_dir()

############################################################
###                       POKEFOOT                       ###
############################################################
subdir('pokefoot')

pokefoot_narc = custom_target('pokefoot.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        pokefoot_nclr,
        pokefoot_nanr_lz,
        pokefoot_ncer_lz,
        pokefoot_ncgr_lz,
    ],
    output : [
        'pokefoot.narc',
        'pokefoot.naix',
    ],
)

nitrofs_files += pokefoot_narc
naix_headers += pokefoot_narc[1]
