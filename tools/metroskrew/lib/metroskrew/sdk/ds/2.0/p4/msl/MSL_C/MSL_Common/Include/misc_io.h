/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:25 $
 * $Revision: 1.23.2.2 $
 */

#ifndef _MSL_MISC_IO_H
#define _MSL_MISC_IO_H

#include <ansi_parms.h>

#if _MSL_OS_DISK_FILE_SUPPORT

_MSL_BEGIN_EXTERN_C

	void _MSL_CDECL	__stdio_atexit(void) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#endif /* _MSL_OS_DISK_FILE_SUPPORT */

#endif /* _MSL_MISC_IO_H */

/* Change record:
 * hh  971206 expanded _extern macro
 * cc  010405 removed pragma options align native and reset	
 * cc  010409 updated defines to JWW new namespace macros
 * cc  011212 added msl cdecl
 * hh  020603 Added no throw spec to functions
 */