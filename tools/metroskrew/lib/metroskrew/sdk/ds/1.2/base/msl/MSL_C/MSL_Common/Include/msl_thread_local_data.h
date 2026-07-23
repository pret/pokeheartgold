/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/04/05 20:00:19 $
 * $Revision: 1.3.4.5 $
 */

#ifndef _MSL_THREAD_LOCAL_DATA_H
#define _MSL_THREAD_LOCAL_DATA_H

#include <ansi_parms.h>

#if _MSL_THREADSAFE && _MSL_LOCALDATA_AVAILABLE
	#if _MSL_PTHREADS
		#include <thread_local_data_pthreads.h>
	#elif (__dest_os == __win32_os) || (__dest_os == __wince_os)
		#include <ThreadLocalData.h>
	#endif
#endif /* _MSL_THREADSAFE */

#endif /* _MSL_THREAD_LOCAL_DATA_H */

/* Change record:
 * JWW 021031 Created new "spooooky" file for handling platform independent thread local data
 * cc  031201 Added _MSL_PTHREADS flag
 */