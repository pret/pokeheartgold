/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:09 $
 * $Revision: 1.27.4.1 $
 */

#ifndef _MSL_WSCANF_H 
#define _MSL_WSCANF_H

#include <ansi_parms.h>
#include <file_struc.h>
#include <va_list.h>

#if __MWERKS__>=0x3200
#pragma implements_std_header("wchar.h")
#endif

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C int _MSL_CDECL fwscanf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;  				/*- mf 990715 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL wscanf(const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL swscanf(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vswscanf(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;	/*- mm 990921 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL vfwscanf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW; 			/*- mf 990715 -*/ /*- mm 990921 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL vwscanf(const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* ifndef _MSL_WSCANF_H */

/* Change record:
 * JCM 980121 First code release.
 * mf  990715 Remove arg names in prorotypes
 * mm  990806 Replaced include <cstdio> by <file_struc.h> and <va_list.h>
 * mm  990921 Changed __vswscanf and __vfwscanf to vswscanf and vfwscanf now that they are in C9x
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros 		  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 */