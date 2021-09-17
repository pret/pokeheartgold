/*
 * NOTE:
 * This file is specific to ARM7
 * DO NOT PUT SHARED/ARM9 CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include <nitro/os/alarm.h> instead!
 */

#ifndef NITRO_OS_ARM7_ALARM_H
#define NITRO_OS_ARM7_ALARM_H

void OS_CreateAlarm(OSAlarm *alarm);
void OS_CancelAlarm(OSAlarm *alarm);
BOOL OS_IsAlarmAvailable(void);
void OS_SetAlarm(OSAlarm *alarm, OSTick tick, OSAlarmHandler handler, void *arg);
void OS_SetPeriodicAlarm(OSAlarm *alarm, OSTick start, OSTick period, OSAlarmHandler handler, void *arg);

#endif //NITRO_OS_ARM7_ALARM_H
