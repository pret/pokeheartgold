/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:05 $
 * $Revision: 1.26.2.2 $
 */

#ifndef _MSL_STDBOOL_H
#define _MSL_STDBOOL_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#ifndef __cplusplus

#if !_MSL_C99													/*- mm 030304 -*/
	#warning "MSL support for C99 is not enabled"
#else
	#ifdef __MWERKS__
		#if !__option(c99)
			#pragma c99 on
			
			#pragma ANSI_strict off
				#warning "Compiler support for C99 has been turned on"
			#pragma ANSI_strict reset
		#endif /* !__option(c99) */
	#endif /* __MWERKS__ */
	
	#define bool							_Bool
	#define true							1
	#define false							0
	#define __bool_true_false_are_defined	1
#endif /* _MSL_C99 */											/*- mm 030304 -*/

#else /* __cplusplus */

#ifdef __MWERKS__
	#if !__option(bool)

		#ifndef bool
			#ifndef _MSL_BOOL_TYPE
				#define _MSL_BOOL_TYPE unsigned char
			#endif
			
			typedef _MSL_BOOL_TYPE bool;
		#endif
		#ifndef true
			#define false static_cast<bool>(0)
			#define true  static_cast<bool>(1)
			#define __bool_true_false_are_defined	1
		#endif

	#endif /* !__option(bool) */
#endif /* __MWERKS__ */

#endif /* !__cplusplus */

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STDBOOL_H */

/* Change record:
 * blc 990323 Created.
 * JWW 001208 Added case for targeting Mach-O
 * cc  010712 Fixed c99 check
 * mm  011005 Set ANSI strict off around #warning 
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * cc  011102 Changed to !__option(c9x)
 * hh  020401 Does nothing if C++ and bool turned on
 * cc  030414 Added check for MWERKS and updated c9x to c99
 * mm  030304 Added _MSL_C99 wrappers
 * JWW 030617 Add support for bool of type unsigned int for Mach-O
 */