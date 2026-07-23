/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:21 $
 * $Revision: 1.40.2.3 $
 */

#ifndef _MSL_WCHAR_H
#define _MSL_WCHAR_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#endif
#else

#include <cwchar>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
#if _MSL_WIDE_CHAR
	using std::mbstate_t;
	using std::wint_t;
	using std::size_t;
	using std::btowc; 							/*- mm 010528 -*/
	using std::fgetwc;
	using std::fgetws;
	using std::fputwc;
	using std::fputws;
	using std::fwide;
	using std::fwprintf;
	using std::fwscanf;
	using std::getwc;
	using std::getwchar;
	using std::mbrlen;  						/*- mm 010528 -*/
	using std::mbrtowc;  						/*- mm 010528 -*/
	using std::mbsinit; 						/*- mm 021210 -*/
 	using std::mbsrtowcs;  						/*- mm 010528 -*/
	using std::putwc;
	using std::putwchar;
	using std::swprintf;
	using std::swscanf;
	using std::ungetwc;
	using std::vfwprintf;
	using std::vswprintf;
	using std::vwprintf;
	using std::wcrtomb; 						/*- mm 010528 -*/
	using std::wcscat;
	using std::wcschr;
	using std::wcscmp;
	using std::wcscoll;
	using std::wcscpy;
	using std::wcscspn;
#if _MSL_OS_TIME_SUPPORT
	using std::wcsftime;
#endif /* _MSL_OS_TIME_SUPPORT */
	using std::wcslen;
	using std::wcsncat;
	using std::wcsncmp;
	using std::wcsncpy;
	using std::wcspbrk;
	using std::wcsrchr;
	using std::wcsrtombs;  						/*- mm 010528 -*/
	using std::wcsspn;
	using std::wcsstr;
	using std::wcstod;
#if _MSL_C99
	using std::wcstof;
	using std::wcstold;
#endif /* _MSL_C99*/
	using std::wcstok;
	using std::wcstol;
#if _MSL_C99
#if _MSL_LONGLONG
	using std::wcstoll;	
	using std::wcstoull;
#endif /* _MSL_LONGLONG */
#endif /* _MSL_C99 */
	using std::wcstoul;
	using std::wcsxfrm;
	using std::wctob;
	using std::wmemchr;
	using std::wmemcmp;
	using std::wmemcpy;
	using std::wmemmove;
	using std::wmemset;
	using std::wprintf;
	using std::wscanf;
#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using std::errno_t;
	using std::rsize_t;
	using std::wmemcpy_s;
	using std::wmemmove_s;
	using std::fwscanf_s;
	using std::wscanf_s;
	using std::swscanf_s;
	using std::vswscanf_s;
	using std::vfwscanf_s;
	using std::vwscanf_s;
	using std::wcsnlen_s;
	using std::wcscpy_s;
	using std::wcsncpy_s;
	using std::wcscat_s;
	using std::wcsncat_s;
#endif /* __STDC_WANT_SECURE_LIB__ */
#endif /* _MSL_WIDE_CHAR */
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_WCHAR_H */

/* Change record:
 * JCM 980121 First code release.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * mm  020326 Added some missing usings
 * mm  021112 Added usings for wcstof and wcstold
 * mm  021210 Added prototype for mbsinit()
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * mm  030321 Added C99 wrapper
 * cc  030804 Added back in wcsftime
 * JWW 031030 Added the __STDC_WANT_SECURE_LIB__ secure library extensions
 */