build_dir = meson.current_build_dir()

############################################################
###                       POKEFOOT                       ###
############################################################
subdir('pokefoot')

pokefoot_narc = custom_target('pokefoot.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pokefoot.narc',
        '-d', build_dir + '/pokefoot.narc.p',
        '-i'
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
    build_by_default:true,
)

nitrofs_files += pokefoot_narc
naix_headers += pokefoot_narc[1]
