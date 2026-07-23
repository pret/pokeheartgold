/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:05 $
 * $Revision: 1.9.2.4 $
 */

#ifndef _MSL_ASSERT_API_H
#define	_MSL_ASSERT_API_H

_MSL_BEGIN_EXTERN_C

#ifndef _MSL_ASSERT_DISPLAYS_FUNC
	#ifdef __MWERKS__
		#if __option(c99)
			#define _MSL_ASSERT_DISPLAYS_FUNC 1
		#else
			#define _MSL_ASSERT_DISPLAYS_FUNC 0
		#endif
	#else
		#define _MSL_ASSERT_DISPLAYS_FUNC 1
	#endif
#endif


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
 * cc  050518 Moving _MSL_ASSERT_DISPLAYS_FUNC configuration to assert_api.h
 */