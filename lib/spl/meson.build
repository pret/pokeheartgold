
libspl_c_args = [
    '-nothumb',
    '-wrap:sdk', '1.2/base_b73',
    '-wrap:noipa',
]

libspl_link_args = [
    '-library',
    '-nothumb',
    '-main', '""',
    '-nostdlib',
]

libspl_public_includes = include_directories('include')

libspl_srcs = files(
    'src/spl_manager.c',
    'src/spl_emitter.c',
    'src/spl_draw.c',
    'src/spl_emit.c',
    'src/spl_anim.c',
    'src/spl_behavior.c',
    'src/spl_list.c',
    'src/spl_random.c'
)

libspl = static_library('spl',
    sources: libspl_srcs,
    nasm_args: asm_args,
    c_args: libspl_c_args,
    link_args: libspl_link_args,
    include_directories: [public_includes, libspl_public_includes],
    dependencies: [nitrosdk_dep, nitrosystem_dep],
    pic: false
)
