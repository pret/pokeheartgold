relative_source_root = fs.relative_to(meson.project_source_root(), meson.project_build_root())

nitrofs_files = []
naix_headers = []

# Generators
ncgr_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NCGR',
)

ncgr_cell_gen = generator(nitrogfx_exe,
    arguments: [
        '@INPUT@',
        '@OUTPUT@',
        '-cell', '-preservepath',
        '@EXTRA_ARGS@',
    ],
    output: '@BASENAME@.NCGR',
)

ncgr_lz_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NCGR.lz',
)

ncgr_cell_lz_gen = generator(nitrogfx_exe,
    arguments: [
        '@INPUT@',
        '@OUTPUT@',
        '-cell', '@CURRENT_SOURCE_DIR@/@BASENAME@_cell.json',
        '@EXTRA_ARGS@',
    ],
    output: '@BASENAME@.NCGR.lz',
)

nclr_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NCLR',
)

ncer_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NCER'
)

ncer_lz_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NCER.lz',
)

nanr_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NANR'
)

nanr_lz_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@', ],
    output: '@BASENAME@.NANR.lz',
)

lz_gen = generator(nitrogfx_exe,
    arguments: [ '@INPUT@', '@OUTPUT@', '-nopad', '@EXTRA_ARGS@', ],
    output: '@PLAINNAME@.lz',
)

copy_gen = generator(find_program('cp'),
    arguments: [ '@INPUT@', '@OUTPUT@', ],
    output: '@PLAINNAME@'
)

# Predefined graphics flags
CLOBBER_SIZE_VERSION101_NCGR_FLAGS = ['-clobbersize', '-version101']
VERSION101_SOPC_NCGR_FLAGS = ['-version101', '-sopc']
VERSION101_SOPC_8BPP_NCGR_FLAGS = ['-version101', '-sopc', '-bitdepth', '8']

BPP4_NOPAD_PCMP_NCLR_FLAGS = ['-bitdepth', '4', '-nopad', '-pcmp']

EXTFMT_LZ_FLAGS = ['-nopad', '-extfmt']

# Subdirectories
subdir('application')
subdir('arc')
subdir('data')
subdir('demo')
subdir('graphic')
subdir('itemtool')
subdir('poketool')

#Msgdata must come after poketool for trainer name file
subdir('msgdata')
