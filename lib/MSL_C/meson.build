msl_c_srcs = files(
#asm
'asm/MSL_ARM_abort_exit.s',
'asm/MSL_ARM_critical_regions_NITRO.s',
'asm/MSL_ARM_math.s',
'asm/MSL_ARM_pool_alloc_NITRO.s',
'asm/MSL_Common_alloc.s',
'asm/MSL_Common_ansi_files.s',
'asm/MSL_Common_assert.s',
'asm/MSL_Common_buffer_io.s',
'asm/MSL_Common_ctype.s',
'asm/MSL_Common_direct_io.s',
'asm/MSL_Common_errno.s',
'asm/MSL_Common_file_io.s',
'asm/MSL_Common_file_pos.s',
'asm/MSL_Common_float.s',
'asm/MSL_Common_mbstring.s',
'asm/MSL_Common_mem.s',
'asm/MSL_Common_mem_funcs.s',
'asm/MSL_Common_printf.s',
'asm/MSL_Common_qsort.s',
'asm/MSL_Common_scanf.s',
'asm/MSL_Common_signal.s',
'asm/MSL_Common_string.s',
'asm/MSL_Common_strtold.s',
'asm/MSL_Common_strtoul.s',
'asm/MSL_Common_wchar_io.s',
'asm/MSL_Common_wctype.s',
'asm/MSL_Common_wmem.s',
'asm/MSL_Common_wprintf.s',
'asm/MSL_Common_wstring.s',
'asm/MSL_CPP_NITRO_Ai_LE.s',
'asm/MSL_DPMath_e_pow.s',
'asm/MSL_DPMath_s_copysign.s',
'asm/MSL_DPMath_s_fabs.s',
'asm/MSL_DPMath_s_frexp.s',
'asm/MSL_DPMath_s_ldexp.s',
'asm/MSL_DPMath_w_pow.s',
'asm/MSL_fp_ansi.s',
'asm/MSL_math.s',
'asm/MSL_string_extras.s',
#c
'src/arith.c',
'src/rand.c'
)

msl_c_includes = include_directories('asm/include')

msl_c_c_args = [
    '-nothumb',
    '-wrap:sdk', '2.0/sp2p3'
]

msl_c_extras_lib = static_library('msl_c_extras',
    sources: ['asm/MSL_string_extras.s'],
    c_args : msl_c_c_args,
    nasm_args : asm_args,
    include_directories : [lib_includes, msl_c_includes],
    pic : false
)