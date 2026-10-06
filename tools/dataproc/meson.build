dataproc_cflags = [
    '-std=gnu17',
    '-O3',
    '-Wall',
    '-Wextra',
    '-Wpedantic',
    '-Wconversion',
    '-Wno-sign-conversion',
    '-Wno-unused-result',
    '-Wno-stringop-overflow',
]

dataproc_dep = declare_dependency(
    include_directories: include_directories('lib/include'),
    link_with: static_library(
        'dataproc',
        sources: files(
            'lib/dataproc.c',
            'lib/json.c',
        ),

        c_args: dataproc_cflags,

        include_directories: include_directories('lib/include'),
        dependencies: dependency('yyjson'),
        native: true,
    ),
)
