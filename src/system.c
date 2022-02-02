#include "system.h"
#include "unk_0201F79C.h"
#include "heap.h"

struct System gSystem;

void HBlankIntrRegsToggle(BOOL enable);

void sub_0201A08C(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(3);
    sub_0201F880(gSystem.unk1C);
    gSystem.unk30++;
}

void sub_0201A0C0(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(3);
}

void sub_0201A0E0(void) {
    OS_DisableIrqMask(OS_IE_VBLANK);
    OS_SetIrqFunction(OS_IE_VBLANK, sub_0201A0C0);
    OS_EnableIrqMask(OS_IE_VBLANK);
}

void Main_SetVBlankIntrCB(GFIntrCB cb, void *arg) {
    gSystem.vBlankIntr = cb;
    gSystem.vBlankIntrArg = arg;
}

void HBlankInterruptDisable(void) {
    HBlankIntrRegsToggle(FALSE);
    gSystem.hBlankIntr = NULL;
    gSystem.hBlankIntrArg = NULL;
}

BOOL Main_SetHBlankIntrCB(GFIntrCB cb, void *arg) {
    if (cb == NULL) {
        HBlankIntrRegsToggle(FALSE);
        gSystem.hBlankIntr = NULL;
        gSystem.hBlankIntrArg = NULL;
        return TRUE;
    } else if (gSystem.hBlankIntr == NULL) {
        gSystem.hBlankIntrArg = arg;
        gSystem.hBlankIntr = cb;
        HBlankIntrRegsToggle(TRUE);
        return TRUE;
    } else {
        return FALSE;
    }
}

void CallHBlankIntrCallback(void) {
    if (gSystem.hBlankIntr != NULL) {
        gSystem.hBlankIntr(gSystem.hBlankIntrArg);
    }
}

void HBlankIntrRegsToggle(BOOL enable) {
    OS_DisableIrq();
    if (!enable) {
        OS_GetIrqMask();
        OS_DisableIrqMask(OS_IE_HBLANK);
        GX_HBlankIntr(FALSE);
    } else {
        OS_GetIrqMask();
        OS_SetIrqFunction(OS_IE_HBLANK, CallHBlankIntrCallback);
        OS_EnableIrqMask(OS_IE_HBLANK);
        GX_HBlankIntr(TRUE);
    }
    OS_EnableIrq();
}

static const struct HeapParam _020F62A4[] = {
    {0xD200, OS_ARENA_MAIN},
    {0x23600, OS_ARENA_MAIN},
    {0x10, OS_ARENA_MAIN},
    {0x11D000, OS_ARENA_MAIN},
};

void sub_0201A1B4(void) {
    u32 lowEntropyBuffer[OS_LOW_ENTROPY_DATA_SIZE / sizeof(u32)];
    u8 digest[MATH_MD5_DIGEST_SIZE];
    u32 heap_size_pre;
    u32 i;

    OS_GetLowEntropyData(lowEntropyBuffer);
    MATH_CalcMD5(digest, lowEntropyBuffer, OS_LOW_ENTROPY_DATA_SIZE);

    heap_size_pre = 0;
    for (i = 0; i < MATH_MD5_DIGEST_SIZE; i++) {
        heap_size_pre += digest[i];
    }
    heap_size_pre &= 0xFF;
    while (heap_size_pre & 3) {
        heap_size_pre++;
    }
    InitHeapSystem(_020F62A4, NELEMS(_020F62A4), 161, heap_size_pre);
}
