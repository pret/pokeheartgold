/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:25 $
 * $Revision: 1.23.2.2 $
 */

#ifndef _MSL_MEM_FUNCS
#define _MSL_MEM_FUNCS

#include <ansi_parms.h>

#ifndef _MSL_LONG_COPY_MIN
	#define _MSL_LONG_COPY_MIN	32		/* NEVER let this be < 16 */
#endif

#define __min_bytes_for_long_copy	_MSL_LONG_COPY_MIN

_MSL_BEGIN_EXTERN_C

	void _MSL_CDECL	__copy_mem                (void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__move_mem                (void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__copy_longs_aligned      (void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__copy_longs_rev_aligned  (void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__copy_longs_unaligned    (void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__copy_longs_rev_unaligned(void * dst, const void * src, unsigned long n) _MSL_CANT_THROW;
	void _MSL_CDECL	__fill_mem				  (void * dst, int val, unsigned long n) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#endif /* _MSL_MEM_FUNCS */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * cc  010405 removed pragma options align native and reset	
 * cc  010409 updated defines to JWW new namespace macros 
 * hh  020603 Added no throw spec to functions
 * cc  041110 Added _MSL_LONG_COPY_MIN macro
 */