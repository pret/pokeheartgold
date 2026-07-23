/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:03:07 $
 * $Revision: 1.26.4.1 $
 */

#ifndef _MSL_WCHAR_IO_H
#define _MSL_WCHAR_IO_H

#include <ansi_parms.h>
#include <file_struc.h>
#include <wchar_t.h>

#if __MWERKS__>=0x3200
#pragma implements_std_header("wchar.h")
#endif

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	wchar_t _MSL_CDECL __put_wchar(wchar_t , FILE *  ) _MSL_CANT_THROW; 					/*- mf 990715 -*/
	wchar_t _MSL_CDECL __get_wchar(FILE *  ) _MSL_CANT_THROW;  								/*- mf 990715 -*/
	
	_MSL_IMP_EXP_C wchar_t _MSL_CDECL (getwchar)(void) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wchar_t _MSL_CDECL ungetwc(wchar_t , FILE *  ) _MSL_CANT_THROW;  		/*- mf 990715 -*/

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* ifndef _MSL_WCHAR_IO_H */

/* Change record:
 * JCM 980121 First code release.
 * mf  990715 Remove arg names in prototypes
 * mm  990806 Replaced includes of cstdio and cstddef by include of file_struc.h
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated to JWW new namespace macros 	
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 */