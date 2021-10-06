#include <nitro.h>

struct OSiVAlarmQueue {
    OSVAlarm *head;
    OSVAlarm *tail;
} OSi_VAlarmQueue;
u16 OSi_UseVAlarm = FALSE;
s32 OSi_VFrameCount;
s32 OSi_PreviousVCount;

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
