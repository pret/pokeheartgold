project('pokeheartgold', ['c', 'cpp', 'nasm'],
    version: '1.0',
    meson_version: '>=1.12.0',
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
    '-O4,p',
    '-D_MSL_RESTRICT=',
    '-DHEARTGOLD',
]

asm_args = [
    '-proc', 'arm5TE',
    '-16',
    '-gccinc',
    '-g',
    '-DHEARTGOLD'
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
        'mwrap_libos' : '2.0/sp2p3',
        'mwrap_libcard' : '2.0/sp2p3',
        'mwrap_arm7' : '2.0/sp2p3',
        'mwrap_libwl_arm7' : '2.0/sp1p2',
        'sp1p3_conditionals' : true,
        'patch3' : true,
        'hg_card_spi' : true,
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

libvct_dep = dependency('libvct')

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

#libmslc = fs.copyfile('tools/metroskrew/lib/metroskrew/sdk/ds/2.0/sp2p3/msl/MSL_C/MSL_ARM/Lib/MSL_C_NITRO_Ai_LE.a')
libdsprot = fs.copyfile('lib/dsprot/libdsprot.a')

main = executable('main',
    sources : [
        pokeheartgold_c,
        pokeheartgold_asm,
        nitrodwc_asm,
        naix_headers,
    ],
    c_args : [
        '-DPM_KEEP_ASSERTS'
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
        crypto_static_dep,
        nitrowifi_dep,
        nitrodwc_dep,
        libvct_dep,
        libdwcppwlobby_dep,
    ],
    link_with : [
        libsyscall,
        libspl,
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

main_sbins_lz = [
    'main.sbin_LZ',
    'OVY_0.sbin_LZ',
    'field.sbin_LZ',
    'OVY_2.sbin_LZ',
    'OVY_3.sbin_LZ',
    'OVY_4.sbin_LZ',
    'OVY_5.sbin_LZ',
    'OVY_6.sbin_LZ',
    'OVY_7.sbin_LZ',
    'OVY_8.sbin_LZ',
    'OVY_9.sbin_LZ',
    'OVY_10.sbin_LZ',
    'OVY_11.sbin_LZ',
    'OVY_12.sbin_LZ',
    'OVY_13.sbin_LZ',
    'OVY_14.sbin_LZ',
    'OVY_15.sbin_LZ',
    'OVY_16.sbin_LZ',
    'OVY_17.sbin_LZ',
    'OVY_18.sbin_LZ',
    'OVY_19.sbin_LZ',
    'OVY_20.sbin_LZ',
    'OVY_21.sbin_LZ',
    'OVY_22.sbin_LZ',
    'npc_trade.sbin_LZ',
    'bug_contest.sbin_LZ',
    'OVY_25.sbin_LZ',
    'OVY_26.sbin_LZ',
    'OVY_27.sbin_LZ',
    'OVY_28.sbin_LZ',
    'OVY_29.sbin_LZ',
    'touch_save_app.sbin_LZ',
    'OVY_31.sbin_LZ',
    'OVY_32.sbin_LZ',
    'OVY_33.sbin_LZ',
    'OVY_34.sbin_LZ',
    'OVY_35.sbin_LZ',
    'OVY_36.sbin_LZ',
    'OVY_37.sbin_LZ',
    'OVY_38.sbin_LZ',
    'OVY_39.sbin_LZ',
    'OVY_40.sbin_LZ',
    'OVY_41.sbin_LZ',
    'OVY_42.sbin_LZ',
    'OVY_43.sbin_LZ',
    'OVY_44.sbin_LZ',
    'OVY_45.sbin_LZ',
    'OVY_46.sbin_LZ',
    'OVY_47.sbin_LZ',
    'OVY_48.sbin_LZ',
    'OVY_49.sbin_LZ',
    'trainer_card.sbin_LZ',
    'trainer_card_main.sbin_LZ',
    'trainer_card_signature.sbin_LZ',
    'OVY_53.sbin_LZ',
    'options_app.sbin_LZ',
    'OVY_55.sbin_LZ',
    'OVY_56.sbin_LZ',
    'OVY_57.sbin_LZ',
    'OVY_58.sbin_LZ',
    'OVY_59.sbin_LZ',
    'intro_title.sbin_LZ',
    'OVY_61.sbin_LZ',
    'OVY_62.sbin_LZ',
    'OVY_63.sbin_LZ',
    'OVY_64.sbin_LZ',
    'OVY_65.sbin_LZ',
    'OVY_66.sbin_LZ',
    'OVY_67.sbin_LZ',
    'OVY_68.sbin_LZ',
    'OVY_69.sbin_LZ',
    'OVY_70.sbin_LZ',
    'OVY_71.sbin_LZ',
    'OVY_72.sbin_LZ',
    'OVY_73.sbin_LZ',
    'OVY_74.sbin_LZ',
    'OVY_75.sbin_LZ',
    'credits.sbin_LZ',
    'OVY_77.sbin_LZ',
    'certificates_app.sbin_LZ',
    'OVY_79.sbin_LZ',
    'OVY_80.sbin_LZ',
    'OVY_81.sbin_LZ',
    'OVY_82.sbin_LZ',
    'OVY_83.sbin_LZ',
    'OVY_84.sbin_LZ',
    'OVY_85.sbin_LZ',
    'OVY_86.sbin_LZ',
    'OVY_87.sbin_LZ',
    'OVY_88.sbin_LZ',
    'OVY_89.sbin_LZ',
    'OVY_90.sbin_LZ',
    'OVY_91.sbin_LZ',
    'OVY_92.sbin_LZ',
    'OVY_93.sbin_LZ',
    'OVY_94.sbin_LZ',
    'OVY_95.sbin_LZ',
    'OVY_96.sbin_LZ',
    'OVY_97.sbin_LZ',
    'OVY_98.sbin_LZ',
    'OVY_99.sbin_LZ',
    'pokegear.sbin_LZ',
    'pokegear_app.sbin_LZ',
    'OVY_102.sbin_LZ',
    'OVY_103.sbin_LZ',
    'OVY_104.sbin_LZ',
    'OVY_105.sbin_LZ',
    'OVY_106.sbin_LZ',
    'OVY_107.sbin_LZ',
    'OVY_108.sbin_LZ',
    'OVY_109.sbin_LZ',
    'OVY_110.sbin_LZ',
    'OVY_111.sbin_LZ',
    'OVY_112.sbin_LZ',
    'OVY_113.sbin_LZ',
    'OVY_114.sbin_LZ',
    'OVY_115.sbin_LZ',
    'OVY_116.sbin_LZ',
    'OVY_117.sbin_LZ',
    'OVY_118.sbin_LZ',
    'OVY_119.sbin_LZ',
    'OVY_120.sbin_LZ',
    'view_rankings_app.sbin_LZ',
    'voltorb_flip.sbin_LZ',
    'ds_protect.sbin_LZ',
    'OVY_124.sbin_LZ',
    'OVY_125.sbin_LZ',
    'OVY_126.sbin_LZ',
    'OVY_127.sbin_LZ',
    'OVY_128.sbin_LZ',
]

main_lz = custom_target('main_lz',
    command : [ 
        compstatic_exe,
        '-9',
        '-c',
        '-f', meson.current_build_dir() / 'component.files',
    ],
    output : main_sbins_lz,
    depends : main
)

############################################################
###                    ARM7 BINARIES                     ###
############################################################
ichneumon_sub = subproject('NitroSDK').get_variable('ichneumon_sub')

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
        nitrofs_files,
    ],
    command : [
        nitrorom_exe,
        'pack',
        '-DHEADER_TEMPLATE=@INPUT1@',   # rom_header_template
        '-DICON_PNG=@INPUT2@',          # icon_png
        '-DARM7_NEF=@INPUT3@',          # ichneumon_sub
        '--output=@OUTPUT0@',           # pokeheartgold.us.nds
        rom_ini,
        filesys_csv,
    ],
    depends : main_lz,
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