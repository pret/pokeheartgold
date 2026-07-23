/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:45 $
 * $Revision: 1.24.2.2 $
 */

#ifndef _MSL_DIV_T_H
#define _MSL_DIV_T_H

#pragma options align=native

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	typedef struct
	{
		int	quot;
		int	rem;
	} div_t;
	
	typedef struct
	{
		long quot;
		long rem;
	} ldiv_t;
	
	#if _MSL_C99 || defined(__cplusplus)
	#if _MSL_LONGLONG
		typedef struct
		{
			long long quot;
			long long rem;
		} lldiv_t;
	#endif	/* _MSL_LONGLONG */
	#endif  /* _MSL_C99 || defined(__cplusplus) */

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#pragma options align=reset

#endif /* _MSL_DIV_T_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * hh  971206 added extern "C" (think maintenance).
 * hh  980122 added long long support
 * mm  981023 added wrappers round long long support
 * mm  990217 added namespace support	
 * cc  010409 updated to JWW new namespace macros
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * mm  030708 Added C99 wrappers.
 */