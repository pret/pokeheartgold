/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:23 $
 * $Revision: 1.25.2.2 $
 */

#ifndef _MSL_INTTYPES_H 
#define _MSL_INTTYPES_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cinttypes>
#include <stdint.h>

#if _MSL_C99			/*- mm 030301 -*/

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::imaxdiv_t;
	using std::imaxabs;
	using std::imaxdiv;
	using std::strtoimax;
	using std::strtoumax;
	#if _MSL_WIDE_CHAR
		using std::wcstoimax;
		using std::wcstoumax;
	#endif
#endif

#endif /* _MSL_C99 */						/*- mm 030301 -*/
#endif /* _MSL_USING_MW_C_HEADERS */
#endif /* _MSL_INTTYPES_H */

/* Change record:
 * mm  980724 Created.
 * hh  991113 Fixed using bug.
 * mm  000515 Modified for use with new cinttypes.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * mm  030301 Added _MSL_C99 wrapper
 */