/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:05 $
 * $Revision: 1.11.2.3 $
 */

#ifndef _MSL_UTIME_H
#define	_MSL_UTIME_H

#include <ansi_parms.h>

#if _MSL_OS_TIME_SUPPORT

#include <ctime>

#if (__dest_os == __mac_os)
	#include <utime.mac.h>
#elif (__dest_os == __win32_os)
	#include <utime.win32.h>
#elif (__dest_os == __arm_bare)
	#include "utime.ARM.h"
#endif

	#pragma options align=native

	/* struct for utime */
	struct utimbuf {
		__std(time_t) actime;					/* access time  */
		__std(time_t) modtime;					/* modification time */
	};

	#pragma options align=reset

	#ifndef _MSL_STRUCT_UTIMEBUF_TYPE
		#define _MSL_STRUCT_UTIMEBUF_TYPE const struct
	#endif

	_MSL_BEGIN_EXTERN_C
	
		_MSL_IMP_EXP_C int _MSL_CDECL utime (const char *, _MSL_STRUCT_UTIMEBUF_TYPE utimbuf *) _MSL_CANT_THROW;

		_MSL_IMP_EXP_C int _MSL_CDECL utimes (const char *path, struct timeval buf[2]) _MSL_CANT_THROW;

	_MSL_END_EXTERN_C

#endif /* _MSL_OS_TIME_SUPPORT */

#endif /* _MSL_UTIME_H */

/* Change record:
 * mm  960927 Inserted setting of __dest_os to __mac_os when not otherwise set.
 * mf  980428 included ansi_parms.h and use #error instead of mac_os by default
 * vss 990115 removed powerTV
 * mf  000430 scoped time_t w/std
 * JWW 000928 balanced align directives (align=native needs align=reset)
 * JWW 001208 Added case for targeting Mach-O
 * cc  010409 updated defines to JWW new namespace macros 	
 * JWW 010510 Removed special case for Mach-O - the cname/name.h header split is a better fix
 * JWW 010621 Moved #include <ctime> to the main utime.h header
 * cc  010821 utime and utimes  are only desktop
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  020708 Added define for _MSL_STRUCT_UTIMEBUF_TYPE
 * cc  021029 Added _No_Time_OS_Support
 * jr  050425 Added ARM utime.ARM.h include
 */