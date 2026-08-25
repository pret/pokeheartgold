build_dir = meson.current_build_dir()

############################################################
###                     PGEAR_PHONE                      ###
############################################################
subdir('pgphone_gra')

pgphone_gra_narc = custom_target('pgphone_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pgphone_gra.narc',
        '-d', build_dir + '/pgphone_gra.narc.p',
        '-i'
    ],
    input : [
        pgphone_gra_nclr,
        pgphone_gra_nscr,
        pgphone_gra_ncer,
        pgphone_gra_nanr,
        pgphone_gra_clobber_ncgr,
        pgphone_gra_sopc_ncgr
    ],
    output : [
        'pgphone_gra.narc',
        'pgphone_gra.naix',
    ],
)

nitrofs_files += pgphone_gra_narc
naix_headers += pgphone_gra_narc[1]
