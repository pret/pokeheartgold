/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:35 $
 * $Revision: 1.36.2.3 $
 */

#ifndef _MSL_WSTRING_H
#define _MSL_WSTRING_H

#include <ansi_parms.h>
#include <size_t.h>
#include <wchar_t.h>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C size_t _MSL_CDECL		(wcslen)(const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL 	(wcscpy)(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL 	wcsncpy(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, size_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL		wcscat(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL		wcsncat(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, size_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL 			wcscmp(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL			wcsncmp(const wchar_t *, const wchar_t *, size_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL 			wcscoll(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C size_t _MSL_CDECL 		wcsxfrm(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, size_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C size_t _MSL_CDECL		wcsspn(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C size_t _MSL_CDECL		wcscspn(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL		wcstok(wchar_t * _MSL_RESTRICT, const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT) _MSL_CANT_THROW;	/*- mm 000420 -*/
#if !defined(__cplusplus) || __embedded_cplusplus != 0
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL		wcschr(const wchar_t *, wchar_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL 	wcspbrk(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL 	wcsrchr(const wchar_t *, wchar_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t * _MSL_CDECL 	wcsstr(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
#else
	_MSL_IMP_EXP_C const wchar_t * _MSL_CDECL wcschr(const wchar_t *, wchar_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C const wchar_t * _MSL_CDECL wcspbrk(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C const wchar_t * _MSL_CDECL wcsrchr(const wchar_t *, wchar_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C const wchar_t * _MSL_CDECL wcsstr(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;
#endif

#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	_MSL_IMP_EXP_C size_t _MSL_CDECL		(wcsnlen_s)(const wchar_t *, size_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C errno_t _MSL_CDECL		(wcscpy_s)(wchar_t * _MSL_RESTRICT, rsize_t, const wchar_t * _MSL_RESTRICT) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C errno_t _MSL_CDECL		wcsncpy_s(wchar_t * _MSL_RESTRICT, rsize_t, const wchar_t * _MSL_RESTRICT, rsize_t) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C errno_t _MSL_CDECL		wcscat_s(wchar_t * _MSL_RESTRICT, rsize_t, const wchar_t * _MSL_RESTRICT) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C errno_t _MSL_CDECL		wcsncat_s(wchar_t * _MSL_RESTRICT, rsize_t, const wchar_t * _MSL_RESTRICT, rsize_t) _MSL_CANT_THROW;
#endif /* __STDC_WANT_SECURE_LIB__ */

_MSL_END_EXTERN_C

	#if defined(__cplusplus) && __embedded_cplusplus == 0

		inline 
		wchar_t* _MSL_CDECL
		wcschr(wchar_t* s, wchar_t c) _MSL_CANT_THROW
		{
			return const_cast<wchar_t*>(wcschr(static_cast<const wchar_t*>(s), c));
		}

		inline
		wchar_t* _MSL_CDECL
		wcspbrk(wchar_t* s1, const wchar_t* s2) _MSL_CANT_THROW
		{
			return const_cast<wchar_t*>(wcspbrk(static_cast<const wchar_t*>(s1), s2));
		}

		inline
		wchar_t* _MSL_CDECL
		wcsrchr(wchar_t* s, wchar_t c) _MSL_CANT_THROW
		{
			return const_cast<wchar_t*>(wcsrchr(static_cast<const wchar_t*>(s), c));
		}

		inline
		wchar_t* _MSL_CDECL
		wcsstr(wchar_t* s1, const wchar_t* s2) _MSL_CANT_THROW
		{
			return const_cast<wchar_t*>(wcsstr(static_cast<const wchar_t*>(s1), s2));
		}

	#endif

_MSL_END_NAMESPACE_STD

#endif /* _MSL_WSTRING_H */

/* Change record:
 * JCM 980121 First code release.
 * hh  991112 Added non-const inlines per C++ standard.
 * mm  000420 Corrected prototype for wcstok to match C99
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros 		  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 030523 Removed meaningless "const" in "const wchar_t" argument
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 * JWW 040317 Updated the __STDC_WANT_SECURE_LIB__ secure library based on new secure specifications
 */