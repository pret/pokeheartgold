build_dir = meson.current_build_dir()

############################################################
###                        MMODEL                        ###
############################################################

subdir('mmodel')
mmodel_template = files('mmodel.json.txt')

mmodel_bin_gen = generator(json2bin_sh,
    arguments : [
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', mmodel_template[0].full_path(),
        '--obj-copy',
        '--out-dir', build_dir / 'mmodel.narc.p',
        '--language', 'asm',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    output : '@BASENAME@.bin'
)

mmodel_narc = custom_target('mmodel.narc',
    output: [ 
        'mmodel.narc', 
        'mmodel.naix' 
    ],
    input: [
        mmodel_bin_gen.process(mmodel_json),
        mmodel_nsbtx,
        mmodel_nsbmd,
    ],
    command: [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    build_by_default:true
)

nitrofs_files += mmodel_narc
naix_headers += mmodel_narc[1]