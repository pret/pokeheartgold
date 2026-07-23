/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:27 $
 * $Revision: 1.47.2.2 $
 */

/*
 *		Notes
 *		-----
 *
 *			What we need in certain areas of the library is the ability to "lock"
 *			certain critical regions of code against reentrance by preemptive
 *			threads. For example, when fopen searches for an unused FILE struct, it
 *			would be unfortunate if another thread "found" the same struct before the
 *			first one could mark it as in-use.
 *			
 *			Because the mechanisms used to manage critical regions will vary widely
 *			depending on the underlying hardware and/or system software, *all*
 *			details about how critical regions are locked and released are kept
 *			hidden. Instead, we define a finite number of critical regions that are
 *			of interest to us and leave the details of how they are managed invisible.
 */

#ifndef _MSL_CRITICAL_REGIONS_H
#define _MSL_CRITICAL_REGIONS_H

#include <ansi_parms.h>

_MSL_BEGIN_EXTERN_C

	enum critical_regions 
	{
		atexit_funcs_access		=0,
		malloc_pool_access		=1,
		stdin_access			=2,	/*- mm 020621 -*/
		stdout_access			=3,	/*- mm 020621 -*/
		stderr_access			=4,	/*- mm 020621 -*/
		files_access			=5,	/*- mm 020621 -*/
		console_status_access	=6,	/*- mm 020621 -*/
		signal_funcs_access		=7,	/*- mm 020621 -*/
		thread_access			=8,	/*- mm 020621 -*/
		num_critical_regions	=9	/*- mm 020621 -*/
	};

	#if _MSL_THREADSAFE

		_MSL_INLINE void _MSL_CDECL __init_critical_regions(void) _MSL_CANT_THROW;
		_MSL_INLINE void _MSL_CDECL __kill_critical_regions(void) _MSL_CANT_THROW;		
		_MSL_INLINE void _MSL_CDECL __begin_critical_region(int region) _MSL_CANT_THROW;
		_MSL_INLINE void _MSL_CDECL __end_critical_region(int region) _MSL_CANT_THROW;
		
		#if __dest_os == __win32_os
			#include <critical_regions.win32.h>
		#elif __dest_os == __dolphin_os
			#include <critical_regions.gamecube.h>
		#elif __dest_os == __mac_os
			#include <critical_regions.macos.h>			
		#elif __dest_os == __arm_bare
			#include <critical_regions.NITRO.h>		
		#elif _MSL_PTHREADS
			#include <critical_regions.pthreads.h>
		#endif /* __dest_os */

	#else
	
	    #define __init_critical_regions()
	    #define __kill_critical_regions()
		#define __begin_critical_region(x)
		#define __end_critical_region(x)
	
	#endif /* _MSL_THREADSAFE */

_MSL_END_EXTERN_C

#endif /* _MSL_CRITICAL_REGIONS_H */

/* Change record:
 * hh  971206 expanded _extern macro
 * mf  980515 wince changes
 * mf  030199 single threaded lib changes
 * hh  990830 Made macros out of __init/__kill_critical_regions on Mac to uncouple
 *            MSL C and PPC runtime lib.
 * mf  000710 added critical region protection for global thread list
 * ah  010119 merged back missing previous code from v1.15
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * sw  011005 Added Gamecube critical region header
 * JWW 011027 Added Mac OS X case
 * cc  011217 Added _MSL_CDECL
 * JWW 020130 Changed _MWMT to _MSL_THREADSAFE for consistency's sake
 * hh  020603 Added no throw spec to functions
 * cc  020709 Added eppc to the __dest_os list
 * mm  020627 Changes to prevent io on stdin, stdout, stderr and general files from interfering with each other
 * JWW 030528 Use _MSL_INLINE instead of __inline to get inlining without declaring functions static
 * cc  031201 Added _MSL_PTHREADS and cleaned up dest_os check.  
 */