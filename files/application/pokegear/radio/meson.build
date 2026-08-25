build_dir = meson.current_build_dir()

############################################################
###                    PRADIO_PHONE                      ###
############################################################
subdir('pgradio_gra')

pgradio_gra_narc = custom_target('pgradio_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pgradio_gra.narc',
        '-d', build_dir + '/pgradio_gra.narc.p',
        '-i'
    ],
    input : [
        pgradio_gra_nclr,
        pgradio_gra_ncer,
        pgradio_gra_nanr,
        pgradio_gra_nscr,
        pgradio_gra_ncgr_clobber,
        pgradio_gra_ncgr_sopc
    ],
    output : [
        'pgradio_gra.narc',
        'pgradio_gra.naix',
    ],
)

nitrofs_files += pgradio_gra_narc
naix_headers += pgradio_gra_narc[1]
