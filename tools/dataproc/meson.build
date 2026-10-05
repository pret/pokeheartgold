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

repo_include = meson.global_source_root() / 'include'
repo_build = meson.global_build_root()
dataproc_templates_dir = meson.current_source_dir() / 'data'

commonproc_dep = declare_dependency(
    link_with: static_library(
        'commonproc',
        sources: files('src/common.c'),

        c_args: [
            dataproc_cflags,
            f'-DREPO_INCLUDE="@repo_include@"',
            f'-DREPO_BUILD="@repo_build@"',
            f'-DTEMPLATES_DIR="@dataproc_templates_dir@"',
        ],

        dependencies: [
            dataproc_dep,
            nitroarc_dep,
            libenum_dep,
            libexpr_dep,
        ],
        native: true,
    ),
    dependencies: [ dataproc_dep, nitroarc_dep, libenum_dep ],
)
