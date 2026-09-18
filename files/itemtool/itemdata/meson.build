build_dir = meson.current_build_dir()

############################################################
###                      ITEM_DATA                       ###
############################################################
item_data_csv = files('item_data.csv')
item_data_manifest = files('item_data.txt')

item_data_narc = custom_target('item_data.narc',
    command : [
        csv2bin_exe,
        'compile',
        item_data_csv,
        build_dir / 'item_data.narc',
        item_data_manifest,
        '--pad', '0xFF',
        '-i', relative_source_root / 'include',
        '--naix'
    ],
    output : [
        'item_data.narc',
        'item_data.naix'
    ],
)

nitrofs_files += item_data_narc
naix_headers += item_data_narc[1]

############################################################
###                      ITEM_ICON                       ###
############################################################
subdir('item_icon')

item_icon_narc = custom_target('item_icon.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        item_icon_nanr,
        item_icon_ncer,
        item_icon_nclr,
        item_icon_ncgr
    ],
    output : [
        'item_icon.narc',
        'item_icon.naix'
    ],
)

nitrofs_files += item_icon_narc
naix_headers += item_icon_narc[1]
