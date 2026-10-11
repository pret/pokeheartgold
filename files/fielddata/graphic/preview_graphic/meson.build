build_dir = meson.current_build_dir()

############################################################
###                   PREVIEW_GRAPHIC                    ###
############################################################

subdir('preview_graphic')

preview_graphic_narc = custom_target('preview_graphic.narc',
    output: [
        'preview_graphic.narc',
        'preview_graphic.naix',
    ],
    input: [
        preview_graphic_nscr_lz,
        preview_graphic_ncgr_lz,
        preview_graphic_nclr,
    ],
    command: [
        nitroarc_exe,
        '--create',
        '--index',
        '--files-from', files('preview_graphic.order'),
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
)

nitrofs_files += preview_graphic_narc
naix_headers += preview_graphic_narc[1]
