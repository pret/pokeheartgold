/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:07 $
 * $Revision: 1.19.4.1 $
 */
 
#ifndef _MSL_VA_LIST_H
#define _MSL_VA_LIST_H

#include <ansi_parms.h>

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	#ifndef _MSL_VA_LIST_TYPE
		#define _MSL_VA_LIST_TYPE char *
	#endif

	typedef _MSL_VA_LIST_TYPE va_list;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_VA_LIST_H */

/* Change record:
 * MEA 970723 Merged PPC EABI changes in.
 * MEA 970720 Changed __ppc_eabi_bare to __ppc_eabi.
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * hh  971206 added namespace support.  Is the extern "C" necessary?  Probably not.
 * cc  010409 updated to JWW new namespace macros 
 * cc  010822 added __dest_os __dolphin_os and named the struct
 * cc  011023 Moved to generic types
 */