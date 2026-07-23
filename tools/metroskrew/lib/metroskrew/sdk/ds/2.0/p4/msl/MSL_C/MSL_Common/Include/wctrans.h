/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:34 $
 * $Revision: 1.34.2.2 $
 */

#ifndef _MSL_WCTRANS_H
#define _MSL_WCTRANS_H

#include <ansi_parms.h>

#if _MSL_WIDE_CHAR

#include <wchar_t.h>

#ifdef __MWERKS__
	#if __MWERKS__ >= 0x3200
		#pragma implements_std_header("wctype.h")
	#endif /* __MWERKS__ >= 0x3200 */
#endif /* __MWERKS__ */

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

	typedef wchar_t wctrans_t;
	
	_MSL_IMP_EXP_C    wint_t _MSL_CDECL	towctrans(wint_t , wctrans_t ) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C wctrans_t _MSL_CDECL	wctrans(const char *) _MSL_CANT_THROW;

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif /* _MSL_WIDE_CHAR */

#endif /* _MSL_WCTRANS_H */

/* Change record:
 * mm  970905 added include of ansi_parms.h to avoid need for prefix file
 * mm  990807 Deleted some superfluous includes
 * cc  010405 removed pragma options align native and reset
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010618 Use cname headers exclusively to prevent namespace pollution in C++
 * cc  011203 Added _MSL_CDECL for new name mangling 
 * hh  020603 Added no throw spec to functions
 * hh  020606 Includes wchar_t.h instead of cwchar
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * ejs 030523 Added #pragma implements_std_header("wchar.h")
 * ejs 030601 It's wctype.h, not wchar.h
 */