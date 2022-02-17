#include "save.h"
#include "heap.h"
#include "save_misc_data.h"
#include "save_arrays.h"
#include "math_util.h"

struct SavArrayHeader {
    int id;
    u32 size;
    u32 offset;
    u16 field_C;
    u16 field_E;
}; // size=0x10

struct SavArrayFooter {
    u32 magic;
    u32 unk_4;
    u32 unk_8;
    u16 unk_C;
    u16 crc;
};

struct SaveSlotSpec {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 padding_3;
    u32 offset;
    u32 size;
}; // size=0xC

struct UnkSavSub_232CC {
    int unk_0;
    int unk_4;
    int unk_8;
    int unk_C;
    int unk_10;
    u32 unk_14;
    u32 unk_18;
    u32 unk_1C[2];
    u8 padding_24[8];
};

struct SaveBlock2 {
    BOOL flashChipDetected;
    BOOL unk_00004;
    BOOL unk_00008;
    u32 unk_0000C;
    u8 dynamic_region[SAVE_PAGE_MAX * SAVE_SECTOR_SIZE];
    u32 unk_23010;
    struct SavArrayHeader arrayHeaders[SAVE_BLOCK_NUM]; // 23014
    struct SaveSlotSpec saveSlotSpecs[2]; // 232B4
    struct UnkSavSub_232CC unk_232CC;
    int boxModifiedFlags;
    u8 filler_232FC[4];
    u16 unk_23300;
    u8 unk_23302[6];
    u8 unk_23308;
    u8 unk_23309;
    u16 unk_2330A;
}; // size=0x2330C

struct UnkStruct_2027744 {
    BOOL unk0;
    u32 unk4;
};

BOOL saveWritten;
SAVEDATA *_021D2228;

void Sav2_InitDynamicRegion(SAVEDATA *saveData);
u32 sub_02027544(SAVEDATA *saveData);
void sub_02027550(SAVEDATA *saveData, int a1);
int sub_02027564(SAVEDATA *saveData);
void sub_02027D6C(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
void sub_02027BDC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2);
BOOL SaveDetectFlash(void);
void SaveBlock2_InitSubstructs(struct SavArrayHeader *headers);
void sub_02027EFC(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers);
int sub_020277D4(SAVEDATA *saveData);
BOOL Sav2_LoadDynamicRegion(SAVEDATA *saveData);
void sub_020279EC(SAVEDATA *saveData, int *err1, int *err2);
int FlashClobberChunkFooter(SAVEDATA *saveData, int spec, int sector);
int sub_02027DB4(SAVEDATA *saveData);
void FlashWriteChunk(u32 offset, void *data, u32 size);
void Sav2_InitDynamicRegion_Internal(u8 *dynamic_region, struct SavArrayHeader *headers);
u32 sub_02028C70(SAVEDATA *saveData);
u32 sub_02028C9C(u32 flags);
int sub_02028968(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
int sub_02027C18(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
void sub_02027CEC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2);

extern void sub_0201A4BC(int);
extern void sub_0201A4CC(int);

SAVEDATA *SaveBlock2_new(void) {
    SAVEDATA *ret;
    int r5;
    int sp4;
    int sp0;

    ret = AllocFromHeap(1, sizeof(SAVEDATA));
    MI_CpuClearFast(ret, sizeof(SAVEDATA));
    _021D2228 = ret;

    ret->flashChipDetected = SaveDetectFlash();
    ret->unk_00004 = 0;
    ret->unk_00008 = 1;
    ret->unk_23308 = 1;
    ret->unk_23309 = 1;

    SaveBlock2_InitSubstructs(ret->arrayHeaders);
    sub_02027EFC(ret->saveSlotSpecs, ret->arrayHeaders);

    r5 = sub_020277D4(ret);
    ret->unk_0000C = 0;
    switch (r5) {
    case 1:
    case 2:
        Sav2_LoadDynamicRegion(ret);
        ret->unk_00004 = 1;
        ret->unk_00008 = 0;
        if (r5 == 2) {
            ret->unk_0000C |= 1;
        } else {
            ret->boxModifiedFlags = sub_02027170(ret);
        }
        sub_020279EC(ret, &sp4, &sp0);
        if (sp4 == 3) {
            ret->unk_0000C |= 8;
        } else if (sp4 == 2) {
            ret->unk_0000C |= 4;
        }
        if (sp0 == 3) {
            ret->unk_0000C |= 0x20;
        } else if (sp0 == 2) {
            ret->unk_0000C |= 0x10;
        }
        break;
    case 3:
        ret->unk_0000C |= 2;
        // fallthrough
    case 0:
        Sav2_InitDynamicRegion(ret);
        break;
    }

    return ret;
}

SAVEDATA *SaveBlock2_get(void) {
    GF_ASSERT(_021D2228 != NULL);
    return _021D2228;
}

void *SavArray_get(SAVEDATA *saveData, int id) {
    GF_ASSERT(id < SAVE_BLOCK_NUM);
    return (void *)&saveData->dynamic_region[saveData->arrayHeaders[id].offset];
}

const void *SavArray_const_get(const SAVEDATA *saveData, int id) {
    return SavArray_get((SAVEDATA *)saveData, id);
}

BOOL sub_020272F4(SAVEDATA *saveData) {
    u8 *r6;
    int i;

    r6 = AllocFromHeapAtEnd(3, SAVE_SECTOR_SIZE);
    sub_0201A4BC(1);
    FlashClobberChunkFooter(saveData, 0, saveData->unk_2330A == 0 ? 1 : 0);
    FlashClobberChunkFooter(saveData, 1, saveData->unk_2330A == 0 ? 1 : 0);
    FlashClobberChunkFooter(saveData, 0, saveData->unk_2330A);
    FlashClobberChunkFooter(saveData, 1, saveData->unk_2330A);
    MI_CpuFillFast(r6, -1, SAVE_SECTOR_SIZE);
    for (i = 0; i < 64; i++) {
        FlashWriteChunk(i * SAVE_SECTOR_SIZE, r6, SAVE_SECTOR_SIZE);
        FlashWriteChunk((i + 64) * SAVE_SECTOR_SIZE, r6, SAVE_SECTOR_SIZE);
    }
    FreeToHeap(r6);
    Sav2_InitDynamicRegion(saveData);
    saveData->unk_00004 = 0;
    sub_0201A4CC(1);
    return TRUE;
}

BOOL sub_020273B0(SAVEDATA *saveData) {
    int sp4;
    int sp0;

    if (!saveData->flashChipDetected) {
        return FALSE;
    }
    if (Sav2_LoadDynamicRegion(saveData)) {
        saveData->unk_00004 = 1;
        saveData->unk_00008 = 0;
        sub_020279EC(saveData, &sp4, &sp0);
        sub_02027180(saveData);
        return TRUE;
    }
    return FALSE;
}

int sub_020273F0(SAVEDATA *saveData) {
    int ret;

    if (!saveData->flashChipDetected) {
        return 3;
    }
    if (saveData->unk_00008) {
        sub_0201A4BC(1);
        FlashClobberChunkFooter(saveData, 0, saveData->unk_2330A == 0 ? 1 : 0);
        FlashClobberChunkFooter(saveData, 1, saveData->unk_2330A == 0 ? 1 : 0);
        FlashClobberChunkFooter(saveData, 0, saveData->unk_2330A);
        FlashClobberChunkFooter(saveData, 1, saveData->unk_2330A);
        sub_0201A4CC(1);
    }
    ret = sub_02027DB4(saveData);
    if (ret == 2) {
        saveData->unk_00004 = 1;
        saveData->unk_00008 = 0;
    }
    return ret;
}

int sub_0202746C(SAVEDATA *saveData, int a1) {
    int ret;

    GF_ASSERT(a1 < 2);
    GF_ASSERT(saveData->unk_00008 == 0);
    GF_ASSERT(saveData->unk_00004 == 1);
    sub_02027550(saveData, a1);
    do {
        ret = sub_02027564(saveData);
    } while (ret == 0 || ret == 1);
    return ret;
}

void Sav2_InitDynamicRegion(SAVEDATA *saveData) {
    saveData->unk_00008 = 1;
    saveData->unk_23308 = 1;
    saveData->unk_23309 = 1;
    Sav2_InitDynamicRegion_Internal(saveData->dynamic_region, saveData->arrayHeaders);
}

BOOL sub_020274D0(SAVEDATA *saveData) {
    return saveData->flashChipDetected;
}

u32 sub_020274D4(SAVEDATA *saveData) {
    return saveData->unk_0000C;
}

void sub_020274D8(SAVEDATA *saveData) {
    saveData->unk_0000C = 0;
}

u32 sub_020274E0(SAVEDATA *saveData) {
    return saveData->unk_00004;
}

u32 sub_020274E4(SAVEDATA *saveData) {
    return saveData->unk_00008;
}

BOOL sub_020274E8(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc = Sav2_Misc_get(saveData);
    return sub_0202A9D8(misc);
}

void sub_020274F4(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc = Sav2_Misc_get(saveData);
    sub_0202A9C4(misc);
}

BOOL sub_02027500(SAVEDATA *saveData) {
    return sub_020274E4(saveData) != 0 && sub_020274E0(saveData) != 0;
}

BOOL sub_02027520(SAVEDATA *saveData) {
    return sub_02027544(saveData) >= 6;
}

void sub_02027534(void) {
    sub_02027190(_021D2228);
}

u32 sub_02027544(SAVEDATA *saveData) {
    return sub_02028C9C(sub_02028C70(saveData));
}

void sub_02027550(SAVEDATA *saveData, int a1) {
    sub_02027BDC(saveData, &saveData->unk_232CC, a1);
}

int sub_02027564(SAVEDATA *saveData) {
    int ret;

    if (saveData->unk_232CC.unk_8 == 1) {
        ret = sub_02028968(saveData, &saveData->unk_232CC);
    } else {
        ret = sub_02027C18(saveData, &saveData->unk_232CC);
    }
    if (!(ret == 0 || ret == 1)) {
        sub_02027CEC(saveData, &saveData->unk_232CC, ret);
    }
    return ret;
}

void sub_020275A4(SAVEDATA *saveData) {
    sub_02027D6C(saveData, &saveData->unk_232CC);
}

void sub_020275B4(SAVEDATA *saveData) {
#pragma unused(saveData)
}

void sub_020275B8(struct UnkStruct_2027744 *unk) {
#pragma unused(unk)
}

void sub_020275BC(struct UnkStruct_2027744 *unk) {
    unk->unk0 = FALSE;
    unk->unk4 = 0;
}

u16 sub_020275C4(SAVEDATA *saveData, const void *data, u32 size) {
#pragma unused(saveData)
    return GF_CalcCRC16(data, size);
}

u16 sub_020275D0(SAVEDATA *saveData, const void *data, u32 size) {
#pragma unused(saveData)
    return GF_CalcCRC16(data, size - sizeof(struct SavArrayFooter));
}
