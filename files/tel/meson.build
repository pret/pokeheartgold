build_dir = meson.current_build_dir()

pmtel_book_json = files('pmtel_book.json')
pmtel_book_template = files('pmtel_book.json.txt')

pmtel_book_dat = custom_target('pmtel_book.dat',
    input : pmtel_book_json,
    output: [ 
        'pmtel_book.dat'
    ],
    command : [
        json2bin_sh,
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', pmtel_book_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '--language', 'asm',
        '-x', 'dat',
        '-y',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
    ],
)

nitrofs_files += pmtel_book_dat