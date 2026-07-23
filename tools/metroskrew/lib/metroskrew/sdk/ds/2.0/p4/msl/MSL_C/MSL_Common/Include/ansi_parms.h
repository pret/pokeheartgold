/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:04 $
 * $Revision: 1.109.2.3 $
 */

#ifndef _MSL_ANSI_PARMS_H
#define _MSL_ANSI_PARMS_H

#include <msl_c_version.h>

#include <mslGlobals.h>

#if defined(_No_Console) && !defined(_MSL_CONSOLE_SUPPORT)
#define _MSL_CONSOLE_SUPPORT 0
#endif

#ifndef _MSL_CONSOLE_SUPPORT
#define _MSL_CONSOLE_SUPPORT 1
#endif

#if defined(_Unbuffered_Console) && !defined(_MSL_BUFFERED_CONSOLE)
#define _MSL_BUFFERED_CONSOLE 0
#endif

#ifndef _MSL_BUFFERED_CONSOLE
#define _MSL_BUFFERED_CONSOLE 1
#endif

#ifndef _MSL_CONSOLE_FILE_IS_DISK_FILE
#define _MSL_CONSOLE_FILE_IS_DISK_FILE 0
#endif

#ifndef _MSL_FILE_CONSOLE_ROUTINES
#define _MSL_FILE_CONSOLE_ROUTINES 0
#endif

#ifndef _MSL_NULL_CONSOLE_ROUTINES
	#if _MSL_CONSOLE_SUPPORT
		#define _MSL_NULL_CONSOLE_ROUTINES 0
	#else
		#define _MSL_NULL_CONSOLE_ROUTINES 1
	#endif
#endif

#if defined(_No_Disk_File_OS_Support) && !defined(_MSL_OS_DISK_FILE_SUPPORT)
#define _MSL_OS_DISK_FILE_SUPPORT 0
#endif

#ifndef _MSL_OS_DISK_FILE_SUPPORT
#define _MSL_OS_DISK_FILE_SUPPORT 1
#endif

#if defined(_No_Alloc_OS_Support) && !defined(_MSL_OS_ALLOC_SUPPORT)
#define _MSL_OS_ALLOC_SUPPORT 0
#endif

#ifndef _MSL_OS_ALLOC_SUPPORT
#define _MSL_OS_ALLOC_SUPPORT 1
#endif

#if !_MSL_OS_ALLOC_SUPPORT && defined(_MSL_OS_DIRECT_MALLOC)
#error Defining _MSL_OS_DIRECT_MALLOC requires _MSL_OS_ALLOC_SUPPORT
#endif

#if defined(_No_Time_OS_Support) && !defined(_MSL_OS_TIME_SUPPORT)
#define _MSL_OS_TIME_SUPPORT 0
#endif

#ifndef _MSL_OS_TIME_SUPPORT
#define _MSL_OS_TIME_SUPPORT 1
#endif

#ifndef	_MSL_CLOCK_T_AVAILABLE
#define _MSL_CLOCK_T_AVAILABLE 1
#endif

#ifndef _MSL_TIME_T_AVAILABLE
#define _MSL_TIME_T_AVAILABLE 1
#endif

#ifndef _MSL_TM_STRUCT_AVAILABLE
#define _MSL_TM_STRUCT_AVAILABLE 1
#endif

#ifndef _MSL_TIME_T_IS_LOCALTIME
#define _MSL_TIME_T_IS_LOCALTIME 1
#endif

#if _MSL_OS_TIME_SUPPORT && ((!_MSL_CLOCK_T_AVAILABLE)  || (!_MSL_TIME_T_AVAILABLE))
#error _MSL_CLOCK_T_AVAILABLE and _MSL_TIME_T_AVAILABLE must match _MSL_OS_TIME_SUPPORT
#endif

#ifndef _MSL_THREADSAFE
#define _MSL_THREADSAFE 0
#endif

#ifndef _MSL_PTHREADS
#define _MSL_PTHREADS 0
#endif

#if _MSL_PTHREADS && !_MSL_THREADSAFE
#error _MSL_PTHREADS and _MSL_THREADSAFE must match
#endif

#ifndef _MSL_LONGLONG
#define _MSL_LONGLONG 1
#endif

#if defined(_No_Floating_Point) && !defined(_MSL_FLOATING_POINT)
#define _MSL_FLOATING_POINT 0
#endif

#ifndef _MSL_FLOATING_POINT
#define _MSL_FLOATING_POINT 1
#endif

#ifndef _MSL_WIDE_CHAR
#define _MSL_WIDE_CHAR 0
#endif

#ifndef _MSL_USES_SUN_MATH_LIB
#define _MSL_USES_SUN_MATH_LIB 0
#endif

#ifndef _MSL_C99
#define _MSL_C99 1
#endif

#ifndef _MSL_C_HAS_CPP_EXTENSIONS
#ifdef __cplusplus
#define _MSL_C_HAS_CPP_EXTENSIONS 1
#else
#define _MSL_C_HAS_CPP_EXTENSIONS 0
#endif
#endif

#ifndef _MSL_POSIX
#define _MSL_POSIX 0
#endif

#ifndef _MSL_NEEDS_EXTRAS
#define _MSL_NEEDS_EXTRAS 0
#endif

#ifndef _MSL_STRERROR_KNOWS_ERROR_NAMES
#define _MSL_STRERROR_KNOWS_ERROR_NAMES 1
#endif

#ifndef _MSL_C_LOCALE_ONLY
#define _MSL_C_LOCALE_ONLY 0
#endif

#ifndef _MSL_FLOATING_POINT_IO
#define _MSL_FLOATING_POINT_IO 1
#endif

#ifndef _MSL_USES_EXIT_PROCESS
#define _MSL_USES_EXIT_PROCESS 0
#endif

#ifndef _MSL_USING_MW_C_HEADERS
#define _MSL_USING_MW_C_HEADERS 1
#endif

#ifndef _MSL_PUT_THIRD_PARTY_C_IN_STD
#define _MSL_PUT_THIRD_PARTY_C_IN_STD 0
#endif

#ifndef _MSL_IMP_EXP
#define _MSL_IMP_EXP
#endif

#ifndef _MSL_IMP_EXP_C
#define _MSL_IMP_EXP_C _MSL_IMP_EXP
#endif

#ifndef _MSL_IMP_EXP_SIOUX
#define _MSL_IMP_EXP_SIOUX _MSL_IMP_EXP
#endif

#ifndef _MSL_IMP_EXP_RUNTIME
#define _MSL_IMP_EXP_RUNTIME _MSL_IMP_EXP
#endif

#ifndef _MSL_MALLOC_IS_ALTIVEC_ALIGNED
#define _MSL_MALLOC_IS_ALTIVEC_ALIGNED 0
#endif

#ifndef _MSL_WFILEIO_AVAILABLE
#define _MSL_WFILEIO_AVAILABLE 0
#endif

#ifndef _MSL_FLOAT_HEX
	#if _MSL_C99
		#define _MSL_FLOAT_HEX 1
	#else 	
		#define _MSL_FLOAT_HEX 0
	#endif
#endif

#ifndef _MSL_CDECL
#define _MSL_CDECL
#endif	

#ifndef _MSL_MATH_CDECL
#define _MSL_MATH_CDECL
#endif

#ifndef _MSL_INLINE
#define _MSL_INLINE __inline
#endif

#ifndef _MSL_DO_NOT_INLINE
#define _MSL_DO_NOT_INLINE __declspec(weak)
#endif

#ifndef _MSL_LOCALDATA
#define _MSL_LOCALDATA(_a) _a
#endif

#ifndef _MSL_LOCALDATA_AVAILABLE
#define _MSL_LOCALDATA_AVAILABLE 1
#endif

#ifndef _MSL_RESTRICT
	#if defined(__MWERKS__)
		#if __option(c99)
			#define _MSL_RESTRICT restrict
		#else
			#define _MSL_RESTRICT
		#endif
	#else
		#define _MSL_RESTRICT
	#endif
#endif	

/* JWW 010918 added the _MSL_MATH_ERHANDLING macro
   This macro is set to MATH_ERRNO (the value 1) by default.  If a particular platform
   has different math requirements, it should set _MSL_MATH_ERRHANDLING to the appropriate
   value in the platform prefix file.  C99 requires that MATH_ERRHANDLING (and thus
   _MSL_MATH_ERRHANDLING) be a value of MATH_ERRNO (1), MATH_ERREXCEPT (2), or
   MATH_ERRNO | MATH_ERREXCEPT (3).  No other values are valid.
*/

#ifndef _MSL_MATH_ERRHANDLING
#define _MSL_MATH_ERRHANDLING 1		/* Define to MATH_ERRNO by default */
#endif

#ifndef _MSL_LITTLE_ENDIAN								/* PMK 020904 */
	#if defined(__MWERKS__)								/* EJS 020924: guard __option */
		#if __option(little_endian)
			#define _MSL_LITTLE_ENDIAN 1
		#else
			#define _MSL_LITTLE_ENDIAN 0
		#endif
	#else
		#define _MSL_LITTLE_ENDIAN 0
	#endif
#endif

#ifdef __cplusplus
	#define _MSL_BEGIN_EXTERN_C extern "C" {
	#define _MSL_END_EXTERN_C }
	
	#ifdef _MSL_USING_NAMESPACE
		#define _MSL_BEGIN_NAMESPACE_STD namespace std {
		#define _MSL_END_NAMESPACE_STD }
		
		#define __std(ref) ::std::ref
		#define __global() ::
	#else
		#define _MSL_BEGIN_NAMESPACE_STD
		#define _MSL_END_NAMESPACE_STD
		
		#define __std(ref) ref
		#define __global()
	#endif
#else
	#define _MSL_BEGIN_EXTERN_C
	#define _MSL_END_EXTERN_C
	
	#define _MSL_BEGIN_NAMESPACE_STD
	#define _MSL_END_NAMESPACE_STD
	
	#define __std(ref) ref
	#define __global()
#endif

/*
	Set up no throw specifications for C headers when compiled under C++
*/
#if !defined(_MSL_NO_THROW_SPECS)
	#ifndef _MSL_NO_THROW
		#if defined(__cplusplus)
			#define _MSL_NO_THROW throw()
		#else
			#define _MSL_NO_THROW
		#endif
	#endif
	#ifndef _MSL_CANT_THROW
		#define _MSL_CANT_THROW __attribute__((nothrow))
	#endif
#else
	#ifndef _MSL_NO_THROW
		#define _MSL_NO_THROW
	#endif
	#ifndef _MSL_CANT_THROW
		#define _MSL_CANT_THROW
	#endif
#endif

#ifndef _MSL_ATTRIBUTE_CONST
	#define _MSL_ATTRIBUTE_CONST __attribute__((const))
#endif

#if !defined(_MSL_USE_INLINE) && !defined(RC_INVOKED) && defined(__MWERKS__)
	#if !__option(dont_inline)
		#define _MSL_USE_INLINE 1
	#endif
#endif

#ifndef __has_intrinsic
	#define __has_intrinsic(_a) 0
#endif

#endif /* ndef _MSL_ANSI_PARMS_H */

/* Change record:
 * MEA 972306 Added __dest_os __ppc_eabi_bare.  New symbol __no_os
 *			  is only defined for bare board embedded systems.
 *			  Do not define long long yet for PPC EABI.
 * SCM 971507 Added __nec_eabi_bare and __nec_eabi_os.
 * MEA 972007 Changed __ppc_eabi_bare to __ppc_eabi.
 * MEA 971109 Added support for long long.
 * vss 971015 New version 2.2
 * hh  971206 reworked macro magic for namespace support
 * hh  971206 Added "define OS" code
 * hh  980120 added <mslGlobals.h>
 * hh  980217 added __ANSI_OVERLOAD__
 * rjk 909313 ADDED _MSL_IMP_EXP macro
 * ah  010121 hawk dsp housekeeping
 * cc  010125 added _MSL_CDECL
 * ah  010131 removed hawk dsp housekeeping -- back to _Old_DSP_IO_Interface
 * cc  010409 updated defines to JWW new namespace macros
 * JWW 010912 Use new msl_c_version.h file for tracking the MSL version number
 * JWW 010918 Added definitions for C99 math error handling macros
 * JWW 010926 Changed _POSIX to _MSL_POSIX to control what happens with POSIX functions in ANSI headers
 * cc  011022 Added _MSL_NO_FLOAT_HEX, _MSL_USES_EXIT_PROCESS, _MSL_NEEDS_EXTRAS
 * JWW 011027 New _MSL_USING_MW_C_HEADERS define to control if the MSL C headers are used or not
 * cc  011115 Added new flags _MSL_USE_INLINE & _MSL_INLINE
 * JWW 011126 Added _MSL_MALLOC_IS_ALTIVEC_ALIGNED to know if malloc returns AltiVec aligned memory
 * cc  011128 Added _MSL_TLS macro and made _MSL_CDECL follow ifndef layout to remove dest os
 * cc  011219 Added C++ check to msl use inline
 * JWW 020308 New _MSL_DO_NOT_INLINE macro for defining how to place functions in the library
 * JWW 020404 New _MSL_ASSERT_DISPLAYS_FUNC macro for defining if assert() displays __func__
 * PMK 020904 Added _MSL_LITTLE_ENDIAN flag, used this flag in _strtold() function
 * JWW 020501 Moved _MSL_ASSERT_DISPLAYS_FUNC definition to cassert so it can be redefined easier
 * cc  020531 Removed the obsolete __tls macro and the comment that it was to be removed in Pro 9
 * JWW 020604 Added _MSL_LOCALDATA macro definition to make multithread code easier to read
 * JWW 020701 Always use compiler inlining option to define _MSL_USE_INLINE, don't special case C++
 * JWW 020917 Added _MSL_RESTRICT to get the restrict type specifier for certain C99 functions
 * ejs 020924 Fix _MSL_LITTLE_ENDIAN setting
 * cc  021001 Added support for _MSL_C_LOCALE_ONLY & _MSL_STRERROR_KNOWS_ERROR_NAMES
 * JWW 021010 Added wchar_t file I/O routines controlled by _MSL_WFILEIO_AVAILABLE
 * mm  030218 Changed _MSL_C9X_ to _MSL_C99 in wrapper name
 * JWW 030224 Generate an error when the _MSL_C99 flag and the compiler C99 setting is incompatible
 * JWW 030224 Changed __MSL_LONGLONG_SUPPORT__ flag into the new more configurable _MSL_LONGLONG
 * JWW 030224 Changed __NO_WIDE_CHAR flag into the new more configurable _MSL_WIDE_CHAR
 * JWW 030321 Added __has_intrinsic macro to determine the most efficient way to perform operations
 * ejs 030613 Remove __has_intrinsic overrides now that compiler supports them
 * cc  030808 Changed _MSL_NO_FLOAT_HEX to _MSL_FLOAT_HEX and turned it on
 * cc  031201 Added _MSL_PTHREADS flag
 * cc  040204 The _No_Time_OS_Support flag has been deprecated and replaced with _MSL_OS_TIME_SUPPORT
 * cc  040217 The _No_Floating_Point flag has been deprecated and replaced with _MSL_FLOATING_POINT
 * cc  040217 Changed _No_Disk_File_OS_Support to _MSL_OS_DISK_FILE_SUPPORT
 * JWW 040401 Changed _No_Alloc_OS_Support to _MSL_OS_ALLOC_SUPPORT
 * JWW 040405 Changed _Unbuffered_Console to _MSL_BUFFERED_CONSOLE
 * cc  010811 Removed need to turn on _MSL_C_LOCALE_ONLY when _MSL_C99 is off
 * JWW 050128 When using MSL C++ on top of a third party C (non-MSL), put C items into std namespace
 * cc  050518 Removed _MSL_ASSERT_DISPLAYS_FUNC flag since cassert does the configuring
 */