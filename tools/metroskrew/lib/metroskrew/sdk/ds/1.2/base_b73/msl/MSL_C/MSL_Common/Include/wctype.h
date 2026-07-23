/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:08 $
 * $Revision: 1.27.2.1 $
 */
 
#ifndef _MSL_WCTYPE_H
#define _MSL_WCTYPE_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#endif
#else

#include <cwctype>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
#if _MSL_WIDE_CHAR
#if _MSL_C99											/*- mm 030304 -*/
	using std::wctrans_t;
	using std::wctype_t;
	using std::wint_t;
	using std::iswalnum;
	using std::iswalpha;
	using std::iswblank;
	using std::iswcntrl;
	using std::iswctype;
	using std::iswdigit;
	using std::iswgraph;
	using std::iswlower;
	using std::iswprint;
	using std::iswpunct;
	using std::iswspace;
	using std::iswupper;
	using std::iswxdigit;
	using std::towctrans;
	using std::towlower;
	using std::towupper;
	using std::wctrans;
	using std::wctype;
#endif /* _MSL_C99 */									/*- mm 030304 -*/
#endif
#endif

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_WCTYPE_H */

/* Change record:
 * 980121 JCM First code release.
 * 991112 hh  Fixed using bug.
 * 001208 JWW Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * mm  030304 Added _MSL_C99 wrapper
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */