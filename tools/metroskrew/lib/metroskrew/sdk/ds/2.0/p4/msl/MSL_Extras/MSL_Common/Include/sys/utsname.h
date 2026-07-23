/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:42 $
 * $Revision: 1.2.2.2 $
 */

/*
 *	Content:	Interface file to standard UNIX-style entry points ...
 *
 *	NB:			This file implements some UNIX low level support.  These functions
 *				are not guaranteed to be 100% conformant.
 */

#ifndef	_MSL_UTSNAME_H
#define	_MSL_UTSNAME_H

#include <ansi_parms.h>

#pragma options align=native

_MSL_BEGIN_EXTERN_C

#if	(__dest_os == __win32_os || __dest_os == __mac_os)

	#define _UTSNAME_FIELD_LENGTH 32
	
	/* struct for uname */
	struct utsname {
		char    sysname[_UTSNAME_FIELD_LENGTH];
		char    nodename[_UTSNAME_FIELD_LENGTH];
		char    release[_UTSNAME_FIELD_LENGTH];
		char    version[_UTSNAME_FIELD_LENGTH];
		char    machine[_UTSNAME_FIELD_LENGTH];
	};
	
	_MSL_IMP_EXP_C int _MSL_CDECL uname (struct utsname* ) _MSL_CANT_THROW;
	
	#if (__dest_os == __win32_os)
		#include <utsname.win32.h>
	#endif
	
#endif /* (__dest_os == __win32_os || __dest_os == __mac_os) */

_MSL_END_EXTERN_C

#pragma options align=reset

#endif /*_MSL_UTSNAME_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * hh  971207 moved this higher in the file
 * vss 980807 remove pragma  - no longer supported by compiler
 * mm  990104 Made field length into defined constant
 * mf  000321 updated to using _POSIX to optionally use posix support
 * cc  000517 moved _POSIX block inside extern c
 * cc  010409 updated to JWW new namespace macros 
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  021029 Added __dest_os check
 */