/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2008/04/17 14:56:52 $
 * $Revision: 1.29.2.2 $
 */

#ifndef __ansi_prefix__
#define __ansi_prefix__

#include <os_enum.h>

#define __dest_os __arm_bare

/*********************************************/
/* 		OS Specific Configuration Flags		 */
/*********************************************/

/* Tiny IO Support defaults (define on command-line if desired) */
#ifndef _MSL_C_TINY_IO
#define _MSL_C_TINY_IO	0
#endif

#ifndef _MSL_TINY_FILE_IO
#define _MSL_TINY_FILE_IO	0
#endif

#ifndef _MSL_TESTING_TINY_IO
#define _MSL_TESTING_TINY_IO	0
#endif

/* Console IO Support Configuration Flags */

#ifndef _MSL_CONSOLE_SUPPORT
	#define _MSL_CONSOLE_SUPPORT	1
#endif

/* File IO Support Configuration Flags */

#ifndef _MSL_OS_DISK_FILE_SUPPORT
	#define _MSL_OS_DISK_FILE_SUPPORT	0
#endif

/* Time Support Configuration Flags */

#ifndef _MSL_OS_TIME_SUPPORT
	#define _MSL_OS_TIME_SUPPORT	1
#endif

#ifndef _MSL_CLOCK_T_AVAILABLE
	#define _MSL_CLOCK_T_AVAILABLE 	1
#endif

#ifndef _MSL_TIME_T_AVAILABLE
	#define _MSL_TIME_T_AVAILABLE	1
#endif

#if _MSL_OS_TIME_SUPPORT && ((!_MSL_CLOCK_T_AVAILABLE)  || (!_MSL_TIME_T_AVAILABLE))
	#error _MSL_CLOCK_T_AVAILABLE and _MSL_CLOCK_T_AVAILABLE must match _MSL_OS_TIME_SUPPORT
#endif

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

/* Memory Allocation Flags */

/*  See alloc.c for more details on configuration options */

#ifndef _MSL_OS_ALLOC_SUPPORT
	#define _MSL_OS_ALLOC_SUPPORT 0
#endif

#ifndef _MSL_HEAP_EXTERN_PROTOTYPES
	#define _MSL_HEAP_EXTERN_PROTOTYPES \
		extern char __heap_addr[]; \
		extern char __heap_size[];
#endif

#ifndef _MSL_HEAP_START
	#define _MSL_HEAP_START __heap_addr
#endif

#ifndef _MSL_HEAP_SIZE
	#define _MSL_HEAP_SIZE __heap_size
#endif

/* #define _MSL_NO_MALLOC_DESIGN_2 */ /* lower overhead but slower allocation */
	
/* #define _MSL_NO_FIX_MALLOC_POOLS */ /* For heaps that are less than 64k */


/********************************************/
/* 		Additional Portability Flags 		*/
/********************************************/

#ifndef _MSL_COMPLEX
	#define _MSL_COMPLEX 0
#endif

#ifndef _MSL_LONGLONG
	#define _MSL_LONGLONG 1
#endif

#ifndef _MSL_FLOATING_POINT
	#define _MSL_FLOATING_POINT 1
#endif

#ifndef _MSL_WIDE_CHAR
	#define _MSL_WIDE_CHAR 1
#endif

#ifndef _MSL_USES_SUN_MATH_LIB
	#define _MSL_USES_SUN_MATH_LIB 1
#endif

#ifndef _MSL_POSIX
	#define _MSL_POSIX 0
#endif

#ifndef _MSL_NEEDS_EXTRAS
	#define _MSL_NEEDS_EXTRAS 0
#endif

/************************************************/
/* 		Flags to reduce code and data size 		*/
/************************************************/

#ifndef _MSL_STRERROR_KNOWS_ERROR_NAMES
	#define _MSL_STRERROR_KNOWS_ERROR_NAMES 1
#endif

#ifndef _MSL_ASSERT_DISPLAYS_FUNC
	#define _MSL_ASSERT_DISPLAYS_FUNC	1
#endif

#ifndef _MSL_C_LOCALE_ONLY
	#define _MSL_C_LOCALE_ONLY	1
#endif

#ifndef _MSL_C99
	#define _MSL_C99	1
#endif

#if !_MSL_C99 && !_MSL_C_LOCALE_ONLY
	#error _MSL_C_LOCALE_ONLY must be turned on if _MSL_C99 is off
#endif

#ifndef _MSL_FLOATING_POINT_IO
	#if _MSL_C_TINY_IO && _MSL_TINY_FILE_IO && _MSL_TESTING_TINY_IO
		#define _MSL_FLOATING_POINT_IO	0
	#else
		#define _MSL_FLOATING_POINT_IO	1
	#endif
#endif


#ifndef _MSL_USES_EXIT_PROCESS
	#define _MSL_USES_EXIT_PROCESS 1
#endif

#ifndef _MSL_FLT_EVAL_METHOD
	#define _MSL_FLT_EVAL_METHOD  0
#endif

#if defined(__cplusplus)
    #define _MSL_USING_NAMESPACE	
#endif

#define __ANSI_OVERLOAD__

#define _MSL_INTEGRAL_MATH

/************************************************/
/* 		TINY IO									*/
/************************************************/

#if _MSL_C_TINY_IO && _MSL_TINY_FILE_IO && _MSL_TESTING_TINY_IO

#ifndef _MSL_C99_PRINTF_SCANF
#define _MSL_C99_PRINTF_SCANF	0
#endif

#ifndef LIBDEF_ENABLE_OVERFLOW_CHECK
#define LIBDEF_ENABLE_OVERFLOW_CHECK	0
#endif

#ifndef LIBDEF_PRINTF_LONG
#define LIBDEF_PRINTF_LONG	1
#endif

#ifndef LIBDEF_PRINTF_FLOATING
#define LIBDEF_PRINTF_FLOATING	1
#endif

#ifndef LIBDEF_PRINTF_FAR_PTR
#define LIBDEF_PRINTF_FAR_PTR	0
#endif

#ifndef LIBDEF_REENTRANT_PRINTF
#define LIBDEF_REENTRANT_PRINTF 0
#endif

#ifndef LIBDEF_PRINTF_PREC
#define LIBDEF_PRINTF_PREC	1
#endif

#ifndef LIBDEF_PRINTF_NOF_CHAR
#define LIBDEF_PRINTF_NOF_CHAR	1
#endif

#ifndef LIBDEF_PRINTF_CHAR
#define	LIBDEF_PRINTF_CHAR	1
#endif

#ifndef LIBDEF_PRINTF_PREC
#define LIBDEF_PRINTF_PREC	1
#endif

#ifndef LIBDEF_PRINTF_PTR
#define LIBDEF_PRINTF_PTR	1
#endif

#ifndef LIBDEF_PRINTF_ALLOW_HEXINT
#define LIBDEF_PRINTF_ALLOW_HEXINT	1
#endif

#ifndef LIBDEF_PRINTF_ALLOW_OCTINT
#define LIBDEF_PRINTF_ALLOW_OCTINT	1
#endif

#ifndef LIBDEF_MULTI_CHAR_SELECTION
#define LIBDEF_MULTI_CHAR_SELECTION	0
#endif

#ifndef LIBDEF_SCANF_DONTCARE_SPACES
#define LIBDEF_SCANF_DONTCARE_SPACES	1
#endif

#ifndef LIBDEF_HAS_ATOI_ATOL_ATOLL
#define LIBDEF_HAS_ATOI_ATOL_ATOLL	1
#endif 

#endif /* Tiny IO */

/************************************************/
/* 		ARM EABI								*/
/************************************************/

#ifndef _AEABI_PORTABILITY_LEVEL
	#define _AEABI_PORTABILITY_LEVEL 0
#endif

#if _AEABI_PORTABILITY_LEVEL 
	typedef long long __int64;
#endif

#endif /*	__ansi_prefix__	  */

/*#pragma once on*/
/* Switching this pragma on, can improve compilation speed but it may cause problems with the
   use of assert.h, which generally depends upon being actually included more than once during
   compilation. */


/* Change record:
 * cc  021022 Turned on the _MSL_C_LOCALE_ONLY flag
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 * JWW 040401 Changed _No_Alloc_OS_Support to _MSL_OS_ALLOC_SUPPORT
 */
