build_dir = meson.current_build_dir()

############################################################
###                       SCR_SEQ                        ###
############################################################
subdir('scr_seq')

scr_seq_gen = generator(makescript_sh,
    arguments : [
        '--out-dir', build_dir / 'scr_seq.narc.p',
        '-a', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include' / 'nitro',
        '-i', relative_source_root / 'subprojects' / 'NitroSystem-071126.1' / 'include',
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'files',
        '-i', relative_source_root / 'build' / 'files',
        '-i', relative_source_root / 'asm' / 'include',
        '-i', relative_source_root / 'asm',
        '-i', relative_source_root,
        '@INPUT@',
    ],
    output : '@BASENAME@.bin'
)

scr_seq_narc = custom_target('scr_seq.narc',
    output : [
        'scr_seq.narc',
        'scr_seq.naix',
    ],
    input : scr_seq_gen.process(scr_seq_asm),
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@'
    ],
    build_by_default : true
)