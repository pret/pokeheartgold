build_dir = meson.current_build_dir()

############################################################
###                     EFFECT_SEQ                       ###
############################################################
subdir('effect_script')

effect_seq_gen = generator(makescript_sh,
    arguments : [
        '--out-dir', build_dir / 'effect_script.narc.p',
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

effect_seq_narc = custom_target('effect_script.narc',
    output : [
        'effect_script.narc',
        'effect_script.naix',
    ],
    input : effect_seq_gen.process(effect_seq_asm),
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@'
    ],
    depends : text_banks,
    build_by_default : true
)

nitrofs_files += effect_seq_narc
naix_headers += effect_seq_narc[1]

############################################################
###                      MOVE_SEQ                        ###
############################################################
subdir('move_script')

move_seq_gen = generator(makescript_sh,
    arguments : [
        '--out-dir', build_dir / 'move_script.narc.p',
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

move_seq_narc = custom_target('move_script.narc',
    output : [
        'move_script.narc',
        'move_script.naix',
    ],
    input : move_seq_gen.process(move_seq_asm),
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@'
    ],
    depends : text_banks,
    build_by_default : true
)

nitrofs_files += move_seq_narc
naix_headers += move_seq_narc[1]

############################################################
###                      SUBSCRIPT                       ###
############################################################
subdir('subscript')

subscript_gen = generator(makescript_sh,
    arguments : [
        '--out-dir', build_dir / 'subscript.narc.p',
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

subscript_narc = custom_target('subscript.narc',
    output : [
        'subscript.narc',
        'subscript.naix',
    ],
    input : subscript_gen.process(subscript_asm),
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@'
    ],
    depends : text_banks,
    build_by_default : true
)

nitrofs_files += subscript_narc
naix_headers += subscript_narc[1]