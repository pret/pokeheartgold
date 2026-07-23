/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:03 $
 * $Revision: 1.12.2.2 $
 */

#ifndef _MSL_EXTRAS_TIME_H
#define _MSL_EXTRAS_TIME_H

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras_time_win32.h>
#endif

_MSL_BEGIN_EXTERN_C

#if _MSL_OS_TIME_SUPPORT

_MSL_IMP_EXP_C char * _MSL_CDECL				asctime_r(const struct __std(tm) *, char *) _MSL_CANT_THROW;
_MSL_IMP_EXP_C char * _MSL_CDECL				ctime_r(const __std(time_t) *, char *) _MSL_CANT_THROW;
_MSL_IMP_EXP_C struct __std(tm) * _MSL_CDECL	localtime_r(const __std(time_t) *, struct __std(tm) *) _MSL_CANT_THROW;
_MSL_IMP_EXP_C char * _MSL_CDECL				strdate(char *) _MSL_CANT_THROW;
_MSL_IMP_EXP_C struct __std(tm) * _MSL_CDECL	gmtime_r(const __std(time_t) *, struct __std(tm) *) _MSL_CANT_THROW;

#endif /* _MSL_OS_TIME_SUPPORT */

_MSL_END_EXTERN_C

#endif /* _MSL_EXTRAS_TIME_H */

/* Change record:
 * cc  030620 Extras split to reduce namespace pollution
 * ejs 030721 Remove <unistd.h> include
 * cc  030722 Moved underscored functions out of extras common headers/source.  
 *            They now live in the extras_xxxx_win32.h headers/source.
 * JWW 031103 Added asctime_r, ctime_r, localtime_r, and gmtime_r
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 */