mushi_trainer = custom_target('mushi_trainer.bin',
    command : [
        csv2bin_exe,
        'compile',
        '@INPUT@',
        '@OUTPUT@',
        files('mushi_trainer.txt'),
        '-i', relative_source_root / 'include',
    ],
    input : files('mushi_trainer.csv'),
    output : 'mushi_trainer.bin'
)

nitrofs_files += mushi_trainer

mushi_encount = custom_target('mushi_encount.bin',
    command : [
        csv2bin_exe,
        'compile',
        '@INPUT@',
        '@OUTPUT@',
        files('mushi_encount.txt'),
        '-i', relative_source_root / 'include',
    ],
    input : files('mushi_encount.csv'),
    output : 'mushi_encount.bin'
)

nitrofs_files += mushi_encount