#include "overlay_13_thumb_1.h"

#include <nitro/hw/ARM9/ioreg_OS.h>

#include "global.h"

#include "overlay_00_thumb.h"
#include "overlay_13_arm_2.h"
#include "unk_02034B0C.h"

void ov13_0221BA00(enum HeapID HeapID) {
    for (int playerNo = 0; playerNo < 32; playerNo++) {
        NNS_SndPlayerSetPlayerVolume(playerNo, 127);
        NNS_SndPlayerSetPlayableSeqCount(playerNo, 1);
        NNS_SndPlayerSetAllocatableChannel(playerNo, 0);
    }
    sub_02034D8C();
    OS_InitTick();
    OS_InitAlarm();
    OSIntrMode interrupts = OS_DisableInterrupts();
    DWC_SetAuthServer(2);
    void *buffer = Heap_Alloc(HeapID, 0x40000);
    DWC_StartUtility(buffer, 1, 0);
    Heap_Free(buffer);
    OS_RestoreInterrupts(interrupts);

    u16 oldValue = reg_OS_IME;
    reg_OS_IME = 1;
}
