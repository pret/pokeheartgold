build_dir = meson.current_build_dir()

############################################################
###                      MAP_MATRIX                      ###
############################################################
subdir('map_matrix')

map_matrix_narc = custom_target('map_matrix.narc',
    command : [
        narc_exe,
        '-p', build_dir + '/map_matrix.narc',
        '-d', build_dir + '/map_matrix.narc.p',
        '-i'
    ],
    input : [
        map_matrix_bin
    ],
    output : [
        'map_matrix.narc',
        'map_matrix.naix'
    ],
    build_by_default:true
)

nitrofs_files += map_matrix_narc
naix_headers += map_matrix_narc[1]

