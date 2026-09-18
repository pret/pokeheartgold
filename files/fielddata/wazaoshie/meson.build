build_dir = meson.current_build_dir()

waza_oshie_json = files('waza_oshie.json')
waza_oshie_template = files('waza_oshie.json.txt')

waza_oshie_bin = custom_target('waza_oshie.bin',
    input : waza_oshie_json,
    output: [
        'waza_oshie.bin'
    ],
    command : [
        json2bin_sh,
        '--compiler', meson.get_compiler('nasm', native: false).cmd_array()[0],
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', waza_oshie_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-D', 'PM_ASM',
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'asm',
        '-y',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
    ],
)

nitrofs_files += waza_oshie_bin