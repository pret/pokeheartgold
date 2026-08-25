build_dir = meson.current_build_dir()

############################################################
###                      OTHER_POKE                      ###
############################################################
otherpoke_index_ncgr = {}
otherpoke_index_nclr = {}

subdir('otherpoke')

otherpoke_file_args = []

foreach index, file : otherpoke_index_ncgr
    otherpoke_file_args += '--ncgr'
    otherpoke_file_args += file
    otherpoke_file_args += index
endforeach

foreach index, file : otherpoke_index_nclr
    otherpoke_file_args += '--nclr'
    otherpoke_file_args += file[0].full_path()
    otherpoke_file_args += index
endforeach

otherpoke_narc = custom_target('otherpoke.narc',
    command : [
        makeotherpoke_sh,
        '--out-dir', build_dir / 'otherpoke.narc.p',
        '--nitrogfx', nitrogfx_exe.full_path(),
        '--narc-exe', narc_exe.full_path(),
        otherpoke_file_args
    ],
    output : [
        'otherpoke.narc',
        'otherpoke.naix',
    ]
)    

nitrofs_files += otherpoke_narc
naix_headers += otherpoke_narc[1]

############################################################
###                       POKEGRA                        ###
############################################################
pokegra_female_back = []
pokegra_female_front = []
pokegra_male_back = []
pokegra_male_front = []
#pokegra_normal_pal = []
#pokegra_shiny_pal = []

subdir('pokegra')

pokegra_narc = custom_target('pokegra.narc',
    output: 'pokegra.narc',
    input: [
        pokegra_female_back,
        pokegra_female_front,
        pokegra_male_back,
        pokegra_male_front
    ],
    command: [
        make_pokegra_py,
        '--nitrogfx', nitrogfx_exe,
        '--narc', nitroarc_exe,
        '--source-dir', '@CURRENT_SOURCE_DIR@' / 'pokegra',
        '--private-dir', '@PRIVATE_DIR@',
        '--output-dir', '@OUTDIR@',
    ],
)

nitrofs_files += pokegra_narc

# Prebuilt Files #

prebuilt_files = [
    'height.narc',
    'height_o.narc'
]

foreach f : prebuilt_files
    nitrofs_files += fs.copyfile(f)
endforeach

