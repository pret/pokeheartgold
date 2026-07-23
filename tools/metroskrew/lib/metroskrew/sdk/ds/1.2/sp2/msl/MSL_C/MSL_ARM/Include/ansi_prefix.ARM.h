/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2005/03/11 18:48:34 $
 * $Revision: 1.6.4.7 $
 */

#ifndef __ansi_prefix__
#define __ansi_prefix__

#include <os_enum.h>

#define __dest_os __arm_bare


/* Thread Safety Configuration Flags */

#ifndef _MSL_THREADSAFE
	#define _MSL_THREADSAFE 0
#endif

#ifndef _MSL_PTHREADS
	#define _MSL_PTHREADS 0
#endif

#if _MSL_PTHREADS && !_MSL_THREADSAFE
	#error _MSL_PTHREADS and _MSL_THREADSAFE must match
#endif

#ifndef _MSL_LOCALDATA_AVAILABLE
	#define _MSL_LOCALDATA_AVAILABLE 1
#endif

#ifndef _MSL_NEEDS_EXTRAS
	/* to access prototypes of non standard functions via a standard header */
	#define _MSL_NEEDS_EXTRAS 0
#endif

#ifndef _MSL_FLT_EVAL_METHOD
	#define _MSL_FLT_EVAL_METHOD  0
#endif

#ifndef _MSL_C99
	#define _MSL_C99 1
#endif

#ifndef _MSL_LONGLONG
	#define _MSL_LONGLONG 1
#endif

#ifndef _MSL_WIDE_CHAR
	#define _MSL_WIDE_CHAR 1
#endif

#if _MSL_LONGLONG && !defined(__MSL_LONGLONG_SUPPORT__)
	/* The __MSL_LONGLONG_SUPPORT__ flag will disappear with MSL 10.  Use _MSL_LONGLONG instead. */
	#define __MSL_LONGLONG_SUPPORT__
#endif

#ifndef _MSL_C_LOCALE_ONLY
	#define _MSL_C_LOCALE_ONLY 1
#endif

#ifndef _MSL_USES_SUN_MATH_LIB
	#define _MSL_USES_SUN_MATH_LIB 1
#endif

#ifndef _MSL_USES_EXIT_PROCESS
	#define _MSL_USES_EXIT_PROCESS 1
#endif

#if defined(__cplusplus)
    #define _MSL_USING_NAMESPACE	
#endif

#define __ANSI_OVERLOAD__

#define _MSL_INTEGRAL_MATH

/* warning: The flag _No_Time_OS_Support is being changed to _MSL_OS_TIME_SUPPORT */
#define _No_Time_OS_Support 

#define _MSL_OS_TIME_SUPPORT	0

#define _No_Alloc_OS_Support

#define _No_Disk_File_OS_Support

/* The new allocation method has some optional configuration.  Please 
/* see alloc.c for more details.  By default, the fastest allocation
/* method has been chosen.  In particular, you may want to define
/* _MSL_NO_FIX_MALLOC_POOLS if your heap is smaller than 64k.
/* define _MSL_NO_MALLOC_DESIGN_2 if you want lower overhead but
/* somewhat slower allocation. 

/*	Turn on _MSL_OS_DIRECT_MALLOC for a malloc alternative that simply goes
/*	straight to the OS with	no pooling.  Recompile the C lib when flipping
/*	this switch.  This will typically cause poorer performance, but may be of
/*	help when debugging memory problems. 
 */

/* #define _MSL_OS_DIRECT_MALLOC 	*/
/* #define _MSL_NO_MALLOC_DESIGN_2 	*/
/* #define _MSL_NO_FIX_MALLOC_POOLS */

#define NEWMODE NEWMODE_MALLOC		/* always use malloc for new */

#endif /*	__ansi_prefix__	  */

/*#pragma once on*/
/* Switching this pragma on, can improve compilation speed but it may cause problems with the
   use of assert.h, which generally depends upon being actually included more than once during
   compilation. */


/* Change record:
 * cc  021022 Turned on the _MSL_C_LOCALE_ONLY flag
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 */