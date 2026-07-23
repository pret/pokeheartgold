/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.29.2.2 $
 */

#ifndef _MSL_WPRINTF_H
#define _MSL_WPRINTF_H

#include <ansi_parms.h>
#include <file_struc.h>
#include <va_list.h>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C int _MSL_CDECL fwprintf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;  					/*- mf 990715 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL wprintf(const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL swprintf(wchar_t * _MSL_RESTRICT, size_t, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vfwprintf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW; 				/*- mf 990715 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL vswprintf(wchar_t * _MSL_RESTRICT, size_t, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vwprintf(const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WPRINTF_H */

/* Change record:
 * mf  990715 remove arg names in prototypes
 * mm  990806 Replaced #include <cstdio> by #include <va_list.h> and file_struc.h
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros 		  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 */