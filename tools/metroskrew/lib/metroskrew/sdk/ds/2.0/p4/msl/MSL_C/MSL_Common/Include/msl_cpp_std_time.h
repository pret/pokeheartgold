/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:44 $
 * $Revision: 1.2.2.3 $
 */

#ifndef _MSL_CPP_STD_TIME_H
#define _MSL_CPP_STD_TIME_H

#ifdef __cplusplus

namespace std {

	using ::size_t;

#if _MSL_CLOCK_T_AVAILABLE
	using ::clock_t;
#endif /* _MSL_CLOCK_T_AVAILABLE */

#if _MSL_TIME_T_AVAILABLE
	using ::time_t;
#endif /* _MSL_TIME_T_AVAILABLE */

#if _MSL_FLOATING_POINT
	using ::difftime;
#endif /* _MSL_FLOATING_POINT */

#if _MSL_OS_TIME_SUPPORT
	using ::tm;
	using ::clock;
	using ::gmtime;
	using ::time;
	using ::asctime;
	using ::ctime;
	using ::localtime;
	using ::mktime;
	using ::strftime;

#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using ::errno_t;
	using ::rsize_t;
	using ::asctime_s;
	using ::ctime_s;
	using ::gmtime_s;
	using ::localtime_s;
#endif /* __STDC_WANT_SECURE_LIB__ */	
	
#endif /* _MSL_OS_TIME_SUPPORT */

} /* namespace std */

#endif /* __cplusplus */

#endif /* _MSL_CPP_STD_TIME_H */

/* Change record:
 * JWW 050128 Put C items into the std namespace
 */