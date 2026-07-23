/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:45 $
 * $Revision: 1.25.2.2 $
 */
 
#ifndef _MSL_CTYPE_H
#define _MSL_CTYPE_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cctype>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::isalnum;
	using std::isalpha;
#if _MSL_C99 						/*- mm 030226 -*/
	using std::isblank;
#endif /* _MSL_C99 */				/*- mm 030226 -*/
	using std::iscntrl;
	using std::isdigit;
	using std::isgraph;
	using std::islower;
	using std::isprint;
	using std::ispunct;
	using std::isspace;
	using std::isupper;
	using std::isxdigit;
	using std::tolower;
	using std::toupper;
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_CTYPE_H */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * mm  030226 Added _MSL_C99 wrappers for isblank()
 */