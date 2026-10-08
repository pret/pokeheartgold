build_dir = meson.current_build_dir()

############################################################
###                      GS_OPENING                      ###
############################################################
subdir('gs_opening')

gs_opening_narc = custom_target('gs_opening.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
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
)

nitrofs_files += gs_opening_narc
naix_headers += gs_opening_narc[1]
