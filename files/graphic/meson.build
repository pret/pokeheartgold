build_dir = meson.current_build_dir()

############################################################
###                  CAMERA_VIEWFINDER                   ###
############################################################
subdir('camera_viewfinder')

camera_viewfinder_narc = custom_target('camera_viewfinder.narc',
    output: [
        'camera_viewfinder.narc',
        'camera_viewfinder.naix',
    ],
    input: [
        camera_viewfinder_nclr,
        camera_viewfinder_ncgr_lz,
        camera_viewfinder_nscr_lz,
    ],
    command: [
        nitroarc_exe,
        '--create',
        '--index',
        '--files-from', files('camera_viewfinder.order'),
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
)

nitrofs_files += camera_viewfinder_narc
naix_headers += camera_viewfinder_narc[1]

############################################################
###                      PLIST_GRA                       ###
############################################################
subdir('plist_gra')

plist_gra_narc = custom_target('plist_gra.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        plist_gra_nanr,
        plist_gra_ncer,
        plist_gra_ncgr,
        plist_gra_nclr,
        plist_gra_nscr
    ],
    output : [
        'plist_gra.narc',
        'plist_gra.naix'
    ],
    build_by_default:true
)

nitrofs_files += plist_gra_narc
naix_headers += plist_gra_narc[1]

############################################################
###                      ZUKAN_GRA                       ###
############################################################
subdir('zukan_gra')

zukan_gra_narc = custom_target('zukan_gra.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        zukan_gra_ncgr_lz_clobber,
        zukan_gra_ncgr_lz_sopc,
        zukan_gra_nclr,
        zukan_gra_nscr_lz,
        zukan_gra_ncer_lz,
        zukan_gra_nanr_lz,
    ],
    output : [
        'zukan_gra.narc',
        'zukan_gra.naix'
    ],
    build_by_default:true
)

nitrofs_files += zukan_gra_narc
naix_headers += zukan_gra_narc[1]

nitrofs_files += fs.copyfile('font.narc')
