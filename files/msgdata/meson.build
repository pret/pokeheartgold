build_dir = meson.current_build_dir()

############################################################
###                        MSGDATA                       ###
############################################################
text_banks_txt = files('NARC_msg.txt')

#Steps 1-3 are handled in the subdir
subdir('msg')

# 4. Generate individual text bank binaries from JSON files.
bank_header_target = fs.relative_to(meson.current_build_dir() / 'msg', meson.project_build_root())
bank_header_dir = custom_target('bank_header_dir',
    capture: true,
    output: 'bank_header_dir',
    command: [
        'sh', '-c', 'mkdir -p ' + bank_header_target
    ]
)
json_to_bin_gen = generator(msgenc_exe,
    arguments: [
        '-e',
        '--json',
        '-c', charmap_txt.full_path(),
        '-H', bank_header_target / '@BASENAME@' + '.h',
        '@INPUT@',
        '@OUTPUT@'
    ],
    depends: [ charmap_txt, bank_header_dir ],
    output: '@BASENAME@'
)

text_bank_files += trainer_text_banks
text_banks = custom_target('msg.narc',
    output : [ 
        'msg.narc',
        'msg.naix'
    ],
    input : json_to_bin_gen.process(text_bank_files),
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--files-from', text_banks_order,
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    build_by_default:true
)

nitrofs_files += text_banks
naix_headers += text_banks[1]