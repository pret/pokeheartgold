#include "overlay_13_thumb_1.h"

#include "global.h"

#include "overlay_00_thumb.h"
#include "overlay_13_arm_2.h"
#include "unk_02034B0C.h"

void ov13_0221BA00(enum HeapID HeapID) {
    for (int playerNo = 0; playerNo < 0x20; playerNo += 1) {
        NNS_SndPlayerSetPlayerVolume(playerNo, 0x7F);
        NNS_SndPlayerSetPlayableSeqCount(playerNo, 1);
        NNS_SndPlayerSetAllocatableChannel(playerNo, 0);
    }
    sub_02034D8C();
    OS_InitTick();
    OS_InitAlarm();
    OSIntrMode interrupts = OS_DisableInterrupts();
    ov00_021EC454(2);
    void *buffer = Heap_Alloc(HeapID, 0x40000);
    ov13_0222B430(buffer, 1, 0);
    Heap_Free(buffer);
    OS_RestoreInterrupts(interrupts);

    u16 oldValue = *(vu16 *)0x04000208;
    *(u16 *)0x04000208 = 1;
}
