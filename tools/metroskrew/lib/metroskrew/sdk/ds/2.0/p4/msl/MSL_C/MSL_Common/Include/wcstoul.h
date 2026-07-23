/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.34.2.2 $
 */

#ifndef _MSL_WCSTOUL_H
#define _MSL_WCSTOUL_H

#include <ansi_parms.h>

#if _MSL_WIDE_CHAR

#include <wchar_t.h>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wchar.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C  int _MSL_CDECL		watoi(const wchar_t * ) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C long _MSL_CDECL		watol(const wchar_t * ) _MSL_CANT_THROW;
	
    extern unsigned long _MSL_CDECL		__wcstoul(	int	base, 
										int		max_width,
										__std(wint_t) (*ReadProc)(void *, __std(wint_t), int), 			/*- mm 990326 -*/ /*- hh 990507 -*/
										void * ReadProcArg,												/*- mm 990326 -*/
										int	* chars_scanned,
										int	* negative,
										int	* overflow) _MSL_CANT_THROW;
	
#if _MSL_LONGLONG              														/*- mm 970110 -*/
	extern unsigned long long _MSL_CDECL __wcstoull(	int	base, 
										 int		max_width,
										 __std(wint_t) (*ReadProc)(void *, __std(wint_t), int), 	/*- mm 990326 -*/ /*- hh 990507 -*/
										 void * ReadProcArg,										/*- mm 990326 -*/
										 int	* chars_scanned,
										 int	* negative,
										 int	* overflow) _MSL_CANT_THROW;
#endif /*_MSL_LONGLONG*/        													/*- mm 970110 -*/

_MSL_END_EXTERN_C

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C unsigned long _MSL_CDECL				wcstoul(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT, int) _MSL_CANT_THROW;
	#if _MSL_C99
	#if _MSL_LONGLONG
		_MSL_IMP_EXP_C unsigned long long _MSL_CDECL	wcstoull(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT, int) _MSL_CANT_THROW;
		_MSL_IMP_EXP_C long long _MSL_CDECL 			wcstoll(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT, int) _MSL_CANT_THROW;
	#endif /* _MSL_LONGLONG */
	#endif /* _MSL_C99 */
	_MSL_IMP_EXP_C long _MSL_CDECL						wcstol(const wchar_t * _MSL_RESTRICT, wchar_t ** _MSL_RESTRICT, int) _MSL_CANT_THROW;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WIDE_CHAR  */
#endif /* _MSL_WCSTOUL_H */

/* Change record:
 * mm  970110 Changed wrappers for long long support
 * hh  971206 namespace support added
 * blc 980324 fixed prototypes for C9X conformance
 * mm  981023 added wrappers round long long support
 * hh  990121 Fixed __std 2 places
 * mm  990326 Prototype changes to allow splitting of string functions from file i/o
 * hh  990507 Wrapped wint_t up in __std(), 4 places
 * cc  000511 moved watoi & watol out of namespace 
 * hh  000518 included wchar_t.h
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros 		  
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 */