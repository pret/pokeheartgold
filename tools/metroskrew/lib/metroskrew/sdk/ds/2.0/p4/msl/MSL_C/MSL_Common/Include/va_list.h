/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:20 $
 * $Revision: 1.23.2.2 $
 */

#ifndef _MSL_VA_LIST_H
#define _MSL_VA_LIST_H

#if __dest_os == __mac_os_x
	#ifndef _VA_LIST
		#define _VA_LIST
	#else
		#ifndef _MSL_VA_LIST_DEFINED
			#define _MSL_VA_LIST_DEFINED
		#endif
	#endif
#endif /* __dest_os == __mac_os_x */


_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	#ifndef _MSL_VA_LIST_TYPE
		#define _MSL_VA_LIST_TYPE char *
	#endif
	
	#ifndef _MSL_VA_LIST_DEFINED
		typedef _MSL_VA_LIST_TYPE va_list;
		#define _MSL_VA_LIST_DEFINED
	#endif

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