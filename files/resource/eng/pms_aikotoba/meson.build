build_dir = meson.current_build_dir()

############################################################
###                    PMS_AIKOTOBA                      ###
############################################################
pms_aikotoba_asm = files('pms_aikotoba.s')

pms_aikotoba_gen = generator(makescript_sh,
    arguments : [
        '--out-dir', build_dir / 'pms_aikotoba.narc.p',
        '-a', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include' / 'nitro',
        '-i', relative_source_root / 'subprojects' / 'NitroSystem-071126.1' / 'include',
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'files',
        '-i', relative_source_root / 'asm' / 'include',
        '-i', relative_source_root / 'asm',
        '-i', relative_source_root,
        '@INPUT@',
    ],
    output : '@BASENAME@.bin'
)

pms_aikotoba_narc = custom_target('pms_aikotoba.narc',
    output : [
        'pms_aikotoba.narc',
    ],
    input : pms_aikotoba_gen.process(pms_aikotoba_asm),
    command : [
        nitroarc_exe,
        '--create',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@'
    ],
    build_by_default : true
)

nitrofs_files += pms_aikotoba_narc