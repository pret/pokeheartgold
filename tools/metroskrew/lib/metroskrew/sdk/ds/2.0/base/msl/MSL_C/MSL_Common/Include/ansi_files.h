/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:04 $
 * $Revision: 1.29.2.2 $
 */

#ifndef _MSL_ANSI_FILES_H
#define _MSL_ANSI_FILES_H

#include <ansi_parms.h>
#include <cstdio>

#define set_eof(file)					\
do										\
{										\
	(file)->state.io_state = __neutral;	\
	(file)->state.eof = 1;				\
	(file)->buffer_len = 0;				\
}										\
while (0)

#define set_error(file)			\
do								\
{								\
	(file)->state.error = 1;	\
	(file)->buffer_len = 0;		\
}								\
while (0)

#if _MSL_BUFFERED_CONSOLE							/*- cc 010924 -*/

	#define console_buff_mode	_IOLBF

	#define console_buff_size	256
	
	typedef unsigned char	console_buff[console_buff_size];
	
	static console_buff	stdin_buff;
	static console_buff	stdout_buff;
	static console_buff	stderr_buff;

#else

	#define console_buff_mode	_IONBF

	#define console_buff_size	1
	
	#define	stdin_buff			&__files[0].char_buffer
	#define	stdout_buff			&__files[1].char_buffer
	#define	stderr_buff			&__files[2].char_buffer

#endif /* _MSL_BUFFERED_CONSOLE */

_MSL_BEGIN_EXTERN_C									

#if _MSL_OS_DISK_FILE_SUPPORT
	__std(FILE) * _MSL_CDECL __find_unopened_file(void) _MSL_CANT_THROW; 	/*- hh 990121 -*/
#endif /* _MSL_OS_DISK_FILE_SUPPORT */

	void _MSL_CDECL			 __init_file(__std(FILE) *  , __std(__file_modes) mode, char * buff, __std(size_t)  ) _MSL_CANT_THROW; /*- mf 990715 -*/
	void _MSL_CDECL			 __close_all(void) _MSL_CANT_THROW;
	int	_MSL_CDECL			 __flush_all(void) _MSL_CANT_THROW;
	int _MSL_CDECL			 __flush_line_buffered_output_files(void) _MSL_CANT_THROW;

_MSL_END_EXTERN_C									

#endif /* _MSL_ANSI_FILES_H */

/* Change record:
 * hh  971206 namespace support
 * mm  981015 Commented out __file_to_num and __num_to_file while investigating whether they are really needed.
 * mm  990121 fixed __std 6 places
 * blc 990308 fixed tabbing on macro definitions
 * mf  990715 Take arg names out of prototype
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  010924 Moved _Unbuffered_Console defines from source file to header
 * cc  011210 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 040405 Changed _Unbuffered_Console to _MSL_BUFFERED_CONSOLE
 */