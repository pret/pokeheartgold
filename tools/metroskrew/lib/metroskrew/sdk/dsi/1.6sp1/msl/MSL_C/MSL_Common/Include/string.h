/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2010/02/05 15:43:45 $
 * $Revision: 1.35.4.1 $
 */

#ifndef _MSL_STRING_H
#define _MSL_STRING_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstring>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::size_t;
	using std::memchr;
	using std::memcmp;
	using std::memcpy;
	using std::memmove;
	using std::memset;
	using std::strcat;
	using std::strchr;
	using std::strcmp;
	using std::strcoll;
	using std::strcpy;
	using std::strcspn;
	using std::strerror;
	using std::strlen;
	using std::strncat;
	using std::strncmp;
	using std::strncpy;
	using std::strpbrk;
	using std::strrchr;
	using std::strspn;
	using std::strstr;
	using std::strtok;
	using std::strxfrm;
#if defined(__STDC_WANT_LIB_EXT1__) && __STDC_WANT_LIB_EXT1__
	using std::errno_t;
	using std::rsize_t;
	using std::memcpy_s;
	using std::memmove_s;
	using std::strnlen_s;
	using std::strcpy_s;
	using std::strncpy_s;
	using std::strcat_s;
	using std::strncat_s;
	using std::strerror_s;
	using std::strtok_s;
#endif /* __STDC_WANT_LIB_EXT1__ */
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STRING_H */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * JWW 031030 Added the __STDC_WANT_LIB_EXT1__ secure library extensions
 */
