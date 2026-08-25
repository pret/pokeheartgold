build_dir = meson.current_build_dir()

############################################################
###                      PGMAP_GRA                       ###
############################################################
subdir('pgmap_gra')

pgmap_gra_narc = custom_target('pgmap_gra.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/pgmap_gra.narc',
        '-d', build_dir + '/pgmap_gra.narc.p',
        '-i'
    ],
    input : [
        pgmap_gra_nclr,
        pgmap_gra_ncer,
        pgmap_gra_nanr,
        pgmap_gra_clobber_ncgr,
        pgmap_gra_sopc_8bpp_ncgr,
        pgmap_gra_sopc_ncgr,
        pgmap_gra_nscr,
    ],
    output : [
        'pgmap_gra.narc',
        'pgmap_gra.naix',
    ],
    build_by_default:true,
)

nitrofs_files += pgmap_gra_narc
naix_headers += pgmap_gra_narc[1]