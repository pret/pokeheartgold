#ifndef NITRO_OS_ALARM_H
#define NITRO_OS_ALARM_H

#include <nitro/os/thread.h>
#include <nitro/os/common/alarm_shared.h>

#ifdef SDK_ARM7
#include <nitro/os/ARM7/alarm.h>
#endif

struct OSiAlarmQueue
{
    OSAlarm *head;
    OSAlarm *tail;
};
struct OSiAlarmQueue *OSi_GetAlarmQueue(void);

void OSi_SetTimer(OSAlarm *alarm);
void OS_InitAlarm(void);
void OSi_InsertAlarm(OSAlarm *alarm, OSTick fire);

#endif //NITRO_OS_ALARM_H
