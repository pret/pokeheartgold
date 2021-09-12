#ifndef NITRO_SUB_OS_ALARM_H
#define NITRO_SUB_OS_ALARM_H

#include "OS_thread.h"
#include "nitro/OS_alarm_shared.h"

void OS_CreateAlarm(OSAlarm *alarm);
void OS_CancelAlarm(OSAlarm *alarm);
BOOL OS_IsAlarmAvailable(void);
void OS_SetAlarm(OSAlarm *alarm, OSTick tick, OSAlarmHandler handler, void *arg);
void OS_SetPeriodicAlarm(OSAlarm *alarm, OSTick start, OSTick period, OSAlarmHandler handler, void *arg);

#endif //NITRO_SUB_OS_ALARM_H
