/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:02:45 $
 * $Revision: 1.6.4.1 $
 */

#ifndef _MSL_ASSERT_API_H
#define	_MSL_ASSERT_API_H

#include <ansi_parms.h>

_MSL_BEGIN_EXTERN_C

#if (__dest_os == __win32_os || __dest_os == __wince_os)
	_MSL_IMP_EXP_C void _MSL_CDECL __msl_wchar_assertion_failed(wchar_t const *, char const *, char const *, int) _MSL_CANT_THROW;
#endif
	
	_MSL_IMP_EXP_C void _MSL_CDECL __msl_assertion_failed(char const *, char const *, char const *, int) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#endif /* _MSL_ASSERT_API_H */

/* Change record:
 * JWW 010905 New file to define the MSL API for the assertion implementation
 * cc  011203 Added _MSL_CDECL for new name mangling
 * hh  020603 Added no throw spec to functions
 * JWW 021218 Improve the check for Windows-specific UNICODE define
 */