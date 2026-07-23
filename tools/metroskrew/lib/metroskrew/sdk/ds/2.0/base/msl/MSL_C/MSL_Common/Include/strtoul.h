/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:19 $
 * $Revision: 1.28.2.2 $
 */

#ifndef _MSL_STRTOUL_H
#define _MSL_STRTOUL_H

#include <ansi_parms.h>
#include <cstdio>

_MSL_BEGIN_EXTERN_C

	extern unsigned long _MSL_CDECL __strtoul(int base, 
								 			  int max_width,
											  int (_MSL_CDECL *ReadProc)(void *, int, int), 	/*- mm 990325 -*/ /*- cc 020109 -*/
											  void * ReadProcArg,								/*- mm 990325 -*/ 
											  int  * chars_scanned,
											  int  * negative,
											  int  * overflow) _MSL_CANT_THROW;

	#if _MSL_LONGLONG              											   /*- mm 970110 -*/
		extern unsigned long long _MSL_CDECL __strtoull(	int		base, 
												int		max_width,
												int (_MSL_CDECL *ReadProc)(void *, int, int), /*- mm 990325 -*/ /*- cc 020109 -*/
												void * ReadProcArg,							  /*- mm 990325 -*/
												int	* chars_scanned,
												int	* negative,
												int	* overflow) _MSL_CANT_THROW;
	#endif   /*_MSL_LONGLONG*/       											 /*- mm 970110 -*/

_MSL_END_EXTERN_C

#endif /* _MSL_STRTOUL_H */

/* Change record:
 * mm  970110 Changed wrappers for long long support
 * hh  971206 namespace support added
 * hh  990121 Fixed __std 2 places
 * mm  990325 Changes to prototypes to allow use of input functions passed by pointer
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  020109 Added _MSL_CDECL 
 * hh  020603 Added no throw spec to functions
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 */