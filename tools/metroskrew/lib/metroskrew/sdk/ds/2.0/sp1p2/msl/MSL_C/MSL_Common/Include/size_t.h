/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:04 $
 * $Revision: 1.34.2.3 $
 */

#ifndef _MSL_SIZE_T_H
#define _MSL_SIZE_T_H

#include <ansi_parms.h>

#ifndef RC_INVOKED	/*- ejs 011205 -*/

#if __dest_os == __mac_os_x
	#include <size_t_mach.h>
#endif /* __dest_os == __mac_os_x */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	#ifndef _MSL_SIZE_T_TYPE
		#define _MSL_SIZE_T_TYPE __typeof__(sizeof(0))
	#endif
	
	#ifndef _MSL_SIZE_T_DEFINED
		#define _MSL_SIZE_T_DEFINED
		typedef _MSL_SIZE_T_TYPE size_t;
	#endif

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* RC_INVOKED */

#endif /* _MSL_SIZE_T_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * hh  971206 added namespace support.
 * mf  980507 added typedef of size_t for wince
 * mm  981014 added typedef of size_t for __DSP568
 * mm  981029 Changed __DSP568 to __m56800__
 * bs  990121 Added BEOS changes
 * ad  990128 added __dest_os == __n64_os
 * vss 990224 MrC needs uint for size_t
 * cc  000326 removed dest_os to be_os  
 * cc  010409 updated to JWW new namespace macros
 * cc  010411 updated hh cute definition of size_t	
 * JWW 011027 Use generic types for defining size_t
 * JWW 011108 Define size_t a bit differently for Mach-O
 * JWW 011112 Add the _MSL_SIZE_T_DEFINED guard in case someone else defines size_t before MSL
 * ejs 011205 Guard against resource compiler
 */