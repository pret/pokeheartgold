/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/03/15 22:17:47 $
 * $Revision: 1.49.2.3 $
 */

/*************************************************************************
*	Project...:	C99 Library												 *
*   Author..... Matthew D. Fassiotto                                     *
*	Purpose...:	to provide fast single precision overloads of the        *
*               standard C double functions in math.h 					 *			
*************************************************************************/

#ifndef _MSL_TGMATH_H
#define _MSL_TGMATH_H

#include <ansi_parms.h>

#if _MSL_C99 												/*- mm 030721 -*/

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#endif
#else

#include <cmath>    /* has float overloads with same name as standard double version(e.g. float cos) */

#ifndef __cplusplus
	#pragma cplusplus on

	double      __promote(int);
	double      __promote(unsigned int);
	double      __promote(long);
	double      __promote(unsigned long);
	double      __promote(long long);
	double      __promote(unsigned long long);
	float       __promote(float);
	double      __promote(double);
	long double __promote(long double);

	inline float       __msl_acos(float x) {return acosf(x);}
	inline double      __msl_acos(double x) {return acos(x);}
	inline long double __msl_acos(long double x) {return acosl(x);}
	
	#undef  acos
	#define acos(x)    __msl_acos((__typeof__(__promote(x)))(x))
	
	inline float       __msl_acosh(float x) {return acoshf(x);}
	inline double      __msl_acosh(double x) {return acosh(x);}
	inline long double __msl_acosh(long double x) {return acoshl(x);}
	
	#undef  acosh
	#define acosh(x)   __msl_acosh((__typeof__(__promote(x)))(x))
	
	inline float       __msl_asin(float x) {return asinf(x);}
	inline double      __msl_asin(double x) {return asin(x);}
	inline long double __msl_asin(long double x) {return asinl(x);}
	
	#undef  asin
	#define asin(x)    __msl_asin((__typeof__(__promote(x)))(x))
	
	inline float       __msl_asinh(float x) {return asinhf(x);}
	inline double      __msl_asinh(double x) {return asinh(x);}
	inline long double __msl_asinh(long double x) {return asinhl(x);}
	
	#undef  asinh
	#define asinh(x)   __msl_asinh((__typeof__(__promote(x)))(x))
	
	inline float       __msl_atan(float x) {return atanf(x);}
	inline double      __msl_atan(double x) {return atan(x);}
	inline long double __msl_atan(long double x) {return atanl(x);}
	
	#undef  atan
	#define atan(x)    __msl_atan((__typeof__(__promote(x)))(x))
	
	inline float       __msl_atan2(float x, float y) {return atan2f(x,y);}
	inline double      __msl_atan2(double x, double y) {return atan2(x,y);}
	inline long double __msl_atan2(long double x,long double y) {return atan2l(x,y);}
	
	#undef  atan2
	#define atan2(x,y) __msl_atan2((__typeof__(__promote(x)+__promote(y)))(x), \
	                               (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_atanh(float x) {return atanhf(x);}
	inline double      __msl_atanh(double x) {return atanh(x);}
	inline long double __msl_atanh(long double x) {return atanhl(x);}
	
	#undef  atanh
	#define atanh(x)   __msl_atanh((__typeof__(__promote(x)))(x))
	
	inline float       __msl_cbrt(float x) {return cbrtf(x);}
	inline double      __msl_cbrt(double x) {return cbrt(x);}
	inline long double __msl_cbrt(long double x) {return cbrtl(x);}
	
	#undef  cbrt
	#define cbrt(x)    __msl_cbrt((__typeof__(__promote(x)))(x))
	
	inline float       __msl_ceil(float x) {return ceilf(x);}
	inline double      __msl_ceil(double x) {return ceil(x);}
	inline long double __msl_ceil(long double x) {return ceill(x);}
	
	#undef  ceil
	#define ceil(x)    __msl_ceil((__typeof__(__promote(x)))(x))
	
	inline float       __msl_copysign(float x, float y) {return copysignf(x,y);}
	inline double      __msl_copysign(double x, double y) {return copysign(x,y);}
	inline long double __msl_copysign(long double x,long double y) {return copysignl(x,y);}
	
	#undef  copysign
	#define copysign(x,y) __msl_copysign((__typeof__(__promote(x)+__promote(y)))(x), \
	                                     (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_cos(float x) {return cosf(x);}
	inline double      __msl_cos(double x) {return cos(x);}
	inline long double __msl_cos(long double x) {return cosl(x);}
	
	#undef  cos
	#define cos(x)     __msl_cos((__typeof__(__promote(x)))(x))
	
	inline float       __msl_cosh(float x) {return coshf(x);}
	inline double      __msl_cosh(double x) {return cosh(x);}
	inline long double __msl_cosh(long double x) {return coshl(x);}
	
	#undef  cosh
	#define cosh(x)    __msl_cosh((__typeof__(__promote(x)))(x))

	#if !__INTEL__
	inline float       __msl_erf(float x) {return erff(x);}
	inline double      __msl_erf(double x) {return erf(x);}
	inline long double __msl_erf(long double x) {return erfl(x);}
	
	#undef  erf
	#define erf(x)     __msl_erf((__typeof__(__promote(x)))(x))
	#endif
	
	#if !__INTEL__
	inline float       __msl_erfc(float x) {return erfcf(x);}
	inline double      __msl_erfc(double x) {return erfc(x);}
	inline long double __msl_erfc(long double x) {return erfcl(x);}
	
	#undef  erfc
	#define erfc(x)    __msl_erfc((__typeof__(__promote(x)))(x))
	#endif

	inline float       __msl_exp(float x) {return expf(x);}
	inline double      __msl_exp(double x) {return exp(x);}
	inline long double __msl_exp(long double x) {return expl(x);}
	
	#undef  exp
	#define exp(x)     __msl_exp((__typeof__(__promote(x)))(x))
	
	inline float       __msl_exp2(float x) {return exp2f(x);}
	inline double      __msl_exp2(double x) {return exp2(x);}
	inline long double __msl_exp2(long double x) {return exp2l(x);}
	
	#undef  exp2
	#define exp2(x)    __msl_exp2((__typeof__(__promote(x)))(x))
	
	inline float       __msl_expm1(float x) {return expm1f(x);}
	inline double      __msl_expm1(double x) {return expm1(x);}
	inline long double __msl_expm1(long double x) {return expm1l(x);}
	
	#undef  expm1
	#define expm1(x)   __msl_expm1((__typeof__(__promote(x)))(x))
	
	inline float       __msl_fabs(float x) {return fabsf(x);}
	inline double      __msl_fabs(double x) {return fabs(x);}
	inline long double __msl_fabs(long double x) {return fabsl(x);}
	
	#undef  fabs
	#define fabs(x)    __msl_fabs((__typeof__(__promote(x)))(x))
	
	inline float       __msl_fdim(float x, float y) {return fdimf(x,y);}
	inline double      __msl_fdim(double x, double y) {return fdim(x,y);}
	inline long double __msl_fdim(long double x,long double y) {return fdiml(x,y);}
	
	#undef  fdim
	#define fdim(x,y)  __msl_fdim((__typeof__(__promote(x)+__promote(y)))(x), \
	                              (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_floor(float x) {return floorf(x);}
	inline double      __msl_floor(double x) {return floor(x);}
	inline long double __msl_floor(long double x) {return floorl(x);}
	
	#undef  floor
	#define floor(x)   __msl_floor((__typeof__(__promote(x)))(x))
	

	inline float       __msl_fma(float x, float y, float z) {return fmaf(x,y,z);}
	inline double      __msl_fma(double x, double y, double z) {return fma(x,y,z);}
	inline long double __msl_fma(long double x,long double y, long double z) {return fmal(x,y,z);}
	
	#undef  fma
	#define fma(x,y,z) __msl_fma((__typeof__(__promote(x)+__promote(y)+__promote(z)))(x), \
	                             (__typeof__(__promote(x)+__promote(y)+__promote(z)))(y), \
	                             (__typeof__(__promote(x)+__promote(y)+__promote(z)))(z))
	
	
	inline float       __msl_fmax(float x, float y) {return fmaxf(x,y);}
	inline double      __msl_fmax(double x, double y) {return fmax(x,y);}
	inline long double __msl_fmax(long double x,long double y) {return fmaxl(x,y);}
	
	#undef  fmax
	#define fmax(x,y)  __msl_fmax((__typeof__(__promote(x)+__promote(y)))(x), \
	                              (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_fmin(float x, float y) {return fminf(x,y);}
	inline double      __msl_fmin(double x, double y) {return fmin(x,y);}
	inline long double __msl_fmin(long double x,long double y) {return fminl(x,y);}
	
	#undef  fmin
	#define fmin(x,y)  __msl_fmin((__typeof__(__promote(x)+__promote(y)))(x), \
	                              (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_fmod(float x, float y) {return fmodf(x,y);}
	inline double      __msl_fmod(double x, double y) {return fmod(x,y);}
	inline long double __msl_fmod(long double x,long double y) {return fmodl(x,y);}
	
	#undef  fmod
	#define fmod(x,y)  __msl_fmod((__typeof__(__promote(x)+__promote(y)))(x), \
	                              (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_frexp(float x, int* y) {return frexpf(x,y);}
	inline double      __msl_frexp(double x, int* y) {return frexp(x,y);}
	inline long double __msl_frexp(long double x, int* y) {return frexpl(x,y);}
	
	#undef  frexp
	#define frexp(x,y) __msl_frexp((__typeof__(__promote(x)))(x), (y))
	
	inline float       __msl_hypot(float x, float y) {return hypotf(x,y);}
	inline double      __msl_hypot(double x, double y) {return hypot(x,y);}
	inline long double __msl_hypot(long double x,long double y) {return hypotl(x,y);}
	
	#undef  hypot
	#define hypot(x,y) __msl_hypot((__typeof__(__promote(x)+__promote(y)))(x), \
	                               (__typeof__(__promote(x)+__promote(y)))(y))
	
	
	inline int         __msl_ilogb(float x) {return ilogbf(x);}
	inline int         __msl_ilogb(double x) {return ilogb(x);}
	inline int         __msl_ilogb(long double x) {return ilogbl(x);}
	
	#undef  ilogb
	#define ilogb(x)   __msl_ilogb((__typeof__(__promote(x)))(x))
	
	
	inline float       __msl_ldexp(float x, int y) {return ldexpf(x,y);}
	inline double      __msl_ldexp(double x, int y) {return ldexp(x,y);}
	inline long double __msl_ldexp(long double x, int y) {return ldexpl(x,y);}
	
	#undef  ldexp
	#define ldexp(x,y) __msl_ldexp((__typeof__(__promote(x)))(x), (y))

	#if !__INTEL__
	inline float       __msl_lgamma(float x) {return lgammaf(x);}
	inline double      __msl_lgamma(double x) {return lgamma(x);}
	inline long double __msl_lgamma(long double x) {return lgammal(x);}
	
	#undef  lgamma
	#define lgamma(x)  __msl_lgamma((__typeof__(__promote(x)))(x))
	#endif

	#if _MSL_LONGLONG
	inline long long   __msl_llrint(float x) {return llrintf(x);}
	inline long long   __msl_llrint(double x) {return llrint(x);}
	inline long long   __msl_llrint(long double x) {return llrintl(x);}
	
	#undef  llrint
	#define llrint(x)  __msl_llrint((__typeof__(__promote(x)))(x))
	#endif
	
	#if _MSL_LONGLONG
	inline long long   __msl_llround(float x) {return llroundf(x);}
	inline long long   __msl_llround(double x) {return llround(x);}
	inline long long   __msl_llround(long double x) {return llroundl(x);}
	
	#undef  llround
	#define llround(x) __msl_llround((__typeof__(__promote(x)))(x))
	#endif
	
	inline float       __msl_log(float x) {return logf(x);}
	inline double      __msl_log(double x) {return log(x);}
	inline long double __msl_log(long double x) {return logl(x);}
	
	#undef  log
	#define log(x)     __msl_log((__typeof__(__promote(x)))(x))
	
	inline float       __msl_log10(float x) {return log10f(x);}
	inline double      __msl_log10(double x) {return log10(x);}
	inline long double __msl_log10(long double x) {return log10l(x);}
	
	#undef  log10
	#define log10(x)   __msl_log10((__typeof__(__promote(x)))(x))
	
	inline float       __msl_log1p(float x) {return log1pf(x);}
	inline double      __msl_log1p(double x) {return log1p(x);}
	inline long double __msl_log1p(long double x) {return log1pl(x);}
	
	#undef  log1p
	#define log1p(x)   __msl_log1p((__typeof__(__promote(x)))(x))
	
	inline float       __msl_log2(float x) {return log2f(x);}
	inline double      __msl_log2(double x) {return log2(x);}
	inline long double __msl_log2(long double x) {return log2l(x);}
	
	#undef  log2
	#define log2(x)    __msl_log2((__typeof__(__promote(x)))(x))
	
	inline float       __msl_logb(float x) {return logbf(x);}
	inline double      __msl_logb(double x) {return logb(x);}
	inline long double __msl_logb(long double x) {return logbl(x);}
	
	#undef  logb
	#define logb(x)    __msl_logb((__typeof__(__promote(x)))(x))
	
	inline long        __msl_lrint(float x) {return lrintf(x);}
	inline long        __msl_lrint(double x) {return lrint(x);}
	inline long        __msl_lrint(long double x) {return lrintl(x);}
	
	#undef  lrint
	#define lrint(x)   __msl_lrint((__typeof__(__promote(x)))(x))
	
	inline long        __msl_lround(float x) {return lroundf(x);}
	inline long        __msl_lround(double x) {return lround(x);}
	inline long        __msl_lround(long double x) {return lroundl(x);}
	
	#undef  lround
	#define lround(x)  __msl_lround((__typeof__(__promote(x)))(x))

	inline float       __msl_nearbyint(float x) {return nearbyintf(x);}
	inline double      __msl_nearbyint(double x) {return nearbyint(x);}
	inline long double __msl_nearbyint(long double x) {return nearbyintl(x);}
	
	#undef  nearbyint
	#define nearbyint(x) __msl_nearbyint((__typeof__(__promote(x)))(x))
	
	inline float       __msl_nextafter(float x, float y) {return nextafterf(x,y);}
	inline double      __msl_nextafter(double x, double y) {return nextafter(x,y);}
	inline long double __msl_nextafter(long double x,long double y) {return nextafterl(x,y);}
	
	#undef  nextafter
	#define nextafter(x,y) __msl_nextafter((__typeof__(__promote(x)+__promote(y)))(x), \
	                                       (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_nexttoward(float x, long double y) {return nexttowardf(x,y);}
	inline double      __msl_nexttoward(double x, long double y) {return nexttoward(x,y);}
	inline long double __msl_nexttoward(long double x, long double y) {return nexttowardl(x,y);}
	
	#undef  nexttoward
	#define nexttoward(x,y) __msl_nexttoward((__typeof__(__promote(x)))(x), (y))

	inline float       __msl_pow(float x, float y) {return powf(x,y);}
	inline double      __msl_pow(double x, double y) {return pow(x,y);}
	inline long double __msl_pow(long double x,long double y) {return powl(x,y);}
	
	#undef  pow
	#define pow(x,y)   __msl_pow((__typeof__(__promote(x)+__promote(y)))(x), \
	                             (__typeof__(__promote(x)+__promote(y)))(y))
	
	inline float       __msl_remainder(float x, float y) {return remainderf(x,y);}
	inline double      __msl_remainder(double x, double y) {return remainder(x,y);}
	inline long double __msl_remainder(long double x,long double y) {return remainderl(x,y);}
	
	#undef  remainder
	#define remainder(x,y) __msl_remainder((__typeof__(__promote(x)+__promote(y)))(x), \
	                                       (__typeof__(__promote(x)+__promote(y)))(y))
#if !_MSL_USES_SUN_MATH_LIB		
	inline float       __msl_remquo(float x, float y, int* z) {return remquof(x,y,z);}
	inline double      __msl_remquo(double x, double y, int* z) {return remquo(x,y,z);}
	inline long double __msl_remquo(long double x,long double y, int* z) {return remquol(x,y,z);}
	
	#undef  remquo
	#define remquo(x,y,z) __msl_remquo((__typeof__(__promote(x)+__promote(y)))(x), \
	                                   (__typeof__(__promote(x)+__promote(y)))(y), (z))
#endif /* _MSL_USES_SUN_MATH_LIB */
	
	inline float       __msl_rint(float x) {return rintf(x);}
	inline double      __msl_rint(double x) {return rint(x);}
	inline long double __msl_rint(long double x) {return rintl(x);}
	
	#undef  rint
	#define rint(x)    __msl_rint((__typeof__(__promote(x)))(x))
	
	inline float       __msl_round(float x) {return roundf(x);}
	inline double      __msl_round(double x) {return round(x);}
	inline long double __msl_round(long double x) {return roundl(x);}
	
	#undef  round
	#define round(x)   __msl_round((__typeof__(__promote(x)))(x))
	
	inline float       __msl_scalbln(float x, long int y) {return scalblnf(x,y);}
	inline double      __msl_scalbln(double x, long int y) {return scalbln(x,y);}
	inline long double __msl_scalbln(long double x, long int y) {return scalblnl(x,y);}
	
	#undef  scalbln
	#define scalbln(x,y) __msl_scalbln((__typeof__(__promote(x)))(x), (y))
	
	inline float       __msl_scalbn(float x, int y) {return scalbnf(x,y);}
	inline double      __msl_scalbn(double x, int y) {return scalbn(x,y);}
	inline long double __msl_scalbn(long double x, int y) {return scalbnl(x,y);}
	
	#undef  scalbn
	#define scalbn(x,y) __msl_scalbn((__typeof__(__promote(x)))(x), (y))
	
	inline float       __msl_sin(float x) {return sinf(x);}
	inline double      __msl_sin(double x) {return sin(x);}
	inline long double __msl_sin(long double x) {return sinl(x);}
	
	#undef  sin
	#define sin(x)     __msl_sin((__typeof__(__promote(x)))(x))
	
	inline float       __msl_sinh(float x) {return sinhf(x);}
	inline double      __msl_sinh(double x) {return sinh(x);}
	inline long double __msl_sinh(long double x) {return sinhl(x);}
	
	#undef  sinh
	#define sinh(x)    __msl_sinh((__typeof__(__promote(x)))(x))
	
	inline float       __msl_sqrt(float x) {return sqrtf(x);}
	inline double      __msl_sqrt(double x) {return sqrt(x);}
	inline long double __msl_sqrt(long double x) {return sqrtl(x);}
	
	#undef  sqrt
	#define sqrt(x)    __msl_sqrt((__typeof__(__promote(x)))(x))
	
	inline float       __msl_tan(float x) {return tanf(x);}
	inline double      __msl_tan(double x) {return tan(x);}
	inline long double __msl_tan(long double x) {return tanl(x);}
	
	#undef  tan
	#define tan(x)     __msl_tan((__typeof__(__promote(x)))(x))
	
	inline float       __msl_tanh(float x) {return tanhf(x);}
	inline double      __msl_tanh(double x) {return tanh(x);}
	inline long double __msl_tanh(long double x) {return tanhl(x);}
	
	#undef  tanh
	#define tanh(x)    __msl_tanh((__typeof__(__promote(x)))(x))
	

	inline float       __msl_tgamma(float x) {return tgammaf(x);}
	inline double      __msl_tgamma(double x) {return tgamma(x);}
	inline long double __msl_tgamma(long double x) {return tgammal(x);}
	
	#undef  tgamma
	#define tgamma(x)  __msl_tgamma((__typeof__(__promote(x)))(x))

	inline float       __msl_trunc(float x) {return truncf(x);}
	inline double      __msl_trunc(double x) {return trunc(x);}
	inline long double __msl_trunc(long double x) {return truncl(x);}
	
	#undef  trunc
	#define trunc(x)   __msl_trunc((__typeof__(__promote(x)))(x))

	#pragma cplusplus reset

#endif /* __cplusplus */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_C99 */											/*- mm 030304 -*/
 
#endif /* _MSL_TGMATH_H */

/* Change record:
 * mf  012799 including cmath instead of math.h per C++ standard,
 *            also added header to top of file
 * mf  021799 added faster version of ldexp, also added a complete
 *            set of int overloads for two argument functions
 * mf  031099 tgmath.h is a general C++ header-- let cmath turn on k6 calling convention
 * vss 990803 Clean up code a bit
 * mf  000416 removed dependency on cmath.
 * mf  000512 wrapped with #pragma cplusplus on ( cc )
 * hh  000519 wrapped in __dest_os != __mac_os.
 * JWW 001208 Added case for targeting Mach-O
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * cc  011203 Added _MSL_MATH_CDECL for new name mangling 
 * ejs 020129 This file is now generated from a script.
 * mm  021108 Changed some wrappers for new math functions in math.c
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * mm  030304 Added C99 wrappers
 * mm  030721 Moved C99 wrapper
 * cc  030919 Added Michael's round, roundf,and roundl for sun math
 * cc  030924 Added Michael's lround, lroundf, lroundl, llround, llroundf, 
 *            and llroundl for sun math
 * cc  031003 Added Michael's lrint,lrint and lrintl for sun math
 * cc  031201 Added Michael's trunc,truncf,truncl for sun math
 */