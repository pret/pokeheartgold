/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:02 $
 * $Revision: 1.7.2.4 $
 */

#ifndef _MSL_EXTRAS_IO_H
#define _MSL_EXTRAS_IO_H

#include <ansi_parms.h>
#include <size_t.h>

#if (__dest_os == __dolphin_os)
	#include "extras_dolphin.h"
#else

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras_io_win32.h>
#endif

#if (__dest_os == __arm_bare)
	#include "extras.ARM.h"
#endif

_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C int _MSL_CDECL filelength(int) _MSL_CANT_THROW;
	
	#if _MSL_OS_DISK_FILE_SUPPORT
		_MSL_IMP_EXP_C int _MSL_CDECL chsize(int, long) _MSL_CANT_THROW;
		int _MSL_CDECL __msl_setfilesize(int, long) _MSL_CANT_THROW;
		__inline long _MSL_CDECL tell(int fildes) _MSL_CANT_THROW { return(lseek(fildes, 0L, SEEK_CUR)); }
	#endif

_MSL_END_EXTERN_C

#endif /* __dest_os == __dolphin_os */
#endif /* _MSL_EXTRAS_IO_H */

/* Change record:
 * cc  030620 Extras split to reduce namespace pollution
 * ejs 030721 Remove <unistd.h>, <null.h> include
 * ejs 030721 Moved Win32 macros into <extras_stdlib_win32.h>
 * cc  030722 Moved underscored functions out of extras common headers/source.  
 *            They now live in the extras_xxxx_win32.h headers/source.
 * JWW 031017 Added __msl_setfilesize to use native OS calls for changing a file size
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 */