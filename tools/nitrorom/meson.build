libpng_dep = dependency('libpng', native: true)

nitrorom_exe = executable('nitrorom',
    sources: [
        files(
            'src/libs/clip.c',
            'src/libs/config.c',
            'src/libs/fileio.c',
            'src/libs/sheets.c',
            'src/libs/strings.c',
            'src/nitrorom.c',
            'src/nitrorom_list.c',
            'src/nitrorom_pack.c',
            'src/packer.c',
            'src/parse/cfg_arm.c',
            'src/parse/cfg_banner.c',
            'src/parse/cfg_header.c',
            'src/parse/cfg_rom.c',
            'src/parse/csv_addfile.c',
        ),
    ],

    c_args: [
        '-std=gnu17',
        '-O3',
        '-Wall',
        '-Wextra',
        '-Wno-unused-result',
        '-Wno-stringop-overflow',
    ],

    include_directories: include_directories('include'),
    dependencies: libpng_dep,
    native: true,
)
