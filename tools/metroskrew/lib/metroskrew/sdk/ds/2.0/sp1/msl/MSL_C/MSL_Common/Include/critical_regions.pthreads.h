/* MSL
 * Copyright © 1995-2006 Freescale Corporation.  All rights reserved.
 *
 * $Date: 2006/02/08 20:32:27 $
 * $Revision: 1.6.2.2 $
 */

/*
 *	Routines
 *	--------
 *		__init_critical_regions
 *		__kill_critical_regions
 *		__begin_critical_region
 *		__end_critical_region
 */

#ifndef _MSL_CRITICAL_REGIONS_PTHREADS_H
#define _MSL_CRITICAL_REGIONS_PTHREADS_H

#include <msl_thread_local_data.h>
#include <pthread.h>

_MSL_BEGIN_EXTERN_C

	_MSL_IMP_EXP_C extern pthread_mutex_t __cs[num_critical_regions];
	
	_MSL_INLINE void __init_critical_regions(void) _MSL_CANT_THROW
	{
		int i;
		
		for (i = 0; i < num_critical_regions; i++)
			pthread_mutex_init(&__cs[i], 0);
		
#if _MSL_LOCALDATA_AVAILABLE
		__msl_InitializeMainThreadData();
#endif /* _MSL_LOCALDATA_AVAILABLE */
	}
	
	_MSL_INLINE void __kill_critical_regions(void) _MSL_CANT_THROW
	{
		int i;
		
#if _MSL_LOCALDATA_AVAILABLE
		__msl_DisposeAllThreadData();
#endif /* _MSL_LOCALDATA_AVAILABLE */
		
		for (i = 0; i < num_critical_regions; i++)
			pthread_mutex_destroy(&__cs[i]);
	}
	
	_MSL_INLINE void __begin_critical_region(int region) _MSL_CANT_THROW
	{
		pthread_mutex_lock(&__cs[region]);
	}
	
	_MSL_INLINE void __end_critical_region(int region) _MSL_CANT_THROW
	{
		pthread_mutex_unlock(&__cs[region]);
	}

_MSL_END_EXTERN_C

#endif /* _MSL_CRITICAL_REGIONS_PTHREADS_H */

/* Change record:
 * cc  010410 Set up for _MSL_PTHREADS flag
 */