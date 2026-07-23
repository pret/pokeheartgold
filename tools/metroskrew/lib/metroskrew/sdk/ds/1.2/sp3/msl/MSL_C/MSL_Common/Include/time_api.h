/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/02/10 15:39:12 $
 * $Revision: 1.7.4.4 $
 */

#ifndef _MSL_TIME_API_H
#define	_MSL_TIME_API_H

#if (__dest_os == __win32_os)
	#define WIN32_LEAN_AND_MEAN
	#include <windows.h>
#endif

#include <ansi_parms.h>
#include <ctime>

_MSL_BEGIN_EXTERN_C

#if _MSL_OS_TIME_SUPPORT
	clock_t	__get_clock(void);		
	time_t	__get_time(void);
	int		__isdst(void);
	int 	__MSL_ISO8601Week(const struct tm *, int *);				
	time_t 	__MSL_ISO8601NewYear(int);
	void	__msl_asciitime(struct tm, char *);		
	int		__to_gm_time(time_t *);
#endif /* _MSL_OS_TIME_SUPPORT */

void	__msl_clear_tm(struct tm *);
void	__msl_time2tm(time_t, struct tm *);
char * 	__MSL_extract_name(char *, int);

#if (__dest_os == __win32_os)
	time_t __systemtime_to_time_t(SYSTEMTIME *);
#endif
		
_MSL_END_EXTERN_C

#endif /* _MSL_TIME_API_H */

/* Change record:
 * JWW 010905 New file to define the MSL API for the clock and time implementation
 * mm  021219 Added prototypes for __MSL_ISO8601Week(), __MSL_ISO8601NewYear(), and __MSL_extract_name(  used in strftime and wcsftime.
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 */