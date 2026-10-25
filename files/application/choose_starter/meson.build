build_dir = meson.current_build_dir()

############################################################
###                  CHOOSE_STARTER_MAIN                 ###
############################################################
subdir('choose_starter_main_res')

choose_starter_narc = custom_target('choose_starter_main_res.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        choose_starter_main_res_nsbmd,
        choose_starter_main_res_nsbca,
        choose_starter_main_res_nsbta,
        choose_starter_main_res_nclr,
        choose_starter_main_res_ncgr,
        choose_starter_main_res_nscr
    ],
    output : [
        'choose_starter_main_res.narc',
        'choose_starter_main_res.naix',
    ],
)

nitrofs_files += choose_starter_narc
naix_headers += choose_starter_narc[1]

############################################################
###                  CHOOSE_STARTER_SUB                  ###
############################################################
subdir('choose_starter_sub_res')

choose_starter_sub_narc = custom_target('choose_starter_sub_res.narc',
    command : [
        nitroarc_exe, 
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        choose_starter_sub_res_ncgr,
        choose_starter_sub_res_nscr,
        choose_starter_sub_res_nclr,
        choose_starter_sub_res_ncer,
        choose_starter_sub_res_nanr
    ],
    output : [
        'choose_starter_sub_res.narc',
        'choose_starter_sub_res.naix',
    ],
)

nitrofs_files += choose_starter_sub_narc
naix_headers += choose_starter_sub_narc[1]