/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_message.h from the specific proc's lib
 */

#ifndef POKEDIAMOND_OS_MESSAGE_SHARED_H
#define POKEDIAMOND_OS_MESSAGE_SHARED_H

#include "nitro/types.h"
#include "nitro/OS_thread_shared.h"

typedef void *OSMessage;

#define  OS_MESSAGE_NOBLOCK   0
#define  OS_MESSAGE_BLOCK     1

typedef struct OSMessageQueue
{
    OSThreadQueue queueSend;
    OSThreadQueue queueReceive;
    OSMessage *msgArray;
    s32 msgCount;
    s32 firstIndex;
    s32 usedCount;
} OSMessageQueue;

#endif //POKEDIAMOND_OS_MESSAGE_SHARED_H
