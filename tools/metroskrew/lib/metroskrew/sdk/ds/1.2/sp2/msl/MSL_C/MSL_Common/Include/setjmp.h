/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:04 $
 * $Revision: 1.22.4.1 $
 */

/*
 *	Content:		Interface to setjmp/longjmp ANSI functions ...
 */

#ifndef _MSL_SETJMP_H
#define _MSL_SETJMP_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <csetjmp>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::jmp_buf;
	using std::longjmp;
#endif

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_SETJMP_H */

/* Change record:
 * hh  971206 Created.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 */