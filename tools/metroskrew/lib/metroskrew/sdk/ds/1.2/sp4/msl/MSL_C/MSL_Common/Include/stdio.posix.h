/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:05 $
 * $Revision: 1.11.2.1 $
 */
 
#ifndef _MSL_STDIO_POSIX_H
#define _MSL_STDIO_POSIX_H

#include <ansi_parms.h>
#include <size_t.h>
#include <null.h>
#include <eof.h>	
#include <va_list.h>
#include <file_struc.h>     		
#include <stdio_api.h>

_MSL_BEGIN_EXTERN_C

#ifndef _No_Disk_File_OS_Support

	_MSL_IMP_EXP_C int _MSL_CDECL	fileno(__std(FILE) *) _MSL_CANT_THROW;

	#if ((__dest_os == __win32_os || __dest_os == __mac_os) && _MSL_POSIX)
		_MSL_IMP_EXP_C __std(FILE)*	_MSL_CDECL  	 fdopen(int , const char *) _MSL_CANT_THROW;
	#endif
	
	#if (__dest_os	== __win32_os)
		_MSL_IMP_EXP_C int _MSL_CDECL			 _fileno(__std(FILE) *) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C __std(FILE) * _MSL_CDECL  _fdopen(int, const char *) _MSL_CANT_THROW;
	#endif

#endif
_MSL_END_EXTERN_C

#endif /* _MSL_STDIO_POSIX_H */

/* Change record:
 * cc  010521 Made for _version of POSIX  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  020220 Added #includes
 * hh  020603 Added no throw spec to functions
 */