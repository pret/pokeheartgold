build_dir = meson.current_build_dir()

############################################################
###                       TP_PARAM                       ###
############################################################
tp_param_csv = files('tp_param.csv')
tp_param_manifest = files('tp_param.csv.txt')

tp_param_narc = custom_target('tp_param.narc',
    command : [
        csv2bin_exe,
        'compile',
        tp_param_csv,
        build_dir / 'tp_param.narc',
        tp_param_manifest,
        '-i', relative_source_root / 'include',
        '--naix'
    ],
    output : [
        'tp_param.narc',
        'tp_param.naix'
    ],
    build_by_default : true
)

nitrofs_files += tp_param_narc
naix_headers += tp_param_narc[1]