build_dir = meson.current_build_dir()

############################################################
###                      PUZZLE_GRA                      ###
############################################################
subdir('puzzle_gra')

puzzle_gra_narc = custom_target('puzzle_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/puzzle_gra.narc',
        '-d', build_dir + '/puzzle_gra.narc.p',
        '-i'
    ],
    input : [
        puzzle_gra_ncgr_clobber,
        puzzle_gra_ncgr_sopc,
        puzzle_gra_nclr,
        puzzle_gra_ncer,
        puzzle_gra_nanr,
        puzzle_gra_nscr,
    ],
    output : [
        'puzzle_gra.narc',
        'puzzle_gra.naix',
    ],
)

nitrofs_files += puzzle_gra_narc
naix_headers += puzzle_gra_narc[1]
