build_dir = meson.current_build_dir()

############################################################
###                        RESDAT                        ###
############################################################
subdir('resdat')
resdat_template = files('resdat.json.txt')

resdat_bin_gen = generator(json2bin_sh,
    arguments : [
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', resdat_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir / 'resdat.narc.p',
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    output : '@BASENAME@.bin'
)

resdat_narc = custom_target('resdat.narc',
    output: [ 
        'resdat.narc', 
        'resdat.naix' 
    ],
    input: resdat_bin_gen.process(resdat_json),
    command: [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    build_by_default:true
)

nitrofs_files += resdat_narc
naix_headers += resdat_narc[1]