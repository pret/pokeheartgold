#include <nitro.h>

#ifdef SDK_ARM7
static void AlarmHandler(void *arg);

void SND_AlarmInit(void) {
    int alarmNo;

    for (alarmNo = 0; alarmNo < SND_ALARM_NUM; alarmNo++) {
        SNDi_Work.alarm[alarmNo].enable = FALSE;
        SNDi_Work.alarm[alarmNo].id = 0;
    }
}

void SND_SetupAlarm(int alarmNo, OSTick tick, OSTick period, int id) {
    SNDAlarm *alarm;

    alarm = &SNDi_Work.alarm[alarmNo];

    if (alarm->enable) {
        OS_CancelAlarm(&alarm->alarm);
        alarm->enable = FALSE;
    }

    alarm->setting.tick = tick;
    alarm->setting.period = period;
    alarm->id = (u8)id;
}

void SND_StartAlarm(int alarmNo) {
    OSTick tick;
    OSTick period;
    SNDAlarm *alarm;
    void *arg;

    alarm = &SNDi_Work.alarm[alarmNo];

    if (alarm->enable) {
        OS_CancelAlarm(&alarm->alarm);
        alarm->enable = FALSE;
    }

    tick = alarm->setting.tick;
    period = alarm->setting.period;
    arg = (void *)((alarm->id << 8) | alarmNo);

    OS_CreateAlarm(&alarm->alarm);

    if (period == 0) {
        OS_SetAlarm(&alarm->alarm, tick, AlarmHandler, arg);
    } else {
        OS_SetPeriodicAlarm(&alarm->alarm, OS_GetTick() + tick, period, AlarmHandler, arg);
    }

    alarm->enable = TRUE;
}

void SND_StopAlarm(int alarmNo) {
    SNDAlarm *alarm;

    alarm = &SNDi_Work.alarm[alarmNo];

    if (!alarm->enable) {
        return;
    }

    OS_CancelAlarm(&alarm->alarm);

    alarm->id++;
    alarm->enable = FALSE;
}

static void AlarmHandler(void *arg) {
    while (PXI_SendWordByFifo(PXI_FIFO_TAG_SOUND, (u32)arg, FALSE) < 0) {
        // spin until success
    }
}

#endif //SDK_ARM7
