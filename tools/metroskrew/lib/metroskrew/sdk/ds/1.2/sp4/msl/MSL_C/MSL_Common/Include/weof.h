/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:08 $
 * $Revision: 1.3.4.1 $
 */

#ifndef _MSL_WEOF_H
#define _MSL_WEOF_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#if _MSL_WIDE_CHAR

#include <wchar_t.h>

#ifndef RC_INVOKED

#ifndef _MSL_WEOF
	#define _MSL_WEOF ((__std(wint_t))(-1))
#endif

#ifndef WEOF
	#define WEOF _MSL_WEOF
#endif /* ifndef WEOF */
	
#endif /* RC_INVOKED */

#endif /* #if _MSL_WIDE_CHAR */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_WEOF_H */

/* Change record:
 * hh  020606 First code release.
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */