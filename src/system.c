#include "system.h"
#include "unk_0201F79C.h"
#include "unk_02027010.h"
#include "heap.h"
#include "math_util.h"

struct System gSystem;
struct FSCacheEntry gFileCache[128];

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

void InitSystemForTheGame(void) {
    u32 table_size;
    void *fsTable;

    OS_Init();
    FX_Init();
    GX_SetPower(GX_POWER_ALL);
    GX_Init();
    OS_InitTick();
    sub_0201A1B4();
    gSystem.unk18 = sub_0201F834(160, OS_AllocFromArenaLo(OS_ARENA_MAIN, sub_0201F82C(160), 4));
    gSystem.unk1C = sub_0201F834(32, OS_AllocFromArenaLo(OS_ARENA_MAIN, sub_0201F82C(32), 4));
    gSystem.unk20 = sub_0201F834(32, OS_AllocFromArenaLo(OS_ARENA_MAIN, sub_0201F82C(32), 4));
    gSystem.unk24 = sub_0201F834(4, OS_AllocFromArenaLo(OS_ARENA_MAIN, sub_0201F82C(4), 4));
    GX_DispOff();
    GXS_DispOff();
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    OS_SetIrqFunction(OS_IE_VBLANK, sub_0201A08C);
    OS_EnableIrqMask(OS_IE_VBLANK);
    OS_EnableIrqMask(OS_IE_SPFIFO_RECV);
    OS_EnableIrq();
    GX_VBlankIntr(TRUE);
    FS_Init(1);
    sub_02027010();
    table_size = FS_TryLoadTable(NULL, 0);
    fsTable = OS_AllocFromArenaLo(OS_ARENA_MAIN, table_size, 4);
    GF_ASSERT(fsTable != NULL);
    FS_TryLoadTable(fsTable, table_size);
    gSystem.vBlankIntr = NULL;
    gSystem.hBlankIntr = NULL;
    gSystem.unk10 = 0;
    gSystem.unk14 = 0;
    gSystem.unk74 = 0;
    gSystem.vblankCounter = 0;
    gSystem.unk69 = 0;
    CARD_SetCacheFlushThreshold(0x500, 0x2400);
    GF_CRC16Init(0);
}

void InitGraphicMemory(void) {
    GX_SetBankForLCDC(GX_VRAM_LCDC_ALL);
    MI_CpuClearFast((void *)HW_LCDC_VRAM, HW_LCDC_VRAM_SIZE);
    GX_DisableBankForLCDC();
    MI_CpuFillFast((void *)HW_OAM, 0xC0, HW_OAM_SIZE);
    MI_CpuFillFast((void *)HW_DB_OAM, 0xC0, HW_DB_OAM_SIZE);
    MI_CpuClearFast((void *)HW_PLTT, HW_PLTT_SIZE);
    MI_CpuClearFast((void *)HW_DB_PLTT, HW_DB_PLTT_SIZE);
}

void *Sys_AllocAndReadFile(HeapID heapId, const char *path) {
    FSFile file;
    void *ret;
    u32 size;

    FS_InitFile(&file);
    if (FS_OpenFile(&file, path)) {
        size = FS_GetLength(&file);
        ret = AllocFromHeap(heapId, size);
        if (ret != NULL) {
            if (FS_ReadFile(&file, ret, size) != size) {
                FreeToHeapExplicit(heapId, ret);
                ret = NULL;
            }
        }
        FS_CloseFile(&file);
    } else {
        ret = NULL;
    }
    return ret;
}

void sub_0201A3F8(const char * path, void **mem) {
    FSFile file;
    u32 size;
    FS_InitFile(&file);
    if (FS_OpenFile(&file, path)) {
        size = FS_GetLength(&file);
        if (*mem != NULL) {
            FS_ReadFile(&file, *mem, size);
        }
        FS_CloseFile(&file);
    }
}

void sub_0201A430(void) {
    int i;

    for (i = 127; i > -1; i--) {
        if (gFileCache[i].data != NULL) {
            FreeToHeap(gFileCache[i].data);
            gFileCache[i].data = NULL;
            gFileCache[i].hash = 0;
        }
    }
}
