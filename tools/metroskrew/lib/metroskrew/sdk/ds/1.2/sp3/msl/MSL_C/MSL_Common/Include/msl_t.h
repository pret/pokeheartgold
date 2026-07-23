/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:04 $
 * $Revision: 1.21.4.1 $
 */
 
#ifndef _MSL_T_H
#define _MSL_T_H

#include <ansi_parms.h>                 

#ifdef _INT32
	#undef _INT32
#endif

#ifdef _UINT32
	#undef _UINT32
#endif

#ifndef _MSL_INT32_TYPE
	#define _MSL_INT32_TYPE int
#endif

#if !defined(_MSL_INT64_TYPE) && _MSL_LONGLONG
	#define _MSL_INT64_TYPE long long
#endif

typedef _MSL_INT32_TYPE _INT32;
typedef unsigned _MSL_INT32_TYPE _UINT32;

#ifdef _MSL_INT64_TYPE
	#ifdef _INT64
		#undef _INT64
	#endif
	
	#ifdef _UINT64
		#undef _UINT64
	#endif
	
	typedef _MSL_INT64_TYPE _INT64;
	typedef unsigned _MSL_INT64_TYPE _UINT64;
#endif

#endif /* _MSL_T_H */

/* Change record:
 * vss 990729 New file to define new types introduced into MSL	
 * cc  010405 removed pragma options align native and reset	
 * cc  011023 Moved to generic types
 * cc  011031 Moved 68K define to palm and embedded68k prefix
 * JWW 030321 Added _INT64 and _UINT64 types, default them to long long
 */