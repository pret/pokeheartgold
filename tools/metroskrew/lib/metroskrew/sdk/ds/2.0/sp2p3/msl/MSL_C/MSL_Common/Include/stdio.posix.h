/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:05 $
 * $Revision: 1.18.2.2 $
 */

#ifndef _MSL_STDIO_POSIX_H
#define _MSL_STDIO_POSIX_H

#include <eof.h>
#include <file_struc.h>
#include <size_t.h>
#include <null.h>
#include <stdio_api.h>
#include <va_list.h>

_MSL_BEGIN_EXTERN_C

#if _MSL_OS_DISK_FILE_SUPPORT

	_MSL_IMP_EXP_C int _MSL_CDECL fileno(__std(FILE) *) _MSL_CANT_THROW;
	
	#if (__dest_os == __win32_os || __dest_os == __mac_os) && _MSL_POSIX
		_MSL_IMP_EXP_C __std(FILE) * _MSL_CDECL fdopen(int, const char *) _MSL_CANT_THROW;
		
		#if _MSL_OS_DISK_FILE_SUPPORT
			_MSL_IMP_EXP_C int _MSL_CDECL fcloseall(void) _MSL_CANT_THROW;
		#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	#endif
	
	#if __dest_os == __win32_os
		_MSL_IMP_EXP_C int _MSL_CDECL _fileno(__std(FILE) *) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C __std(FILE) * _MSL_CDECL _fdopen(int, const char *) _MSL_CANT_THROW;
	#endif

#endif /* _MSL_OS_DISK_FILE_SUPPORT */

_MSL_END_EXTERN_C

#endif /* _MSL_STDIO_POSIX_H */

/* Change record:
 * cc  010521 Made for _version of POSIX  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  020220 Added #includes
 * hh  020603 Added no throw spec to functions
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 * JWW 040924 Added fcloseall (in stdio_posix.h even though it's GNU and not POSIX)
 */