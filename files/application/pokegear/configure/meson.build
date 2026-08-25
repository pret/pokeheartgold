build_dir = meson.current_build_dir()

############################################################
###                      PGCONF_GRA                      ###
############################################################
subdir('pgconf_gra')

pconf_gra_narc = custom_target('pgconf_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pgconf_gra.narc',
        '-d', build_dir + '/pgconf_gra.narc.p',
        '-i'
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
    build_by_default:true,
)

nitrofs_files += pconf_gra_narc
naix_headers += pconf_gra_narc[1]
