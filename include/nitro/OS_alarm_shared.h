/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_alarm.h from the specific proc's lib
 */

#ifndef NITRO_OS_ALARM_SHARED_H
#define NITRO_OS_ALARM_SHARED_H

#include "nitro/types.h"
#include "nitro/OS_tick_shared.h"
#include "nitro/OS_thread_shared.h"

typedef void (*OSAlarmHandler) (void *);

struct OSiAlarm
{
    OSAlarmHandler handler;
    void *arg;

    u32 tag;
    OSTick fire;
    OSAlarm *prev;
    OSAlarm *next;

    OSTick period;
    OSTick start;
};

#endif //NITRO_OS_ALARM_SHARED_H
