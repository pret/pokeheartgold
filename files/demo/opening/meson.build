build_dir = meson.current_build_dir()

############################################################
###                      GS_OPENING                      ###
############################################################
subdir('gs_opening')

gs_opening_narc = custom_target('gs_opening.narc',
    command : [
        narc_exe,
        '-p', build_dir + '/gs_opening.narc',
        '-d', build_dir + '/gs_opening.narc.p',
        '-i'
    ],
    input : [
        gs_opening_nclr,
        gs_opening_nscr,
        gs_opening_nanr_lz,
        gs_opening_ncer_lz,
        gs_opening_ncgr_lz,
        gs_opening_nscr_lz,
        gs_opening_nsbmd,
        gs_opening_nsbca,
        gs_opening_nsbta
    ],
    output : [
        'gs_opening.narc',
        'gs_opening.naix'
    ],
    build_by_default:true
)

nitrofs_files += gs_opening_narc
naix_headers += gs_opening_narc[1]
