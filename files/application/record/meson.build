build_dir = meson.current_build_dir()

############################################################
###                        RECORD                        ###
############################################################
subdir('record')

record_narc = custom_target('record.narc',
    command : [
        narc_exe, 
        '-p', build_dir + '/record.narc',
        '-d', build_dir + '/record.narc.p',
        '-i'
    ],
    input : [
        record_nclr,
        record_bin
    ],
    output : [
        'record.narc',
        'record.naix',
    ],
)

nitrofs_files += record_narc
naix_headers += record_narc[1]