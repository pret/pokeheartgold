/* Metrowerks Standard Library
 * Copyright © 1995-2004 Metrowerks Corporation.  All rights reserved.
 *
 * $Date: 2004/01/26 22:02:50 $
 * $Revision: 1.1.2.2 $
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
	extern pthread_t __cs_id[num_critical_regions];
	extern int __cs_ref[num_critical_regions];
	
	_MSL_INLINE void __init_critical_regions(void) _MSL_CANT_THROW
	{
		int i;
		
		for (i = 0; i < num_critical_regions; i++)
			pthread_mutex_init(&__cs[i], 0);
		
		__msl_InitializeMainThreadData();
	}
	
	_MSL_INLINE void __kill_critical_regions(void) _MSL_CANT_THROW
	{
		int i;
		
		__msl_DisposeAllThreadData();
		
		for (i = 0; i < num_critical_regions; i++)
			pthread_mutex_destroy(&__cs[i]);
	}
	
	_MSL_INLINE void __begin_critical_region(int region) _MSL_CANT_THROW
	{
		/* Attempt to get the lock, but do not block if lock cannot be acquired */
		if (pthread_mutex_trylock(&__cs[region]) == 0)
		{
			/* Lock was acquired */
			__cs_id[region] = pthread_self();
			__cs_ref[region] = 1;
		}
		else
		{
			/* Lock was not acquired, somebody else already has the mutex locked */
			if (pthread_equal(pthread_self(), __cs_id[region]))
				/* ...but the lock was already acquired by the current thread */
				__cs_ref[region]++;
			else
			{
				/* The lock is in another thread, so block until it is acquired */
				pthread_mutex_lock(&__cs[region]);
				__cs_id[region] = pthread_self();
				__cs_ref[region] = 1;
			}
		}
	}
	
	_MSL_INLINE void __end_critical_region(int region) _MSL_CANT_THROW
	{
		/* Don't unlock until reference count goes to zero */
		if (--__cs_ref[region] == 0)
			pthread_mutex_unlock(&__cs[region]);
	}

_MSL_END_EXTERN_C

#endif /* _MSL_CRITICAL_REGIONS_PTHREADS_H */

/* Change record:
 * cc  010410 Set up for _MSL_PTHREADS flag
 */