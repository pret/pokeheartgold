/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:33:45 $
 * $Revision: 1.8.2.2 $
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