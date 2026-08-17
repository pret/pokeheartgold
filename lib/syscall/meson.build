
libsyscall_link_args = [
    '-library',
    '-nodead',
    '-w', 'off',
    '-proc', 'v5te'
]

libsyscall_asm = files(
    'asm/_secure_IPGE.s',
    'asm/_secure_IPKE.s'
)

libsyscall_public_includes = include_directories('.')

libsyscall = static_library('syscall',
    sources : libsyscall_asm,
    link_args : libsyscall_link_args,
    include_directories : libsyscall_public_includes,
    pic : false
)