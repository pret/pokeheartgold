subdir('bag_graphics')

bag_graphics_narc = custom_target('bag_graphics.narc',
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input: [
        bag_graphics_ncgr,
        bag_graphics_nclr,
        bag_graphics_ncer,
        bag_graphics_nanr,
        bag_graphics_nscr,
        bag_graphics_nsbmd,
        bag_graphics_nsbca,
        bag_graphics_nsbtp,
        bag_graphics_nsbta,
    ],
    output: [
        'bag_graphics.narc',
        'bag_graphics.naix',
    ],
    build_by_default: true
)

nitrofs_files += bag_graphics_narc
naix_headers += bag_graphics_narc[1]
