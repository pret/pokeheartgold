/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:04 $
 * $Revision: 1.42.2.2 $
 */

#ifndef _MSL_ANSI_FP_H
#define _MSL_ANSI_FP_H

#include <ansi_parms.h>
#include <cmath>

#pragma options align=native

_MSL_BEGIN_EXTERN_C

	#ifndef _MSL_SIGDIGLEN
		#define _MSL_SIGDIGLEN 32
	#endif
	
	#define SIGDIGLEN		_MSL_SIGDIGLEN

	#define FLOATDECIMAL	((char)(0))
	#define FIXEDDECIMAL	((char)(1))
	
	typedef struct decimal
	{
		 char	sgn;
		 char	unused;
		 short	exp;
		 struct 
		 {
				unsigned char	length;
				unsigned char	text[SIGDIGLEN];
				unsigned char	unused;
		 } sig;
	} decimal;
	
	typedef struct decform
	{
		char	style;
		char	unused;
		short	digits;
	} decform;
	
	#if	_MSL_FLOATING_POINT
	
		_MSL_IMP_EXP_C void _MSL_CDECL __num2dec(const decform *f, double x, decimal *d) _MSL_CANT_THROW;  /*- cc 020426 -*/
		_MSL_IMP_EXP_C double _MSL_CDECL __dec2num(const decimal *d) _MSL_CANT_THROW;					  /*- cc 020426 -*/
	
	#endif /* _MSL_FLOATING_POINT */

_MSL_END_EXTERN_C

#pragma options align=reset

#endif /* _MSL_ANSI_FP_H */

/* Change record:
 * mm  960927 Inserted setting of __dest_os to __mac_os when not otherwise set.
 * KO  961110 Changed include fdlibm.h to math.h since we are no longer using
 *			  the fdlibm math library.
 * mm  961114 Corrected test for __dest_os not being set
 * bk  961202 remove huge val
 * SCM 970723 Wrapped floating point code in #ifndef _No_Floating_Point
 * mf  970909 use math.h on all platforms  
 * hh  971206 Minor maintenance to get namespaces going.
 * mf  980720 wrapped prototypes to turn off K63d mode
 * mm  981013 Incorporated DSP568 change
 * mm  981028 Change __DSP568 to __m56800__
 * mm  990921 Commented out #define _MSL_C9X__ 1 since it is also defined in ansi_parms.h
 * cc  010409 updated to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011210 Added _MSL_CDECL for new name mangling 
 * cc  011211 Moved defines __num2dec & __dec2num to os prefix files and added _MSL_SIGDIGLEN
 * cc  020426 Set double_t to double to match ansi_fp.c
 * cc  020521 Removed the __std()
 * hh  020603 Added no throw spec to functions
 * cc  040217 Changed _No_Floating_Point to _MSL_FLOATING_POINT
 */