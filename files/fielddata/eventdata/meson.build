build_dir = meson.current_build_dir()

############################################################
###                      ZONE_EVENT                      ###
############################################################
zone_event_template = files('zone_event.json.txt')

zone_event_gen = generator(json2bin_sh,
    arguments : [
        '--compiler', relative_source_root / 'tools' / 'metroskrew' / 'bin' / 'mwasmarm.exe',
        '--jsonproc', jsonproc_exe.full_path(),
        '--template', zone_event_template[0].full_path(),
        '--o2narc', o2narc_exe.full_path(),
        '--out-dir', build_dir / 'zone_event.narc.p',
        '-i', relative_source_root,
        '-i', relative_source_root / 'include',
        '-i', relative_source_root / 'subprojects' / 'NitroSDK-4.2.30001' / 'include',
        '-i', relative_source_root / 'files',
        '--language', 'asm',
        '-D', 'PM_ASM',
        '-y',
        '@INPUT@'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    output : '@BASENAME@.bin'
)

subdir('zone_event')

zone_event_narc = custom_target('zone_event.narc',
    input : zone_event_gen.process(zone_event_json),
    output: [ 
        'zone_event.narc', 
        'zone_event.naix',
    ],
    command : [
        narc_exe,
        '-p', build_dir + '/zone_event.narc',
        '-d', build_dir + '/zone_event.narc.p',
        '-i'
    ],
    depends : [
        jsonproc_exe,
        o2narc_exe,
    ],
    build_by_default:true
)

nitrofs_files += zone_event_narc
naix_headers += zone_event_narc[1]
