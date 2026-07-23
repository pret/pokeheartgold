/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:46 $
 * $Revision: 1.53.2.2 $
 */

/********************************************************************************
 *      A collection of functions designed to provide access to the floating    *
 *      point environment for numerical programming. It is modeled after the    *
 *      Numerical C Extensions Group's requirements ( NCEG / X3J11.1 ).         *
 *                                                                              *
 *      The file <fenv.h> declares many functions in support of numerical       *
 *      programming.  It provides a set of environmental controls similar to    *
 *      the ones found in <SANE.h>.  Programs that test flags or run under      *
 *      non-default modes must do so under the effect of an enabling            *
 *      "fenv_access" pragma.                                                   *
 *                                                                              *                                                                              *
 *      Written by Ali Sazegari, started on October 1992.                       *
 ********************************************************************************/

#ifndef _MSL_FENV_H
#define _MSL_FENV_H

#ifndef __FENV__
#define __FENV__	/* JWW - Keep the Apple Universal Interfaces happy */

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#else
	#include <CarbonCore/fenv.h>
	#endif
#else
#if _MSL_C99
#ifdef __POWERPC__
	/* FP TYPES */
	typedef long int		fenv_t;
	typedef long int		fexcept_t;
	/* FP EXCEPTION FLAGS */
	#define FE_DIVBYZERO	0x04000000	/* bit 5 from left of the FPSCR, !!don't forget 2 count bit 0!! */
	#define FE_INEXACT		0x02000000	/* bit 6 */
	#define FE_INVALID		0x20000000	/* bit 2 */
	#define FE_OVERFLOW		0x10000000	/* bit 3 */
	#define FE_UNDERFLOW	0x08000000	/* bit 4 */
	/* ROUNDING MODES */
	#define FE_DOWNWARD		0x00000003	/* bits 30 - 31 */
	#define FE_TONEAREST	0x00000000
	#define FE_TOWARDZERO	0x00000001
	#define FE_UPWARD		0x00000002
#endif /* __POWERPC__ */

#ifdef __MIPS__
	typedef long int		fenv_t;
	typedef long int		fexcept_t;
	/* FP EXCEPTION FLAGS */
	#define FE_INEXACT		0x00001000
	#define FE_UNDERFLOW	0x00002000
	#define FE_OVERFLOW		0x00004000
	#define FE_DIVBYZERO	0x00008000
	#define FE_INVALID		0x00010000
	
	/* ROUNDING MODES  - ASKING SONY - TEMPORARY ONLY*/ 
	#define FE_TONEAREST		((short)(-1))
	#define FE_UPWARD			((short)(-2))
	#define FE_DOWNWARD			((short)(-3))
	#define FE_TOWARDZERO		((short)(-4))
#endif

#if defined(__MC68K__) || defined(__COLDFIRE__)
	#if __MC68881__ || __COLDFIRE_HW_FPU__
		/* FP TYPES */
		typedef long fexcept_t;
		typedef struct {
		    long FPCR;
		    long FPSR;
		} fenv_t;
		/* FP EXCEPTION FLAGS */
		#define FE_INEXACT		((long)(8))
		#define FE_DIVBYZERO	((long)(16))
		#define FE_UNDERFLOW	((long)(32))
		#define FE_OVERFLOW		((long)(64))
		#define FE_INVALID		((long)(128))
	#else 	/* endif __MC68881__ */
		/* FP TYPES */
		typedef short fexcept_t;
		typedef short fenv_t;
		/* FP EXCEPTION FLAGS */
		#define FE_INVALID		((short)(1))
		#define FE_UNDERFLOW	((short)(2))
		#define FE_OVERFLOW		((short)(4))
		#define FE_DIVBYZERO	((short)(8))
		#define FE_INEXACT		((short)(16))
	#endif	/* __MC68K__ */
	
	/* ROUNDING MODES */
	#define FE_TONEAREST		((short)(0))
	#define FE_UPWARD			((short)(1))
	#define FE_DOWNWARD			((short)(2))
	#define FE_TOWARDZERO		((short)(3))
	/* PRECISION (68K only) */
	#define FE_LDBLPREC			((short)(0))
	#define FE_DBLPREC			((short)(1))
	#define FE_FLTPREC			((short)(2))
#endif /* __MC68K__ */

#ifdef __INTEL__
	/* FP TYPES */
	typedef short fexcept_t;
	typedef long fenv_t;			/* control word/status word  */
	/* FP EXCEPTION FLAGS */
	#define FE_INVALID		0x0001
	#define FE_DIVBYZERO	0x0004
	#define FE_OVERFLOW		0x0008
	#define FE_UNDERFLOW	0x0010
	#define FE_INEXACT		0x0020
	/* ROUNDING MODES */
	#define FE_TONEAREST	0x00000000
	#define FE_TOWARDZERO	0x00000C00
	#define FE_UPWARD		0x00000800
	#define FE_DOWNWARD		0x00000400
	/* PRECISION */
	#define FE_LDBLPREC		0x00000300
	#define FE_DBLPREC		0x00000200
	#define FE_FLTPREC		0x00000000
#endif /* __INTEL__ */

#ifdef __arm
	/* FP TYPES */
	typedef unsigned int __ieee_edata_t;     /* exception flags passed to traps */

	typedef union {
	    float f;
	    float s;
	    double d;
	    int i;
	    unsigned int ui;
#if !defined(__STRICT_ANSI__) || (defined(__STDC_VERSION__) && 199901L <= __STDC_VERSION__)
	    long long l;
	    unsigned long long ul;
#endif /* __STRICT_ANSI__ */
	    struct { int word1, word2; } str;
	    } __ieee_value_t;                        /* in/out values passed to traps */

	typedef __ieee_value_t (*__ieee_handler_t) (__ieee_value_t, __ieee_value_t,
						__ieee_edata_t);

	typedef struct {
	    unsigned statusword;			/* VFP FPSCR control word/status word  */
	    __ieee_handler_t invalid_handler;
	    __ieee_handler_t divbyzero_handler;
	    __ieee_handler_t overflow_handler;
	    __ieee_handler_t underflow_handler;
	    __ieee_handler_t inexact_handler;
	    } fenv_t, fexcept_t;

	/* FP EXCEPTION FLAGS */
	/* NOTE: These are the FPSCR exception status bits, not the exception enable bits */
	#define FE_INVALID		((unsigned long) 0x00000001)	/* bit 0 of FPSCR */
	#define FE_DIVBYZERO	((unsigned long) 0x00000002)	/* bit 1 */
	#define FE_OVERFLOW		((unsigned long) 0x00000004)	/* bit 2 */
	#define FE_UNDERFLOW	((unsigned long) 0x00000008)	/* bit 3 */
	#define FE_INEXACT		((unsigned long) 0x00000010)	/* bit 4 */
	/* ROUNDING MODES */
	#define FE_TONEAREST	((unsigned long) 0x00000000)	/* FPSCR bits[23:22] = 0b00 */
	#define FE_TOWARDZERO	((unsigned long) 0x00C00000)	/* FPSCR bits[23:22] = 0b11 */
	#define FE_UPWARD		((unsigned long) 0x00400000)	/* FPSCR bits[23:22] = 0b01 */
	#define FE_DOWNWARD		((unsigned long) 0x00800000)	/* FPSCR bits[23:22] = 0b10 */
#endif /* __arm */

#ifdef __MIPS__
	typedef long int fenv_t;
	typedef long int fexcept_t;
	/* FP EXCEPTION FLAGS */
	#define FE_INEXACT		0x00001000
	#define FE_UNDERFLOW	0x00002000
	#define FE_OVERFLOW		0x00004000
	#define FE_DIVBYZERO	0x00008000
	#define FE_INVALID		0x00010000
#endif /* __MIPS__ */

#define FE_ALL_EXCEPT (FE_INEXACT | FE_DIVBYZERO | FE_UNDERFLOW | FE_OVERFLOW | FE_INVALID)

/* PROTOTYPE FUNCTIONS */
_MSL_BEGIN_EXTERN_C

extern fenv_t _FE_DFL_ENV;
#define FE_DFL_ENV &_FE_DFL_ENV				/* pointer to default environment */

_MSL_IMP_EXP_C void _MSL_MATH_CDECL feclearexcept ( int ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C void _MSL_MATH_CDECL fegetexceptflag ( fexcept_t *, int ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C void _MSL_MATH_CDECL fesetexceptflag ( const fexcept_t *, int ) _MSL_CANT_THROW;
#if (defined(__INTEL__) || defined(__arm) || __dest_os == __dolphin_os)
	#define fegetexcept fegetexceptflag
	#define fesetexcept fesetexceptflag
#else
	_MSL_IMP_EXP_C void _MSL_MATH_CDECL fegetexcept (fexcept_t *, int) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void _MSL_MATH_CDECL fesetexcept (const fexcept_t *, int ) _MSL_CANT_THROW;
#endif
_MSL_IMP_EXP_C void _MSL_MATH_CDECL feraiseexcept (int) _MSL_CANT_THROW;
_MSL_IMP_EXP_C int _MSL_MATH_CDECL fetestexcept ( int  ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C int _MSL_MATH_CDECL fegetround ( void ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C int _MSL_MATH_CDECL fesetround ( int  ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C void _MSL_MATH_CDECL fegetenv ( fenv_t * ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C int _MSL_MATH_CDECL feholdexcept ( fenv_t * ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C void _MSL_MATH_CDECL fesetenv ( const fenv_t * ) _MSL_CANT_THROW;
_MSL_IMP_EXP_C void _MSL_MATH_CDECL feupdateenv ( const fenv_t *  ) _MSL_CANT_THROW;
#if (defined(__MC68K__)  || defined(__INTEL__))
	_MSL_IMP_EXP_C int _MSL_MATH_CDECL fegetprec ( void ) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_MATH_CDECL fesetprec ( int  ) _MSL_CANT_THROW;
#endif  /* __MC68K__  || __INTEL__ */

_MSL_END_EXTERN_C

#if defined(__INTEL__)
	#include <fenv_x87.h>
#elif defined(__arm)
    #include <fenv.ARM.h>
#endif

#endif /* __FENV__ */
#endif /* _MSL_C99 */
#endif /* _MSL_USING_MW_C_HEADERS */
#endif /* _MSL_FENV_H */

/* Change record:
 * mf  971216 intel impementation complete(including precision functions feset/getprec
 * mf  970715 added support for X86 moved header to common\Public Includes
 * ngk 950117 Use ConditionalMacros for processor info
 * PAF 940513 Added fegetprec and fesetprec and corresponding macros for 68K
 * PAF 940222 Modified for 68K compatability
 * ali 920823 included C++ extern "C" wrappers to make them C++ friendly.
 * ali 930408 changed "enums" to "macros" to be more compatible with the FPCE of NCEG
 * JPO 930205 Changed function types of feclearexcept,fegetexcept, feraiseexcept, and fesetexcept
 *            from int to void to reflect changes in NCEG specification.  Changed definition of
 *            FE_DFL_ENV from typedef to #define.  Modified comments describing functionality.
 * JWW 001208 Added case for targeting Mach-O
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010729 Updated Mach-O section to get the system fenv.h from the CoreServices framework
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test in addition to Mach-O test
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * ejs 020124 Include fenv_x87.h for intel
 * pmk 020219 added prototypes for fegetexceptflag and fesetexceptflag
 * pmk 020305 removed excess notes and clarified what's common and what's pltform specific
 * JWW 020311 Changed _MSL_CDECL to _MSL_MATH_CDECL
 * hh  020603 Added no throw spec to functions
 * JWW 020724 Don't use external fenv.h file when compiling for Mach-O since this one will suffice
 * ss  030203 Added arm specific defines
 * mm  030226 Added _MSL_C99 wrapper since fenv.h does not occur in C90
 * bn  030425 Added ARM specific user-defined exception handlers
 */