build_dir = meson.current_build_dir()

trainers_json = files('trainers.json')

trname_template = files('trname.json.txt')
trname_json = custom_target('msg_0729.json',
    command : [
        jsonproc_exe,
        trainers_json,
        trname_template,
        build_dir + '/msg_0729.json'
    ],
    output : [
        'msg_0729.json'
    ]
)

trainer_text_banks = [
    trname_json
]

############################################################
###                        TR_DATA                       ###
############################################################
trdata_json = files('trainers.json')
trdata_template = files('trdata.json.txt')

trdata_narc = custom_target('trdata.narc',
    input : trdata_json,
    output: [ 
        'trdata.narc', 
        'trdata.naix' 
    ],
    command : [
        json2bin_sh,
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', trdata_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-N',
        '-w', 'trdata',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += trdata_narc
naix_headers += trdata_narc[1]

############################################################
###                        TR_POKE                       ###
############################################################
trpoke_json = files('trainers.json')
trpoke_template = files('trpoke.json.txt')

trpoke_narc = custom_target('trpoke.narc',
    input : trpoke_json,
    output: [ 
        'trpoke.narc', 
        'trpoke.naix' 
    ],
    command : [
        json2bin_sh,
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', trpoke_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-N',
        '--language', 'asm',
        '-w', 'trpoke',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += trpoke_narc
naix_headers += trpoke_narc[1]