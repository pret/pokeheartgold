compstatic_src = files(
    'component.c',
    'compress.c',
    'digest.c',
    'files.c',
    'main.c',
    'misc.c',
    'overlay_defs.c',
    'overlay_modules.c',
    'overlay_table.c',
    'print.c',
    'static_module.c',
    'str.c',
)

compstatic_exe = executable(
    'compstatic',
    sources: compstatic_src,
    c_args: ['-O3'],
    dependencies: nitroarc_dep,
    install: false,
    native: true,
)