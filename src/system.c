#include "system.h"
#include "unk_02027010.h"
#include "heap.h"
#include "math_util.h"
#include "unk_020210A0.h"

struct System gSystem;
struct FSCacheEntry gFileCache[128];

void sub_0201A08C(void);
void sub_0201A0C0(void);
void CallHBlankIntrCallback(void);
void HBlankIntrRegsToggle(BOOL enable);
void sub_0201A1B4(void);
void sub_0201A5E8(void);

void sub_0201A08C(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
    sub_0201F880(gSystem.unk1C);
    gSystem.unk30++;
}

void sub_0201A0C0(void) {
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
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

static const struct HeapParam sDefaultHeapSpec[] = {
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
    InitHeapSystem(sDefaultHeapSpec, NELEMS(sDefaultHeapSpec), 161, heap_size_pre);
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
    gSystem.unk10 = NULL;
    gSystem.unk14 = NULL;
    gSystem.unk74 = NULL;
    gSystem.vblankCounter = 0;
    gSystem.screensFlipped = 0;
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

void InitKeypadAndTouchpad(void) {
    TPCalibrateParam tp_calibrate;
    gSystem.buttonMode = 0;
    gSystem.heldKeysRaw = 0;
    gSystem.newKeysRaw = 0;
    gSystem.newAndRepeatedKeysRaw = 0;
    gSystem.heldKeys = 0;
    gSystem.newKeys = 0;
    gSystem.newAndRepeatedKeys = 0;
    gSystem.keyRepeatCounter = 0;
    gSystem.keyRepeatContinueDelay = 4;
    gSystem.keyRepeatStartDelay = 8;
    gSystem.touchX = 0;
    gSystem.touchY = 0;
    gSystem.touchNew = 0;
    gSystem.touchHeld = 0;
    gSystem.touchpadReadAuto = FALSE;
    TP_Init();
    GF_TouchpadInit();
    if (TP_GetUserInfo(&tp_calibrate) == TRUE) {
        TP_SetCalibrateParam(&tp_calibrate);
    }
}

void sub_0201A4B0(int a0) {
    gSystem.unk6A = a0;
}

void Sys_SetSleepDisableFlag(int a0) {
    gSystem.lidClosedPauseDisabled |= a0;
}

void Sys_ClearSleepDisableFlag(int a0) {
    gSystem.lidClosedPauseDisabled &= ~a0;
}

void ReadKeypadAndTouchpad(void) {
    TPData rawTpData, calibTpData;
    u32 tpSamplingResult;
    int raw;
    if (PAD_DetectFold()) {
        gSystem.newKeys = 0;
        gSystem.heldKeys = 0;
        gSystem.newAndRepeatedKeys = 0;
        gSystem.touchNew = 0;
        gSystem.touchHeld = 0;
        return;
    }
    
    raw = PAD_Read() | gSystem.simulatedInputs;
    gSystem.simulatedInputs = 0;
    gSystem.newKeysRaw = raw & (raw ^ gSystem.heldKeysRaw);
    gSystem.newAndRepeatedKeysRaw = raw & (raw ^ gSystem.heldKeysRaw);
    if (raw != 0 && gSystem.heldKeysRaw == raw) {
        gSystem.keyRepeatCounter--;
        if (gSystem.keyRepeatCounter == 0) {
            gSystem.newAndRepeatedKeysRaw = raw;
            gSystem.keyRepeatCounter = gSystem.keyRepeatContinueDelay;
        }
    } else {
        gSystem.keyRepeatCounter = gSystem.keyRepeatStartDelay;
    }
    gSystem.heldKeysRaw = raw;
    gSystem.newKeys = gSystem.newKeysRaw;
    gSystem.heldKeys = gSystem.heldKeysRaw;
    gSystem.newAndRepeatedKeys = gSystem.newAndRepeatedKeysRaw;
    sub_0201A5E8();
    if (!gSystem.touchpadReadAuto) {
        while (TP_RequestRawSampling(&rawTpData)) {}
    } else {
        TP_GetLatestRawPointInAuto(&rawTpData);
    }
    TP_GetCalibratedPoint(&calibTpData, &rawTpData);
    if (calibTpData.validity == TP_VALIDITY_VALID) {
        gSystem.touchX = calibTpData.x;
        gSystem.touchY = calibTpData.y;
    } else {
        if (gSystem.touchHeld) {
            switch (calibTpData.validity) {
            case TP_VALIDITY_INVALID_X:
                gSystem.touchY = calibTpData.y;
                break;
            case TP_VALIDITY_INVALID_Y:
                gSystem.touchX = calibTpData.x;
                break;
            case TP_VALIDITY_INVALID_XY:
                break;
            default:
                break;
            }
        } else {
            calibTpData.touch = TP_TOUCH_OFF;
        }
    }
    gSystem.touchNew = calibTpData.touch & (calibTpData.touch ^ gSystem.touchHeld);
    gSystem.touchHeld = calibTpData.touch;
}

#define BUTTON_COPY(adrs, if_pressed, set_these) { \
    if (adrs & if_pressed) {                       \
        adrs |= set_these;                         \
    }                                              \
}

#define BUTTON_SWAP(adrs, pat1, pat2) { \
    int tmp = 0;                        \
    if (adrs & pat1) {                  \
        tmp |= pat2;                    \
    }                                   \
    if (adrs & pat2) {                  \
        tmp |= pat1;                    \
    }                                   \
    adrs &= ((pat1 | pat2) ^ 0xFFFF);   \
    adrs |= tmp;                        \
}

#define BUTTON_HIDE(adrs, pat) { \
    adrs &= (pat ^ 0xFFFF);      \
}

void sub_0201A5E8(void) {
    switch (gSystem.buttonMode) {
    case BUTTONMODE_NORMAL:
        break;
    case BUTTONMODE_STARTEQUALSX:
        BUTTON_COPY(gSystem.newKeys, PAD_BUTTON_START, PAD_BUTTON_X);
        BUTTON_COPY(gSystem.heldKeys, PAD_BUTTON_START, PAD_BUTTON_X);
        BUTTON_COPY(gSystem.newAndRepeatedKeys, PAD_BUTTON_START, PAD_BUTTON_X);
        break;
    case BUTTONMODE_SWAPXY:
        BUTTON_SWAP(gSystem.newKeys, PAD_BUTTON_X, PAD_BUTTON_Y);
        BUTTON_SWAP(gSystem.heldKeys, PAD_BUTTON_X, PAD_BUTTON_Y);
        BUTTON_SWAP(gSystem.newAndRepeatedKeys, PAD_BUTTON_X, PAD_BUTTON_Y);
        break;
    case BUTTONMODE_LEQUALSA:
        BUTTON_COPY(gSystem.newKeys, PAD_BUTTON_L, PAD_BUTTON_A);
        BUTTON_COPY(gSystem.heldKeys, PAD_BUTTON_L, PAD_BUTTON_A);
        BUTTON_COPY(gSystem.newAndRepeatedKeys, PAD_BUTTON_L, PAD_BUTTON_A);
        BUTTON_HIDE(gSystem.newKeys, (PAD_BUTTON_L | PAD_BUTTON_R));
        BUTTON_HIDE(gSystem.heldKeys, (PAD_BUTTON_L | PAD_BUTTON_R));
        BUTTON_HIDE(gSystem.newAndRepeatedKeys, (PAD_BUTTON_L | PAD_BUTTON_R));
        break;
    }
}

void SetKeyRepeatTimers(int cont, int start) {
    gSystem.keyRepeatContinueDelay = cont;
    gSystem.keyRepeatStartDelay = start;
}

void sub_0201A728(int a0) {
    gSystem.softResetDisabled |= a0;
}

void sub_0201A738(int a0) {
    gSystem.softResetDisabled &= ~a0;
}

void sub_0201A748(HeapID heapId) {
    GF_ASSERT(gSystem.unk74 == NULL);
    gSystem.unk74 = AllocFromHeapAtEnd(heapId, sizeof(u32));
    *gSystem.unk74 = 0x2F93A1BC;
}

void sub_0201A774(void) {
    GF_ASSERT(gSystem.unk74 != NULL);
    *gSystem.unk74 = 0;
    FreeToHeap(gSystem.unk74);
    gSystem.unk74 = NULL;
}

BOOL sub_0201A79C(void) {
    if (gSystem.unk74 != NULL && *gSystem.unk74 == 0x2F93A1BC) {
        return TRUE;
    } else {
        return FALSE;
    }
}
