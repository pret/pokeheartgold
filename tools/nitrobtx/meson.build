nitrobtx_cflags = [
    '-std=gnu17',
    '-O3',
    '-Wall',
    '-Wno-sign-conversion',
    '-Werror',
]

libpng_dep = dependency('libpng', native: true)

nitrobtx_incdir = include_directories('include')

nitrobtx_exe = executable(
    'nitrobtx',
    sources: files(
        'src/common.c',
        'src/help.c',
        'src/main.c',
        'src/ns/chunks/tex.c',
        'src/ns/container.c',
        'src/ns/resource_dict.c',
        'src/ns/resource_name.c',
        'src/ns/resource_tree.c',
        'src/options.c',
        'src/palette.c',
        'src/texture.c',
    ),
    c_args: nitrobtx_cflags,
    include_directories: nitrobtx_incdir,
    dependencies: libpng_dep,
    native: true,
)
