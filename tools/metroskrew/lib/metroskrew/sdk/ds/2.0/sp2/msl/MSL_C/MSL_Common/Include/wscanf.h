/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.33.2.3 $
 */

#ifndef _MSL_WSCANF_H
#define _MSL_WSCANF_H

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

	_MSL_IMP_EXP_C int _MSL_CDECL fwscanf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;  				/*- mf 990715 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL wscanf(const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL swscanf(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vswscanf(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;	/*- mm 990921 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL vfwscanf(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW; 			/*- mf 990715 -*/ /*- mm 990921 -*/
	_MSL_IMP_EXP_C int _MSL_CDECL vwscanf(const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;
	
#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	_MSL_IMP_EXP_C int _MSL_CDECL fwscanf_s(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL wscanf_s(const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL swscanf_s(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, ...) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vswscanf_s(const wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vfwscanf_s(FILE * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL vwscanf_s(const wchar_t * _MSL_RESTRICT, va_list) _MSL_CANT_THROW;
#endif /* __STDC_WANT_SECURE_LIB__ */

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WSCANF_H */

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
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 */