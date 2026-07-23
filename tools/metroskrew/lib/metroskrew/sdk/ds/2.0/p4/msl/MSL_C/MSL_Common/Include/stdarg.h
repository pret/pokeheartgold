/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:04 $
 * $Revision: 1.24.2.2 $
 */

#ifndef _MSL_STDARG_H
#define _MSL_STDARG_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstdarg>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::va_list;
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STDARG_H_ */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 */