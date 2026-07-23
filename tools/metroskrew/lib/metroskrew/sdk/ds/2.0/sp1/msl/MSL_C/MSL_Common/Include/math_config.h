/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:24 $
 * $Revision: 1.23.2.2 $
 */

#ifndef _MSL_MATH_CONFIG_H
#define _MSL_MATH_CONFIG_H

/********************************************************************************
 *	Project...:	Standard C99 math library/ ANSI/ISO C Standard Lib		 
 *  Author..... Matthew D. Fassiotto                                     
 *	Purpose...:	this header is meant to include platform specific 
 *              implementations of standard math functions according to
 *              the target architecture as set by the CodeWarrior compiler.
 *
 *   NOTE: This header gets included automatically by math.h.  It is not a
 *         standalone header meant to be included directly by any application.
 *         We do not support any source file including this header directly.
 *         This header depends on macros and other types defined in math.h
 *         which must be defined before this header is inlcuded.  Therefore
 *         you are guaranteed this will NOT compile when included directly.
 *        
 ********************************************************************************/           
#include <msl_t.h>

#if defined(__MIPS__)
	#include <mips_math.h>
#elif defined(__m56800__)							        
	#include <m56800_math.h> 			            	
#elif defined(__m56800E__)							        
	#include <m56700_math.h> 	
#elif defined(__arm)
	#include <math.ARM.h>
#elif defined(__POWERPC__)
	#if __dest_os == __mac_os_x && _MSL_USING_MW_C_HEADERS
		#include <math_mach.h>
	#else
		#include <math_ppc.h>
	#endif
#elif defined(__INTEL__)	
	#if defined(__MWERKS__) && __option(k63d)
		#include <math_k63d.h>
	#else
		#include <math_x87.h>            	
	#endif
#elif defined(__COLDFIRE__)
	#include <math_e68k.h>
#elif defined(_ENTERPRISE_C_)
	# include <math_StarCore.h>
#endif


#endif /* _MSL_MATH_CONFIG_H */

/* Change record:
 * mf  000619 moved amd architecture header from cmath to this one. 
 * sw  011005 added namespace around this for dolphin os 
 * ejs 020124 removed dolphin stuff
 * JWW 020205 Use math_mach.h for Mach-O MSL C
 */