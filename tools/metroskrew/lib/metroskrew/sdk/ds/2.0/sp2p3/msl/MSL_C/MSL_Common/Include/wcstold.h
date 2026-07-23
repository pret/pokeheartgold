/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:33 $
 * $Revision: 1.34.2.2 $
 */

#ifndef _MSL_WCSTOLD_H
#define _MSL_WCSTOLD_H

#include <ansi_parms.h>
#include <cstdio>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_EXTERN_C

	extern long double _MSL_CDECL __wcstold(int	max_width,
									__std(wint_t) (*ReadProc)(void *, __std(wint_t), int), 		/*- mm 990326 -*/ /*- hh 990507 -*/
									void * ReadProcArg,											/*- mm 990326 -*/
									int	* chars_scanned,
									int	* overflow) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C double _MSL_CDECL wcstod(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C float _MSL_CDECL wcstof(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT) _MSL_CANT_THROW;		/*- mm 021112 -*/
	_MSL_IMP_EXP_C long double _MSL_CDECL wcstold(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT) _MSL_CANT_THROW;	/*- mm 021112 -*/

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WCSTOLD_H */

/* Change record:
 * mm  970905 added include of stdio.h to allow this header to be included first.
 * hh  971206 namespace support
 * blc 980324 fixed prototype for C9X conformance
 * hh  990121 Fixed __std
 * mm  990326 Changes to prototype to allow split of string functions from file i/o
 * hh  990507 Wrapped wint_t up in __std(), 2 places
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * mm  021112 Added prototypes for wcstold and wcstof
 * cc  021119 Moved watof from the C lib to extras
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 */