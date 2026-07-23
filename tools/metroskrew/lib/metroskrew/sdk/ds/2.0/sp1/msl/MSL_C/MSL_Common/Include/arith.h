/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:05 $
 * $Revision: 1.34.2.2 $
 */

#ifndef _MSL_ARITH_H
#define _MSL_ARITH_H

#include <ansi_parms.h>
#include <div_t.h>

_MSL_BEGIN_EXTERN_C

	int _MSL_CDECL __msl_add (int  * x, int  y) _MSL_CANT_THROW;
	int _MSL_CDECL __msl_ladd(long * x, long y) _MSL_CANT_THROW;
	
	int _MSL_CDECL __msl_mul (int  * x, int  y) _MSL_CANT_THROW;
	int _MSL_CDECL __msl_lmul(long * x, long y) _MSL_CANT_THROW;
	
	__std(ldiv_t) _MSL_CDECL __msl_ldiv(long x, long y) _MSL_CANT_THROW;
	__std(div_t)  _MSL_CDECL __msl_div(int  x, int  y) _MSL_CANT_THROW;
	
	#if _MSL_LONGLONG
		
		int _MSL_CDECL __lladd(long long * x, long long y) _MSL_CANT_THROW;
		int _MSL_CDECL __llmul(long long * x, long long y) _MSL_CANT_THROW;
	#if _MSL_C99														/*- mm 030708 -*/	
		__std(lldiv_t) _MSL_CDECL __lldiv(long long x, long long y) _MSL_CANT_THROW;
	#endif /* _MSL_C99 */												/*- mm 030708 -*/
		
	#endif /* _MSL_LONGLONG */
	
	#ifndef __MOTO__
	
		int	_MSL_CDECL  __msl_mod(int  x, int  y) _MSL_CANT_THROW;
		long _MSL_CDECL __msl_lmod(long x, long y) _MSL_CANT_THROW;
		
		#if _MSL_LONGLONG
			long long _MSL_CDECL __llmod(long long x, long long y) _MSL_CANT_THROW;
		#endif /* _MSL_LONGLONG */
	
	#endif /* __MOTO__ */

_MSL_END_EXTERN_C

#endif /* _MSL_ARITH_H */

/* Change record:
 * bkoz961221 Lien 30 added mmoss's change
 * hh  971206 Expanded __extern macro
 * mm  981023 Added wrappers round long long support
 * hh  000518 Wrapped div_t and company in __std
 * cc  010405 Removed pragma options align native and reset
 * cc  010409 Updated defines to JWW new namespace macros 
 * cc  010510 Changed __add to __msl_add
 * cc  010510 Changed __div to __msl_div
 * cc  010510 Changed __ladd to __msl_ladd
 * cc  010510 Chnaged __mul to __msl_mul
 * cc  010510 Changed __lmul to __msl_lmul
 * cc  010510 Changed __ldiv to __msl_ldiv
 * cc  010510 Changed __mod to __msl_mod
 * cc  010510 Changed __lmod to __msl_lmod
 * cc  011210 Added _MSL_CDECL for new name mangling 
 * cc  011211 Moved __div__ macro to prefix header and made it obsolete
 * hh  020603 Added no throw spec to functions
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * mm  030708 Added _C99 wrappers
 */