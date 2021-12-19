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

#endif //NITRO_OS_VALARM_H_
