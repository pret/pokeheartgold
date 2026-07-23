/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:44 $
 * $Revision: 1.3.2.3 $
 */

#ifndef _MSL_CPP_STD_WCHAR_H
#define _MSL_CPP_STD_WCHAR_H

#ifdef __cplusplus

#if _MSL_OS_X_VERSION > 2

namespace std {

#if _MSL_WIDE_CHAR
	using ::mbstate_t;
	using ::wint_t;
	using ::size_t;
	using ::btowc;
	using ::fgetwc;
	using ::fgetws;
	using ::fputwc;
	using ::fputws;
	using ::fwide;
	using ::fwprintf;
	using ::fwscanf;
	using ::getwc;
	using ::getwchar;
	using ::mbrlen;
	using ::mbrtowc;
	using ::mbsinit;
 	using ::mbsrtowcs;
	using ::putwc;
	using ::putwchar;
	using ::swprintf;
	using ::swscanf;
	using ::ungetwc;
	using ::vfwprintf;
	using ::vswprintf;
	using ::vwprintf;
	using ::wcrtomb;
	using ::wcscat;
	using ::wcschr;
	using ::wcscmp;
	using ::wcscoll;
	using ::wcscpy;
	using ::wcscspn;
#if _MSL_OS_TIME_SUPPORT
	using ::wcsftime;
#endif /* _MSL_OS_TIME_SUPPORT */
	using ::wcslen;
	using ::wcsncat;
	using ::wcsncmp;
	using ::wcsncpy;
	using ::wcspbrk;
	using ::wcsrchr;
	using ::wcsrtombs;
	using ::wcsspn;
	using ::wcsstr;
	using ::wcstod;
#if _MSL_C99
	using ::wcstof;
	using ::wcstold;
#endif /* _MSL_C99*/
	using ::wcstok;
	using ::wcstol;
#if _MSL_C99
#if _MSL_LONGLONG
	using ::wcstoll;	
	using ::wcstoull;
#endif /* _MSL_LONGLONG */
#endif /* _MSL_C99 */
	using ::wcstoul;
	using ::wcsxfrm;
	using ::wctob;
	using ::wmemchr;
	using ::wmemcmp;
	using ::wmemcpy;
	using ::wmemmove;
	using ::wmemset;
	using ::wprintf;
	using ::wscanf;
#if defined(__STDC_WANT_SECURE_LIB__) && __STDC_WANT_SECURE_LIB__
	using ::errno_t;
	using ::rsize_t;
	using ::wmemcpy_s;
	using ::wmemmove_s;
	using ::fwscanf_s;
	using ::wscanf_s;
	using ::swscanf_s;
	using ::vswscanf_s;
	using ::vfwscanf_s;
	using ::vwscanf_s;
	using ::wcsnlen_s;
	using ::wcscpy_s;
	using ::wcsncpy_s;
	using ::wcscat_s;
	using ::wcsncat_s;
#endif /* __STDC_WANT_SECURE_LIB__ */
#endif /* _MSL_WIDE_CHAR */

} /* namespace std */

#endif /* _MSL_OS_X_VERSION > 2 */

#endif /* __cplusplus */

#endif /* _MSL_CPP_STD_WCHAR_H */

/* Change record:
 * JWW 050128 Put C items into the std namespace
 */