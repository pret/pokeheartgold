/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.7.2.2 $
 */

#ifndef _MSL_WEOF_H
#define _MSL_WEOF_H

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#if _MSL_WIDE_CHAR

#ifndef RC_INVOKED

	#include <wchar_t.h>
	
	#ifndef _MSL_WEOF
		#define _MSL_WEOF ((__std(wint_t))(-1))
	#endif
	
	#ifndef WEOF
		#define WEOF _MSL_WEOF
	#endif /* WEOF */

#endif /* RC_INVOKED */

#endif /* _MSL_WIDE_CHAR */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_WEOF_H */

/* Change record:
 * hh  020606 First code release.
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */