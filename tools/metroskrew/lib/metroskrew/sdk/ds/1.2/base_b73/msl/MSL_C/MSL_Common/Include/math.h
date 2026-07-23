/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:03 $
 * $Revision: 1.56.2.3 $
 */

#ifndef _MSL_MATH_H
#define _MSL_MATH_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cmath>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) && defined(_MSL_CMATH_DEFINED_MATH_ITEMS)
	#if (__m56800E__ || __m56800__)
		using std::exp;	
		using std::fabs;
		using std::fmodf;
		using std::frexp;
		using std::ldexp;
		using std::log;
		using std::log10;
		using std::log2;
		using std::modf;
		using std::nan;
		using std::pow;
	#else	
		using std::acos;
		using std::acosf;
		using std::acosh;
		using std::acoshf;
		using std::acoshl;
		using std::acosl;
		using std::asin;
		using std::asinf;
		using std::asinh;
		using std::asinhf;
		using std::asinhl;
		using std::asinl;
		using std::atan;
		using std::atan2;
		using std::atan2f;
		using std::atan2l;
		using std::atanf;
		using std::atanh;
		using std::atanhf;
		using std::atanhl;
		using std::atanl;
		using std::cbrt;
		using std::cbrtf;
		using std::cbrtl;
		using std::ceil;
		using std::ceilf;
		using std::ceill;
		using std::copysign;
		using std::copysignf;
		using std::copysignl;
		using std::cos;
		using std::cosf;
		using std::cosh;
		using std::coshf;
		using std::coshl;
		using std::cosl;
		#if _MSL_C99											/*- mm 030521 -*/
		using std::erf;
		using std::erfc;
		using std::erfcf;
		using std::erfcl;
		using std::erff;
		using std::erfl;
		#endif /* _MSL_C99 */									/*- mm 030521 -*/
		using std::exp;
		using std::exp2;
		using std::exp2f;
		using std::exp2l;
		using std::expf;
		using std::expl;
		using std::expm1;
		using std::expm1f;
		using std::expm1l;
		using std::fabs;
		using std::fabsf;
		using std::fabsl;
		#if _MSL_C99											/*- mm 030521 -*/
		using std::fdim;
		using std::fdimf;
		using std::fdiml;
		using std::floor;
		using std::floorf;
		using std::floorl;
		#endif  /* _MSL_C99 */ 									/*- mm 030521 -*/
		using std::fma;
		using std::fmaf;
		using std::fmal;
		using std::fmax;
		using std::fmaxf;
		using std::fmaxl;
		using std::fmin;
		using std::fminf;
		using std::fminl;
		using std::fmod;
		using std::fmodf;
		using std::fmodl;
		using std::frexp;
		using std::frexpf;
		using std::frexpl;
		using std::hypot;
		using std::hypotf;
		using std::hypotl;
		using std::ilogb;
		using std::ilogbf;
		using std::ilogbl;
		using std::ldexp;
		using std::ldexpf;
		using std::ldexpl;
		using std::lgamma;
		using std::lgammaf;
		using std::lgammal;
		#if _MSL_LONGLONG
		using std::llrint;
		using std::llrintf;
		using std::llrintl;
		using std::llround;
		using std::llroundf;
		using std::llroundl;
		#endif /* _MSL_LONGLONG */
		using std::log;
		using std::log10;
		using std::log10f;
		using std::log10l;
		using std::log1p;
		using std::log1pf;
		using std::log1pl;
		using std::log2;
		using std::log2f;
		using std::log2l;
		using std::logb;
		using std::logbf;
		using std::logbl;
		using std::logf;
		using std::logl;
		using std::lrint;
		using std::lrintf;
		using std::lrintl;
		using std::lround;
		using std::lroundf;
		using std::lroundl;
		using std::modf;
		using std::modff;
		using std::modfl;
		using std::nan;
		using std::nanf;
		using std::nanl;
		using std::nearbyint;
		using std::nearbyintf;
		using std::nearbyintl;
		using std::nextafter;
		using std::nextafterf;
		using std::nextafterl;
		using std::nexttoward;
		using std::nexttowardf;
		using std::nexttowardl;
		using std::pow;
		using std::powf;
		using std::powl;
		using std::remainder;
		using std::remainderf;
		using std::remainderl;
		using std::remquo;
		using std::remquof;
		using std::remquol;
		using std::rint;
		using std::rintf;
		using std::rintl;
		using std::round;
		using std::roundf;
		using std::roundl;
		using std::scalbln;
		using std::scalblnf;
		using std::scalblnl;
		using std::scalbn;
		using std::scalbnf;
		using std::scalbnl;
		using std::sin;
		using std::sinf;
		using std::sinh;
		using std::sinhf;
		using std::sinhl;
		using std::sinl;
		using std::sqrt;
		using std::sqrtf;
		using std::sqrtl;
		using std::tan;
		using std::tanf;
		using std::tanh;
		using std::tanhf;
		using std::tanhl;
		using std::tanl;
		using std::tgamma;
		using std::tgammaf;
		using std::tgammal;
		using std::trunc;
		using std::truncf;
		using std::truncl;
				
		#if __dest_os != __mac_os_x
			using std::abs;			
			using std::float_t;
			using std::double_t;
		#endif /* __dest_os != __mac_os_x */
		
	#endif /* __m56800E__ || __m56800__ */
	
#endif /* __cplusplus && _MSL_USING_NAMESPACE && _MSL_CMATH_DEFINED_MATH_ITEMS */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_MATH_H */

/* Change record: 
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * hh  000804 Protected against <fp.h> being included first (on Mac)
 * hh  000925 Fixed up <fp.h> protection on 68K
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * JWW 011029 No longer test for Mac 68K
 * blc 011211 Added _MSL_NO_MATH_LIB check
 * ejs 020129 This file is generated from a script now.
 * ejs 020130 Added float_t and double_t to namespace std
 * JWW 020205 Fixed up <fp.h> protection for Mach-O MSL C
 * JWW 020422 Test for _MSL_CMATH_DEFINED_MATH_ITEMS instead of __FP__
 * cc  020819 Round and family not supported by sun math
 * cc  020910 DSP does not support full math lib
 * cc  021022 Added ilogb and cbrt to arm and gcn
 * mm  021108 Changed some wrappers for new math functions in math.c
 * cc  021216 Added cbrt and family for Michael
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * mm  030521 Added C99 wrappers
 * cc  030919 Added Michael's round, roundf,and roundl for sun math
 * cc  030924 Added Michael's lround, lroundf, lroundl, llround, llroundf, 
 *            and llroundl for sun math
 * cc  031003 Added Michael's lrint,lrint and lrintl for sun math
 * cc  031029 Added Michael's nearbyintl, nearbyintf and nearbyint for sun math
 * cc  031029 Added Michael's nearbyintl, nearbyintf, nearbyint, remquo,
 *            remquol, and remquof for sun math
 */