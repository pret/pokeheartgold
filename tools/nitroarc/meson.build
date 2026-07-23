nitroarc_cflags = [
    '-std=c99',
    '-DNDEBUG',
    '-O3',
    '-Wall',
    '-Wextra',
    '-Wpedantic',
    '-Wconversion',
    '-Wno-sign-conversion',
    '-Werror',
]

nitroarc_incdir = include_directories('lib/include')

nitroarc_dep = declare_dependency(
    include_directories: nitroarc_incdir,
    link_with: static_library(
        'nitroarc',
        sources: files('lib/nitroarc.c'),

        c_args: nitroarc_cflags,
        include_directories: nitroarc_incdir,
        install: false,
        native: true,
    ),
)

nitroarc_exe = executable(
    'nitroarc',
    sources: files(
        'src/common.c',
        'src/extensions.c',
        'src/main.c',
        'src/opmode_create.c',
        'src/opmode_extract.c',
        'src/opmode_list.c',
        'src/opmode_metadata.c',
        'src/optparse.c',
    ),

    c_args: nitroarc_cflags,
    dependencies: nitroarc_dep,
    install: false,
    native: true,
)
