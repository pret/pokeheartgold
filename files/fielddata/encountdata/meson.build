build_dir = meson.current_build_dir()

############################################################
###                      GS_ENC_DATA                     ###
############################################################
gs_enc_data_json = files('gs_enc_data.json')
gs_enc_data_template = files('gs_enc_data.json.txt')

g_enc_data_narc = custom_target('g_enc_data.narc',
    input : gs_enc_data_json,
    output: [ 
        'g_enc_data.narc', 
        'g_enc_data.naix' 
    ],
    command : [
        json2bin_sh,
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', gs_enc_data_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'c',
        '-N',
        '-D', 'ENC_HEARTGOLD',
        '--overwrite-name', 'g_enc_data',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += g_enc_data_narc
naix_headers += g_enc_data_narc[1]

s_enc_data_narc = custom_target('s_enc_data.narc',
    input : gs_enc_data_json,
    output: [ 
        's_enc_data.narc', 
        's_enc_data.naix' 
    ],
    command : [
        json2bin_sh,
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', gs_enc_data_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'c',
        '-N',
        '-D', 'ENC_SOULSILVER',
        '--overwrite-name', 's_enc_data',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += s_enc_data_narc
naix_headers += s_enc_data_narc[1]
