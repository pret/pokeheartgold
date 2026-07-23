/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/09 17:03:02 $
 * $Revision: 1.16.2.2 $
 */

#ifndef _MSL_EXTRAS_H
#define _MSL_EXTRAS_H

#include <ansi_parms.h>
#include <size_t.h>
#include <time.h>
#include <unistd.h>
#include <null.h>
#include <stdio.posix.h>
#include <extras_io.h>
#include <extras_malloc.h>
#include <extras_stdlib.h>
#include <extras_string.h>
#include <extras_time.h>
#include <extras_wchar.h>

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	#include <extras.win32.h>
#endif

#endif /* _MSL_EXTRAS_H */

/* Change record:
 * cc  000428 moved _tell to extras.win32.h 
 * cc  000428 readded #include <unistd.h>
 * cc  000428 reremoved #include <unistd.h>
 * cc  000511 added  _heapmin to extras.h
 * cc  000516 moved __myraise to unix.h
 * cc  000828 removed raise from extras. and left it in csignal
 * cc  010306 added _tell
 * cc  010405 removed pragma options align native and reset	 
 * cc  010409 updated defines to JWW new namespace macros 
 * cc  010517 renamed _lseek to lseek 	
 * cc  010713 renamed all the _functions to non-underscored.
 * cc  010713 added strcasecmp and strncasecmp for Ed 
 * cc  010714 added strcmpi and strncmpi
 * cc  010715 added the underscore version of the functions
 * cc  010910 removed strlen and strcpy they are in cstring
 * cc  010924 added Hisham's version of chsize  
 * ejs 011128 Added strcoll/wcscoll variants
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * cc  021029 Added _No_Disk_File_OS_Support 
 * cc  021119 Moved watof from the C lib to extras
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 */