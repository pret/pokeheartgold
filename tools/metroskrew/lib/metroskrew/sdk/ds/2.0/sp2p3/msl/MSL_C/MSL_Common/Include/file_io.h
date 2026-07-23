/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:05 $
 * $Revision: 1.39.2.2 $
 */

#ifndef _MSL_FILE_IO_H
#define _MSL_FILE_IO_H

#include <ansi_parms.h>
#include <cstdio>

_MSL_BEGIN_EXTERN_C

#if _MSL_OS_DISK_FILE_SUPPORT
	extern _MSL_IMP_EXP_C __std(__file_modes) __temp_file_mode;
	
	int  _MSL_CDECL __open_file(const char * name, __std(__file_modes) mode, __std(__file_handle) * handle) _MSL_CANT_THROW;
	int  _MSL_CDECL __open_temp_file(__std(__file_handle) * handle) _MSL_CANT_THROW;
	
	int  __read_file(__std(__file_handle) handle, unsigned char * buffer, __std(size_t) * count, __std(__ref_con) ref_con) _MSL_CANT_THROW;
	int  __write_file(__std(__file_handle) handle, unsigned char * buffer, __std(size_t) * count, __std(__ref_con) ref_con) _MSL_CANT_THROW;
	int  __position_file(__std(__file_handle) handle, __std(fpos_t) * position, int mode, __std(__ref_con) ref_con) _MSL_CANT_THROW;
	int  __close_file(__std(__file_handle) handle) _MSL_CANT_THROW;
	
	void _MSL_CDECL __temp_file_name(char * name_str, void *) _MSL_CANT_THROW;
	int  _MSL_CDECL __delete_file(const char * name) _MSL_CANT_THROW;
	int  _MSL_CDECL __rename_file(const char * old_name, const char * new_name) _MSL_CANT_THROW;
	
	_MSL_IMP_EXP_C __std(FILE) * _MSL_CDECL __reopen(__std(FILE) * file) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL __get_file_modes(const char * mode, __std(__file_modes) * modes) _MSL_CANT_THROW;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */
	
#if _MSL_WFILEIO_AVAILABLE
	int	 _MSL_CDECL __wopen_file(const wchar_t * name, __std(__file_modes) mode, __std(__file_handle) * handle) _MSL_CANT_THROW;
	void _MSL_CDECL __wtemp_file_name(wchar_t * name_str, void *) _MSL_CANT_THROW;
	int	 _MSL_CDECL __wdelete_file(const wchar_t * name) _MSL_CANT_THROW;
	int	 _MSL_CDECL __wrename_file(const wchar_t * old_name, const wchar_t * new_name) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C int _MSL_CDECL __wget_file_modes (const wchar_t * mode, __std(__file_modes) * modes) _MSL_CANT_THROW;
#endif /* _MSL_WFILEIO_AVAILABLE */
	
	char * _MSL_CDECL __msl_itoa(int, char *, int) _MSL_CANT_THROW;						/*- cc 010605 -*/
	char * _MSL_CDECL __msl_strrev(char *) _MSL_CANT_THROW;								/*- cc 010605 -*/
	int    _MSL_CDECL __msl_strnicmp(const char *, const char *, int ) _MSL_CANT_THROW;	/*- cc 010605 -*/

#if _MSL_OS_DISK_FILE_SUPPORT	
	char * _MSL_CDECL __msl_getcwd(char *, int) _MSL_CANT_THROW;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */

	char * _MSL_CDECL __msl_strdup(const char *) _MSL_CANT_THROW;						/*- cc 010725 -*/

_MSL_END_EXTERN_C

#endif /* _MSL_FILE_IO_H */

/* Change record:
 * mm  970702 Synchronization with Be
 * hh  971206 namespace support
 * rjk 980313 added _MSL_IMP_EXP_C for __temp_file_mode
 * hh  990121 Fixed __std 15 places
 * mm  990609 Added header for __reopen.
 * hh  990921 Wrapped FILE under __std, 2 places
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * cc  010605 Made __msl_itoa = to itoa,__msl_strrev = to strrev,
 *     		  __msl_strnicmp = to strncmp, __msl_getcwd= to getcwd  for MSL C
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  010725 Added __msl_strdup
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * cc  011210 Removed __flush_line_buffered_output_files was defined in ansi_files.h
 * hh  020603 Added no throw spec to functions
 * JWW 020906 Use generic reference constant instead of specific idle_proc in file I/O
 * JWW 021010 Added wchar_t file I/O routines controlled by _MSL_WFILEIO_AVAILABLE
 * JWW 030926 Marked __reopen() as _MSL_IMP_EXP_C
 */