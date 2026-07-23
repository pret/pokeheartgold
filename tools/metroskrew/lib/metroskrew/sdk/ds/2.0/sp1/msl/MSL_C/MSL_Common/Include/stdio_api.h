/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:05 $
 * $Revision: 1.21.2.2 $
 */

#ifndef _MSL_STDIO_API_H
#define _MSL_STDIO_API_H

#include <size_t.h>
#include <null.h>
#include <eof.h>
#include <va_list.h>

#if _MSL_WIDE_CHAR
	#include <wchar_t.h>
#endif /* _MSL_WIDE_CHAR */

#include <file_struc.h>

#pragma options align=native

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

_MSL_IMP_EXP_C size_t _MSL_CDECL	__fread(void *, size_t, size_t, FILE *) _MSL_CANT_THROW;					 			/*- mm 001018 -*/
_MSL_IMP_EXP_C size_t _MSL_CDECL	__fwrite(const void *, size_t, size_t, FILE *) _MSL_CANT_THROW; 						/*- mm 001018 -*/
_MSL_IMP_EXP_C fpos_t _MSL_CDECL   	_ftell(FILE * _MSL_RESTRICT) _MSL_CANT_THROW;                    										/*- mm 970708 -*/
_MSL_IMP_EXP_C int _MSL_CDECL     	_fseek(FILE *, fpos_t, int) _MSL_CANT_THROW;     										/*- mm 970708 -*/
_MSL_IMP_EXP_C int _MSL_CDECL		__get_char(FILE *) _MSL_CANT_THROW; 													/*- mf 990715 -*/
_MSL_IMP_EXP_C int _MSL_CDECL		__put_char(int, FILE *) _MSL_CANT_THROW; 											/*- mf 990715 -*/
_MSL_IMP_EXP_C int _MSL_CDECL		__fwide(FILE *, int) _MSL_CANT_THROW;

int _MSL_CDECL __ungetc(int, FILE *) _MSL_CANT_THROW;

#if _MSL_WIDE_CHAR
	wchar_t _MSL_CDECL __getwc(FILE *) _MSL_CANT_THROW;				/*- mm 040505 -*/
	wchar_t _MSL_CDECL __fgetwc(FILE *) _MSL_CANT_THROW;			/*- mm 040504 -*/
	wchar_t _MSL_CDECL __getwchar(void) _MSL_CANT_THROW;			/*- mm 040505 -*/
	wchar_t _MSL_CDECL __ungetwc(wchar_t, FILE *) _MSL_CANT_THROW;	/*- mm 040505 -*/
#endif /* _MSL_WIDE_CHAR */

#if _MSL_WIDE_CHAR
	#define __getc(_file) \
		((__fwide(_file, -1) >= 0) ? EOF : (_file)->buffer_len-- ? (int)  *(_file)->buffer_ptr++ : __std(__get_char)(_file))
	#define __putc(_c, _file) \
		((__fwide(_file, -1) >= 0) ? EOF : (_file)->buffer_len-- ? (int) (*(_file)->buffer_ptr++ = (unsigned char)(_c)) : __std(__put_char)(_c, _file))
#else
	#define __getc(_file) \
		((_file)->buffer_len-- ? (int)  *(_file)->buffer_ptr++ : __std(__get_char)(_file))
	#define __putc(_c, _file) \
		((_file)->buffer_len-- ? (int) (*(_file)->buffer_ptr++ = (unsigned char)(_c)) : __std(__put_char)(_c, _file))
#endif /* _MSL_WIDE_CHAR && _MSL_C99 */

typedef struct
{
	char * CharStr;
	size_t MaxCharCount;
	size_t CharsWritten;
} __OutStrCtrl;

typedef struct													
{
	char * NextChar;
	int    NullCharDetected;
} __InStrCtrl;

void * _MSL_CDECL __FileWrite(void *, const char *, size_t) _MSL_CANT_THROW;	/*- cc 020108 -*/			
void * _MSL_CDECL __StringWrite(void *, const char *, size_t) _MSL_CANT_THROW;  /*- cc 020108 -*/
int    _MSL_CDECL __FileRead(void *, int, int) _MSL_CANT_THROW;					/*- cc 020109 -*/
int    _MSL_CDECL __StringRead(void *, int, int) _MSL_CANT_THROW;				/*- cc 020109 -*/	

enum __ReadProcActions
{
	__GetAChar,
	__UngetAChar,
	__TestForError
};

#if _MSL_WIDE_CHAR				
typedef struct
{
	wchar_t * wCharStr;
	size_t MaxCharCount;
	size_t CharsWritten;
} __wOutStrCtrl;

typedef struct
{
	wchar_t * wNextChar;
	int    wNullCharDetected;
} __wInStrCtrl;

enum __WReadProcActions
{
	__GetAwChar,
	__UngetAwChar,
	__TestForwcsError
};	

void * _MSL_CDECL __wFileWrite(void *, const wchar_t *, size_t) _MSL_CANT_THROW; /*- cc 020108 -*/
void * _MSL_CDECL __wStringWrite(void *, const wchar_t *, size_t) _MSL_CANT_THROW; /*- cc 020108 -*/

#if _MSL_C99
	wint_t __wFileRead(void *, wint_t, int) _MSL_CANT_THROW;
#endif /* _MSL_C99 */
	wint_t __wStringRead(void *, wint_t, int) _MSL_CANT_THROW;
#endif /* _MSL_WIDE_CHAR */

#if _MSL_OS_DISK_FILE_SUPPORT
	_MSL_IMP_EXP_C FILE * _MSL_CDECL __handle_open(__file_handle handle, const char * mode) _MSL_CANT_THROW;
	FILE * _MSL_CDECL __handle_reopen(__file_handle handle, const char * mode, FILE *) _MSL_CANT_THROW;
#endif /* _MSL_OS_DISK_FILE_SUPPORT */

void   _MSL_CDECL __set_ref_con(FILE *, __ref_con ref_con) _MSL_CANT_THROW;
void   _MSL_CDECL __set_idle_proc(FILE *, __idle_proc idle_proc) _MSL_CANT_THROW;

#if _MSL_WFILEIO_AVAILABLE
	_MSL_IMP_EXP_C FILE * _MSL_CDECL __whandle_open(__file_handle handle, const wchar_t * mode) _MSL_CANT_THROW;
	FILE * _MSL_CDECL __whandle_reopen(__file_handle handle, const wchar_t * mode, FILE *) _MSL_CANT_THROW;
#endif /* _MSL_WFILEIO_AVAILABLE */

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#pragma options align=reset

#endif /* _MSL_STDIO_API_H */

/* Change record:
 * cc  010928 Moved APIs 
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020906 Use generic reference constant instead of specific idle_proc in file I/O
 * JWW 021010 Added wchar_t file I/O routines controlled by _MSL_WFILEIO_AVAILABLE
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * mm  030710 Added C99 wrappers
 * mm  040504 Added __fgetwc to avoid nested critical regions
 * mm  040505 Added __getwc and __getwchar to avoid nested critical regions
 */