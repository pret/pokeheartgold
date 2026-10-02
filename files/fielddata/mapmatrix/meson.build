build_dir = meson.current_build_dir()

############################################################
###                      MAP_MATRIX                      ###
############################################################
subdir('map_matrix')

map_matrix_narc = custom_target('map_matrix.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        map_matrix_bin
    ],
    output : [
        'map_matrix.narc',
        'map_matrix.naix'
    ],
)

nitrofs_files += map_matrix_narc
naix_headers += map_matrix_narc[1]

