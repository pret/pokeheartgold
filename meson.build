project('pokeheartgold', ['c', 'cpp', 'nasm'],
    version: '1.0',
    meson_version: '>=1.10.0',
    default_options : [
        'buildtype=plain',
        'warning_level=0'
    ]
)

fs = import('fs')

############################################################
###                    INCLUDE PATHS                     ###
############################################################
public_includes = include_directories('include', 'asm/include', 'lib/include', 'build/files', 'files')
toplevel_includes = include_directories('.')

############################################################
###                    COMPILER FLAGS                    ###
############################################################
c_args = [
    '-proc', 'arm946e',
    '-enum', 'int',
    '-lang', 'c99',
    '-Cpp_exceptions', 'off',
    '-gccext,on',
    '-msgstyle', 'gcc',
    '-ipa', 'file',
    '-interworking',
    '-inline', 'on,noauto',
    '-char', 'signed',
    '-nosyspath',
    '-stdinc',
    '-sym', 'on',
]

asm_args = [
    '-proc', 'arm5TE',
    '-16',
    '-gccinc'
]

add_global_arguments(c_args,
    language: 'c',
    native: false
)

############################################################
###                     DEPENDENCIES                     ###
############################################################
nitrosdk_dep = dependency('NitroSDK',
    default_options : {
        'mwrap_sdk' : '2.0/sp1p2',
        'sp1p3_conditionals' : true,
    }
)

nitrosystem_dep = dependency('NitroSystem',
    default_options: {
        'mwrap_sdk': '2.0/sp2',
    }
)

nitrowifi_dep = dependency('NitroWiFi',
    default_options: {
        'mwrap_sdk': '2.0/sp1p2',
        'sp1p3_conditionals': true
    }
)

nitrodwc_dep = dependency('NitroDWC',
    default_options: {
        'mwrap_sdk': '2.0/sp2p2',
        'link_ppwlobby': true
    }
)

############################################################
###                         TOOLS                        ###
############################################################
subdir('tools')

############################################################
###                      SPEC FILES                      ###
############################################################
subdir('heartgold.us')

############################################################
###                  INTERNAL LIBRARIES                  ###
############################################################
subdir('lib')

############################################################
###                         FILES                        ###
############################################################
subdir('files')

subdir('asm')
subdir('src')

#ARM 9 BINARY

main = executable('main',
    sources : [
        pokeheartgold_c,
        pokeheartgold_asm,
        naix_headers,
    ],
    c_args : [
        
    ],
    include_directories : [
        public_includes,
        lib_asm_includes,
    ],
    dependencies : [
        nitrosdk_dep,
        nitrosystem_dep,
        nitrowifi_dep,
        nitrodwc_dep,
    ],
    native : false
)

############################################################
###                        DS ROM                        ###
############################################################

pokeheartgold_nds = custom_target('pokeheartgold.us.nds',
    output : 'pokeheartgold.us.nds',
    input : [
        main,
        rom_header_template,
        nitrofs_files,
    ],
    command : [
        nitrorom_exe,
        'pack',
        '-DHEADER_TEMPLATE=@INPUT1@', #rom_header_template
    ]
)

############################################################
###                       POSTCONF                       ###
############################################################
meson.add_postconf_script(postconf_py)