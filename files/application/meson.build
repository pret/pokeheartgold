build_dir = meson.current_build_dir()

############################################################
###                       GUINNESS                       ###
############################################################
subdir('guinness')

puzzle_gra_narc = custom_target('guinness.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/guinness.narc',
        '-d', build_dir + '/guinness.narc.p',
        '-i'
    ],
    input : [
        guinness_nclr,
        guinness_ncgr_lz,
        guinness_nscr_lz,
        guinness_nanr_lz,
        guinness_ncer_lz,
    ],
    output : [
        'guinness.narc',
        'guinness.naix',
    ],
)

nitrofs_files += puzzle_gra_narc
naix_headers += puzzle_gra_narc[1]

#########################################################################
###                             VOLTORB_FLIP                          ###
###                         __...--------...__                        ###  
###                    _.--'                  `"-..                   ###
###                _.-'                  ,.        `-._               ###
###             _,'                    .'  \           `._            ###  
###           ,"                     ,'     .             `.          ###
###         ,'                      /        `.             `.        ###
###        /                       .           \              `.      ###
###      ,'                         `.._        .               .     ###
###     /                               `-._    /`               \    ###
###    /                                    `-._  \               \   ###
###   /    __,........----...__                 `"-'               \  ###
###  /.--""                    `'--.._                 ...........    ###
### j                                 `"-._            `. /      |  ` ###
### '                                      `._           `.      .   .###
###.                                          `._          `.    '   |###
###|                                             `.          \  /    |###
###|                                               `.         `'     |###
###|                                                 `.              |###
###|                                                   `.            |###
###'                                                     `.          |###
### .                                                      .         |###
###                                                         \        '###
###  '                                                       \      ' ###
###   .                                                       \    /  ###
###    \       ____                                            .  /   ###
###     \    ."    `""-._                                       '/    ###
###      `   '           `-.                                   ,'     ###
###       `.  `.            `.                               ,'       ###
###         `.  .             `.                           .'         ###
###           `._`-.            \                        .'           ###
###              `._`._          '                    _,'             ###
###                 `._`"-._     |                 _."                ###
###                     "-.._`--'           __,.-"'                   ### 
###                          `""----------"'              credit:maija###
#########################################################################
subdir('voltorb_flip')

puzzle_gra_narc = custom_target('voltorb_flip.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/voltorb_flip.narc',
        '-d', build_dir + '/voltorb_flip.narc.p',
        '-i'
    ],
    input : [
        voltorb_flip_nclr,
        voltorb_flip_ncgr_lz_sopc,
        voltorb_flip_ncgr_lz_clobber,
        voltorb_flip_nscr_lz,
        voltorb_flip_ncer_lz,
        voltorb_flip_nanr_lz
    ],
    output : [
        'voltorb_flip.narc',
        'voltorb_flip.naix',
    ],
)

nitrofs_files += puzzle_gra_narc
naix_headers += puzzle_gra_narc[1]

# Subdirectories
subdir('annon')
subdir('choose_starter')
subdir('pokegear')
subdir('record')
subdir('zukanlist')