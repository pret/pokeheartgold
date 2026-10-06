build_dir = meson.current_build_dir()

############################################################
###                        RECORD                        ###
############################################################
subdir('record')

record_narc = custom_target('record.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        record_nclr,
        record_bin
    ],
    output : [
        'record.narc',
        'record.naix',
    ],
)

nitrofs_files += record_narc
naix_headers += record_narc[1]