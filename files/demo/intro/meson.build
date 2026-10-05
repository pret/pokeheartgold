build_dir = meson.current_build_dir()

############################################################
###                         INTRO                        ###
############################################################
subdir('intro')

intro_narc = custom_target('intro.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        intro_ncgr,
        intro_nclr,
        intro_nscr,
        intro_nanr,
        intro_ncer
    ],
    output : [
        'intro.narc',
        'intro.naix'
    ],
)

nitrofs_files += intro_narc
naix_headers += intro_narc[1]