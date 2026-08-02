build_dir = meson.current_build_dir()

############################################################
###                       NAME IN                        ###
############################################################
subdir('namein')

namein_narc = custom_target('namein.narc',
    command : [
        narc_exe,
        '-p', build_dir + '/namein.narc',
        '-d', build_dir + '/namein.narc.p',
        '-i'
    ],
    input : [
        namein_nclr,
        namein_ncgr_lz,
        namein_nscr_lz,
        namein_ncer_lz,
        namein_nanr_lz,
    ],
    output : [
        'namein.narc',
        'namein.naix'
    ],
    build_by_default:true
)

nitrofs_files += namein_narc
naix_headers += namein_narc[1]


############################################################
###                        RESDAT                        ###
############################################################
subdir('resdat')
resdat_template = files('resdat.json.txt')

resdat_bin_gen = generator(json2bin_sh,
    arguments : [
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', resdat_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir / 'resdat.narc.p',
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    output : '@BASENAME@.bin'
)

resdat_narc = custom_target('resdat.narc',
    output: [ 
        'resdat.narc', 
        'resdat.naix' 
    ],
    input: resdat_bin_gen.process(resdat_json),
    command: [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    build_by_default:true
)

nitrofs_files += resdat_narc
naix_headers += resdat_narc[1]

############################################################
###                       SBOX_GRA                       ###
############################################################
subdir('sbox_gra')

sbox_gra_narc = custom_target('sbox_gra.narc',
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--files-from', sbox_gra_order,
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        sbox_gra_nclr,
        sbox_gra_ncgr,
    ],
    output : [
        'sbox_gra.narc',
        'sbox_gra.naix'
    ],
    build_by_default:true
)

nitrofs_files += sbox_gra_narc
naix_headers += sbox_gra_narc[1]

# Other subdirs
subdir('mmodel')