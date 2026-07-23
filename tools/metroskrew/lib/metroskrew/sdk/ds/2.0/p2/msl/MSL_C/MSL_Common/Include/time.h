/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:20 $
 * $Revision: 1.37.2.4 $
 */

#ifndef _MSL_TIME_H
#define _MSL_TIME_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <ctime>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)

	using std::size_t;

#if _MSL_CLOCK_T_AVAILABLE
	using std::clock_t;
#endif /* _MSL_CLOCK_T_AVAILABLE */

#if _MSL_TIME_T_AVAILABLE
	using std::time_t;
#endif /* _MSL_TIME_T_AVAILABLE */

#if _MSL_FLOATING_POINT && _MSL_TIME_T_AVAILABLE
	using std::difftime;
#endif /* _MSL_FLOATING_POINT */

#if _MSL_OS_TIME_SUPPORT
	using std::tm;
	using std::clock;
	using std::gmtime;
	using std::time;
	using std::asctime;
	using std::ctime;
	using std::localtime;
	using std::mktime;
	using std::strftime;

#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using std::errno_t;
	using std::rsize_t;
	using std::asctime_s;
	using std::ctime_s;
	using std::gmtime_s;
	using std::localtime_s;
#endif /* __STDC_WANT_SECURE_LIB__ */	
	
#endif /* _MSL_OS_TIME_SUPPORT */

#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_TIME_H */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 * cc  040217 Changed _No_Floating_Point to _MSL_FLOATING_POINT
 */