/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/02/28 19:16:41 $
 * $Revision: 1.43 $
 */

#ifndef _MSL_STDIO_H
#define _MSL_STDIO_H

#include <ansi_parms.h>

#if !_MSL_USING_MW_C_HEADERS
	#error You must have the non-MSL C header file access path before the MSL access path
#else

#include <cstdio>

#if defined(__cplusplus) && defined(_MSL_USING_NAMESPACE)

#if _AEABI_PORTABILITY_LEVEL
	#include <stdio_aeabi.h>
#endif

	using std::FILE;
	using std::fpos_t;
	using std::size_t;
	using std::clearerr;
	using std::fclose;
	using std::feof;
	using std::ferror;
	using std::fflush;
	using std::fgetc;
#if !_MSL_C_TINY_IO
	using std::fgetpos;
	using std::fgets;
	using std::fread;
	using std::fscanf;
	using std::fseek;
	using std::fsetpos;
	using std::ftell;
	using std::fwrite;
	using std::putc;
	using std::rewind;
	using std::setbuf;
	using std::setvbuf;
	using std::snprintf;
	using std::ungetc;
	using std::vfprintf;
	using std::vfprintf;
	using std::vfscanf;
	using std::vscanf;						/*- mm 020326 -*/
	using std::vsnprintf;
#endif	
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::fopen;
	using std::fprintf;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */	/*- mm 030319 -*/
	using std::fputc;
	using std::fputs;	
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::freopen;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	using std::getc;
	using std::getchar;
	using std::gets;
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::perror;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	using std::printf;
	using std::putchar;
	using std::puts;
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::remove;
	using std::rename;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	using std::scanf;
	using std::sprintf;
	using std::sscanf;
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::tmpfile;
	using std::tmpnam;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	using std::vprintf;
	using std::vsprintf;
	using std::vsscanf;
#if defined(__STDC_WANT_LIB_EXT1__) && __STDC_WANT_LIB_EXT1__
	using std::errno_t;
	using std::rsize_t;
	using std::fprintf_s;
	using std::fscanf_s;
	using std::printf_s;
	using std::scanf_s;
	using std::snprintf_s;
	using std::sprintf_s;
	using std::sscanf_s;
	using std::vfprintf_s;
	using std::vfscanf_s;
	using std::vprintf_s;
	using std::vsnprintf_s;
	using std::vsprintf_s;
	using std::vsscanf_s;
	using std::gets_s;
#if _MSL_OS_DISK_FILE_SUPPORT
	using std::fopen_s;
	using std::freopen_s;
	using std::tmpfile_s;
	using std::tmpnam_s;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
#endif /* __STDC_WANT_LIB_EXT1__ */
#endif /* defined(__cplusplus) && defined(_MSL_USING_NAMESPACE) */

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
 * JWW 031030 Added the __STDC_WANT_LIB_EXT1__ secure library extensions
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 */