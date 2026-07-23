/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:35 $
 * $Revision: 1.37.2.2 $
 */

#ifndef _MSL_WTIME_H
#define _MSL_WTIME_H

#include <ansi_parms.h>
#include <ctime>

#include <wchar_t.h>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

#if _MSL_OS_TIME_SUPPORT
	_MSL_IMP_EXP_C __std(size_t) _MSL_CDECL		wcsftime(wchar_t * _MSL_RESTRICT, __std(size_t), const wchar_t * _MSL_RESTRICT, const struct __std(tm) * _MSL_RESTRICT) _MSL_CANT_THROW;			/*- cc 011203 -*/
	 static  int _MSL_CDECL						wemit(wchar_t *, __std(size_t), __std(size_t) *, const wchar_t *, ...) _MSL_CANT_THROW;  /*- mf 990715 -*/	/*- cc 011203 -*/
#endif /* _MSL_OS_TIME_SUPPORT */

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WTIME_H */

/* Change record:
 * mm  970905 added include of stdio.h to allow this header to be included first.
 * hh  971206 namespace support
 * hh  990121 Fixed __std 7 places
 * mf  990715 Remove arg name in prototype
 * mm  990806 Removed include of cstdio and replaced include of cwchar
 *            by one of wchar_t.h
 * cc  000413 Added _MSL_IMP_EXP_C
 * mm  010327 Commented wasctime and wctime out since they are not defined in C99 and wasctime tampered with gmtime's
 *			  threadlocal data
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011203 Added _MSL_CDECL for new name mangling
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 * cc  030804 Added missing namespace std flags
 */