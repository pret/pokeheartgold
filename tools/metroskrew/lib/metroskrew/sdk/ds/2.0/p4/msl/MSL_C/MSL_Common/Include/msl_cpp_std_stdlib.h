/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:44 $
 * $Revision: 1.6.2.3 $
 */

#ifndef _MSL_CPP_STD_STDLIB_H
#define _MSL_CPP_STD_STDLIB_H

#ifdef __cplusplus

namespace std {

	using ::size_t;
	using ::abort;
	using ::atexit;
	using ::exit;
#if _MSL_C99
#if _MSL_OS_X_VERSION > 3
	using ::_Exit;
#endif /* _MSL_OS_X_VERSION > 3 */
#endif /* _MSL_C99 */
	using ::getenv;
	using ::system;
	using ::malloc;
	using ::calloc;
	using ::realloc;
	using ::free;
	using ::atol;
#if _MSL_LONGLONG
#if _MSL_C99
#if _MSL_OS_X_VERSION > 2
	using ::atoll;
#endif /* _MSL_OS_X_VERSION > 2 */
#endif /* _MSL_C99 */
#endif /* _MSL_LONGLONG */
#ifndef _MSL_NO_MATH_LIB
	using ::atof;
	using ::strtod;
#if _MSL_OS_X_VERSION > 2
	using ::strtold;
#if _MSL_C99
	using ::strtof;
#endif /* _MSL_C99 */
#endif /* _MSL_OS_X_VERSION > 2 */
#endif /* _MSL_NO_MATH_LIB */
	using ::atoi;
	using ::strtol;
	using ::strtoul;
#if _MSL_LONGLONG
#if _MSL_C99
#if _MSL_OS_X_VERSION > 1
	using ::strtoll;
	using ::strtoull;
#endif /* _MSL_OS_X_VERSION > 1 */
#endif /* _MSL_C99 */
#endif /* _MSL_LONGLONG */
#if _MSL_WIDE_CHAR
	using ::mblen;
	using ::mbstowcs;
	using ::mbtowc;
	using ::wctomb;
	using ::wcstombs;
#endif /* _MSL_WIDE_CHAR */
	using ::bsearch;
	using ::qsort;
	using ::div_t;
	using ::ldiv_t;
	using ::abs;
	using ::div;
	using ::labs;
#if _MSL_LONGLONG
#if _MSL_C99
#if _MSL_OS_X_VERSION > 2
	using ::llabs;
	using ::lldiv_t;
	using ::lldiv;
#endif /* _MSL_OS_X_VERSION > 2 */
#endif /* _MSL_C99 */
#endif /* _MSL_LONGLONG */
	using ::ldiv;
	using ::srand;
	using ::rand;
#if 0 /* Do not include AltiVec extensions when using non-MSL C */
#if __VEC__
	using ::vec_calloc;
	using ::vec_free;
	using ::vec_malloc;
	using ::vec_realloc;
#endif /* __VEC__ */
#endif /* 0 */
#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using ::errno_t;
	using ::rsize_t;
	using ::getenv_s;
	using ::bsearch_s;
	using ::qsort_s;
#if _MSL_WIDE_CHAR
	using ::wctomb_s;
#endif /* _MSL_WIDE_CHAR */
#endif /* __STDC_WANT_SECURE_LIB__ */

} /* namespace std */

#endif /* __cplusplus */

#endif /* _MSL_CPP_STD_STDLIB_H */

/* Change record:
 * JWW 050128 Put C items into the std namespace
 */