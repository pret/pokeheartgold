#include "save.h"
#include "heap.h"

typedef u32 (*SAVESIZEFN)(void);
typedef void (*SAVEINITFN)(void *);

struct SaveChunkHeader {
    int id;
    u32 block;
    SAVESIZEFN sizeFunc;
    SAVEINITFN sizeInit;
};

struct ExtraSaveChunkHeader {
    int id;
    u32 sector;
    SAVESIZEFN sizeFunc;
    SAVEINITFN sizeInit;
};

struct SavArrayHeader {
    int id;
    u32 size;
    u32 offset;
    u16 field_C;
    u16 field_E;
}; // size=0x10

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
    u8 dynamic_region[0x23000];
    u32 unk_23010;
    struct SavArrayHeader arrayHeaders[SAVE_BLOCK_NUM]; // 23014
    struct SaveSlotSpec saveSlotSpecs[2]; // 232B4
    struct UnkSavSub_232CC unk_232CC;
    int unk_232F8;
    u8 filler_232FC[4];
    u16 unk_23300;
    u8 unk_23302[6];
    u8 unk_23308;
    u8 unk_23309;
    u16 unk_2330A;
}; // size=0x2330C

BOOL saveWritten;
SAVEDATA *_021D2228;

extern const struct SaveChunkHeader _020F64C4[];
extern const int _020F6460;

extern const struct ExtraSaveChunkHeader _020F6464[];
extern const int _020F645C;

BOOL SaveDetectFlash(void);
void SaveBlock2_InitSubstructs(struct SavArrayHeader *headers);
void sub_02027EFC(struct SaveSlotSpec *slotSpecs, struct SavArrayHeader *headers);
int sub_020277D4(SAVEDATA *saveData);
void Sav2_LoadDynamicRegion(SAVEDATA *saveData);
extern u32 sub_02027170(SAVEDATA *saveData);
void sub_020279EC(SAVEDATA *saveData, int *err1, int *err2);
void Sav2_InitDynamicRegion(SAVEDATA *saveData);

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
            ret->unk_232F8 = sub_02027170(ret);
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
