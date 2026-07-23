/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:03 $
 * $Revision: 1.4.2.2 $
 */

#ifndef _MSL_EXTRAS_WCHAR_H
#define _MSL_EXTRAS_WCHAR_H
      					
#include <ansi_parms.h>
#include <size_t.h>

#if _MSL_WIDE_CHAR

#include <wchar_t.h>

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras_wchar_win32.h>
#endif

_MSL_BEGIN_EXTERN_C

	    _MSL_IMP_EXP_C		int   _MSL_CDECL wtoi(const wchar_t *_a) _MSL_CANT_THROW;
   		_MSL_IMP_EXP_C		int   _MSL_CDECL wcsicmp(const wchar_t *s1, const wchar_t *s2) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C		int   _MSL_CDECL wcsnicmp(const wchar_t *s1, const wchar_t *s2, __std(size_t) n) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C	wchar_t * _MSL_CDECL itow(int, wchar_t *, int) _MSL_CANT_THROW; 				
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsrev(wchar_t *str) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsupr(wchar_t *str) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsdup (const wchar_t *str) _MSL_CANT_THROW;
	    _MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wstrrev(wchar_t * str) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcslwr(wchar_t *str) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsset(wchar_t *str, wchar_t wc) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsnset(wchar_t *str, wchar_t wc, __std(size_t) n) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 	wchar_t * _MSL_CDECL wcsspnp(const wchar_t *s1, const wchar_t *s2) _MSL_CANT_THROW; 
		_MSL_IMP_EXP_C 		int   _MSL_CDECL wcsicoll(const wchar_t *, const wchar_t *) _MSL_CANT_THROW;		
		_MSL_IMP_EXP_C 		int   _MSL_CDECL wcsnicoll(const wchar_t *, const wchar_t *, __std(size_t)) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C 		int   _MSL_CDECL wcsncoll(const wchar_t *, const wchar_t *, __std(size_t)) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C   double   _MSL_CDECL watof(const wchar_t * ) _MSL_CANT_THROW; 		

_MSL_END_EXTERN_C

#endif /* _MSL_WIDE_CHAR */
#endif /* _MSL_EXTRAS_WCHAR_H */

/* Change record:
 * cc  030620 Extras split to reduce namespace pollution
 * ejs 030721 Remove <unistd.h>, <null.h> include
 * cc  060722 Moved _xxx versions out of extras common headers/source.  
 *            They now live in the extras_xxxx_win32.h headers/source.
 */