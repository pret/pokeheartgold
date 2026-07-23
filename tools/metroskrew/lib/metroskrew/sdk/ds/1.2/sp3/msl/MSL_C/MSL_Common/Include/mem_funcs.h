/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:03 $
 * $Revision: 1.20.4.1 $
 */
 
#ifndef _MSL_MEM_FUNCS
#define _MSL_MEM_FUNCS

#include <ansi_parms.h>

#define __min_bytes_for_long_copy	32		/* NEVER let this be < 16 */

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
 */