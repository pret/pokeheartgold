/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:41 $
 * $Revision: 1.6.2.2 $
 */

#ifndef	_MSL_TIMEB_H
#define	_MSL_TIMEB_H

#include <ansi_parms.h>
#include <sys/stat.h>

_MSL_BEGIN_EXTERN_C

#pragma options align=native

/*-	EJS 030922: ANSI-safe name -*/
struct _timeb
{
	__std(time_t)		time;			/* Seconds in the current time					*/
	unsigned short		millitm;		/* Milliseconds in the current time				*/
	short				timezone;		/* The difference,in minutes, between local time 
										   and Greenwich Mean time						*/
	short				dstflag;		/* 1 if Daylight Savings time is in effect 		*/
};

#define timeb _timeb					/*	EJS 030922: compatibility name */
		
#pragma options align=reset

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <timeb.win32.h>
#endif
		
	
_MSL_END_EXTERN_C

#endif /* _MSL_TIMEB_H */

/* Change record:
 * cc  020711 Added timeb struct
 * ejs 030922 Make primary struct name "_timeb" and add macro to map to "timeb"
 * ejs 040108 Use <sys/stat.h>, not <stat.h>
 */