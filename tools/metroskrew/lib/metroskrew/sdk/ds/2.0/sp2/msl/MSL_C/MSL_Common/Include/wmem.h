/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.40.2.3 $
 */

#ifndef _MSL_WMEM_H
#define _MSL_WMEM_H

#include <ansi_parms.h>
#include <mem_funcs.h>
#include <cstddef>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL (wmemcpy)(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, size_t) _MSL_CANT_THROW;			/*- mm 980909 -*/
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL (wmemmove)(wchar_t *, const wchar_t *, size_t) _MSL_CANT_THROW;				/*- mm 980909 -*/
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL (wmemset)(wchar_t *, wchar_t, size_t) _MSL_CANT_THROW;					/*- mm 980909 -*/
#if !defined(__cplusplus) || __embedded_cplusplus != 0
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL (wmemchr)(const wchar_t *, wchar_t, size_t) _MSL_CANT_THROW;        		/*- mm 980909 -*/
#else
	_MSL_IMP_EXP_C const wchar_t * _MSL_CDECL (wmemchr)(const wchar_t *, wchar_t, size_t) _MSL_CANT_THROW;
#endif
	_MSL_IMP_EXP_C 	   int   _MSL_CDECL (wmemcmp)(const wchar_t *, const wchar_t *, size_t) _MSL_CANT_THROW;  	/*- mm 980909 -*/

#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	_MSL_IMP_EXP_C errno_t _MSL_CDECL (wmemcpy_s)(wchar_t * _MSL_RESTRICT, rsize_t, const wchar_t * _MSL_RESTRICT, rsize_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C errno_t _MSL_CDECL (wmemmove_s)(wchar_t *, rsize_t, const wchar_t *, rsize_t) _MSL_CANT_THROW;
#endif /* __STDC_WANT_SECURE_LIB__ */

_MSL_END_EXTERN_C

	#if defined(__cplusplus) && __embedded_cplusplus == 0
	
		inline
		wchar_t* _MSL_CDECL
		wmemchr(wchar_t* s, wchar_t c, size_t n) _MSL_CANT_THROW
		{
			return const_cast<wchar_t*>(wmemchr(static_cast<const wchar_t*>(s), c, n));
		}
	
	#endif

_MSL_END_NAMESPACE_STD

#endif /* _MSL_WMEM_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * mm  980909 Corrected prototypes to refer to wchar_t* instead of void*
 * hh  991112 Added non-const inlines per C++ standard.
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 * JWW 040317 Updated the __STDC_WANT_SECURE_LIB__ secure library based on new secure specifications
 */