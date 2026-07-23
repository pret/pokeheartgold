/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:04 $
 * $Revision: 1.32.2.2 $
 */

#ifndef _MSL_ABORT_EXIT_H
#define _MSL_ABORT_EXIT_H

#include <ansi_parms.h>

_MSL_BEGIN_EXTERN_C

	extern void _MSL_CDECL (* __stdio_exit)  (void);
	extern void _MSL_CDECL (* __console_exit)(void);
	
	extern int __aborting;
	
	int	 _MSL_CDECL __atexit(void (_MSL_CDECL * func)(void)) _MSL_CANT_THROW;
	void _MSL_CDECL __exit(int status) _MSL_CANT_THROW;

	#define __setup_exit()
	
	int _MSL_CDECL __register_atexit(void (*func)(void)) _MSL_CANT_THROW;
	extern void _MSL_CDECL __destroy_global_chain(void) _MSL_CANT_THROW;

	#if (__dest_os == __win32_os || __dest_os == __wince_os	)
		_MSL_IMP_EXP_C void _MSL_CDECL _CleanUpMSL() _MSL_CANT_THROW;
	#endif

	#if _MSL_USES_EXIT_PROCESS 											/*- cc 011022 -*/ 
		_MSL_IMP_EXP_C void _MSL_CDECL _ExitProcess(void) _MSL_CANT_THROW;									
	#endif

_MSL_END_EXTERN_C

#endif /* _MSL_ABORT_EXIT_H */

/* Change record:
 * hh  971206 expanded __extern macro
 * mf  980515 wince changes
 * beb 990804 add e68k guard
 * as  001028 added mcore guard
 * cc  000326 removed dest_os to be_os 
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated to JWW new namespace macros 	
 * cc  010822 added __dest_os __dolphin_os	 
 * cc  011022 changed all dest_os to _MSL_USES_EXIT_PROCESS. Flag is set in ansi_prefix file. 
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  020225 Added __register_atexit
 * hh  020603 Added no throw spec to functions
 */