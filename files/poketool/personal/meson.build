build_dir = meson.current_build_dir()


############################################################
###                         EVO                          ###
############################################################
evo_json = files('evo.json')
evo_template = files('evo.json.txt')

evo_narc = custom_target('evo.narc',
    input : evo_json,
    output: [
        'evo.narc',
        'evo.naix'
    ],
    command : [
        json2bin_sh,
        '--compiler', ' '.join(meson.get_compiler('c', native: false).cmd_array()),
        '--flags', ' '.join(c_args),
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', evo_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'c',
        '-N',
        '-p', '0x00',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
)

nitrofs_files += evo_narc
naix_headers += evo_narc[1]

############################################################
###                       GROWTBL                        ###
############################################################
growtbl_csv = files('growtbl.csv')
growtbl_manifest = files('growtbl.txt')

growtbl_narc = custom_target('growtbl.narc',
    input : growtbl_csv,
    output : [
        'growtbl.narc',
        'growtbl.naix',
    ],
    command : [
        csv2bin_exe,
        'compile',
        '@INPUT@',
        '@OUTPUT0@',
        growtbl_manifest,
        '-i', relative_source_root / 'include',
        '--naix'
    ]
)

nitrofs_files += growtbl_narc
naix_headers += growtbl_narc[1]

############################################################
###                       PERSONAL                       ###
############################################################
personal_json = files('personal.json')
personal_template = files('personal.json.txt')

personal_narc = custom_target('personal.narc',
    input : personal_json,
    output: [
        'personal.narc',
        'personal.naix'
    ],
    command : [
        json2bin_sh,
        '--compiler', ' '.join(meson.get_compiler('c', native: false).cmd_array()),
        '--flags', ' '.join(c_args),
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', personal_template[0].full_path(),
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

nitrofs_files += personal_narc
naix_headers += personal_narc[1]


prebuilt_files = [
    'pms.narc',
    'wotbl.narc',
    'performance.narc',
]

foreach f : prebuilt_files
    nitrofs_files += fs.copyfile(f)
endforeach
