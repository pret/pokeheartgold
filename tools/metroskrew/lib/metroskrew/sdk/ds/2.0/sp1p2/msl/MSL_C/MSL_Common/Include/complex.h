/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:27 $
 * $Revision: 1.10.2.2 $
 */

#ifndef _MSL_COMPLEX_H
#define _MSL_COMPLEX_H

#ifdef __cplusplus

#include <complex>

#ifndef _MSL_NO_CPP_NAMESPACE
	#if _MSL_FLOATING_POINT && !defined(_MSL_NO_MATH_LIB)
		using std::complex;
	#endif
#endif

#else /* __cplusplus */

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

#endif /* __cplusplus */

#endif /* _MSL_COMPLEX_H */

/* Change record:
 * JWW 011027 Created as a placeholder - this file currently does nothing.
 * cc  040217 Changed _No_Floating_Point to _MSL_FLOATING_POINT
 */