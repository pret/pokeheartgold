subdir('cb_data')

cb_data_narc = custom_target('cb_data.narc',
    command : [
        nitroarc_exe,
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input: [
        cb_data_files,
        cb_data_lz_files,
    ],
    output: [
        'cb_data.narc',
        'cb_data.naix',
    ]
)

nitrofs_files += cb_data_narc
naix_headers += cb_data_narc[1]
