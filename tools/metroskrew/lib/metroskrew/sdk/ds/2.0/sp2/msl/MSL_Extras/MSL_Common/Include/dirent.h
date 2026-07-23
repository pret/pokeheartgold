/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:02 $
 * $Revision: 1.11.2.2 $
 */

#ifndef _MSL_DIRENT_H
#define _MSL_DIRENT_H

#include <ansi_parms.h>

#if _MSL_OS_DISK_FILE_SUPPORT

#ifndef NAME_MAX
	#define NAME_MAX 260		/* this should have been defined in <limits.h>! */
#endif

#pragma options align=native
#pragma warn_padding off

_MSL_BEGIN_EXTERN_C	

	struct dirent
	{
		char d_name[NAME_MAX];
	};
	
#if (__dest_os == __win32_os)

	typedef struct
	{
		struct dirent 	*_d__dirent;
	  	char 			*_d__wildcard;			/* "directory\\*" */
	  	unsigned long 	*_d__handle;			/* for FindNextFile() */
		void 			*_d__ffd;				/* really WIN32_FIND_DATA */ 
	} DIR;

#elif (__dest_os == __mac_os)

	typedef struct
	{
		struct dirent 	_d__dirent;
		
#if _MSL_USE_OLD_FILE_APIS
		short			_d__vrefnum;			/* old style directory vRefNum to iterate */
		long			_d__dirid;				/* old style directory ID to iterate */
		short			_d__index;				/* index in the directory */
#endif /* _MSL_USE_OLD_FILE_APIS */
#if _MSL_USE_NEW_FILE_APIS
		void *			_d__ref;				/* new style FSRef of directory to iterate */
		void *			_d__iterator;			/* new style directory iterator reference */
#endif /* _MSL_USE_NEW_FILE_APIS */
	} DIR;

#endif	/* __dest_os == __win32_os */
	
	
	_MSL_IMP_EXP_C DIR				*opendir(const char *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C struct dirent	*readdir(DIR *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int				readdir_r(DIR *, struct dirent *, struct dirent **) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void				rewinddir(DIR *) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int				closedir(DIR *) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#pragma warn_padding reset
#pragma options align=reset

#endif /* _MSL_OS_DISK_FILE_SUPPORT */

#endif /* _MSL_DIRENT_H */

/* Change record:
 * ejs 010417 added
 * JWW 010529 Added Macintosh equivalents of the dirent calls
 * JWW 020114 Added _MSL_IMP_EXP_C to function prototypes
 * cc  021029 Added _No_Disk_File_OS_Support
 * JWW 031103 Added readdir_r
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 */