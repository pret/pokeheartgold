build_dir = meson.current_build_dir()

############################################################
###                       HEADBUTT                       ###
############################################################
headbutt_json = files('headbutt.json')
headbutt_template = files('headbutt.json.txt')

if game_version == 'HEARTGOLD'
    headbutt_narc = custom_target('headbutt.heartgold.narc',
        input : headbutt_json,
        output: [ 
            'headbutt.heartgold.narc', 
            'headbutt.heartgold.naix' 
        ],
        command : [
            json2bin_sh,
            '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
            '--jsonproc', jsonproc_exe.full_path(),
            '--template', headbutt_template[0].full_path(),
            '--o2narc', o2narc_exe.full_path(),
            '--out-dir', build_dir,
            '-i', relative_source_root,
            '-i', relative_source_root / 'include',
            '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
            '--language', 'asm',
            '-w', 'headbutt.heartgold',
            '-D', 'HEARTGOLD',
            '-N',
            '@INPUT@'
        ],
        depends : [
            jsonproc_exe,
            o2narc_exe,
        ],
    )
elif game_version == 'SOULSILVER'
    headbutt_narc = custom_target('headbutt.soulsilver.narc',
        input : headbutt_json,
        output: [ 
            'headbutt.soulsilver.narc', 
            'headbutt.soulsilver.naix' 
        ],
        command : [
            json2bin_sh,
            '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
            '--jsonproc', jsonproc_exe.full_path(),
            '--template', headbutt_template[0].full_path(),
            '--o2narc', o2narc_exe.full_path(),
            '--out-dir', build_dir,
            '-i', relative_source_root,
            '-i', relative_source_root / 'include',
            '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
            '--language', 'asm',
            '-w', 'headbutt.soulsilver',
            '-D', 'SOULSILVER',
            '-N',
            '@INPUT@'
        ],
        depends : [
            jsonproc_exe,
            o2narc_exe,
        ],
    )
endif

nitrofs_files += headbutt_narc
naix_headers += headbutt_narc[1]

############################################################
###                         PPARK                        ###
############################################################
ppark_json = files('ppark.json')
ppark_template = files('ppark.json.txt')

ppark_narc = custom_target('ppark.narc',
    input : ppark_json,
    output: [ 
        'ppark.narc', 
        'ppark.naix' 
    ],
    command : [
        json2bin_sh,
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', ppark_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'c',
        '-N',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
)

nitrofs_files += ppark_narc
naix_headers += ppark_narc[1]

############################################################
###                       SAFARI ENC                     ###
############################################################
safari_enc_json = files('safari_enc.json')
safari_enc_template = files('safari_enc.json.txt')

safari_enc_narc = custom_target('safari_enc.narc',
    input : safari_enc_json,
    output: [ 
        'safari_enc.narc', 
        'safari_enc.naix' 
    ],
    command : [
        json2bin_sh,
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', safari_enc_template[0].full_path(),
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
)

nitrofs_files += safari_enc_narc
naix_headers += safari_enc_narc[1]
