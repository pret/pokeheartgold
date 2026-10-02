libenum_dep = declare_dependency(
    include_directories: include_directories('.'),
    link_with: static_library(
        'libenum',
        sources: files('libenum.c'),
        c_args: [
            '-std=gnu17',
            '-O3',
            '-Wall',
            '-Wextra',
            '-Wpedantic',
            '-Wconversion',
            '-Wno-sign-conversion',
            '-Werror',
        ],
        include_directories: include_directories('.'),
        native: true,
    ),
)

libexpr_dep = declare_dependency(
    include_directories: include_directories('.'),
    link_with: static_library(
        'libexpr',
        sources: files('libexpr.c'),
        c_args: [
            '-std=gnu17',
            '-O3',
            '-Wall',
            '-Wextra',
            '-Wpedantic',
            '-Wconversion',
            '-Wno-sign-conversion',
            '-Werror',
        ],
        include_directories: include_directories('.'),
        native: true,
    ),
)

enumproc_exe = executable(
    'enumproc',
    sources: files('enumproc.c'),
    c_args: [
        '-std=gnu17',
        '-O3',
        '-Wall',
        '-Wextra',
        '-Wpedantic',
        '-Wconversion',
        '-Wno-sign-conversion',
        '-Werror',
    ],
    dependencies: [ libenum_dep, libexpr_dep ],
    native: true,
)
