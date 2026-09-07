lib_asm_includes = [
    include_directories('asm/include'),
    include_directories('NitroDWC/asm/include'),
    #include_directories('NitroSDK/asm/include'),
    #include_directories('syscall/asm/include'),
]

lib_includes = include_directories('include', 'syscall')

##############
###  SPL   ###
##############
lib_link_args = [
    '-library',
    '-nothumb',
    '-main', '""',
    '-nostdlib',
]

libspl = static_library('spl',
    sources : files('asm/jn_spl.s'),
    nasm_args : asm_args,
    link_args : lib_link_args,
    include_directories : [public_includes, lib_asm_includes],
    dependencies : [nitrosdk_dep, nitrosystem_dep],
    pic : false
)

##############
###  IRC   ###
##############
libirc = static_library('irc',
    sources : files('asm/libirc.s'),
    nasm_args : asm_args,
    link_args : lib_link_args,
    include_directories : [public_includes, lib_asm_includes],
    dependencies : [nitrosdk_dep, nitrosystem_dep],
    pic : false
)

subdir('dsprot')
subdir('NitroDWC')
subdir('syscall')
subdir('MSL_C')

