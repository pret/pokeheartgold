/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/03/06 17:21:11 $
 * $Revision: 1.5 $
 */

/* This header file contains the definitions connected with file structures
 * to separate their definition from the stdio prototypes
 */

#ifndef _MSL_FILE_STRUC_TINY_IO_H
#define _MSL_FILE_STRUC_TINY_IO_H

#include <size_t.h>

#if _MSL_WIDE_CHAR
	#include <wchar_t.h>
#endif /* _MSL_WIDE_CHAR */

#ifndef RC_INVOKED

#pragma options align=native
#pragma warn_padding off

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

typedef void * __ref_con;
typedef unsigned long __file_handle;

#if _MSL_TESTING_TINY_IO

#if _MSL_WIDE_CHAR
	enum __file_orientation						/*- mm 980204 -*/
	{
		__unoriented,
		__char_oriented,
		__wide_oriented
	};
#endif /* _MSL_WIDE_CHAR */

enum __io_modes
{
	__read				= 1,
	__write				= 2,
	__read_write		= 3,
	__append			= 4
};


enum __io_states
{
	__neutral,
	__writing,
	__reading,
	__rereading
};


enum __file_kinds
{
	__closed_file,
	__disk_file,
	__console_file,
	__unavailable_file
};

typedef int  (* __io_proc)    (__file_handle file, unsigned char * buff, size_t * count, __ref_con ref_con);


typedef struct
{
	unsigned int	io_state	: 3;
	unsigned int	free_buffer	: 1;
	unsigned char	eof;
	unsigned char	error;
} __file_state;

typedef struct
{
	unsigned int	open_mode	: 2;
	unsigned int	io_mode		: 3;
	unsigned int	buffer_mode	: 2;
	unsigned int	file_kind	: 3;			/*- mm 980708 -*/
	
	#if _MSL_WIDE_CHAR
		unsigned int	file_orientation : 2;
	#endif /* _MSL_WIDE_CHAR */
	
	unsigned int	binary_io	: 1;
} __file_modes;

#endif

typedef struct FILE {

#if _MSL_TESTING_TINY_IO
	__file_handle		handle;
	__file_state		state;
	__file_modes		mode;

	unsigned long		position;
	unsigned char *		buffer;
	unsigned long		buffer_size;
	unsigned char *		buffer_ptr;
	unsigned long		buffer_len;
	unsigned long		buffer_alignment;
	unsigned long		buffer_pos;
	__io_proc			write_proc;
	__ref_con			ref_con;
	
#endif
	
  char *channel_name;        /* Name of I/O channel             */
  char *port_addr;           /* Address of port                 */
  char  flags;               /* STTY style flags                */
  char  lastchar;            /* Last character for ungetc       */
  int   (*open_channel)();   /* routine for port initialization */
  int   (*close_channel)();  /* routine for port shutdown       */
  int   (*read_channel)();   /* routine for port reads          */
  int   (*write_channel)();  /* routine for port writes         */
}FILE;

extern _MSL_IMP_EXP_C FILE __files[];	/*- mm 961031 -*/ /*- mm 961203 -*/

typedef unsigned long fpos_t;

enum __io_results
{
	__no_io_error,
	__io_error,
	__io_EOF									/*- mm 961031 -*/
};


#define _IOEOF    (1<<0)
#define _IOERR    (1<<1)
#define _IOCHR    (1<<2)

#ifndef _IONBF
#define _IONBF 0
#endif

#ifndef _IOLBF
#define _IOLBF 1
#endif

#ifndef _IOFBF
#define _IOFBF 2
#endif

#ifndef	_MSL_BUFSIZ
	#define _MSL_BUFSIZ 4096				/*- cc 011024 -*/
#endif

#define BUFSIZ _MSL_BUFSIZ					/*- cc 011024 -*/

#if !_MSL_OS_DISK_FILE_SUPPORT
	#if !_MSL_CONSOLE_SUPPORT
		#ifndef FOPEN_MAX
			#define FOPEN_MAX		0
		#endif
	#else
		#ifndef FOPEN_MAX
			#define FOPEN_MAX		3
		#endif
	#endif
	#define _STATIC_FILES		3			/*- mm 981007 -*/
#else
	#define FOPEN_MAX			35
	#define _STATIC_FILES		4			/*- mm 981007 -*/
#endif


#ifndef _MSL_FILENAME_MAX
#define _MSL_FILENAME_MAX		256			/*- cc 011024 -*/
#endif

#ifndef FILENAME_MAX
#define FILENAME_MAX			_MSL_FILENAME_MAX	/*- cc 011024 -*/
#endif

#ifndef L_tmpnam
#define	L_tmpnam				_MSL_FILENAME_MAX	/*- cc 011024 -*/
#endif

#ifndef TMP_MAX
#define TMP_MAX					32767
#endif

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

#ifndef stdin
#define stdin  	(&__std(__files[0]))   /*- mm 961031 -*/ /*- mm 961203 -*/ /*- mm 000201 -*/
#endif

#ifndef stdout
#define stdout	(&__std(__files[0]))   /*- mm 961031 -*/ /*- mm 961203 -*/ /*- mm 000201 -*/
#endif

#ifndef stderr
#define stderr	(&__std(__files[0]))   /*- mm 961031 -*/ /*- mm 961203 -*/ /*- mm 000201 -*/
#endif


extern void set_printf(void (*f)(char));


/*-----------------------------------------------------------------*/
/* file I/O */
/* for file I/O we are using the terminal functionality and writing
   to a file. Note that this is limited to one active file only! */
   
 char TERMIO_GetChar(void);




_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#pragma warn_padding reset
#pragma options align=reset

#endif /* RC_INVOKED */

#endif /* _MSL_FILE_STRUC_TINY_IO_H */

/* Change record:
 * mm  961031 Changes for Pascal
 * mm  961203 Changed files to __files
 * mm  970708 Inserted Be changes
 * hh  971206 Changed file name from stdio.h to cstdio and added namespace support
 * hh  971230 added RC_INVOKED wrapper
 * mm  980204 added fields in file structure for wide characters.
 * rjk 980313 add DLLDATA for exporting data in dll
 * mm  980708 Corrected space allotment for the values of __file_kinds in __file_modes
 * vss 980817 Define EOF in its own file and include it here to avoid circular dep
 * mm  981007 Changes for dynamic allocation of file structures.
 * mm  990217 Deleted #include cstddef as not needed and replaced by #include <wchar_t.h>
 * mm  990806 Header file constructed by moving contents from cstdio.
 * mm  990816 Removed reference to __string_file
 * blc 990825 Fixed missing brace for extern "C" part of header
 * mm  000201 Added __std wrappers
 * cc  000326 removed dest_os to be_os 
 * cc  010409 updated defines to JWW new namespace macros 	 
 * cc  011024 made generic BUFSIZ, _MSL_FILENAME_MAX, and changed define of L_tmpnam
 * cc  011024 Moved dsp specific define to dsp prefix files
 * JWW 020906 Use generic reference constant instead of specific idle_proc in file I/O
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * JWW 031030 Added the __STDC_WANT_LIB_EXT1__ secure library extensions
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 * JWW 040405 Changed _Unbuffered_Console to _MSL_BUFFERED_CONSOLE
 * cc  060428 Integrated _AEABI_PORTABILITY_LEVEL work 
 * cc  060508 Guarded for redefinition
 */