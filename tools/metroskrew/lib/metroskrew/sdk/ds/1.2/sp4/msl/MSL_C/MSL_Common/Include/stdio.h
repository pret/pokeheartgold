/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:05 $
 * $Revision: 1.25.4.2 $
 */
 
#ifndef _MSL_STDIO_H
#define _MSL_STDIO_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstdio>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)
	using std::FILE;
	using std::fpos_t;
	using std::size_t;
	using std::clearerr;
	using std::fclose;
	using std::feof;
	using std::ferror;
	using std::fflush;
	using std::fgetc;
	using std::fgetpos;
	using std::fgets;
#ifndef _No_Disk_File_OS_Support
	using std::fopen;
	using std::fprintf;
#endif							/*- mm 030319 -*/
	using std::fputc;
	using std::fputs;
	using std::fread;
#ifndef _No_Disk_File_OS_Support
	using std::freopen;
#endif
	using std::fscanf;
	using std::fseek;
	using std::fsetpos;
	using std::ftell;
	using std::fwrite;
	using std::getc;
	using std::getchar;
	using std::gets;
	using std::perror;
	using std::printf;
	using std::putc;
	using std::putchar;
	using std::puts;
#ifndef _No_Disk_File_OS_Support
	using std::remove;
	using std::rename;
#endif
	using std::rewind;
	using std::scanf;
	using std::setbuf;
	using std::setvbuf;
	using std::sprintf;
	using std::snprintf;
	using std::sscanf;
#ifndef _No_Disk_File_OS_Support
	using std::tmpfile;
	using std::tmpnam;
#endif
	using std::ungetc;
	using std::vfprintf;
	using std::vprintf;
	using std::vsprintf;
	using std::vfscanf;
	using std::vscanf;						/*- mm 020326 -*/
	using std::vsscanf;
	using std::vsnprintf;
#if _MSL_WIDE_CHAR && _MSL_C99				/*- mm 030314 -*/
	using std::fwide;
#endif /* _MSL_WIDE_CHAR && _MSL_C99 */		/*- mm 030314 -*/
#endif

#endif /* _MSL_USING_MW_C_HEADERS */

#endif /* _MSL_STDIO_H */

/* Change record:
 * hh  971206 Created.
 * hh  991112 Fixed using bug.
 * JWW 001208 Added case for targeting Mach-O
 * JWW 011027 Use _MSL_USING_MW_C_HEADERS as generic header test instead of specific Mach-O test
 * mm  020126 Included using vscanf, __unoriented, __wide_oriented, and __char_oriented
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * mm  030314 Added wrappers for fwide
 * mm  030319 Moved wrapper for _No_Disk_File_OS_Support
 */