/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:02:49 $
 * $Revision: 1.25.4.1 $
 */

#ifndef _MSL_CONSOLE_IO_H
#define _MSL_CONSOLE_IO_H

#include <ansi_parms.h>            
#include <cstdio>               	

_MSL_BEGIN_EXTERN_C

	#ifndef _No_Console
		int	_MSL_CDECL __read_console	  (__std(__file_handle) handle, unsigned char * buffer, __std(size_t) * count, __std(__ref_con) ref_con);
		int	_MSL_CDECL __write_console	  (__std(__file_handle) handle, unsigned char * buffer, __std(size_t) * count, __std(__ref_con) ref_con);
		int	_MSL_CDECL __close_console	  (__std(__file_handle) handle) _MSL_CANT_THROW;
	#endif

_MSL_END_EXTERN_C

#endif  /* _MSL_CONSOLE_IO_H */

/* Change record:
 * hh  971206 Namespace support
 * hh  990121 Fixed __std 7 places
 * ad  990128 Added #ifndef _No_Console
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * hh  020603 Added no throw spec to functions
 * JWW 020906 Use generic reference constant instead of specific idle_proc in file I/O
 */