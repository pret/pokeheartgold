/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:24 $
 * $Revision: 1.25.2.2 $
 */

#ifndef _MSL_CHAR_IO_H
#define _MSL_CHAR_IO_H

#include <ansi_parms.h>
#include <cstdio>

	_MSL_BEGIN_EXTERN_C

		int	_MSL_CDECL __ungotten(__std(FILE) *) _MSL_CANT_THROW;

	_MSL_END_EXTERN_C

#endif /* _MSL_CHAR_IO_H */

/* Change record:
 * hh  971206 namespace support
 * hh  990121 fixed __std
 * mf  990715 Arg names in prototype cause conflicts
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * hh  020603 Added no throw spec to functions
 */