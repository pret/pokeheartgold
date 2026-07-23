/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:05 $
 * $Revision: 1.39.2.3 $
 */

#ifndef _MSL_STDLIB_H
#define _MSL_STDLIB_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstdlib>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::size_t;
	using std::abort;
	using std::atexit;
	using std::exit;
#if  _MSL_C99 														/*- mm 030708 -*/
	using std::_Exit;
#endif /* _MSL_C99 */												/*- mm 030708 -*/
	using std::getenv;
	using std::system;
	using std::malloc;
	using std::calloc;
	using std::realloc;
	using std::free;
	using std::atol;
#if _MSL_LONGLONG
#if _MSL_C99
	using std::atoll;
#endif /* _MSL_C99 */
#endif /* _MSL_LONGLONG */
#ifndef _MSL_NO_MATH_LIB
	using std::atof;
	using std::strtod;
	using std::strtold;							/*- mm 020326 -*/
#if _MSL_C99
	using std::strtof;							/*- mm 021106 -*/
#endif /* _MSL_C99 */
#endif /* _MSL_NO_MATH_LIB */
	using std::atoi;
	using std::strtol;
	using std::strtoul;
#if _MSL_LONGLONG
#if _MSL_C99 														/*- mm 030708 -*/
	using std::strtoll;
	using std::strtoull;
#endif /* _MSL_C99 */
#endif /* _MSL_LONGLONG */
#if _MSL_WIDE_CHAR
	using std::mblen;
	using std::mbstowcs;
	using std::mbtowc;
	using std::wctomb;
	using std::wcstombs;
#endif /* _MSL_WIDE_CHAR */
	using std::bsearch;
	using std::qsort;
	using std::div_t;
	using std::ldiv_t;
	using std::abs;
	using std::div;
	using std::labs;
#if _MSL_LONGLONG
#if _MSL_C99																/*- mm 030708 -*/
	using std::llabs;
	using std::lldiv_t;
	using std::lldiv;
#endif /* _MSL_C99 */														/*- mm 030708 -*/
#endif /* _MSL_LONGLONG */
	using std::ldiv;
	using std::srand;
	using std::rand;
#if __VEC__
	using std::vec_calloc;
	using std::vec_free;
	using std::vec_malloc;
	using std::vec_realloc;
#endif /* __VEC__ */
#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using std::errno_t;
	using std::rsize_t;
	using std::getenv_s;
	using std::bsearch_s;
	using std::qsort_s;
#if _MSL_WIDE_CHAR
	using std::wctomb_s;
#endif /* _MSL_WIDE_CHAR */
#endif /* __STDC_WANT_SECURE_LIB__ */
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STDLIB_H */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * mm  020326 Inserted missing using for strtold
 * mm  021108 Inserted missing prototype for strtof
 * JWW 021209 Added _Exit for C99
 * cc  021209 Added atoll for C99
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * mm  030708 Added C99 wrappers
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 */