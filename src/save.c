#include "save.h"
#include "heap.h"
#include "save_misc_data.h"
#include "save_arrays.h"
#include "math_util.h"
#include "save_data_read_error.h"
#include "save_data_write_error.h"
#include "unk_0202C034.h"
#include "system.h"

#define SAVE_CHUNK_MAGIC 0x20060623

struct SavArrayHeader {
    int id;
    u32 size;
    u32 offset;
    u16 crc;
    u16 slot;
}; // size=0x10

struct SavArrayFooter {
    u32 magic;
    u32 saveno;
    u32 size;
    u16 idx;
    u16 crc;
};

struct SaveChunkFooter {
    u32 count;
    u32 size;
    u32 magic;
    u16 slot;
    u16 crc;
};

struct SaveSlotSpec {
    u8 id;
    u8 firstPage;
    u8 numPages;
    u8 padding_3;
    u32 offset;
    u32 size;
}; // size=0xC

struct AsyncWriteManager {
    int rollbackCounter;
    int unk_4;
    int curSector;
    int numSectors;
    int lockId;
    u32 state;
    u32 count;
    BOOL waitingAsync;
    u32 state_sub;
};

struct SaveBlock2 {
    BOOL flashChipDetected;
    BOOL saveFileExists;
    BOOL isNewGame;
    u32 statusFlags;
    u8 dynamic_region[SAVE_PAGE_MAX * SAVE_SECTOR_SIZE];
    u32 saveCounter;
    struct SavArrayHeader arrayHeaders[SAVE_BLOCK_NUM]; // 23014
    struct SaveSlotSpec saveSlotSpecs[2]; // 232B4
    struct AsyncWriteManager async_write_man;
    u32 lastGoodSaveSlot;
    u32 lastGoodSaveNo;
    int boxModifiedFlags;
    u32 newBoxModifiedFlags;
    u16 pcStorageLastCRC;
    u16 pcStorageCRC;
    u16 numModifiedBoxes;
    u16 nextBoxToWrite;
    u8 sectorCleanFlag[2];
    u16 lastGoodSector;
}; // size=0x2330C

struct SaveSlotCheck {
    BOOL valid;
    u32 count;
};

static BOOL saveWritten;
static SAVEDATA *sSaveDataPtr;

static u32 Save_IsNewGame(SAVEDATA *saveData);
static void Save_SetExtraChunksExist(SAVEDATA *saveData);
static u32 Save_CalcNumModifiedPCBoxes(SAVEDATA *saveData);
static void SaveFooterDebugPrn(struct SaveChunkFooter *footer);
static void DebugPrn_MirrorValid(BOOL unk);
static void SaveSlotCheck_InitDummy(struct SaveSlotCheck *check);
static u16 SavArray_CalcCRC16MinusFooter(SAVEDATA *saveData, const void *data, u32 size);
static u32 GetChunkOffsetFromCurrentSaveSlot(u32 slot, struct SaveSlotSpec *spec);
static struct SaveChunkFooter *GetSaveSectorFooterPtr(SAVEDATA *saveData, void *data, int idx);
static BOOL ValidateSaveSectorFooter(SAVEDATA *saveData, void *data, int idx);
static void SaveSlotCheck_InitFromSavedat(struct SaveSlotCheck *check, SAVEDATA *saveData, void *data, int idx);
static void SaveSlot_BuildFooter(SAVEDATA *saveData, void *data, int idx);
static int SaveCounterCompare(u32 stat1, u32 stat2);
static u32 SaveSlotCheckCompare(struct SaveSlotCheck *first, struct SaveSlotCheck *second, u32 *ret1_p, u32 *ret2_p);
static void Save_RecordWhichLatestGoodSector(SAVEDATA *saveData, struct SaveSlotCheck *a1, struct SaveSlotCheck *a2, int idx);
static int Save_GetSaveFilesStatus(SAVEDATA *saveData);
static void Save_CheckFrontierData(SAVEDATA *saveData, int *err1, int *err2);
static BOOL FlashLoadSaveDataFromChunk(u32 slot, struct SaveSlotSpec *spec, void *dest);
static BOOL Sav2_LoadDynamicRegion(SAVEDATA *saveData);
static int Save_WriteSlotAsync(SAVEDATA *saveData, int idx, u8 slot);
static int Save_WriteChunkFooterAsync(SAVEDATA *saveData, int idx, u8 slot);
static void Save_WriteManInit(SAVEDATA *saveData, struct AsyncWriteManager *writeMan, int a2);
static int HandleWriteSaveAsync_NormalData(SAVEDATA *saveData, struct AsyncWriteManager *writeMan);
static void Save_WriteManFinish(SAVEDATA *saveData, struct AsyncWriteManager *writeMan, int a2);
static void CancelAsyncSave(SAVEDATA *saveData, struct AsyncWriteManager *writeMan);
static int _NowWriteFlash(SAVEDATA *saveData);
static int FlashClobberChunkFooter(SAVEDATA *saveData, int spec, int sector);
static u32 GetSaveChunkSizePlusCRC(int idx);
static void SaveBlock2_InitSubstructs(struct SavArrayHeader *arr_hdr);
static void SaveBlock2_InitSlotSpecs(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers);
static void Sav2_InitDynamicRegion_Internal(u8 *dynamic_region, struct SavArrayHeader *headers);
static void CreateChunkFooter(SAVEDATA *saveData, void *data, int idx, u32 size);
static BOOL ValidateChunk(SAVEDATA *saveData, void *data, int idx, u32 size);
static u32 SavArray_GetFooterSaveNo(void *data, u32 size);
static void sub_020286B4(SAVEDATA *saveData, int a1, u32 *a2, u32 *a3, u8 *a4);
static void sub_020286D4(SAVEDATA *saveData, int a1, u32 a2, u32 a3, u8 a4);
static BOOL SaveDetectFlash(void);
static s32 FlashWriteChunk(u32 offset, void *data, u32 size);
static BOOL FlashLoadChunk(u32 offset, void *data, u32 size);
static void FlashWriteCommandCallback(void *arg);
static s32 FlashWriteChunkInternal(u32 offset, void *data, u32 size);
static BOOL WaitFlashWrite(s32 lockId, BOOL checkResult, BOOL *resultSuccess);
static void SaveErrorHandling(s32 lockId, int code);
static int HandleWriteSaveAsync_PCBoxes(SAVEDATA *saveData, struct AsyncWriteManager *writeMan);
static int Save_WritePCBoxes(SAVEDATA *saveData, struct AsyncWriteManager *writeMan);
static int Save_WriteNextPCBox(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 slot);
static int Save_WritePCFooter(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 slot);
static u32 Save_CalcPCBoxModifiedFlags(SAVEDATA *saveData);
static u32 PCModifiedFlags_CountModifiedBoxes(u32 flags);
static u32 PCModifiedFlags_GetIndexOfNthModifiedBox(u32 flags, u8 last);

SAVEDATA *SaveBlock2_new(void) {
    SAVEDATA *ret;
    int status;
    int sp4;
    int sp0;

    ret = AllocFromHeap(1, sizeof(SAVEDATA));
    MI_CpuClearFast(ret, sizeof(SAVEDATA));
    sSaveDataPtr = ret;

    ret->flashChipDetected = SaveDetectFlash();
    ret->saveFileExists = FALSE;
    ret->isNewGame = TRUE;
    ret->sectorCleanFlag[0] = 1;
    ret->sectorCleanFlag[1] = 1;

    SaveBlock2_InitSubstructs(ret->arrayHeaders);
    SaveBlock2_InitSlotSpecs(ret->saveSlotSpecs, ret->arrayHeaders);

    status = Save_GetSaveFilesStatus(ret);
    ret->statusFlags = 0;
    switch (status) {
    case LOAD_STATUS_IS_GOOD:
    case LOAD_STATUS_SLOT_FAIL:
        Sav2_LoadDynamicRegion(ret);
        ret->saveFileExists = TRUE;
        ret->isNewGame = FALSE;
        if (status == LOAD_STATUS_SLOT_FAIL) {
            ret->statusFlags |= 1;
        } else {
            ret->boxModifiedFlags = Save_GetPCBoxModifiedFlags(ret);
        }
        Save_CheckFrontierData(ret, &sp4, &sp0);
        if (sp4 == 3) {
            ret->statusFlags |= 8;
        } else if (sp4 == 2) {
            ret->statusFlags |= 4;
        }
        if (sp0 == 3) {
            ret->statusFlags |= 0x20;
        } else if (sp0 == 2) {
            ret->statusFlags |= 0x10;
        }
        break;
    case LOAD_STATUS_TOTAL_FAIL:
        ret->statusFlags |= 2;
        // fallthrough
    case LOAD_STATUS_NOT_EXIST:
        Sav2_InitDynamicRegion(ret);
        break;
    }

    return ret;
}

SAVEDATA *SaveBlock2_get(void) {
    GF_ASSERT(sSaveDataPtr != NULL);
    return sSaveDataPtr;
}

void *SavArray_get(SAVEDATA *saveData, int id) {
    GF_ASSERT(id < SAVE_BLOCK_NUM);
    return (void *)&saveData->dynamic_region[saveData->arrayHeaders[id].offset];
}

const void *SavArray_const_get(const SAVEDATA *saveData, int id) {
    return SavArray_get((SAVEDATA *)saveData, id);
}

BOOL Save_DeleteAllData(SAVEDATA *saveData) {
    u8 *r6;
    int i;

    r6 = AllocFromHeapAtEnd(3, SAVE_SECTOR_SIZE);
    Sys_SetSleepDisableFlag(1);
    FlashClobberChunkFooter(saveData, 0, saveData->lastGoodSector == 0 ? 1 : 0);
    FlashClobberChunkFooter(saveData, 1, saveData->lastGoodSector == 0 ? 1 : 0);
    FlashClobberChunkFooter(saveData, 0, saveData->lastGoodSector);
    FlashClobberChunkFooter(saveData, 1, saveData->lastGoodSector);
    MI_CpuFillFast(r6, -1, SAVE_SECTOR_SIZE);
    for (i = 0; i < 64; i++) {
        FlashWriteChunk(i * SAVE_SECTOR_SIZE, r6, SAVE_SECTOR_SIZE);
        FlashWriteChunk((i + 64) * SAVE_SECTOR_SIZE, r6, SAVE_SECTOR_SIZE);
    }
    FreeToHeap(r6);
    Sav2_InitDynamicRegion(saveData);
    saveData->saveFileExists = FALSE;
    Sys_ClearSleepDisableFlag(1);
    return TRUE;
}

BOOL SaveData_TryLoadOnContinue(SAVEDATA *saveData) {
    int sp4;
    int sp0;

    if (!saveData->flashChipDetected) {
        return FALSE;
    }
    if (Sav2_LoadDynamicRegion(saveData)) {
        saveData->saveFileExists = TRUE;
        saveData->isNewGame = FALSE;
        Save_CheckFrontierData(saveData, &sp4, &sp0);
        Save_ResetPCBoxModifiedFlags(saveData);
        return TRUE;
    }
    return FALSE;
}

int SaveGameNormal(SAVEDATA *saveData) {
    int ret;

    if (!saveData->flashChipDetected) {
        return WRITE_STATUS_TOTAL_FAIL;
    }
    if (saveData->isNewGame) {
        Sys_SetSleepDisableFlag(1);
        FlashClobberChunkFooter(saveData, 0, saveData->lastGoodSector == 0 ? 1 : 0);
        FlashClobberChunkFooter(saveData, 1, saveData->lastGoodSector == 0 ? 1 : 0);
        FlashClobberChunkFooter(saveData, 0, saveData->lastGoodSector);
        FlashClobberChunkFooter(saveData, 1, saveData->lastGoodSector);
        Sys_ClearSleepDisableFlag(1);
    }
    ret = _NowWriteFlash(saveData);
    if (ret == WRITE_STATUS_SUCCESS) {
        saveData->saveFileExists = TRUE;
        saveData->isNewGame = FALSE;
    }
    return ret;
}

int Save_NowWriteFile_AfterMGInit(SAVEDATA *saveData, int a1) {
    int ret;

    GF_ASSERT(a1 < 2);
    GF_ASSERT(saveData->isNewGame == FALSE);
    GF_ASSERT(saveData->saveFileExists == TRUE);
    Save_PrepareForAsyncWrite(saveData, a1);
    do {
        ret = Save_WriteFileAsync(saveData);
    } while (ret == WRITE_STATUS_CONTINUE || ret == WRITE_STATUS_NEXT);
    return ret;
}

void Sav2_InitDynamicRegion(SAVEDATA *saveData) {
    saveData->isNewGame = TRUE;
    saveData->sectorCleanFlag[0] = 1;
    saveData->sectorCleanFlag[1] = 1;
    Sav2_InitDynamicRegion_Internal(saveData->dynamic_region, saveData->arrayHeaders);
}

BOOL Save_FlashChipIsDetected(SAVEDATA *saveData) {
    return saveData->flashChipDetected;
}

u32 Save_GetStatusFlags(SAVEDATA *saveData) {
    return saveData->statusFlags;
}

void Save_ClearStatusFlags(SAVEDATA *saveData) {
    saveData->statusFlags = 0;
}

u32 Save_FileExists(SAVEDATA *saveData) {
    return saveData->saveFileExists;
}

static u32 Save_IsNewGame(SAVEDATA *saveData) {
    return saveData->isNewGame;
}

BOOL Save_CheckExtraChunksExist(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc = Sav2_Misc_get(saveData);
    return SaveMisc_CheckExtraChunksExist(misc);
}

static void Save_SetExtraChunksExist(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc = Sav2_Misc_get(saveData);
    SaveMisc_SetExtraChunksExist(misc);
}

BOOL Save_FileDoesNotBelongToPlayer(SAVEDATA *saveData) {
    return Save_IsNewGame(saveData) != 0 && Save_FileExists(saveData) != 0;
}

BOOL Save_NumModifiedPCBoxesIsMany(SAVEDATA *saveData) {
    return Save_CalcNumModifiedPCBoxes(saveData) >= 6;
}

void SetAllPCBoxesModified(void) {
    Save_SetAllPCBoxesModified(sSaveDataPtr);
}

static u32 Save_CalcNumModifiedPCBoxes(SAVEDATA *saveData) {
    return PCModifiedFlags_CountModifiedBoxes(Save_CalcPCBoxModifiedFlags(saveData));
}

void Save_PrepareForAsyncWrite(SAVEDATA *saveData, int a1) {
    Save_WriteManInit(saveData, &saveData->async_write_man, a1);
}

int Save_WriteFileAsync(SAVEDATA *saveData) {
    int ret;

    if (saveData->async_write_man.curSector == 1) {
        ret = HandleWriteSaveAsync_PCBoxes(saveData, &saveData->async_write_man);
    } else {
        ret = HandleWriteSaveAsync_NormalData(saveData, &saveData->async_write_man);
    }
    if (!(ret == WRITE_STATUS_CONTINUE || ret == WRITE_STATUS_NEXT)) {
        Save_WriteManFinish(saveData, &saveData->async_write_man, ret);
    }
    return ret;
}

void Save_Cancel(SAVEDATA *saveData) {
    CancelAsyncSave(saveData, &saveData->async_write_man);
}

static void SaveFooterDebugPrn(struct SaveChunkFooter *footer) {
#pragma unused(footer)
}

static void DebugPrn_MirrorValid(BOOL unk) {
#pragma unused(unk)
}

static void SaveSlotCheck_InitDummy(struct SaveSlotCheck *check) {
    check->valid = FALSE;
    check->count = 0;
}

u16 SavArray_CalcCRC16(SAVEDATA *saveData, const void *data, u32 size) {
#pragma unused(saveData)
    return GF_CalcCRC16(data, size);
}

static u16 SavArray_CalcCRC16MinusFooter(SAVEDATA *saveData, const void *data, u32 size) {
#pragma unused(saveData)
    return GF_CalcCRC16(data, size - sizeof(struct SavArrayFooter));
}

static u32 GetChunkOffsetFromCurrentSaveSlot(u32 slot, struct SaveSlotSpec *spec) {
    u32 adrs;
    if (slot == 0) {
        adrs = 0;
    } else {
        adrs = 0x40000;
    }
    return adrs + spec->offset;
}

static struct SaveChunkFooter *GetSaveSectorFooterPtr(SAVEDATA *saveData, void *data, int idx) {
    u8 *ret;
    struct SaveSlotSpec *spec;

    spec = &saveData->saveSlotSpecs[idx];
    ret = (u8 *)data + spec->offset;
    GF_ASSERT(spec->size != 0);
    return (struct SaveChunkFooter *)(ret + spec->size - sizeof(struct SaveChunkFooter));
}

static BOOL ValidateSaveSectorFooter(SAVEDATA *saveData, void *data, int idx) {
    struct SaveSlotSpec *spec;
    struct SaveChunkFooter *footer;
    u32 offset;

    spec = &saveData->saveSlotSpecs[idx];
    footer = GetSaveSectorFooterPtr(saveData, data, idx);
    offset = spec->offset;
    SaveFooterDebugPrn(footer);
    if (footer->size != spec->size) {
        return FALSE;
    }
    if (footer->magic != SAVE_CHUNK_MAGIC) {
        return FALSE;
    }
    if (footer->slot != idx) {
        return FALSE;
    }
    return SavArray_CalcCRC16MinusFooter(saveData, (u8 *)data + offset, spec->size) == footer->crc;
}

static void SaveSlotCheck_InitFromSavedat(struct SaveSlotCheck *check, SAVEDATA *saveData, void *data, int idx) {
    struct SaveChunkFooter *footer;

    footer = GetSaveSectorFooterPtr(saveData, data, idx);
    check->valid = ValidateSaveSectorFooter(saveData, data, idx);
    if (check->valid) {
        check->count = footer->count;
    } else {
        check->count = 0;
    }
}

static void SaveSlot_BuildFooter(SAVEDATA *saveData, void *data, int idx) {
    struct SaveSlotSpec *spec;
    struct SaveChunkFooter *footer;
    u32 offset;

    spec = &saveData->saveSlotSpecs[idx];
    footer = GetSaveSectorFooterPtr(saveData, data, idx);
    offset = spec->offset;
    footer->count = saveData->saveCounter;
    footer->size = spec->size;
    footer->magic = SAVE_CHUNK_MAGIC;
    footer->slot = idx;
    footer->crc = SavArray_CalcCRC16MinusFooter(saveData, (u8 *)data + offset, spec->size);
    SaveFooterDebugPrn(footer);
}

static int SaveCounterCompare(u32 stat1, u32 stat2) {
    if (stat1 == -1 && stat2 == 0) {
        return -1;
    }
    if (stat1 == 0 && stat2 == -1) {
        return 1;
    }
    if (stat1 > stat2) {
        return 1;
    }
    return -((stat1 < stat2) ? 1 : 0);
}

static u32 SaveSlotCheckCompare(struct SaveSlotCheck *first, struct SaveSlotCheck *second, u32 *ret1_p, u32 *ret2_p) {
    int r0;

    r0 = SaveCounterCompare(first->count, second->count);
    if (first->valid && second->valid) {
        if (r0 > 0) {
            *ret1_p = 0;
            *ret2_p = 1;
        } else if (r0 < 0) {
            *ret1_p = 1;
            *ret2_p = 0;
        } else {
            *ret1_p = 0;
            *ret2_p = 1;
        }
        return 2;
    }
    if (first->valid && !second->valid) {
        *ret1_p = 0;
        *ret2_p = 2;
        return 1;
    }
    if (!first->valid && second->valid) {
        *ret1_p = 1;
        *ret2_p = 2;
        return 1;
    }
    *ret1_p = 2;
    *ret2_p = 2;
    return 0;
}

static void Save_RecordWhichLatestGoodSector(SAVEDATA *saveData, struct SaveSlotCheck *checks_main, struct SaveSlotCheck *checks_sub, int idx) {
#pragma unused(checks_sub)
    saveData->saveCounter = checks_main[idx].count;
    saveData->lastGoodSector = idx;
}

static int Save_GetSaveFilesStatus(SAVEDATA *saveData) {
    u8 *data1;
    u8 *data2;

    struct SaveSlotCheck checks_main[2];
    struct SaveSlotCheck checks_sub[2];
    u32 newer_main;
    u32 newer_sub;
    u32 older_main;
    u32 older_sub;
    u32 __older_main;
    u32 numGood_main;
    u32 numGood_sub;
    u32 __newer_main;

    data1 = AllocFromHeapAtEnd(3, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    data2 = AllocFromHeapAtEnd(3, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    if (FlashLoadChunk(0 * 0x40000, data1, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE)) {
        SaveSlotCheck_InitFromSavedat(&checks_main[0], saveData, data1, 0);
        SaveSlotCheck_InitFromSavedat(&checks_sub[0], saveData, data1, 1);
    } else {
        SaveSlotCheck_InitDummy(&checks_main[0]);
        SaveSlotCheck_InitDummy(&checks_sub[0]);
    }
    if (FlashLoadChunk(1 * 0x40000, data2, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE)) {
        SaveSlotCheck_InitFromSavedat(&checks_main[1], saveData, data2, 0);
        SaveSlotCheck_InitFromSavedat(&checks_sub[1], saveData, data2, 1);
    } else {
        SaveSlotCheck_InitDummy(&checks_main[1]);
        SaveSlotCheck_InitDummy(&checks_sub[1]);
    }
    FreeToHeap(data1);
    FreeToHeap(data2);

    numGood_main = SaveSlotCheckCompare(&checks_main[0], &checks_main[1], &newer_main, &older_main);
    __older_main = older_main;
    __newer_main = newer_main;
    numGood_sub = SaveSlotCheckCompare(&checks_sub[0], &checks_sub[1], &newer_sub, &older_sub);

    DebugPrn_MirrorValid(checks_main[0].valid);
    DebugPrn_MirrorValid(checks_main[1].valid);
    DebugPrn_MirrorValid(checks_sub[0].valid);
    DebugPrn_MirrorValid(checks_sub[1].valid);

    if (numGood_main == 0 && numGood_sub == 0) {
        return LOAD_STATUS_NOT_EXIST;
    }

    if (numGood_main == 0 || numGood_sub == 0) {
        return LOAD_STATUS_TOTAL_FAIL;
    }

    GF_ASSERT(__newer_main != 2);

    if (numGood_main == 2 && numGood_sub == 2) {
        if (checks_main[__newer_main].count == checks_sub[__newer_main].count) {
            Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, __newer_main);
            saveData->sectorCleanFlag[0] = 0;
            saveData->sectorCleanFlag[1] = 0;
            return LOAD_STATUS_IS_GOOD;
        }
        if (checks_main[__older_main].count != checks_sub[__older_main].count) {
            return LOAD_STATUS_TOTAL_FAIL;
        }
        Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, __older_main);
        return LOAD_STATUS_SLOT_FAIL;
    }
    if (numGood_main == 1 && numGood_sub == 2) {
        if (checks_main[__newer_main].count == checks_sub[__newer_main].count) {
            Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, __newer_main);
            return LOAD_STATUS_SLOT_FAIL;
        }
        return LOAD_STATUS_TOTAL_FAIL;
    }
    if (numGood_main == 2 && numGood_sub == 1) {
        if (checks_main[__newer_main].count == checks_sub[__newer_main].count) {
            Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, __newer_main);
            return LOAD_STATUS_IS_GOOD;
        }
        if (__older_main == 2) {
            return LOAD_STATUS_TOTAL_FAIL;
        }
        if (checks_main[__older_main].count == checks_sub[__older_main].count) {
            Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, __older_main);
            return LOAD_STATUS_SLOT_FAIL;
        }
        return LOAD_STATUS_TOTAL_FAIL;
    }
    if (numGood_main == 1 && numGood_sub == 1) {
        if (newer_main == newer_sub) {
            GF_ASSERT(checks_main[newer_main].count == checks_sub[newer_sub].count);
            Save_RecordWhichLatestGoodSector(saveData, checks_main, checks_sub, newer_main);
            saveData->sectorCleanFlag[newer_main] = 0;
            return LOAD_STATUS_IS_GOOD;
        }
    }
    return LOAD_STATUS_TOTAL_FAIL;
}

static void Save_CheckFrontierData(SAVEDATA *saveData, int *err1, int *err2) {
    SAVE_MISC_DATA *misc;
    int sp14;
    int sp10;
    u32 sp0C;
    u32 sp08;
    u8 sp04;
    int i;

    misc = Sav2_Misc_get(saveData);
    *err1 = 1;
    *err2 = 1;
    if (Save_CheckExtraChunksExist(saveData)) {
        sub_0202AC38(misc, 1, &sp0C, &sp08, &sp04);
        if (sp0C != -1 || sp08 != -1) {
            FreeToHeap(sub_020284A4(saveData, 3, 1, &sp14, &sp10));
            if (sp14 == 2) {
                *err1 = 3;
            } else if (sp14 == 1 && sp10 == 1) {
                *err1 = 2;
            }
        }
        for (i = 2; i <= 5; i++) {
            sub_0202AC38(misc, i, &sp0C, &sp08, &sp04);
            if (sp0C != -1 || sp08 != -1) {
                FreeToHeap(sub_020284A4(saveData, 3, i, &sp14, &sp10));
                if (sp14 == 2) {
                    *err2 = 3;
                } else if (sp14 == 1 && sp10 == 1 && *err2 != 3) {
                    *err2 = 2;
                }
            }
        }
    }
}

static BOOL FlashLoadSaveDataFromChunk(u32 slot, struct SaveSlotSpec *spec, void *dest) {
    return FlashLoadChunk(GetChunkOffsetFromCurrentSaveSlot(slot, spec), (u8 *)dest + spec->offset, spec->size);
}

static BOOL Sav2_LoadDynamicRegion(SAVEDATA *saveData) {
    int i;
    u8 *data;
    u32 pc_offs;
    u32 pc_size;

    struct SaveSlotSpec *specs = saveData->saveSlotSpecs;

    for (i = 0; i < 2; i++) {
        data = saveData->dynamic_region;
        if (!FlashLoadSaveDataFromChunk(saveData->lastGoodSector, &saveData->saveSlotSpecs[i], saveData->dynamic_region)) {
            return FALSE;
        }
        if (!ValidateSaveSectorFooter(saveData, saveData->dynamic_region, i)) {
            return FALSE;
        }
    }
    for (i = 0; i < SAVE_BLOCK_NUM; i++) {
        saveData->arrayHeaders[i].crc = GF_CalcCRC16(SavArray_get(saveData, i), saveData->arrayHeaders[i].size);
    }
    pc_offs = saveData->saveSlotSpecs[1].offset;
    pc_size = PCStorage_GetSizeOfBox() * PCStorage_GetNumBoxes();
    saveData->pcStorageLastCRC = GF_CalcCRC16(data + pc_offs, pc_size);
    sub_020310A0(saveData);
    sub_0202C6FC(saveData);
    return TRUE;
}

static int Save_WriteSlotAsync(SAVEDATA *saveData, int idx, u8 slot) {
    struct SaveSlotSpec *spec;

    spec = &saveData->saveSlotSpecs[idx];
    SaveSlot_BuildFooter(saveData, saveData->dynamic_region, idx);
    return FlashWriteChunkInternal(GetChunkOffsetFromCurrentSaveSlot(slot, spec), saveData->dynamic_region + spec->offset, spec->size - sizeof(struct SaveChunkFooter));
}

static int Save_WriteChunkFooterAsync(SAVEDATA *saveData, int idx, u8 slot) {
    struct SaveSlotSpec *spec;
    u32 size;

    spec = &saveData->saveSlotSpecs[idx];
    size = spec->size;
    return FlashWriteChunkInternal(GetChunkOffsetFromCurrentSaveSlot(slot, spec) + size - sizeof(struct SaveChunkFooter), saveData->dynamic_region + spec->offset + size - sizeof(struct SaveChunkFooter), sizeof(struct SaveChunkFooter));
}

static void Save_WriteManInit(SAVEDATA *saveData, struct AsyncWriteManager *writeMan, int a2) {
#pragma unused(a2)
    sub_0202C714(saveData);
    sub_02031084(saveData);

    writeMan->state = 0;
    writeMan->state_sub = 0;
    writeMan->rollbackCounter = 0;
    writeMan->waitingAsync = FALSE;
    writeMan->rollbackCounter = 1;
    writeMan->count = saveData->saveCounter;
    saveData->saveCounter++;
    writeMan->unk_4 = 0;
    writeMan->curSector = 0;
    writeMan->numSectors = 2;
    Sys_SetSleepDisableFlag(1);
}

static int HandleWriteSaveAsync_NormalData(SAVEDATA *saveData, struct AsyncWriteManager *writeMan) {
    BOOL result;
    switch (writeMan->state) {
    case 0:
        writeMan->lockId = Save_WriteSlotAsync(saveData, writeMan->curSector, saveData->lastGoodSector == 0);
        writeMan->waitingAsync = TRUE;
        writeMan->state++;
        // fallthrough
    case 1:
        if (!WaitFlashWrite(writeMan->lockId, writeMan->waitingAsync, &result)) {
            break;
        }
        writeMan->waitingAsync = FALSE;
        if (!result) {
            return WRITE_STATUS_TOTAL_FAIL;
        }
        writeMan->state++;
        if (writeMan->curSector + 1 == writeMan->numSectors) {
            return WRITE_STATUS_NEXT;
        }
        // fallthrough
    case 2:
        writeMan->lockId = Save_WriteChunkFooterAsync(saveData, writeMan->curSector, saveData->lastGoodSector == 0);
        writeMan->waitingAsync = TRUE;
        writeMan->state++;
        // fallthrough
    case 3:
        if (!WaitFlashWrite(writeMan->lockId, writeMan->waitingAsync, &result)) {
            break;
        }
        writeMan->waitingAsync = FALSE;
        if (!result) {
            return WRITE_STATUS_TOTAL_FAIL;
        }
        if (++writeMan->curSector == writeMan->numSectors) {
            return WRITE_STATUS_SUCCESS;
        }
        writeMan->state = 0;
        break;
    }
    return WRITE_STATUS_CONTINUE;
}

static void Save_WriteManFinish(SAVEDATA *saveData, struct AsyncWriteManager *writeMan, int a2) {
    saveData->numModifiedBoxes = 0;
    saveData->nextBoxToWrite = 0;
    if (a2 == 3) {
        if (writeMan->rollbackCounter) {
            saveData->saveCounter = writeMan->count;
        }
    } else {
        saveData->boxModifiedFlags = Save_GetPCBoxModifiedFlags(saveData);
        saveData->pcStorageLastCRC = saveData->pcStorageCRC;
        Save_ResetPCBoxModifiedFlags(saveData);
        saveData->sectorCleanFlag[saveData->lastGoodSector == 0] = 0;
        saveData->lastGoodSector = saveData->lastGoodSector == 0;
        saveData->saveFileExists = TRUE;
        saveData->isNewGame = FALSE;
    }
    Sys_ClearSleepDisableFlag(1);
}

static void CancelAsyncSave(SAVEDATA *saveData, struct AsyncWriteManager *writeMan) {
    if (writeMan->rollbackCounter) {
        saveData->saveCounter = writeMan->count;
    }
    if (!CARD_TryWaitBackupAsync()) {
        CARD_CancelBackupAsync();
    }
    if (writeMan->waitingAsync) {
        CARD_UnlockBackup(writeMan->lockId);
        OS_ReleaseLockID(writeMan->lockId);
        writeMan->waitingAsync = FALSE;
    }
    Sys_ClearSleepDisableFlag(1);
}

static int _NowWriteFlash(SAVEDATA *saveData) {
    struct AsyncWriteManager writeManager;
    int ret;

    Save_WriteManInit(saveData, &writeManager, 2);
    do {
        if (writeManager.curSector != 1) {
            ret = HandleWriteSaveAsync_NormalData(saveData, &writeManager);
        } else {
            ret = HandleWriteSaveAsync_PCBoxes(saveData, &writeManager);
        }
    } while (ret == WRITE_STATUS_CONTINUE || ret == WRITE_STATUS_NEXT);
    Save_WriteManFinish(saveData, &writeManager, ret);
    return ret;
}

static int FlashClobberChunkFooter(SAVEDATA *saveData, int spec, int sector) {
    struct SaveChunkFooter sp0;
    struct SaveSlotSpec *slotSpec;

    slotSpec = &saveData->saveSlotSpecs[spec];
    MI_CpuFill8(&sp0, 0xFF, sizeof(struct SaveChunkFooter));
    return FlashWriteChunk(GetChunkOffsetFromCurrentSaveSlot(sector, slotSpec) + slotSpec->size - sizeof(struct SaveChunkFooter), &sp0, sizeof(struct SaveChunkFooter));
}

static u32 GetSaveChunkSizePlusCRC(int idx) {
    u32 size;
    const struct SaveChunkHeader *hdr;

    hdr = gSaveChunkHeaders;
    GF_ASSERT(idx < gNumSaveChunkHeaders);
    size = hdr[idx].sizeFunc();
    size = ((size + 3) & ~3) + 4;
    return size;
}

static void SaveBlock2_InitSubstructs(struct SavArrayHeader *arr_hdr) {
    int i;
    const struct SaveChunkHeader *hdr;
    int adrs;

    hdr = gSaveChunkHeaders;
    adrs = 0;
    GF_ASSERT(gNumSaveChunkHeaders == SAVE_BLOCK_NUM);
    for (i = 0; i < gNumSaveChunkHeaders; i++) {
        GF_ASSERT(i == hdr[i].id);
        arr_hdr[i].id = hdr[i].id;
        arr_hdr[i].size = GetSaveChunkSizePlusCRC(i);
        arr_hdr[i].offset = adrs;
        arr_hdr[i].crc = 0;
        arr_hdr[i].slot = hdr[i].block;
        adrs += arr_hdr[i].size;
        if (i == gNumSaveChunkHeaders - 1 || hdr[i].block != hdr[i + 1].block) {
            adrs += sizeof(struct SaveChunkFooter);
            if (hdr[i].block != hdr[i + 1].block && i + 1 < gNumSaveChunkHeaders && (adrs % 0x100) != 0) {
                adrs += 0x100 - (adrs % 0x100);
            }
        }
    }
    GF_ASSERT(adrs <= SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
}

static void SaveBlock2_InitSlotSpecs(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers) {
    int i;
    int adrs;
    int npage;
    int j;

    npage = 0;
    adrs = 0;
    j = 0;
    for (i = 0; i < 2; i++) {
        slotSpecs[i].id = i;
        slotSpecs[i].size = 0;
        for (; i == headers[j].slot && j < gNumSaveChunkHeaders; j++) {
            slotSpecs[i].size += headers[j].size;
        }
        slotSpecs[i].size += sizeof(struct SaveChunkFooter);
        slotSpecs[i].firstPage = npage;
        slotSpecs[i].offset = adrs;
        slotSpecs[i].numPages = (slotSpecs[i].size + SAVE_SECTOR_SIZE - 1) / SAVE_SECTOR_SIZE;
        npage += slotSpecs[i].numPages;
        adrs += slotSpecs[i].size;
        if (adrs % 0x100 != 0) {
            adrs += (0x100 - (adrs % 0x100));
        }
    }
    GF_ASSERT(npage == slotSpecs[1].firstPage + slotSpecs[1].numPages);
    GF_ASSERT(npage <= SAVE_PAGE_MAX);
}

static void Sav2_InitDynamicRegion_Internal(u8 *dynamic_region, struct SavArrayHeader *headers) {
    const struct SaveChunkHeader *chunkHeaders;
    int i;
    u32 adrs;
    void *ptr;

    chunkHeaders = gSaveChunkHeaders;
    MI_CpuClearFast(dynamic_region, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    for (i = 0; i < gNumSaveChunkHeaders; i++) {
        adrs = headers[i].offset;
        ptr = dynamic_region + adrs;
        MI_CpuClearFast(ptr, headers[i].size);
        chunkHeaders[i].initFunc(ptr);
    }
}

void Save_WipeExtraChunks(SAVEDATA *saveData) {
    const struct ExtraSaveChunkHeader *chunkHeaders;
    int i;
    void *data;
    int status;

    chunkHeaders = gExtraSaveChunkHeaders;
    if (Save_CheckExtraChunksExist(saveData) == 1) {
        return;
    }

    for (i = 0; i < gNumExtraSaveChunkHeaders; i++) {
        if (chunkHeaders[i].id != 0) {
            data = ReadExtraSaveChunk(saveData, 3, chunkHeaders[i].id, &status);
            GF_ASSERT(data != NULL);
            MI_CpuClear8(data, chunkHeaders[i].sizeFunc());
            chunkHeaders[i].initFunc(data);
            WriteExtraSaveChunk(saveData, chunkHeaders[i].id, data);
            FreeToHeap(data);
        }
    }

    Save_SetExtraChunksExist(saveData);
}

static void CreateChunkFooter(SAVEDATA *saveData, void *data, int idx, u32 size) {
    struct SavArrayFooter *footer;

    footer = (struct SavArrayFooter *)((u8 *)data + size);

    footer->magic = SAVE_CHUNK_MAGIC;
    footer->saveno = saveData->lastGoodSaveNo + 1;
    footer->size = size;
    footer->idx = idx;
    footer->crc = GF_CalcCRC16(data, size + offsetof(struct SavArrayFooter, crc));
}

static BOOL ValidateChunk(SAVEDATA *saveData, void *data, int idx, u32 size) {
#pragma unused(saveData)
    struct SavArrayFooter *footer;

    footer = (struct SavArrayFooter *)((u8 *)data + size);

    if (footer->magic != SAVE_CHUNK_MAGIC) {
        return FALSE;
    }
    if (footer->size != size) {
        return FALSE;
    }
    if (footer->idx != idx) {
        return FALSE;
    }
    return footer->crc == GF_CalcCRC16(data, size + offsetof(struct SavArrayFooter, crc));
}

static u32 SavArray_GetFooterSaveNo(void *data, u32 size) {
    struct SavArrayFooter *footer;

    footer = (struct SavArrayFooter *)((u8 *)data + size);

    return footer->saveno;
}

int WriteExtraSaveChunk(SAVEDATA *saveData, int idx, void *data) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 size;
    int ret;

    Sys_SetSleepDisableFlag(1);
    GF_ASSERT(idx < gNumExtraSaveChunkHeaders);
    hdr = &gExtraSaveChunkHeaders[idx];
    GF_ASSERT(hdr->id == idx);
    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    if (saveData->lastGoodSaveSlot == 1) {
        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret = FlashWriteChunk(hdr->sector * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);

        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret |= FlashWriteChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);
    } else {
        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret = FlashWriteChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);

        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret |= FlashWriteChunk(hdr->sector * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);
    }
    if (ret == 1) {
        Sys_ClearSleepDisableFlag(1);
        return 2;
    }
    Sys_ClearSleepDisableFlag(1);
    return 3;
}

int sub_02028230(SAVEDATA *saveData, int idx, void *data) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 size;
    int ret;
    u32 sp14;
    u32 sp10;
    u8 sp0C;
    u32 r6;

    Sys_SetSleepDisableFlag(1);
    GF_ASSERT(idx < gNumExtraSaveChunkHeaders);
    hdr = &gExtraSaveChunkHeaders[idx];
    GF_ASSERT(hdr->id == idx);
    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    sub_020286B4(saveData, idx, &sp14, &sp10, &sp0C);
    do {
        r6 = PRandom(sp14);
    } while (r6 == -1);
    sub_020286D4(saveData, idx, r6, sp14, sp0C ^ 1);
    *(u32 *)data = r6;
    if (sp0C == 1) {
        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret = FlashWriteChunk(hdr->sector * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);
    } else {
        CreateChunkFooter(saveData, data, idx, hdr->sizeFunc());
        ret = FlashWriteChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, data, size);
        GF_ASSERT(ValidateChunk(saveData, data, idx, hdr->sizeFunc()) == TRUE);
    }
    if (ret == 1) {
        Sys_ClearSleepDisableFlag(1);
        return WRITE_STATUS_SUCCESS;
    }
    Sys_ClearSleepDisableFlag(1);
    return WRITE_STATUS_TOTAL_FAIL;
}

void *ReadExtraSaveChunk(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 size;
    void *ret;
    BOOL valid1;
    BOOL valid2;
    u32 saveno1;
    u32 saveno2;

    GF_ASSERT(idx < gNumExtraSaveChunkHeaders);
    hdr = &gExtraSaveChunkHeaders[idx];
    GF_ASSERT(hdr->id == idx);

    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    ret = AllocFromHeap(heapId, size);
    FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
    valid1 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    saveno1 = SavArray_GetFooterSaveNo(ret, hdr->sizeFunc());
    FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
    valid2 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    saveno2 = SavArray_GetFooterSaveNo(ret, hdr->sizeFunc());

    *ret_p = 1;
    if (valid1 == TRUE && valid2 == FALSE) {
        saveData->lastGoodSaveSlot = 0;
        saveData->lastGoodSaveNo = saveno1;
        FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == FALSE && valid2 == TRUE) {
        saveData->lastGoodSaveSlot = 1;
        saveData->lastGoodSaveNo = saveno2;
        FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == TRUE && valid2 == TRUE) {
        if (SaveCounterCompare(saveno1, saveno2) != -1) {
            saveData->lastGoodSaveSlot = 0;
            saveData->lastGoodSaveNo = saveno1;
            FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
            return ret;
        } else {
            saveData->lastGoodSaveSlot = 1;
            saveData->lastGoodSaveNo = saveno2;
            FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
            return ret;
        }
    }
    *ret_p = 2;
    saveData->lastGoodSaveSlot = 0;
    saveData->lastGoodSaveNo = 0;
    return ret;
}

void *sub_020284A4(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p, int *ret2_p) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 sp2C;
    u32 sp28;
    u32 sp24;
    u32 sp20;
    u8 sp1C;
    u32 size;
    void *ret;
    BOOL valid1;
    BOOL valid2;
    u32 saveno1;
    u32 saveno2;
    SAVE_MISC_DATA *misc;

    misc = Sav2_Misc_get(saveData);

    GF_ASSERT(idx < gNumExtraSaveChunkHeaders);
    GF_ASSERT(idx != 0);
    hdr = &gExtraSaveChunkHeaders[idx];
    GF_ASSERT(hdr->id == idx);
    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    ret = AllocFromHeap(heapId, size);
    sub_020286B4(saveData, idx, &sp24, &sp20, &sp1C);
    FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
    valid1 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    MI_CpuCopy8(ret, &sp2C, sizeof(u32));
    FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
    valid2 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    MI_CpuCopy8(ret, &sp28, sizeof(u32));
    *ret_p = 1;
    *ret2_p = 0;
    if (valid1 == TRUE && valid2 == FALSE && sp24 == sp2C) {
        if (sp1C == 1) {
            sub_020286D4(saveData, idx, sp20, sp20, 0);
            *ret2_p = 1;
        }
        FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == FALSE && valid2 == TRUE && sp24 == sp28) {
        if (sp1C == 0) {
            sub_020286D4(saveData, idx, sp20, sp20, 1);
            *ret2_p = 1;
        }
        FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == TRUE && valid2 == TRUE) {
        if (sp1C == 0) {
            if (sp24 == sp2C) {
                FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
                return ret;
            } else if (sp20 == sp28) {
                sub_020286D4(saveData, idx, sp20, sp20, sp1C ^ 1);
                *ret2_p = 1;
                FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
                return ret;
            }
        } else{
            if (sp24 == sp28) {
                FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
                return ret;
            } else if (sp20 == sp2C) {
                sub_020286D4(saveData, idx, sp20, sp20, sp1C ^ 1);
                *ret2_p = 1;
                FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
                return ret;
            }
        }
    }
    *ret_p = 2;
    sub_0202AC60(misc, hdr->id, -1, -1, 0);
    return ret;
}

static void sub_020286B4(SAVEDATA *saveData, int a1, u32 *a2, u32 *a3, u8 *a4) {
    sub_0202AC38(Sav2_Misc_get(saveData), a1, a2, a3, a4);
}

static void sub_020286D4(SAVEDATA *saveData, int a1, u32 a2, u32 a3, u8 a4) {
    sub_0202AC60(Sav2_Misc_get(saveData), a1, a2, a3, a4);
}

static BOOL SaveDetectFlash(void) {
    s32 lockId;
    CARDBackupType flash_id;

    lockId = OS_GetLockID();
    GF_ASSERT(lockId != OS_LOCK_ID_ERROR);
    CARD_LockBackup(lockId);
    if (CARD_IdentifyBackup(CARD_BACKUP_TYPE_FLASH_4MBITS_EX)) {
        flash_id = CARD_BACKUP_TYPE_FLASH_4MBITS_EX;
    } else if (CARD_IdentifyBackup(CARD_BACKUP_TYPE_FLASH_4MBITS)) {
        flash_id = CARD_BACKUP_TYPE_FLASH_4MBITS;
    } else {
        flash_id = CARD_BACKUP_TYPE_NOT_USE;
    }
    CARD_UnlockBackup(lockId);
    OS_ReleaseLockID(lockId);
    return flash_id != CARD_BACKUP_TYPE_NOT_USE;
}

static s32 FlashWriteChunk(u32 offset, void *data, u32 size) {
    int stat;
    s32 lockId;
    lockId = FlashWriteChunkInternal(offset, data, size);
    while (!WaitFlashWrite(lockId, 1, &stat)) {}
    return stat;
}

static BOOL FlashLoadChunk(u32 offset, void *data, u32 size) {
    u32 lock;
    BOOL result;

    lock = OS_GetLockID();
    GF_ASSERT(lock != OS_LOCK_ID_ERROR);
    CARD_LockBackup(lock);
    CARD_ReadBackupAsync(offset, data, size, NULL, NULL);
    result = CARD_WaitBackupAsync();
    CARD_UnlockBackup(lock);
    OS_ReleaseLockID(lock);
    if (!result) {
        FreeToHeap(sSaveDataPtr);
        ShowSaveDataReadError(1);
    }
    return result;
}

static void FlashWriteCommandCallback(void *arg) {
#pragma unused(arg)
    saveWritten = TRUE;
}

static s32 FlashWriteChunkInternal(u32 offset, void *data, u32 size) {
    s32 lock;
    BOOL result;
    u32 sp14;

    lock = OS_GetLockID();
    GF_ASSERT(lock != OS_LOCK_ID_ERROR);
    CARD_LockBackup(lock);
    if (!CARD_ReadBackup(0, &sp14, sizeof(u32))) {
        SaveErrorHandling(lock, 1);
    }
    saveWritten = FALSE;
    CARD_WriteAndVerifyBackupAsync(offset, data, size, FlashWriteCommandCallback, NULL);
    return lock;
}

static BOOL WaitFlashWrite(s32 lockId, BOOL checkResult, BOOL *resultSuccess) {
    if (saveWritten == TRUE) {
        if (!checkResult) {
            return TRUE;
        }
        switch (CARD_GetResultCode()) {
        case CARD_RESULT_SUCCESS:
            *resultSuccess = TRUE;
            break;
        case CARD_RESULT_TIMEOUT:
        default:
            *resultSuccess = FALSE;
            SaveErrorHandling(lockId, 0);
        case CARD_RESULT_NO_RESPONSE:
            *resultSuccess = FALSE;
            SaveErrorHandling(lockId, 1);
        }
        CARD_UnlockBackup(lockId);
        OS_ReleaseLockID(lockId);
        return TRUE;
    }
    return FALSE;
}

static void SaveErrorHandling(s32 lockId, int code) {
    CARD_UnlockBackup(lockId);
    OS_ReleaseLockID(lockId);
    FreeToHeap(sSaveDataPtr);
    ShowSaveDataWriteError(1, code);
}

BOOL SaveSubstruct_AssertCRC(int idx) {
    u8 *data;
    int size;
    u16 *data_u16;
    u16 crc;

    data = SavArray_get(SaveBlock2_get(), idx);
    data_u16 = (u16 *)data;
    size = GetSaveChunkSizePlusCRC(idx) - 4;
    crc = GF_CalcCRC16(data, size);
    if (crc == data_u16[size / 2]) {
        return TRUE;
    }

    GF_ASSERT(0);
    return FALSE;
}

void SaveSubstruct_UpdateCRC(int idx) {
    u8 *data;
    int size;
    u16 *data_u16;
    u16 crc;

    data = SavArray_get(SaveBlock2_get(), idx);
    data_u16 = (u16 *)data;
    size = GetSaveChunkSizePlusCRC(idx) - 4;
    crc = GF_CalcCRC16(data, size);
    data_u16[size / 2] = crc;
}

static int HandleWriteSaveAsync_PCBoxes(SAVEDATA *saveData, struct AsyncWriteManager *writeMan) {
    u32 r7;
    int r0;
    int sp0;
    void *data;
    switch (writeMan->state) {
    case 0:
        saveData->newBoxModifiedFlags = Save_CalcPCBoxModifiedFlags(saveData);
        saveData->numModifiedBoxes = PCModifiedFlags_CountModifiedBoxes(saveData->newBoxModifiedFlags);
        saveData->nextBoxToWrite = 0;
        r7 = PCStorage_GetSizeOfBox() * PCStorage_GetNumBoxes();
        saveData->pcStorageCRC = GF_CalcCRC16(SavArray_get(saveData, SAVE_PCSTORAGE), r7);
        if (saveData->numModifiedBoxes == 0) {
            GF_ASSERT(saveData->pcStorageCRC == saveData->pcStorageLastCRC);
            sub_020271A0(saveData);
            if (saveData->pcStorageCRC != saveData->pcStorageLastCRC) {
                saveData->numModifiedBoxes = PCStorage_GetNumBoxes();
                saveData->newBoxModifiedFlags = BOX_ALL_MODIFIED_FLAG;
                Save_SetAllPCBoxesModified(saveData);
            }
        }
        writeMan->state_sub = 0;
        data = saveData->dynamic_region;
        SaveSlot_BuildFooter(saveData, data, writeMan->curSector);
        GetSaveSectorFooterPtr(saveData, data, writeMan->curSector);
        writeMan->state++;
        // fallthrough
    case 1:
        r0 = Save_WritePCBoxes(saveData, writeMan);
        if (r0 == 0) {
            return WRITE_STATUS_TOTAL_FAIL;
        }
        if (r0 == 1) {
            writeMan->state++;
            if (writeMan->curSector + 1 == writeMan->numSectors) {
                return WRITE_STATUS_NEXT;
            }
        }
        break;
    case 2:
        writeMan->lockId = Save_WriteChunkFooterAsync(saveData, writeMan->curSector, saveData->lastGoodSector == 0);
        writeMan->waitingAsync = 1;
        writeMan->state++;
        // fallthrough
    case 3:
        if (WaitFlashWrite(writeMan->lockId, writeMan->waitingAsync, &sp0)) {
            writeMan->waitingAsync = 0;
            if (!sp0) {
                return WRITE_STATUS_TOTAL_FAIL;
            }
            writeMan->curSector++;
            if (writeMan->curSector == writeMan->numSectors) {
                return WRITE_STATUS_SUCCESS;
            }
            writeMan->state = 0;
        }
        break;
    }
    return WRITE_STATUS_CONTINUE;
}

static int Save_WritePCBoxes(SAVEDATA *saveData, struct AsyncWriteManager *writeMan) {
    int write_ok;

    switch (writeMan->state_sub) {
    case 0:
        if (saveData->nextBoxToWrite >= saveData->numModifiedBoxes) {
            writeMan->state_sub = 3;
        } else {
            writeMan->state_sub++;
        }
        break;
    case 1:
        writeMan->lockId = Save_WriteNextPCBox(saveData, &saveData->saveSlotSpecs[writeMan->curSector], saveData->lastGoodSector == 0);
        writeMan->waitingAsync = 1;
        writeMan->state_sub++;
        // fallthrough
    case 2:
        if (WaitFlashWrite(writeMan->lockId, writeMan->waitingAsync, &write_ok)) {
            writeMan->waitingAsync = 0;
            if (!write_ok) {
                return 0;
            }
            saveData->nextBoxToWrite++;
            writeMan->state_sub = 0;
        }
        break;
    case 3:
        writeMan->lockId = Save_WritePCFooter(saveData, &saveData->saveSlotSpecs[writeMan->curSector], saveData->lastGoodSector == 0);
        writeMan->waitingAsync = 1;
        writeMan->state_sub++;
        // fallthrough
    case 4:
        if (WaitFlashWrite(writeMan->lockId, writeMan->waitingAsync, &write_ok)) {
            writeMan->waitingAsync = 0;
            writeMan->state_sub = 0;
            if (!write_ok) {
                return 0;
            }
            return 1;
        }
        break;
    }
    return 2;
}

static int Save_WriteNextPCBox(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 slot) {
    u32 boxno;
    u32 box_size;
    u32 offset;

    box_size = PCStorage_GetSizeOfBox();
    offset = GetChunkOffsetFromCurrentSaveSlot(slot, spec);
    boxno = PCModifiedFlags_GetIndexOfNthModifiedBox(saveData->newBoxModifiedFlags, saveData->nextBoxToWrite);
    GF_ASSERT(boxno != 0xFF);
    return FlashWriteChunkInternal(offset + box_size * boxno, saveData->dynamic_region + spec->offset + box_size * boxno, box_size);
}

static int Save_WritePCFooter(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 slot) {
    u32 sector_size;
    struct SaveChunkFooter *footer;
    u32 spec_offset;
    void *dynamic_region_ptr;
    u32 offset;
    void *data;
    u32 pc_size;
    u16 crc;

    pc_size = PCStorage_GetSizeOfBox() * PCStorage_GetNumBoxes();
    offset = GetChunkOffsetFromCurrentSaveSlot(slot, spec);
    data = saveData->dynamic_region + spec->offset;
    sector_size = spec->size - sizeof(struct SaveChunkFooter);
    GF_ASSERT(sector_size != 0);
    dynamic_region_ptr = saveData->dynamic_region;
    spec_offset = spec->offset;
    footer = GetSaveSectorFooterPtr(saveData, dynamic_region_ptr, 1);
    crc = SavArray_CalcCRC16MinusFooter(saveData, (u8 *)dynamic_region_ptr + spec_offset, spec->size);
    GF_ASSERT(crc == footer->crc);
    return FlashWriteChunkInternal(offset + pc_size, data + pc_size, sector_size - pc_size);
}

static u32 Save_CalcPCBoxModifiedFlags(SAVEDATA *saveData) {
    u32 ret;

    ret = Save_GetPCBoxModifiedFlags(saveData);
    ret |= saveData->boxModifiedFlags;
    if (saveData->sectorCleanFlag[0] || saveData->sectorCleanFlag[1]) {
        ret = BOX_ALL_MODIFIED_FLAG;
    }
    return ret;
}

static u32 PCModifiedFlags_CountModifiedBoxes(u32 flags) {
    u8 i, n;
    u32 t;

    n = 0;
    t = PCStorage_GetNumBoxes();
    for (i = 0; i < t; i++) {
        if (flags & 1) {
            n++;
        }
        flags >>= 1;
        flags &= BOX_ALL_MODIFIED_FLAG;
    }
    return n;
}

static u32 PCModifiedFlags_GetIndexOfNthModifiedBox(u32 flags, u8 last) {
    u8 i, n;
    u32 t;

    n = 0;
    t = PCStorage_GetNumBoxes();
    for (i = 0; i < t; i++) {
        if (flags & 1) {
            if (n == last) {
                return i;
            }
            n++;
        }
        flags >>= 1;
        flags &= BOX_ALL_MODIFIED_FLAG;
    }
    return 0xFF;
}
