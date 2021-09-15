#ifndef NITRO_OS_ALARM_H
#define NITRO_OS_ALARM_H

#include <nitro/os/thread.h>
#include <nitro/os/alarm_shared.h>

void OS_CreateAlarm(OSAlarm *alarm);
void OS_CancelAlarm(OSAlarm *alarm);
BOOL OS_IsAlarmAvailable(void);
void OS_SetAlarm(OSAlarm *alarm, OSTick tick, OSAlarmHandler handler, void *arg);
void OS_SetPeriodicAlarm(OSAlarm *alarm, OSTick start, OSTick period, OSAlarmHandler handler, void *arg);

#endif //NITRO_OS_ALARM_H
