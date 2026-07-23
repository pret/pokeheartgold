/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.25.2.2 $
 */

#ifndef _MSL_T_H
#define _MSL_T_H

#ifdef _INT32
	#undef _INT32
#endif

#ifdef _UINT32
	#undef _UINT32
#endif

#ifndef _MSL_INT32_TYPE
	#define _MSL_INT32_TYPE int
#endif

typedef _MSL_INT32_TYPE _INT32;
typedef unsigned _MSL_INT32_TYPE _UINT32;


#if _MSL_LONGLONG
	#ifdef _INT64
		#undef _INT64
	#endif
	
	#ifdef _UINT64
		#undef _UINT64
	#endif
	
	#ifndef _MSL_INT64_TYPE
		#define _MSL_INT64_TYPE long long
	#endif
	
	typedef _MSL_INT64_TYPE _INT64;
	typedef unsigned _MSL_INT64_TYPE _UINT64;
#endif /*_MSL_LONGLONG */

#endif /* _MSL_T_H */

/* Change record:
 * vss 990729 New file to define new types introduced into MSL	
 * cc  010405 removed pragma options align native and reset	
 * cc  011023 Moved to generic types
 * cc  011031 Moved 68K define to palm and embedded68k prefix
 * JWW 030321 Added _INT64 and _UINT64 types, default them to long long
 */