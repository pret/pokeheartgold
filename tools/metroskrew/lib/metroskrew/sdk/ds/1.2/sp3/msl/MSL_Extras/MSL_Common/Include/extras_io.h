/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:04:03 $
 * $Revision: 1.3.2.1 $
 */

#ifndef _MSL_EXTRAS_IO_H
#define _MSL_EXTRAS_IO_H

#include <ansi_parms.h>
#include <size_t.h>

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras_io_win32.h>
#endif

_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C int _MSL_CDECL filelength(int fileno) _MSL_CANT_THROW;
	
	#ifndef _No_Disk_File_OS_Support
		_MSL_IMP_EXP_C int _MSL_CDECL chsize(int, long) _MSL_CANT_THROW;
		int _MSL_CDECL __msl_setfilesize(int, long) _MSL_CANT_THROW;
		__inline long _MSL_CDECL tell(int fildes) _MSL_CANT_THROW { return(lseek(fildes, 0L, SEEK_CUR)); }
	#endif

_MSL_END_EXTERN_C

#endif  /* _MSL_EXTRAS_IO_H */

/* Change record:
 * cc  030620 Extras split to reduce namespace pollution
 * ejs 030721 Remove <unistd.h>, <null.h> include
 * ejs 030721 Moved Win32 macros into <extras_stdlib_win32.h>
 * cc  030722 Moved underscored functions out of extras common headers/source.  
 *            They now live in the extras_xxxx_win32.h headers/source.
 * JWW 031017 Added __msl_setfilesize to use native OS calls for changing a file size
 */