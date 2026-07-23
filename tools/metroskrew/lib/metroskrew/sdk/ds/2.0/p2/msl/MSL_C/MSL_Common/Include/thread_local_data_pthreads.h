/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:34:20 $
 * $Revision: 1.5.2.2 $
 */

#ifndef _MSL_THREAD_LOCAL_DATA_PTHREADS_H
#define _MSL_THREAD_LOCAL_DATA_PTHREADS_H

#include <ansi_parms.h>
#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <clocale>
#include <locale_api.h>

#pragma options align=native

_MSL_BEGIN_EXTERN_C

	typedef struct _ThreadLocalData 
	{
		struct 					_ThreadLocalData *next;
		int 					_errno;
		unsigned long int 		random_next;
		unsigned char *			strtok_n;
		unsigned char *			strtok_s;
		#if _MSL_OS_TIME_SUPPORT	
		struct __std(tm) 		gmtime_tm;
		struct __std(tm)    	localtime_tm;
		#endif
		char 					asctime_result[26];
		char					temp_name[L_tmpnam];
		char *					locale_name;
		struct __locale         _current_locale;
		#if !_MSL_C_LOCALE_ONLY
		struct __std(lconv)		__lconv;
		#endif
		#if ((__dest_os == __mac_os) || (__dest_os == __mac_os_x))
		short					MacOSErrNo;
		#endif
		
#if _MSL_WFILEIO_AVAILABLE
		wchar_t					wtemp_name[L_tmpnam];
#endif
	} _ThreadLocalData;
	
	_MSL_IMP_EXP_C int _MSL_CDECL __msl_InitializeMainThreadData(void) _MSL_CANT_THROW;
	_MSL_IMP_EXP_C void _MSL_CDECL __msl_DisposeAllThreadData(void) _MSL_CANT_THROW;
	
	_MSL_IMP_EXP_C _ThreadLocalData * _MSL_CDECL __msl_GetThreadLocalData(void) _MSL_CANT_THROW;

_MSL_END_EXTERN_C

#pragma options align=reset

#endif /* _MSL_THREAD_LOCAL_DATA_PTHREADS_H */

/* Change record:
 * cc  021201 New file to work with _MSL_PTHREADS flag
 */