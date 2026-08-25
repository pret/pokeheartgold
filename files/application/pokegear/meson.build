build_dir = meson.current_build_dir()

############################################################
###                       PGEAR_GRA                      ###
############################################################
subdir('pgear_gra')

pgear_gra_narc = custom_target('pgear_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pgear_gra.narc',
        '-d', build_dir + '/pgear_gra.narc.p',
        '-i'
    ],
    input : [
        pgear_gra_nclr,
        pgear_gra_ncgr_clobber,
        pgear_gra_ncgr_sopc,
        pgear_gra_ncer,
        pgear_gra_nanr,
        pgear_gra_nscr,
    ],
    output : [
        'pgear_gra.narc',
        'pgear_gra.naix',
    ],
)

nitrofs_files += pgear_gra_narc
naix_headers += pgear_gra_narc[1]

# Subdirs
subdir('configure')
subdir('map')
subdir('phone')
subdir('radio')