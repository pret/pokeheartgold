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