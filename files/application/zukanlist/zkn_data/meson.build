build_dir = meson.current_build_dir()

############################################################
###                      ZUKAN_DATA                      ###
############################################################
zukan_json = files('zukan_data.json')
zukan_template = files('zukan_data.json.txt')

zukan_narc = custom_target('zukan_data.narc',
    input : zukan_json,
    output: [
        'zukan_data.narc',
        'zukan_data.naix'
    ],
    command : [
        json2bin_sh,
        '--compiler', ' '.join(meson.get_compiler('nasm', native: false).cmd_array()),
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', zukan_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'asm',
        '-N',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += zukan_narc
naix_headers += zukan_narc[1]

zukan_gira_narc = custom_target('zukan_data_gira.narc',
    input : zukan_json,
    output: [
        'zukan_data_gira.narc',
        'zukan_data_gira.naix'
    ],
    command : [
        json2bin_sh,
        '--compiler', ' '.join(meson.get_compiler('nasm', native: false).cmd_array()),
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', zukan_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'asm',
        '-N',
        '-D', 'GIRA',
        '--overwrite-name', 'zukan_data_gira',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += zukan_gira_narc
naix_headers += zukan_gira_narc[1]

############################################################
###                       ZUKAN_ENC                      ###
############################################################
zukan_enc_json = files('zukan_enc.json')
zukan_enc_template = files('zukan_enc.json.txt')
if game_version == 'HEARTGOLD'
    zukan_enc_gold_narc = custom_target('zukan_enc_gold.narc',
        input : zukan_enc_json,
        output: [
            'zukan_enc_gold.narc',
            'zukan_enc.naix'
        ],
        command : [
            json2bin_sh,
            '--compiler', ' '.join(meson.get_compiler('nasm', native: false).cmd_array()),
            '--jsonproc', jsonproc_exe.full_path(),
            '--template', zukan_enc_template[0].full_path(),
            '--o2narc', o2narc_exe.full_path(),
            '--out-dir', build_dir,
            '-i', relative_source_root,
            '-i', relative_source_root / 'include',
            '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
            '--language', 'asm',
            '-N',
            '-D', 'HEARTGOLD',
            '-p', '0x00',
            '--overwrite-name', 'zukan_enc_gold',
            '-a', 'gold',
            '@INPUT@'
        ],
        depends : [
            jsonproc_exe,
            o2narc_exe,
        ],
        build_by_default:true
    )

    nitrofs_files += zukan_enc_gold_narc
    naix_headers += zukan_enc_gold_narc[1]
elif game_version == 'SOULSILVER'
    zukan_enc_silver_narc = custom_target('zukan_enc_silver.narc',
        input : zukan_enc_json,
        output: [
            'zukan_enc_silver.narc',
            'zukan_enc.naix'
        ],
        command : [
            json2bin_sh,
            '--compiler', ' '.join(meson.get_compiler('nasm', native: false).cmd_array()),
            '--jsonproc', jsonproc_exe.full_path(),
            '--template', zukan_enc_template[0].full_path(),
            '--o2narc', o2narc_exe.full_path(),
            '--out-dir', build_dir,
            '-i', relative_source_root,
            '-i', relative_source_root / 'include',
            '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
            '--language', 'asm',
            '-N',
            '-D', 'SOULSILVER',
            '-p', '0x00',
            '--overwrite-name', 'zukan_enc_silver',
            '-a', 'silver',
            '@INPUT@'
        ],
        depends : [
            jsonproc_exe,
            o2narc_exe,
        ],
        build_by_default:true
    )

    nitrofs_files += zukan_enc_silver_narc
    naix_headers += zukan_enc_silver_narc[1]
endif

############################################################
###                     ZUKAN_HW_DATA                    ###
############################################################
subdir('zukan_hw_data')

if game_version == 'HEARTGOLD'
    zukan_hw_files = zukan_hw_files_hg
    zukan_hw_order = zukan_hw_order_hg
elif game_version == 'SOULSILVER'
    zukan_hw_files = zukan_hw_files_ss
    zukan_hw_order = zukan_hw_order_ss
endif

zukan_hw_narc = custom_target('zukan_hw_data.narc',
    input : [
        zukan_hw_files
    ],
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--files-from', zukan_hw_order[0],
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    output : [
        'zukan_hw_data.narc',
        'zukan_hw_data.naix'
    ]
)

nitrofs_files += zukan_hw_narc
naix_headers += zukan_hw_narc[1]