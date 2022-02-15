#include <nitro.h>

#define HW_LCD_LINES            (263)

#define OSi_VHIGHT              HW_LCD_LINES

#define OSi_VALARM_LATER        0
#define OSi_VALARM_NOW          1
#define OSi_VALARM_TIMEOUT      2

struct OSiVAlarmQueue {
    OSVAlarm *head;
    OSVAlarm *tail;
} OSi_VAlarmQueue;

u16 OSi_UseVAlarm = FALSE;
s32 OSi_VFrameCount;
s32 OSi_PreviousVCount;

static void OSi_SetNextVAlarm(OSVAlarm *alarm);
static void OSi_AppendVAlarm(OSVAlarm *alarm);
static int OSi_CompareVCount(OSVAlarm *alarm, s32 currentVCount, s32 currentVFrame);
static s32 OSi_GetVFrame(s32 vcount);
static void OSi_VAlarmHandler(void);

void OS_InitVAlarm(void) {
    if (!OSi_UseVAlarm) {
        OSi_UseVAlarm = TRUE;
        OSi_VAlarmQueue.head = NULL;
        OSi_VAlarmQueue.tail = NULL;
        OS_DisableIrqMask(OS_IE_V_COUNT);
        OSi_VFrameCount = 0;
        OSi_PreviousVCount = 0;
    }
}

BOOL OS_IsVAlarmAvailable(void) {
    return OSi_UseVAlarm;
}

void OSi_InsertVAlarm(OSVAlarm *alarm) {
    OSVAlarm *prev;
    OSVAlarm *next;
    for (next = OSi_VAlarmQueue.head; next; next = next->next) {
        if ((next->frame < alarm->frame) || (next->frame == alarm->frame) && (next->fire <= alarm->fire)) {
            continue;
        }
        prev = next->prev;
        alarm->prev = prev;
        alarm->next = next;
        next->prev = alarm;
        if (prev) {
            prev->next = alarm;
        } else {
            OSi_VAlarmQueue.head = alarm;
            OSi_SetNextVAlarm(alarm);
        }
        return;
    }
    OSi_AppendVAlarm(alarm);
}

static void OSi_AppendVAlarm(OSVAlarm *alarm) {
    OSVAlarm *prev = OSi_VAlarmQueue.tail;
    alarm->prev = prev;
    alarm->next = NULL;
    OSi_VAlarmQueue.tail = alarm;
    if (prev) {
        prev->next = alarm;
    } else {
        OSi_VAlarmQueue.head = alarm;
        OSi_SetNextVAlarm(alarm);
    }
}

void OSi_DetachVAlarm(OSVAlarm *alarm) {
    OSVAlarm *prev;
    OSVAlarm *next;
    if (alarm == NULL) {
        return;
    }
    prev = alarm->prev;
    next = alarm->next;
    if (next) {
        next->prev = prev;
    } else {
        OSi_VAlarmQueue.tail = prev;
    }
    if (prev) {
        prev->next = next;
    } else {
        OSi_VAlarmQueue.head = next;
    }
}

void OS_CreateVAlarm(OSVAlarm *alarm) {
    alarm->handler = NULL;
    alarm->tag = 0;
    alarm->finish = FALSE;
}

void OS_SetVAlarm(OSVAlarm *alarm, s16 count, s16 delay, OSVAlarmHandler handler, void *arg) {
    OSIntrMode enabled = OS_DisableInterrupts();
    s32 currentVCount;
    s32 currentVFrame;
    if (!alarm || alarm->handler) {
        OS_Panic("");
    }
    currentVCount = GX_GetVCount();
    currentVFrame = OSi_GetVFrame(currentVCount);
    alarm->period = FALSE;
    alarm->fire = count;
    alarm->frame = ((count > currentVCount) ? currentVFrame : (currentVFrame + 1));
    alarm->delay = delay;
    alarm->handler = handler;
    alarm->arg = arg;
    alarm->canceled = FALSE;
    OSi_InsertVAlarm(alarm);
    OS_RestoreInterrupts(enabled);
}

void OS_SetPeriodicVAlarm(OSVAlarm *alarm, s16 count, s16 delay, OSVAlarmHandler handler, void *arg) {
    OSIntrMode enabled = OS_DisableInterrupts();
    s32 currentVCount;
    s32 currentVFrame;
    if (!alarm || alarm->handler) {
        OS_Panic("");
    }
    currentVCount = GX_GetVCount();
    currentVFrame = OSi_GetVFrame(currentVCount);
    alarm->period = TRUE;
    alarm->fire = count;
    alarm->frame = ((count > currentVCount) ? currentVFrame : (currentVFrame + 1));
    alarm->delay = delay;
    alarm->handler = handler;
    alarm->arg = arg;
    alarm->canceled = FALSE;
    OSi_InsertVAlarm(alarm);
    OS_RestoreInterrupts(enabled);
}

__declspec(noinline)
static void OSi_SetNextVAlarm(OSVAlarm *alarm) {
    OS_SetIrqFunction(OS_IE_V_COUNT, (void(*)())OSi_VAlarmHandler);
    GX_SetVCountEqVal(alarm->fire);
    GX_VCountEqIntr(TRUE);
    OS_EnableIrqMask(OS_IE_V_COUNT);
}

void OS_SetVAlarmTag(OSVAlarm *alarm, u32 tag) {
    if (tag == 0) {
        OS_Panic("");
    }
    if (alarm) {
        alarm->tag = tag;
    }
}

void OS_CancelVAlarm(OSVAlarm *alarm) {
    OSIntrMode enabled = OS_DisableInterrupts();
    alarm->canceled = TRUE;
    if (alarm->handler == NULL) {
        OS_RestoreInterrupts(enabled);
        return;
    }
    OSi_DetachVAlarm(alarm);
    alarm->handler = NULL;
    OS_RestoreInterrupts(enabled);
}

void OS_CancelVAlarms(u32 tag) {
    OSIntrMode enabled = OS_DisableInterrupts();
    OSVAlarm *alarm;
    OSVAlarm *next;
    if (tag == 0) {
        OS_Panic("");
    }
    for (alarm = OSi_VAlarmQueue.head, next = alarm ? alarm->next : NULL; alarm; alarm = next, next = alarm? alarm->next : NULL) {
        if (alarm->tag == tag) {
            OS_CancelVAlarm(alarm);
        }
    }
    OS_RestoreInterrupts(enabled);
}

void OSi_VAlarmHandler(void) {
    OSVAlarm *alarm;
    OSVAlarmHandler handler;
    int check;
    s32 currentVCount;
    s32 currentVFrame;

    OS_DisableIrqMask(OS_IE_V_COUNT);
    GX_VCountEqIntr(FALSE);
    OS_SetIrqCheckFlag(OS_IE_V_COUNT);
    currentVCount = GX_GetVCountEqVal();
    currentVFrame = OSi_GetVFrame(currentVCount - 1);

    while (NULL != (alarm = OSi_VAlarmQueue.head)) {
        currentVCount = GX_GetVCount();
        currentVFrame = OSi_GetVFrame(currentVCount);
        check = OSi_CompareVCount(alarm, currentVFrame, currentVCount);
        switch (check) {
        case OSi_VALARM_LATER:
            OSi_SetNextVAlarm(alarm);
            if (alarm->fire != GX_GetVCount() || alarm->frame != currentVFrame) {
                return;
            }
            OS_DisableIrqMask(OS_IE_V_COUNT);
            GX_VCountEqIntr(FALSE);
            OS_ResetRequestIrqMask(OS_IE_V_COUNT);
            // fallthrough
        case OSi_VALARM_NOW:
            handler = alarm->handler;
            OSi_DetachVAlarm(alarm);
            alarm->handler = NULL;
            if (handler) {
                (handler)(alarm->arg);
            }
            if (alarm->period && !alarm->canceled) {
                alarm->handler = handler;
                alarm->frame = OSi_VFrameCount + 1;
                OSi_InsertVAlarm(alarm);
            }
            break;
        case OSi_VALARM_TIMEOUT:
            OSi_DetachVAlarm(alarm);
            alarm->frame = OSi_VFrameCount + 1;
            OSi_InsertVAlarm(alarm);
            break;
        }
    }
}

static int OSi_CompareVCount(OSVAlarm *alarm, s32 currentVFrame, s32 currentVCount) {
    s32 delayVFrame;
    s32 delayVCount;

    delayVFrame = currentVFrame - alarm->frame;
    delayVCount = currentVCount - alarm->fire;
    if (delayVFrame < 0 || (delayVFrame == 0 && delayVCount < 0)) {
        return OSi_VALARM_LATER;
    }
    if (delayVCount < 0) {
        delayVCount += OSi_VHIGHT;
    }
    return (delayVCount <= alarm->delay) ? OSi_VALARM_NOW : OSi_VALARM_TIMEOUT;
}

static s32 OSi_GetVFrame(s32 vcount) {
    OSIntrMode enabled = OS_DisableInterrupts();
    if (vcount < OSi_PreviousVCount) {
        OSi_VFrameCount++;
    }
    OSi_PreviousVCount = vcount;
    OS_RestoreInterrupts(enabled);
    return OSi_VFrameCount;
}
