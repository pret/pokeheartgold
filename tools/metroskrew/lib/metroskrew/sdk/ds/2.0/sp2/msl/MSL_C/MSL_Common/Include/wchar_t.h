/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:33 $
 * $Revision: 1.32.2.2 $
 */

#ifndef _MSL_WCHAR_T_H
#define _MSL_WCHAR_T_H

#include <ansi_parms.h>

#ifndef _MSL_WCHAR_T_TYPE
	#define _MSL_WCHAR_T_TYPE unsigned short
#endif

#ifndef _MSL_WCHAR_MIN
	#define _MSL_WCHAR_MIN 0
#endif

#ifndef _MSL_WCHAR_MAX
	#define _MSL_WCHAR_MAX 0xffffU					/*- mm 010607 -*/
#endif

#ifdef __MWERKS__
	#if (!defined(__cplusplus)|| !__option(wchar_type))
		#ifdef __cplusplus
			extern "C" {
		#endif
		
		typedef _MSL_WCHAR_T_TYPE wchar_t;
		
		#ifdef __cplusplus
			}
		#endif
	#endif /* (!defined(__cplusplus)|| !__option(wchar_type)) */
#endif /* __MWERKS__ */

#ifdef __cplusplus      
	#ifdef _MSL_USING_NAMESPACE
		namespace std {
	#endif
	extern "C" {
#endif

#ifndef WCHAR_MIN
	#define WCHAR_MIN _MSL_WCHAR_MIN
#endif

#ifndef WCHAR_MAX
	#define WCHAR_MAX _MSL_WCHAR_MAX
#endif


typedef wchar_t wint_t;		/*- mm 990809 -*/
typedef wchar_t wctype_t;	/*- mm 990809 -*/
typedef int 	mbstate_t;  /*- mm 990809 -*/
typedef wchar_t Wint_t;     /*- mm 990809 -*/

#if __dest_os == __win32_os
	#define _WCTYPE_T_DEFINED	/*- ejs 030721 -*/
#endif

#ifdef __cplusplus       
	}
	#ifdef _MSL_USING_NAMESPACE
		}
	#endif
#endif

#endif /* _MSL_WCHAR_T_H */

/* Change record:
 * mm  990217 Recreated to avoid standard headers having to include cstddef
 *            to get the typedef for wchar_t
 * mm  990809 Added definitions
 * hh  000609 Put wchar_t in global namespace
 * mm  010302 Changed definition of WCHAR_MAX
 * mm  010607 Repeat of my 010302 change that somehow vanished.
 * JWW 010817 extern "C" for wchar_t somehow disappeared...  I put it back.
 * JWW 011027 Use generic types for defining wchar_t
 * cc  011217 Made ifndef _MSL_XXX
 * JWW 020114 Don't redefine WCHAR_MIN or WCHAR_MAX if they've already been defined elsewhere
 * JWW 020627 Use _MSL_WCHAR_MIN macro to help the WCHAR_MIN definition
 * mm  030710 Added C99 wrappers
 * ejs 030721 Add macro #define for Win32 <tchar.h>
 */