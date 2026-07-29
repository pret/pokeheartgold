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
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
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
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
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
        '-p', 'gira',
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
