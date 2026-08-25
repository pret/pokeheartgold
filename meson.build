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
public_includes = include_directories('include', 'asm/include', 'lib/include', 'files', 'src', 'asm')
toplevel_includes = include_directories('.')
msl_includes = include_directories(
    'tools' / 'metroskrew' / 'lib' / 'metroskrew' / 'sdk' / 'ds' / '2.0' / 'sp2' / 'msl' / 'MSL_C' / 'MSL_Common' / 'Include'
)
relative_source_root = fs.relative_to(meson.project_source_root(), meson.project_build_root())

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
    '-O4,p'
]

asm_args = [
    '-proc', 'arm5TE',
    '-16',
    '-gccinc',
    '-g'
]

link_args = [
    '-w', 'off',
    '-proc', 'arm946e',
    '-nopic',
    '-nopid',
    '-interworking',
    '-map', 'closure,unused',
    '-symtab', 'sort',
    '-msgstyle' ,'gcc',
    '-m', '_start',
    '-force_active', 'DGTi_hash2_arm4_small',
    '-sym', 'on'
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
        'mwrap_sdk': '2.0/sp2p2'
    }
)

############################################################
###                         TOOLS                        ###
############################################################
subdir('tools')

############################################################
###                      SPEC FILES                      ###
############################################################
# Collect inputs for main.lcf
main_lsf = files('main.lsf')
main_lcf_template = subproject('NitroSDK').get_variable('main_lcf_template')

subdir('heartgold.us')

############################################################
###                  INTERNAL LIBRARIES                  ###
############################################################
subdir('lib')

############################################################
###                     FILE SYSTEM                      ###
############################################################
subdir('files')

############################################################
###                     ARM9 BINARY                      ###
############################################################
subdir('asm')
subdir('src')

libmslc = fs.copyfile('tools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2/msl/MSL_C/MSL_ARM/Lib/MSL_C_NITRO_Ai_LE.a')
libdsprot = fs.copyfile('lib/dsprot/libdsprot.a')

main = executable('main',
    sources : [
        pokeheartgold_c,
        pokeheartgold_asm,
        nitrodwc_asm,
        naix_headers,
    ],
    c_args : [
        
    ],
    nasm_args : [
        '-DPM_ASM',
        '-DSDK_ASM',
        asm_args
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
    link_with : [
        libmslc,
        libsyscall,
        libspl,
        libwifi,
        libVCT,
        libdsprot,
        libirc,
    ],
    link_args : [
        link_args,
        'heartgold.us/main.lcf'
    ],
    link_depends : main_lcf,
    native : false
)
############################################################
###                    ARM7 BINARIES                     ###
############################################################
ichneumon_sub = subproject('NitroSDK'
    ).get_variable('ichneumon_sub')

ichneumon_sub_defs = subproject('NitroSDK'
    ).get_variable('ichneumon_sub_defs')

############################################################
###                        DS ROM                        ###
############################################################

pokeheartgold_nds = custom_target('pokeheartgold.us.nds',
    output : 'pokeheartgold.us.nds',
    input : [
        main,
        rom_header_template,
        icon_png,
        ichneumon_sub,
        ichneumon_sub_defs,
        nitrofs_files,
    ],
    command : [
        nitrorom_exe,
        'pack',
        '-DHEADER_TEMPLATE=@INPUT1@',   # rom_header_template
        '-DICON_PNG=@INPUT2@',          # icon_png
        '-DARM7_STATIC=@INPUT3@',       # ichneumon_sub
        '-DARM7_DEFINE=@INPUT4@',       # ichneumon_sub_defs
        '--output=@OUTPUT0@',           # pokeheartgold.us.nds
        rom_ini,
        filesys_csv,
    ],
    build_by_default : true
)

############################################################
###                        TESTS                         ###
############################################################
sha1sum = find_program(['sha1sum', 'shasum'], native: true)

test('Main Checksums',
    sha1sum,
    args: ['-c', '--quiet', main_sha1]
)

test('Filesystem Checksums',
    sha1sum,
    args: ['-c', '--quiet', filesystem_sha1]
)

test('ROM Checksum',
    sha1sum,
    args: ['-c', '--quiet', rom_sha1]
)


############################################################
###                       POSTCONF                       ###
############################################################
meson.add_postconf_script(postconf_py)