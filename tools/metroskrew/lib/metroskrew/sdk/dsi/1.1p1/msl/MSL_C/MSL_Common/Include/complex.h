/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:04 $
 * $Revision: 1.17 $
 */

#ifndef _MSL_COMPLEX_H
#define _MSL_COMPLEX_H

#ifdef __cplusplus

#include <complex>

#ifndef _MSL_NO_CPP_NAMESPACE
	#if _MSL_FLOATING_POINT && !defined(_MSL_NO_MATH_LIB)
		using std::complex;
	#endif
#endif

#else /* __cplusplus */

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#endif
#else

#if _MSL_C99 && _MSL_COMPLEX

#define complex			_Complex
#define imaginary		_Imaginary
#define	_Complex_I		(0.0f + __builtin__Imaginary_I)
#define _Imaginary_I	__builtin__Imaginary_I
#define I				_Imaginary_I

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

/* Trigonometric functions */

_MSL_IMP_EXP_C double complex       _MSL_CDECL cacos (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL cacosf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL cacosl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL casin (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL casinf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL casinl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL catan (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL catanf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL catanl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL ccos (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL ccosf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL ccosl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL csin (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL csinf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL csinl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL ctan (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL ctanf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL ctanl(long double complex z);

/* Hyperbolic functions */

_MSL_IMP_EXP_C double complex       _MSL_CDECL cacosh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL cacoshf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL cacoshl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL casinh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL casinhf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL casinhl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL catanh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL catanhf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL catanhl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL ccosh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL ccoshf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL ccoshl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL csinh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL csinhf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL csinhl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL ctanh (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL ctanhf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL ctanhl(long double complex z);

/* Exponential and logarithmic functions */

_MSL_IMP_EXP_C double complex       _MSL_CDECL cexp (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL cexpf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL cexpl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL clog (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL clogf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL clogl(long double complex z);

/* Power and absolute value functions */

_MSL_IMP_EXP_C double      _MSL_CDECL cabs (double complex z);
_MSL_IMP_EXP_C float       _MSL_CDECL cabsf(float complex z);
_MSL_IMP_EXP_C long double _MSL_CDECL cabsl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL cpow (double complex x, double complex y);
_MSL_IMP_EXP_C float complex        _MSL_CDECL cpowf(float complex x, float complex y);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL cpowl(long double complex x, long double complex y);

_MSL_IMP_EXP_C double complex       _MSL_CDECL csqrt (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL csqrtf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL csqrtl(long double complex z);

/* Manipulation functions */

_MSL_IMP_EXP_C double      _MSL_CDECL carg (double complex z);
_MSL_IMP_EXP_C float       _MSL_CDECL cargf(float complex z);
_MSL_IMP_EXP_C long double _MSL_CDECL cargl(long double complex z);

/*#if _MSL_USE_INLINE*/
_MSL_INLINE _MSL_IMP_EXP_C double      _MSL_CDECL cimag(double complex z)				
	{ return ((double *)&z)[1]; }
_MSL_INLINE _MSL_IMP_EXP_C float       _MSL_CDECL cimagf(float complex z)				
	{ return ((float *)&z)[1]; }
_MSL_INLINE _MSL_IMP_EXP_C long double _MSL_CDECL cimagl(long double complex z)	
	{ return ((long double *)&z)[1]; }
/*#else
_MSL_IMP_EXP_C double      _MSL_CDECL cimag(double complex z);
_MSL_IMP_EXP_C float       _MSL_CDECL cimagf(float complex z);
_MSL_IMP_EXP_C long double _MSL_CDECL cimagl(long double complex z);
#endif /* _MSL_USE_INLINE */

_MSL_IMP_EXP_C double complex       _MSL_CDECL conj (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL conjf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL conjl(long double complex z);

_MSL_IMP_EXP_C double complex       _MSL_CDECL cproj (double complex z);
_MSL_IMP_EXP_C float complex        _MSL_CDECL cprojf(float complex z);
_MSL_IMP_EXP_C long double complex  _MSL_CDECL cprojl(long double complex z);

/*#if _MSL_USE_INLINE */
_MSL_INLINE _MSL_IMP_EXP_C double      _MSL_CDECL creal(double complex z)				
	{ return ((double *)&z)[0]; }
_MSL_INLINE _MSL_IMP_EXP_C float       _MSL_CDECL crealf(float complex z)				
	{ return ((float *)&z)[0]; }
_MSL_INLINE _MSL_IMP_EXP_C long double _MSL_CDECL creall(long double complex z)	
	{ return ((long double *)&z)[0]; }
/*#else
_MSL_IMP_EXP_C double      _MSL_CDECL creal(double complex z);
_MSL_IMP_EXP_C float       _MSL_CDECL crealf(float complex z);
_MSL_IMP_EXP_C long double _MSL_CDECL creall(long double complex z);
#endif /* _MSL_USE_INLINE */

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_COMPLEX */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* __cplusplus */

#endif /* _MSL_COMPLEX_H */

/* Change record:
 * JWW 011027 Created as a placeholder - this file currently does nothing.
 * cc  040217 Changed _No_Floating_Point to _MSL_FLOATING_POINT
 * bn  060605 C99 compliant implementation
 */