/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:07 $
 * $Revision: 1.30.2.1 $
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
#if _MSL_WIDE_CHAR && _MSL_C99					/*- mm 030321 -*/
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
	using std::towctrans;						/*- mm 020326 -*/
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
	using std::wcsftime;
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
	using std::wcstof;							/*- mm 021112 -*/
	using std::wcstold;							/*- mm 021112 -*/
	using std::wcstok;
	using std::wcstol;
#if _MSL_LONGLONG					/*- mm 020326 -*/
	using std::wcstoll;							/*- mm 020326 -*/
	using std::wcstoull;						/*- mm 020326 -*/
#endif
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
	using std::wctrans;							/*- mm 020326 -*/
#endif
#endif

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
 */