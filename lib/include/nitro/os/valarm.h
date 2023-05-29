#ifndef NITRO_OS_VALARM_H_
#define NITRO_OS_VALARM_H_

typedef void (*OSVAlarmHandler)(void *);

typedef struct OSiVAlarm OSVAlarm;

struct OSiVAlarm {
    OSVAlarmHandler handler;
    void *arg;
    u32 tag;
    u32 frame;
    s16 fire;
    s16 delay;
    OSVAlarm *prev;
    OSVAlarm *next;
    BOOL period;
    BOOL finish;
    BOOL canceled;
};

void OS_InitVAlarm(void);
BOOL OS_IsVAlarmAvailable(void);
void OSi_InsertVAlarm(OSVAlarm *alarm);
void OSi_DetachVAlarm(OSVAlarm *alarm);
void OS_CreateVAlarm(OSVAlarm *alarm);
void OS_SetVAlarm(OSVAlarm *alarm, s16 count, s16 delay, OSVAlarmHandler handler, void *arg);
void OS_SetPeriodicVAlarm(OSVAlarm *alarm, s16 count, s16 delay, OSVAlarmHandler handler, void *arg);
void OS_SetVAlarmTag(OSVAlarm *alarm, u32 tag);
void OS_CancelVAlarm(OSVAlarm *alarm);
void OS_CancelVAlarms(u32 tag);

#endif //NITRO_OS_VALARM_H_
