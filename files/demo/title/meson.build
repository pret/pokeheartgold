build_dir = meson.current_build_dir()

############################################################
###                      TITLEDEMO                       ###
############################################################
subdir('titledemo')

titledemo_narc = custom_target('titledemo.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/titledemo.narc',
        '-d', build_dir + '/titledemo.narc.p',
        '-i'
    ],
    input : [
        titledemo_8bpp_ncgr,
        titledemo_4bpp_ncgr,
        titledemo_ncgr,
        titledemo_nscr,
        titledemo_nclr,
        titledemo_nsbmd,
        titledemo_nsbta,
        titledemo_nsbtp,
        titledemo_nsbca,
        titledemo_nsbma,
    ],
    output : [
        'titledemo.narc',
        'titledemo.naix',
    ],
    build_by_default:true,
)

nitrofs_files += titledemo_narc
naix_headers += titledemo_narc[1]