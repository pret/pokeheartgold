build_dir = meson.current_build_dir()

############################################################
###                      PGCONF_GRA                      ###
############################################################
subdir('pgconf_gra')

pconf_gra_narc = custom_target('pgconf_gra.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        pgconf_gra_nclr,
        pgconf_gra_nanr,
        pgconf_gra_ncer,
        pgconf_gra_ncgr_clobber,
        pgconf_gra_ncgr_sopc,
        pgconf_gra_nscr,
    ],
    output : [
        'pgconf_gra.narc',
        'pgconf_gra.naix',
    ],
)

nitrofs_files += pconf_gra_narc
naix_headers += pconf_gra_narc[1]
