build_dir = meson.current_build_dir()

############################################################
###                     GS_AREAWINDOW                    ###
############################################################
subdir('gs_areawindow')

gs_areawindow_narc = custom_target('gs_areawindow.narc',
    command : [
        nitroarc_exe,
        '--create',
        '--index',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
    ],
    input : [
        gs_areawindow_nclr,
        gs_areawindow_ncgr,
    ],
    output : [
        'gs_areawindow.narc',
        'gs_areawindow.naix'
    ],
)

nitrofs_files += gs_areawindow_narc
naix_headers += gs_areawindow_narc[1]


############################################################
###                       NAME IN                        ###
############################################################
subdir('namein')

namein_narc = custom_target('namein.narc',
    command : [
        nitroarc_exe,
        '--create',
        '--index-namespace',
        '--file', '@OUTPUT0@',
        '@PRIVATE_DIR@',
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
###                      PHOTO_DATA                      ###
############################################################
photo_data_template = files('photo_data.json.txt')
photo_data_json = files('photo_data.json')

photo_data_narc = custom_target('pmtel_book.dat',
    input : photo_data_json,
    output: [
        'photo_data.narc',
        'photo_data.naix'
    ],
    command : [
        json2bin_sh,
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', photo_data_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir,
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-N',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
    ],
)

nitrofs_files += photo_data_narc
naix_headers += photo_data_narc[1]

############################################################
###                        RESDAT                        ###
############################################################
subdir('resdat')
resdat_template = files('resdat.json.txt')

resdat_bin_gen = generator(json2bin_sh,
    arguments : [
        '--compiler', meson.get_compiler('c', native: false).cmd_array()[0],
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
subdir('mushi')
subdir('sound')

# Prebuilt files
prebuilt_files = [
    'UTF16.dat',
    'area00light.txt',
    'area01light.txt',
    'area02light.txt',
    'arealight.narc',
    'battle_win.NSCR',
    'cell0.NCGR',
    'cell0.NCLR',
    'clact_default.NANR',
    'crystal.nsbmd',
    'demo_climax.narc',
    'dp_areawindow.NCGR',
    'dp_areawindow.NCLR',
    'dun20_01light.txt',
    'dun20_02light.txt',
    'dun_sea.nsbtx',
    'eoo.dat',
    'exdata.dat',
    'farm.dat',
    'field_cutin.narc',
    'fldtanime.narc',
    'fs_kanban.nsbca',
    'ground0.NCGR',
    'ground0.NCLR',
    'ground0.NSCR',
    'gsbr.dat',
    'guru2.narc',
    'kemu_itpconv.dat',
    'kowaza.narc',
    'lake_anim.nsbtx',
    'miniasahamabe.nsbtx',
    'miniasasea.nsbtx',
    'minihamabe.nsbtx',
    'minimum.nsbtx',
    'minirhana.nsbtx',
    'nfont.NCGR',
    'nfont.NCLR',
    'pc.nsbca',
    'pl_wifi.ncgr',
    'pl_wm.ncgr',
    'pl_wm.nclr',
    'slot.narc',
    'smptm_koori.NANR',
    'smptm_koori.NCER',
    'smptm_koori.NCGR',
    'smptm_koori.NCLR',
    'smptm_nemuri.NANR',
    'smptm_nemuri.NCER',
    'smptm_nemuri.NCGR',
    'smptm_nemuri.NCLR',
    'str2uni.bin',
    't3_fl_b.nsbtx',
    't3_fl_p.nsbtx',
    't3_fl_r.nsbtx',
    't3_fl_y.nsbtx',
    'test.atr',
    'tmap_block.dat',
    'tmap_flags.dat',
    'tradelist.narc',
    'trapmark.narc',
    'ug_anim.narc',
    'ug_base_cur.nsbmd',
    'ug_boygirl.NCGR',
    'ug_boygirl.NCLR',
    'ug_fossil.narc',
    'ug_hero.NANR',
    'ug_hero.NCER',
    'ug_hole.NANR',
    'ug_hole.NCER',
    'ug_hole.NCGR',
    'ug_parts.narc',
    'ug_radar.narc',
    'ug_trap.narc',
    'ugeffect_obj_graphic.narc',
    'underg_radar.narc',
    'utility.bin',
    'weather_sys.narc',
    'wifi.ncgr',
    'wifinote.narc',
    'wifip2pmatch.narc',
    'wm.ncgr',
    'wm.nclr',
    'wm256k.ncgr',
]

foreach f : prebuilt_files
    nitrofs_files += fs.copyfile(f)
endforeach
