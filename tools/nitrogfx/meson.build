nitrogfx_lib_flags = run_command('pkg-config', '--cflags', 'libpng', 'zlib').stdout().strip()
libpng_dep = dependency('libpng', native : true)

nitrogfx_exe = executable('nitrogfx',
    sources : [
        'main.c',
        'convert_png.c',
        'gfx.c',
        'jasc_pal.c',
        'lz.c',
        'rl.c',
        'util.c',
        'font.c',
        'huff.c',
        'json.c',
        'cJSON.c',
    ],
    c_args : [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wno-sign-compare',
        '-std=gnu17',
        '-DPNG_SKIP_SETJMP_CHECK',
        nitrogfx_lib_flags,
        '-O2',
    ],
    dependencies : libpng_dep,
    native : true
)