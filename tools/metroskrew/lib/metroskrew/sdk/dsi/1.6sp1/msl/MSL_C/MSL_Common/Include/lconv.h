/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:09 $
 * $Revision: 1.23 $
 */
 
#ifndef _MSL_LCONV_H
#define _MSL_LCONV_H

#include <ansi_parms.h>

#pragma options align=native

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	extern struct lconv __lconv;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#pragma options align=reset

#endif /* _MSL_LCONV_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * hh  971206 namespace support
 * cc  010409 updated to JWW new namespace macros 	
 */
