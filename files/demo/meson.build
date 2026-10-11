build_dir = meson.current_build_dir()

############################################################
###                        LEGEND                        ###
############################################################
subdir('legend')

legend_narc = custom_target('legend.narc',
    input : [
        legend_nsbmd,
        legend_nsbca,
        legend_nsbtp,
        legend_nsbma,
        legend_nsbta,
        legend_nscr,
        legend_ncgr,
        legend_nclr,
    ],
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    output : [
        'legend.narc',
        'legend.naix'
    ]
)

nitrofs_files += legend_narc
naix_headers += legend_narc[1]

subdir('intro')
subdir('opening')
subdir('title')