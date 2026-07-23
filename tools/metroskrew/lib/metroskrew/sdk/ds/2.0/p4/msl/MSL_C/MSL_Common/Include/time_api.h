/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:20 $
 * $Revision: 1.21.2.2 $
 */

#ifndef _MSL_TIME_API_H
#define	_MSL_TIME_API_H

#include <ansi_parms.h>
#include <ctime>

#if __dest_os == __win32_os
	#define WIN32_LEAN_AND_MEAN
	#include <windows.h>
#endif

_MSL_BEGIN_EXTERN_C

#if _MSL_OS_TIME_SUPPORT

extern const short __msl_month_to_days[2][13];

clock_t	__get_clock(void) _MSL_CANT_THROW;		
time_t	__get_time(void) _MSL_CANT_THROW;
int		__isdst(void) _MSL_CANT_THROW;
int 	__MSL_ISO8601Week(const struct tm *, int *) _MSL_CANT_THROW;
time_t 	__MSL_ISO8601NewYear(int) _MSL_CANT_THROW;
int		__msl_leap_year(int) _MSL_CANT_THROW;
void	__msl_asciitime(struct tm, char *) _MSL_CANT_THROW;
int		__to_gm_time(time_t *) _MSL_CANT_THROW;
#if !_MSL_TIME_T_IS_LOCALTIME
int		__to_local_time(time_t *) _MSL_CANT_THROW;
#endif /* _MSL_TIME_T_IS_LOCALTIME */
void	__msl_clear_tm(struct tm *) _MSL_CANT_THROW;
int		__msl_week_num(const struct tm *, int) _MSL_CANT_THROW;
void	__msl_time2tm(time_t, struct tm *) _MSL_CANT_THROW;
char * 	__MSL_extract_name(char *, int) _MSL_CANT_THROW;

#if __dest_os == __win32_os
	time_t __systemtime_to_time_t(SYSTEMTIME *) _MSL_CANT_THROW;
#endif

#endif /* _MSL_OS_TIME_SUPPORT */
		
_MSL_END_EXTERN_C

#endif /* _MSL_TIME_API_H */

/* Change record:
 * JWW 010905 New file to define the MSL API for the clock and time implementation
 * mm  021219 Added prototypes for __MSL_ISO8601Week(), __MSL_ISO8601NewYear(), and __MSL_extract_name(  used in strftime and wcsftime.
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 */