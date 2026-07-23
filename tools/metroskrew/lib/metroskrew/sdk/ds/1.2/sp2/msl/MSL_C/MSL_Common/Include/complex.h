/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:02:49 $
 * $Revision: 1.6.2.1 $
 */

#ifndef _MSL_COMPLEX_H
#define _MSL_COMPLEX_H

#ifdef __cplusplus

#include <complex>

#ifndef _MSL_NO_CPP_NAMESPACE      /* hh 971206 Backward compatibility added with "using" */
#if !defined(_No_Floating_Point) && !defined(_MSL_NO_MATH_LIB)
	using std::complex;
#endif
#endif

#else /*__cplusplus*/

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#if !__MACH__
	#error You must have the non-MSL C header file access path before the MSL access path
	#endif
#else

	/*
		JWW - Currently do nothing here.  Complex is not supported by MSL C.
		
		This file is used as a placeholder for systems that include the header file
		even though they do not use anything from it.
	*/

#endif /* _MSL_USING_MW_C_HEADERS */

#endif  /*__cplusplus*/

#endif /* _MSL_COMPLEX_H */

/* Change record:
 * JWW 011027 Created as a placeholder - this file currently does nothing.
 */