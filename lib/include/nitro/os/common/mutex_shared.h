/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_mutex.h from the specific proc's lib
 */

#ifndef NITRO_OS_MUTEX_SHARED_H
#define NITRO_OS_MUTEX_SHARED_H

#include <nitro/os/common/thread_shared.h>
#include <nitro/types.h>

struct OSMutex {
    OSThreadQueue queue;
    OSThread *thread;
    s32 count;
    OSMutexLink link;
};

#endif //NITRO_OS_MUTEX_SHARED_H
