/* MSL
 * Copyright © 1995-2007 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2007/01/29 18:12:19 $
 * $Revision: 1.11 $
 */

#ifndef _MSL_THREAD_LOCAL_DATA_H
#define _MSL_THREAD_LOCAL_DATA_H

#include <ansi_parms.h>

#if _MSL_THREADSAFE && _MSL_LOCALDATA_AVAILABLE
	#if _MSL_PTHREADS
		#include <thread_local_data_pthreads.h>
	#elif (__dest_os == __win32_os) || (__dest_os == __wince_os)
		#include <ThreadLocalData.h>
	#elif (__dest_os == __starcore_bare)
		#include <thread_local_data_StarCore.h>		
	#endif
#endif /* _MSL_THREADSAFE */

#endif /* _MSL_THREAD_LOCAL_DATA_H */

/* Change record:
 * JWW 021031 Created new "spooooky" file for handling platform independent thread local data
 * cc  031201 Added _MSL_PTHREADS flag
 */