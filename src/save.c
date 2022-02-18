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
    u32 unk_0;
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

struct UnkSavSub_232CC {
    int unk_0;
    int unk_4;
    int unk_8;
    int unk_C;
    int unk_10;
    u32 unk_14;
    u32 unk_18;
    u32 unk_1C;
    u32 unk_20;
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
    u32 unk_232F0;
    u32 unk_232F4;
    int boxModifiedFlags;
    u32 unk_232FC;
    u16 unk_23300;
    u16 unk_23302;
    u16 unk_23304;
    u16 unk_23306;
    u8 unk_23308[2];
    u16 unk_2330A;
}; // size=0x2330C

struct UnkStruct_2027744 {
    BOOL unk0;
    u32 unk4;
};

BOOL saveWritten;
SAVEDATA *_021D2228;

static u32 sub_020274E4(SAVEDATA *saveData);
static void sub_020274F4(SAVEDATA *saveData);
static u32 sub_02027544(SAVEDATA *saveData);
static void sub_020275B4(struct SaveChunkFooter *footer);
static void sub_020275B8(BOOL unk);
static void sub_020275BC(struct UnkStruct_2027744 *unk);
static u16 SavArray_CalcCRC16MinusFooter(SAVEDATA *saveData, const void *data, u32 size);
static u32 GetChunkOffsetFromCurrentSaveSlot(u32 slot, struct SaveSlotSpec *spec);
static struct SaveChunkFooter *sub_020275F4(SAVEDATA *saveData, void *data, int idx);
static BOOL sub_0202761C(SAVEDATA *saveData, void *data, int idx);
static void sub_0202768C(struct UnkStruct_2027744 *unk, SAVEDATA *saveData, void *data, int idx);
static void sub_020276C0(SAVEDATA *saveData, void *data, int idx);
static int sub_0202770C(u32 stat1, u32 stat2);
static u32 sub_02027744(struct UnkStruct_2027744 *first, struct UnkStruct_2027744 *second, u32 *ret1_p, u32 *ret2_p);
static void sub_020277BC(SAVEDATA *saveData, struct UnkStruct_2027744 *a1, struct UnkStruct_2027744 *a2, int a3);
static int sub_020277D4(SAVEDATA *saveData);
static void sub_020279EC(SAVEDATA *saveData, int *err1, int *err2);
static BOOL sub_02027ABC(u32 slot, struct SaveSlotSpec *spec, void *dest);
static BOOL Sav2_LoadDynamicRegion(SAVEDATA *saveData);
static int sub_02027B74(SAVEDATA *saveData, int idx, u8 slot);
static int sub_02027BAC(SAVEDATA *saveData, int idx, u8 slot);
static void sub_02027BDC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2);
static int sub_02027C18(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
static void sub_02027CEC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2);
static void sub_02027D6C(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
static int sub_02027DB4(SAVEDATA *saveData);
static int FlashClobberChunkFooter(SAVEDATA *saveData, int spec, int sector);
static u32 sub_02027E30(int idx);
static void SaveBlock2_InitSubstructs(struct SavArrayHeader *arr_hdr);
static void sub_02027EFC(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers);
static void Sav2_InitDynamicRegion_Internal(u8 *dynamic_region, struct SavArrayHeader *headers);
static void CreateChunkFooter(SAVEDATA *saveData, void *data, int idx, u32 size);
static BOOL ValidateChunk(SAVEDATA *saveData, void *data, int idx, u32 size);
static u32 sub_020280DC(void *data, u32 size);
static void sub_020286B4(SAVEDATA *saveData, int a1, u32 *a2, u32 *a3, u8 *a4);
static void sub_020286D4(SAVEDATA *saveData, int a1, u32 a2, u32 a3, u8 a4);
static BOOL SaveDetectFlash(void);
static s32 FlashWriteChunk(u32 offset, void *data, u32 size);
static BOOL FlashLoadChunk(u32 offset, void *data, u32 size);
static void FlashWriteCommandCallback(void *arg);
static s32 FlashWriteChunkInternal(u32 offset, void *data, u32 size);
static BOOL WaitFlashWrite(s32 lockId, int a1, int *a2);
static void SaveErrorHandling(s32 lockId, int code);
static int sub_02028968(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
static int sub_02028AB4(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC);
static int sub_02028BA8(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 a2);
static int sub_02028BF8(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 a2);
static u32 sub_02028C70(SAVEDATA *saveData);
static u32 sub_02028C9C(u32 flags);
static u32 sub_02028CD4(u32 flags, u8 last);

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
    ret->unk_23308[0] = 1;
    ret->unk_23308[1] = 1;

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
    saveData->unk_23308[0] = 1;
    saveData->unk_23308[1] = 1;
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

static u32 sub_020274E4(SAVEDATA *saveData) {
    return saveData->unk_00008;
}

BOOL sub_020274E8(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc = Sav2_Misc_get(saveData);
    return sub_0202A9D8(misc);
}

static void sub_020274F4(SAVEDATA *saveData) {
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

static u32 sub_02027544(SAVEDATA *saveData) {
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

static void sub_020275B4(struct SaveChunkFooter *footer) {
#pragma unused(footer)
}

static void sub_020275B8(BOOL unk) {
#pragma unused(unk)
}

static void sub_020275BC(struct UnkStruct_2027744 *unk) {
    unk->unk0 = FALSE;
    unk->unk4 = 0;
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

static struct SaveChunkFooter *sub_020275F4(SAVEDATA *saveData, void *data, int idx) {
    u8 *ret;
    struct SaveSlotSpec *spec;

    spec = &saveData->saveSlotSpecs[idx];
    ret = (u8 *)data + spec->offset;
    GF_ASSERT(spec->size != 0);
    return (struct SaveChunkFooter *)(ret + spec->size - sizeof(struct SaveChunkFooter));
}

static BOOL sub_0202761C(SAVEDATA *saveData, void *data, int idx) {
    struct SaveSlotSpec *spec;
    struct SaveChunkFooter *footer;
    u32 offset;

    spec = &saveData->saveSlotSpecs[idx];
    footer = sub_020275F4(saveData, data, idx);
    offset = spec->offset;
    sub_020275B4(footer);
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

static void sub_0202768C(struct UnkStruct_2027744 *unk, SAVEDATA *saveData, void *data, int idx) {
    struct SaveChunkFooter *footer;

    footer = sub_020275F4(saveData, data, idx);
    unk->unk0 = sub_0202761C(saveData, data, idx);
    if (unk->unk0) {
        unk->unk4 = footer->unk_0;
    } else {
        unk->unk4 = 0;
    }
}

static void sub_020276C0(SAVEDATA *saveData, void *data, int idx) {
    struct SaveSlotSpec *spec;
    struct SaveChunkFooter *footer;
    u32 offset;

    spec = &saveData->saveSlotSpecs[idx];
    footer = sub_020275F4(saveData, data, idx);
    offset = spec->offset;
    footer->unk_0 = saveData->unk_23010;
    footer->size = spec->size;
    footer->magic = SAVE_CHUNK_MAGIC;
    footer->slot = idx;
    footer->crc = SavArray_CalcCRC16MinusFooter(saveData, (u8 *)data + offset, spec->size);
    sub_020275B4(footer);
}

static int sub_0202770C(u32 stat1, u32 stat2) {
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

static u32 sub_02027744(struct UnkStruct_2027744 *first, struct UnkStruct_2027744 *second, u32 *ret1_p, u32 *ret2_p) {
    int r0;

    r0 = sub_0202770C(first->unk4, second->unk4);
    if (first->unk0 && second->unk0) {
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
    if (first->unk0 && !second->unk0) {
        *ret1_p = 0;
        *ret2_p = 2;
        return 1;
    }
    if (!first->unk0 && second->unk0) {
        *ret1_p = 1;
        *ret2_p = 2;
        return 1;
    }
    *ret1_p = 2;
    *ret2_p = 2;
    return 0;
}

static void sub_020277BC(SAVEDATA *saveData, struct UnkStruct_2027744 *a1, struct UnkStruct_2027744 *a2, int a3) {
#pragma unused(a2)
    saveData->unk_23010 = a1[a3].unk4;
    saveData->unk_2330A = a3;
}

static int sub_020277D4(SAVEDATA *saveData) {
    u8 *data1;
    u8 *data2;

    struct UnkStruct_2027744 sp24[2];
    struct UnkStruct_2027744 sp14[2];
    u32 sp10;
    u32 sp0C;
    u32 sp08;
    u32 sp04;
    u32 sp00;
    u32 r7;
    u32 r6;
    u32 r4;

    data1 = AllocFromHeapAtEnd(3, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    data2 = AllocFromHeapAtEnd(3, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    if (FlashLoadChunk(0 * 0x40000, data1, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE)) {
        sub_0202768C(&sp24[0], saveData, data1, 0);
        sub_0202768C(&sp14[0], saveData, data1, 1);
    } else {
        sub_020275BC(&sp24[0]);
        sub_020275BC(&sp14[0]);
    }
    if (FlashLoadChunk(1 * 0x40000, data2, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE)) {
        sub_0202768C(&sp24[1], saveData, data2, 0);
        sub_0202768C(&sp14[1], saveData, data2, 1);
    } else {
        sub_020275BC(&sp24[1]);
        sub_020275BC(&sp14[1]);
    }
    FreeToHeap(data1);
    FreeToHeap(data2);

    r7 = sub_02027744(&sp24[0], &sp24[1], &sp10, &sp08);
    sp00 = sp08;
    r4 = sp10;
    r6 = sub_02027744(&sp14[0], &sp14[1], &sp0C, &sp04);

    sub_020275B8(sp24[0].unk0);
    sub_020275B8(sp24[1].unk0);
    sub_020275B8(sp14[0].unk0);
    sub_020275B8(sp14[1].unk0);

    if (r7 == 0 && r6 == 0) {
        return 0;
    }

    if (r7 == 0 || r6 == 0) {
        return 3;
    }

    GF_ASSERT(r4 != 2);

    if (r7 == 2 && r6 == 2) {
        if (sp24[r4].unk4 == sp14[r4].unk4) {
            sub_020277BC(saveData, sp24, sp14, r4);
            saveData->unk_23308[0] = 0;
            saveData->unk_23308[1] = 0;
            return 1;
        }
        if (sp24[sp00].unk4 != sp14[sp00].unk4) {
            return 3;
        }
        sub_020277BC(saveData, sp24, sp14, sp00);
        return 2;
    }
    if (r7 == 1 && r6 == 2) {
        if (sp24[r4].unk4 == sp14[r4].unk4) {
            sub_020277BC(saveData, sp24, sp14, r4);
            return 2;
        }
        return 3;
    }
    if (r7 == 2 && r6 == 1) {
        if (sp24[r4].unk4 == sp14[r4].unk4) {
            sub_020277BC(saveData, sp24, sp14, r4);
            return 1;
        }
        if (sp00 == 2) {
            return 3;
        }
        if (sp24[sp00].unk4 == sp14[sp00].unk4) {
            sub_020277BC(saveData, sp24, sp14, sp00);
            return 2;
        }
        return 3;
    }
    if (r7 == 1 && r6 == 1) {
        if (sp10 == sp0C) {
            GF_ASSERT(sp24[sp10].unk4 == sp14[sp0C].unk4);
            sub_020277BC(saveData, sp24, sp14, sp10);
            saveData->unk_23308[sp10] = 0;
            return 1;
        }
    }
    return 3;
}

static void sub_020279EC(SAVEDATA *saveData, int *err1, int *err2) {
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
    if (sub_020274E8(saveData)) {
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

static BOOL sub_02027ABC(u32 slot, struct SaveSlotSpec *spec, void *dest) {
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
        if (!sub_02027ABC(saveData->unk_2330A, &saveData->saveSlotSpecs[i], saveData->dynamic_region)) {
            return FALSE;
        }
        if (!sub_0202761C(saveData, saveData->dynamic_region, i)) {
            return FALSE;
        }
    }
    for (i = 0; i < SAVE_BLOCK_NUM; i++) {
        saveData->arrayHeaders[i].crc = GF_CalcCRC16(SavArray_get(saveData, i), saveData->arrayHeaders[i].size);
    }
    pc_offs = saveData->saveSlotSpecs[1].offset;
    pc_size = sub_02027164() * sub_0202716C();
    saveData->unk_23300 = GF_CalcCRC16(data + pc_offs, pc_size);
    sub_020310A0(saveData);
    sub_0202C6FC(saveData);
    return TRUE;
}

static int sub_02027B74(SAVEDATA *saveData, int idx, u8 slot) {
    struct SaveSlotSpec *spec;

    spec = &saveData->saveSlotSpecs[idx];
    sub_020276C0(saveData, saveData->dynamic_region, idx);
    return FlashWriteChunkInternal(GetChunkOffsetFromCurrentSaveSlot(slot, spec), saveData->dynamic_region + spec->offset, spec->size - sizeof(struct SaveChunkFooter));
}

static int sub_02027BAC(SAVEDATA *saveData, int idx, u8 slot) {
    struct SaveSlotSpec *spec;
    u32 size;

    spec = &saveData->saveSlotSpecs[idx];
    size = spec->size;
    return FlashWriteChunkInternal(GetChunkOffsetFromCurrentSaveSlot(slot, spec) + size - sizeof(struct SaveChunkFooter), saveData->dynamic_region + spec->offset + size - sizeof(struct SaveChunkFooter), sizeof(struct SaveChunkFooter));
}

static void sub_02027BDC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2) {
    sub_0202C714(saveData);
    sub_02031084(saveData);

    unk232CC->unk_14 = 0;
    unk232CC->unk_20 = 0;
    unk232CC->unk_0 = 0;
    unk232CC->unk_1C = 0;
    unk232CC->unk_0 = 1;
    unk232CC->unk_18 = saveData->unk_23010;
    saveData->unk_23010++;
    unk232CC->unk_4 = 0;
    unk232CC->unk_8 = 0;
    unk232CC->unk_C = 2;
    sub_0201A4BC(1);
}

static int sub_02027C18(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC) {
    int sp0;
    switch (unk232CC->unk_14) {
    case 0:
        unk232CC->unk_10 = sub_02027B74(saveData, unk232CC->unk_8, saveData->unk_2330A == 0);
        unk232CC->unk_1C = 1;
        unk232CC->unk_14++;
        // fallthrough
    case 1:
        if (!WaitFlashWrite(unk232CC->unk_10, unk232CC->unk_1C, &sp0)) {
            break;
        }
        unk232CC->unk_1C = 0;
        if (!sp0) {
            return 3;
        }
        unk232CC->unk_14++;
        if (unk232CC->unk_8 + 1 == unk232CC->unk_C) {
            return 1;
        }
        // fallthrough
    case 2:
        unk232CC->unk_10 = sub_02027BAC(saveData, unk232CC->unk_8, saveData->unk_2330A == 0);
        unk232CC->unk_1C = 1;
        unk232CC->unk_14++;
        // fallthrough
    case 3:
        if (!WaitFlashWrite(unk232CC->unk_10, unk232CC->unk_1C, &sp0)) {
            break;
        }
        unk232CC->unk_1C = 0;
        if (!sp0) {
            return 3;
        }
        if (++unk232CC->unk_8 == unk232CC->unk_C) {
            return 2;
        }
        unk232CC->unk_14 = 0;
        break;
    }
    return 0;
}

static void sub_02027CEC(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC, int a2) {
    saveData->unk_23304 = 0;
    saveData->unk_23306 = 0;
    if (a2 == 3) {
        if (unk232CC->unk_0) {
            saveData->unk_23010 = unk232CC->unk_18;
        }
    } else {
        saveData->boxModifiedFlags = sub_02027170(saveData);
        saveData->unk_23300 = saveData->unk_23302;
        sub_02027180(saveData);
        saveData->unk_23308[saveData->unk_2330A == 0] = 0;
        saveData->unk_2330A = saveData->unk_2330A == 0;
        saveData->unk_00004 = 1;
        saveData->unk_00008 = 0;
    }
    sub_0201A4CC(1);
}

static void sub_02027D6C(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC) {
    if (unk232CC->unk_0) {
        saveData->unk_23010 = unk232CC->unk_18;
    }
    if (!CARD_TryWaitBackupAsync()) {
        CARD_CancelBackupAsync();
    }
    if (unk232CC->unk_1C) {
        CARD_UnlockBackup(unk232CC->unk_10);
        OS_ReleaseLockID(unk232CC->unk_10);
        unk232CC->unk_1C = 0;
    }
    sub_0201A4CC(1);
}

static int sub_02027DB4(SAVEDATA *saveData) {
    struct UnkSavSub_232CC sp0;
    int ret;

    sub_02027BDC(saveData, &sp0, 2);
    do {
        if (sp0.unk_8 != 1) {
            ret = sub_02027C18(saveData, &sp0);
        } else {
            ret = sub_02028968(saveData, &sp0);
        }
    } while (ret == 0 || ret == 1);
    sub_02027CEC(saveData, &sp0, ret);
    return ret;
}

static int FlashClobberChunkFooter(SAVEDATA *saveData, int spec, int sector) {
    struct SaveChunkFooter sp0;
    struct SaveSlotSpec *slotSpec;

    slotSpec = &saveData->saveSlotSpecs[spec];
    MI_CpuFill8(&sp0, 0xFF, sizeof(struct SaveChunkFooter));
    return FlashWriteChunk(GetChunkOffsetFromCurrentSaveSlot(sector, slotSpec) + slotSpec->size - sizeof(struct SaveChunkFooter), &sp0, sizeof(struct SaveChunkFooter));
}

static u32 sub_02027E30(int idx) {
    u32 size;
    const struct SaveChunkHeader *hdr;

    hdr = _020F64C4;
    GF_ASSERT(idx < _020F6460);
    size = hdr[idx].sizeFunc();
    size = ((size + 3) & ~3) + 4;
    return size;
}

static void SaveBlock2_InitSubstructs(struct SavArrayHeader *arr_hdr) {
    int i;
    const struct SaveChunkHeader *hdr;
    int adrs;

    hdr = _020F64C4;
    adrs = 0;
    GF_ASSERT(_020F6460 == SAVE_BLOCK_NUM);
    for (i = 0; i < _020F6460; i++) {
        GF_ASSERT(i == hdr[i].id);
        arr_hdr[i].id = hdr[i].id;
        arr_hdr[i].size = sub_02027E30(i);
        arr_hdr[i].offset = adrs;
        arr_hdr[i].crc = 0;
        arr_hdr[i].slot = hdr[i].block;
        adrs += arr_hdr[i].size;
        if (i == _020F6460 - 1 || hdr[i].block != hdr[i + 1].block) {
            adrs += sizeof(struct SaveChunkFooter);
            if (hdr[i].block != hdr[i + 1].block && i + 1 < _020F6460 && (adrs % 0x100) != 0) {
                adrs += 0x100 - (adrs % 0x100);
            }
        }
    }
    GF_ASSERT(adrs <= SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
}

static void sub_02027EFC(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers) {
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
        for (; i == headers[j].slot && j < _020F6460; j++) {
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

    chunkHeaders = _020F64C4;
    MI_CpuClearFast(dynamic_region, SAVE_PAGE_MAX * SAVE_SECTOR_SIZE);
    for (i = 0; i < _020F6460; i++) {
        adrs = headers[i].offset;
        ptr = dynamic_region + adrs;
        MI_CpuClearFast(ptr, headers[i].size);
        chunkHeaders[i].initFunc(ptr);
    }
}

void sub_02027FFC(SAVEDATA *saveData) {
    const struct ExtraSaveChunkHeader *chunkHeaders;
    int i;
    void *data;
    int status;

    chunkHeaders = _020F6464;
    if (sub_020274E8(saveData) == 1) {
        return;
    }

    for (i = 0; i < _020F645C; i++) {
        if (chunkHeaders[i].id != 0) {
            data = ReadExtraSaveChunk(saveData, 3, chunkHeaders[i].id, &status);
            GF_ASSERT(data != NULL);
            MI_CpuFill8(data, 0, chunkHeaders[i].sizeFunc());
            chunkHeaders[i].initFunc(data);
            WriteExtraSaveChunk(saveData, chunkHeaders[i].id, data);
            FreeToHeap(data);
        }
    }

    sub_020274F4(saveData);
}

static void CreateChunkFooter(SAVEDATA *saveData, void *data, int idx, u32 size) {
    struct SavArrayFooter *footer;

    footer = (struct SavArrayFooter *)((u8 *)data + size);

    footer->magic = SAVE_CHUNK_MAGIC;
    footer->saveno = saveData->unk_232F4 + 1;
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

static u32 sub_020280DC(void *data, u32 size) {
    struct SavArrayFooter *footer;

    footer = (struct SavArrayFooter *)((u8 *)data + size);

    return footer->saveno;
}

int WriteExtraSaveChunk(SAVEDATA *saveData, int idx, void *data) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 size;
    int ret;

    sub_0201A4BC(1);
    GF_ASSERT(idx < _020F645C);
    hdr = &_020F6464[idx];
    GF_ASSERT(hdr->id == idx);
    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    if (saveData->unk_232F0 == 1) {
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
        sub_0201A4CC(1);
        return 2;
    }
    sub_0201A4CC(1);
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

    sub_0201A4BC(1);
    GF_ASSERT(idx < _020F645C);
    hdr = &_020F6464[idx];
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
        sub_0201A4CC(1);
        return 2;
    }
    sub_0201A4CC(1);
    return 3;
}

void *ReadExtraSaveChunk(SAVEDATA *saveData, HeapID heapId, int idx, int *ret_p) {
    const struct ExtraSaveChunkHeader *hdr;
    u32 size;
    void *ret;
    BOOL valid1;
    BOOL valid2;
    u32 saveno1;
    u32 saveno2;

    GF_ASSERT(idx < _020F645C);
    hdr = &_020F6464[idx];
    GF_ASSERT(hdr->id == idx);

    size = hdr->sizeFunc() + sizeof(struct SavArrayFooter);
    ret = AllocFromHeap(heapId, size);
    FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
    valid1 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    saveno1 = sub_020280DC(ret, hdr->sizeFunc());
    FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
    valid2 = ValidateChunk(saveData, ret, idx, hdr->sizeFunc());
    saveno2 = sub_020280DC(ret, hdr->sizeFunc());

    *ret_p = 1;
    if (valid1 == TRUE && valid2 == FALSE) {
        saveData->unk_232F0 = 0;
        saveData->unk_232F4 = saveno1;
        FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == FALSE && valid2 == TRUE) {
        saveData->unk_232F0 = 1;
        saveData->unk_232F4 = saveno2;
        FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
        return ret;
    }
    if (valid1 == TRUE && valid2 == TRUE) {
        if (sub_0202770C(saveno1, saveno2) != -1) {
            saveData->unk_232F0 = 0;
            saveData->unk_232F4 = saveno1;
            FlashLoadChunk(hdr->sector * SAVE_SECTOR_SIZE, ret, size);
            return ret;
        } else {
            saveData->unk_232F0 = 1;
            saveData->unk_232F4 = saveno2;
            FlashLoadChunk((hdr->sector + 64) * SAVE_SECTOR_SIZE, ret, size);
            return ret;
        }
    }
    *ret_p = 2;
    saveData->unk_232F0 = 0;
    saveData->unk_232F4 = 0;
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

    GF_ASSERT(idx < _020F645C);
    GF_ASSERT(idx != 0);
    hdr = &_020F6464[idx];
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
        FreeToHeap(_021D2228);
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

static BOOL WaitFlashWrite(s32 lockId, int a1, int *a2) {
    if (saveWritten == TRUE) {
        if (!a1) {
            return TRUE;
        }
        switch (CARD_GetResultCode()) {
        case CARD_RESULT_SUCCESS:
            *a2 = TRUE;
            break;
        case CARD_RESULT_TIMEOUT:
        default:
            *a2 = FALSE;
            SaveErrorHandling(lockId, 0);
        case CARD_RESULT_NO_RESPONSE:
            *a2 = FALSE;
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
    FreeToHeap(_021D2228);
    ShowSaveDataWriteError(1, code);
}

BOOL SaveSubstruct_AssertCRC(int idx) {
    u8 *data;
    int size;
    u16 *data_u16;
    u16 crc;

    data = SavArray_get(SaveBlock2_get(), idx);
    data_u16 = (u16 *)data;
    size = sub_02027E30(idx) - 4;
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
    size = sub_02027E30(idx) - 4;
    crc = GF_CalcCRC16(data, size);
    data_u16[size / 2] = crc;
}

static int sub_02028968(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC) {
    u32 r7;
    int r0;
    int sp0;
    void *data;
    switch (unk232CC->unk_14) {
    case 0:
        saveData->unk_232FC = sub_02028C70(saveData);
        saveData->unk_23304 = sub_02028C9C(saveData->unk_232FC);
        saveData->unk_23306 = 0;
        r7 = sub_02027164() * sub_0202716C();
        saveData->unk_23302 = GF_CalcCRC16(SavArray_get(saveData, SAVE_PCSTORAGE), r7);
        if (!saveData->unk_23304) {
            GF_ASSERT(saveData->unk_23302 == saveData->unk_23300);
            sub_020271A0(saveData);
            if (saveData->unk_23302 != saveData->unk_23300) {
                saveData->unk_23304 = sub_0202716C();
                saveData->unk_232FC = BOX_ALL_MODIFIED_FLAG;
                sub_02027190(saveData);
            }
        }
        unk232CC->unk_20 = 0;
        data = saveData->dynamic_region;
        sub_020276C0(saveData, data, unk232CC->unk_8);
        sub_020275F4(saveData, data, unk232CC->unk_8);
        unk232CC->unk_14++;
        // fallthrough
    case 1:
        r0 = sub_02028AB4(saveData, unk232CC);
        if (r0 == 0) {
            return 3;
        }
        if (r0 == 1) {
            unk232CC->unk_14++;
            if (unk232CC->unk_8 + 1 == unk232CC->unk_C) {
                return 1;
            }
        }
        break;
    case 2:
        unk232CC->unk_10 = sub_02027BAC(saveData, unk232CC->unk_8, saveData->unk_2330A == 0);
        unk232CC->unk_1C = 1;
        unk232CC->unk_14++;
        // fallthrough
    case 3:
        if (WaitFlashWrite(unk232CC->unk_10, unk232CC->unk_1C, &sp0)) {
            unk232CC->unk_1C = 0;
            if (!sp0) {
                return 3;
            }
            unk232CC->unk_8++;
            if (unk232CC->unk_8 == unk232CC->unk_C) {
                return 2;
            }
            unk232CC->unk_14 = 0;
        }
        break;
    }
    return 0;
}

static int sub_02028AB4(SAVEDATA *saveData, struct UnkSavSub_232CC *unk232CC) {
    int sp0;

    switch (unk232CC->unk_20) {
    case 0:
        if (saveData->unk_23306 >= saveData->unk_23304) {
            unk232CC->unk_20 = 3;
        } else {
            unk232CC->unk_20++;
        }
        break;
    case 1:
        unk232CC->unk_10 = sub_02028BA8(saveData, &saveData->saveSlotSpecs[unk232CC->unk_8], saveData->unk_2330A == 0);
        unk232CC->unk_1C = 1;
        unk232CC->unk_20++;
        // fallthrough
    case 2:
        if (WaitFlashWrite(unk232CC->unk_10, unk232CC->unk_1C, &sp0)) {
            unk232CC->unk_1C = 0;
            if (!sp0) {
                return 0;
            }
            saveData->unk_23306++;
            unk232CC->unk_20 = 0;
        }
        break;
    case 3:
        unk232CC->unk_10 = sub_02028BF8(saveData, &saveData->saveSlotSpecs[unk232CC->unk_8], saveData->unk_2330A == 0);
        unk232CC->unk_1C = 1;
        unk232CC->unk_20++;
        // fallthrough
    case 4:
        if (WaitFlashWrite(unk232CC->unk_10, unk232CC->unk_1C, &sp0)) {
            unk232CC->unk_1C = 0;
            unk232CC->unk_20 = 0;
            if (!sp0) {
                return 0;
            }
            return 1;
        }
        break;
    }
    return 2;
}

static int sub_02028BA8(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 a2) {
    u32 boxno;
    u32 box_size;
    u32 offset;

    box_size = sub_02027164();
    offset = GetChunkOffsetFromCurrentSaveSlot(a2, spec);
    boxno = sub_02028CD4(saveData->unk_232FC, saveData->unk_23306);
    GF_ASSERT(boxno != 0xFF);
    return FlashWriteChunkInternal(offset + box_size * boxno, saveData->dynamic_region + spec->offset + box_size * boxno, box_size);
}

static int sub_02028BF8(SAVEDATA *saveData, struct SaveSlotSpec *spec, u8 a2) {
    u32 sector_size;
    struct SaveChunkFooter *footer;
    u32 spec_offset;
    void *sp8;
    u32 offset;
    void *data;
    u32 pc_size;
    u16 crc;

    pc_size = sub_02027164() * sub_0202716C();
    offset = GetChunkOffsetFromCurrentSaveSlot(a2, spec);
    data = saveData->dynamic_region + spec->offset;
    sector_size = spec->size - sizeof(struct SaveChunkFooter);
    GF_ASSERT(sector_size != 0);
    sp8 = saveData->dynamic_region;
    spec_offset = spec->offset;
    footer = sub_020275F4(saveData, sp8, 1);
    crc = SavArray_CalcCRC16MinusFooter(saveData, (u8 *)sp8 + spec_offset, spec->size);
    GF_ASSERT(crc == footer->crc);
    return FlashWriteChunkInternal(offset + pc_size, data + pc_size, sector_size - pc_size);
}

static u32 sub_02028C70(SAVEDATA *saveData) {
    u32 ret;

    ret = sub_02027170(saveData);
    ret |= saveData->boxModifiedFlags;
    if (saveData->unk_23308[0] || saveData->unk_23308[1]) {
        ret = BOX_ALL_MODIFIED_FLAG;
    }
    return ret;
}

static u32 sub_02028C9C(u32 flags) {
    u8 i, n;
    u32 t;

    n = 0;
    t = sub_0202716C();
    for (i = 0; i < t; i++) {
        if (flags & 1) {
            n++;
        }
        flags >>= 1;
        flags &= BOX_ALL_MODIFIED_FLAG;
    }
    return n;
}

static u32 sub_02028CD4(u32 flags, u8 last) {
    u8 i, n;
    u32 t;

    n = 0;
    t = sub_0202716C();
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
