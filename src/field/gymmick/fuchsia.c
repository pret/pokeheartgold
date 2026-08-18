#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"
#include "unk_02005D10.h"

typedef struct FuchsiaGymmickWallData {
    int unk_00;
    int unk_04;
    u16 unk_08;
    s8 unk_0A;
    s8 unk_0B;
    s8 unk_0C[6];
} FuchsiaGymmickWallData;

typedef struct FuchsiaGymmickLocalData_Sub00D4_Sub004 {
    BOOL unk_00;
    Field3DModelAnimation unk_04[4];
    Field3dObject unk_54;
} FuchsiaGymmickLocalData_Sub00D4_Sub004;

typedef struct FuchsiaGymmickLocalData_Sub00D4 {
    int unk_000;
    FuchsiaGymmickLocalData_Sub00D4_Sub004 unk_004[3];
} FuchsiaGymmickLocalData_Sub00D4;

typedef struct FuchsiaGymmickLocalData_Sub1DB4 {
    u16 unk_0;
    s16 unk_2;
    FuchsiaGymmickLocalData_Sub00D4_Sub004 *unk_4;
    SysTask *unk_8;
} FuchsiaGymmickLocalData_Sub1DB4; // size: 0xC

typedef struct FuchsiaGymmickLocalData {
    NNSFndAllocator unk_0000;
    Field3dModel unk_0010[12];
    int unk_00D0;
    FuchsiaGymmickLocalData_Sub00D4 unk_00D4[12];
    FuchsiaGymmickLocalData_Sub1DB4 unk_1DB4[3];
} FuchsiaGymmickLocalData; // size: 0x1DD8

void ov04_02256734(SysTask *sysTask, void *data);
void ov04_02256758(FuchsiaGymmickLocalData *localData, enum HeapID heapID);
void ov04_0225686C(FuchsiaGymmickLocalData *localData);
s16 ov04_022568F0(int x, int z);
BOOL ov04_02256920(FuchsiaGymmickLocalData_Sub1DB4 *a0, s16 a1);
void ov04_02256950(FuchsiaGymmickLocalData *localData, FieldSystem *fieldSystem, u8 a2);
BOOL ov04_02256A54(Field3DModelAnimation *anim, u8 num);
FuchsiaGymmickLocalData_Sub00D4_Sub004 *ov04_02256A90(FuchsiaGymmickLocalData_Sub00D4 *a0);
void ov04_02256AC4(FuchsiaGymmickLocalData *localData, const u8 a1);
void ov04_02256B3C(FuchsiaGymmickLocalData_Sub1DB4 *a0);

static const FuchsiaGymmickWallData ov04_0225766C[] = {
    {
     .unk_00 = 4,
     .unk_04 = 4,
     .unk_08 = 0,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 1, 2, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 5,
     .unk_04 = 4,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 0, 2, 3, -1, -1, -1 },
     },
    {
     .unk_00 = 6,
     .unk_04 = 4,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 1, 3, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 4,
     .unk_08 = 9,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 1, 2, 5, -1, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 4,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 7, -1, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 5,
     .unk_08 = 6,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 3, 6, 8, -1, -1, -1 },
     },
    {
     .unk_00 = 8,
     .unk_04 = 5,
     .unk_08 = 0,
     .unk_0A = -1,
     .unk_0B = 0,
     .unk_0C = { 3, 5, 8, -1, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 5,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 4, 9, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 6,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 3, 5, 6, 13, 15, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 6,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 4, 7, 14, 16, -1, -1 },
     },
    {
     .unk_00 = 1,
     .unk_04 = 7,
     .unk_08 = 0,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 11, 12, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 2,
     .unk_04 = 7,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 10, 11, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 3,
     .unk_04 = 7,
     .unk_08 = 0,
     .unk_0A = -1,
     .unk_0B = 0,
     .unk_0C = { 10, 11, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 7,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 5, 13, 15, 17, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 7,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 7, 16, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 8,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 8, 13, 17, 18, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 8,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = -1,
     .unk_0C = { 9, 14, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 9,
     .unk_08 = 10,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 13, 18, 19, -1, -1, -1 },
     },
    {
     .unk_00 = 8,
     .unk_04 = 9,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 15, 17, 19, 20, -1, -1 },
     },
    {
     .unk_00 = 9,
     .unk_04 = 9,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 17, 18, 20, 25, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 9,
     .unk_08 = 9,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 18, 19, 25, 27, -1, -1 },
     },
    {
     .unk_00 = 1,
     .unk_04 = 10,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 26, -1, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 10,
     .unk_08 = 0,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 23, 24, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 5,
     .unk_04 = 10,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 22, 24, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 6,
     .unk_04 = 10,
     .unk_08 = 0,
     .unk_0A = -1,
     .unk_0B = 0,
     .unk_0C = { 22, 23, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 10,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 19, 20, 27, 28, -1, -1 },
     },
    {
     .unk_00 = 1,
     .unk_04 = 11,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = -1,
     .unk_0C = { 21, -1, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 11,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 20, 25, 28, 35, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 12,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 25, 27, 35, 37, 34, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 13,
     .unk_08 = 8,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 26, 30, 31, -1, -1, -1 },
     },
    {
     .unk_00 = 5,
     .unk_04 = 13,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 36, 29, 31, 32, 32, -1 },
     },
    {
     .unk_00 = 6,
     .unk_04 = 13,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 29, 30, 32, 33, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 13,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 30, 31, 33, 34, -1, -1 },
     },
    {
     .unk_00 = 8,
     .unk_04 = 13,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 31, 32, 34, 35, -1, -1 },
     },
    {
     .unk_00 = 9,
     .unk_04 = 13,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 32, 33, 35, 28, 37, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 13,
     .unk_08 = 7,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 27, 28, 37, 34, -1, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 14,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = -1,
     .unk_0C = { 29, 30, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 14,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = -1,
     .unk_0C = { 28, 34, 35, 37, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 15,
     .unk_08 = 2,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 39, 44, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 16,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 38, 44, 46, -1, -1, -1 },
     },
    {
     .unk_00 = 2,
     .unk_04 = 17,
     .unk_08 = 0,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 41, 42, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 3,
     .unk_04 = 17,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 40, 42, 43, 45, -1, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 17,
     .unk_08 = 4,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 40, 41, 43, 45, -1, -1 },
     },
    {
     .unk_00 = 5,
     .unk_04 = 17,
     .unk_08 = 0,
     .unk_0A = -1,
     .unk_0B = 0,
     .unk_0C = { 41, 45, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 17,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 38, 39, 46, 48, -1, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 18,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 41, 43, 42, 47, 52, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 18,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 39, 44, 48, 59, -1, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 19,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 42, 45, 51, 52, 53, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 19,
     .unk_08 = 3,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 44, 46, 59, 58, -1, -1 },
     },
    {
     .unk_00 = 1,
     .unk_04 = 20,
     .unk_08 = 0,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 50, 51, -1, -1, -1, -1 },
     },
    {
     .unk_00 = 2,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 49, 51, 52, -1, -1, -1 },
     },
    {
     .unk_00 = 3,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 49, 50, 52, 53, 47, -1 },
     },
    {
     .unk_00 = 4,
     .unk_04 = 20,
     .unk_08 = 5,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 50, 51, 45, 47, 53, 54 },
     },
    {
     .unk_00 = 5,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 47, 51, 52, 54, 55, -1 },
     },
    {
     .unk_00 = 6,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 52, 53, 55, 56, -1, -1 },
     },
    {
     .unk_00 = 7,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 53, 54, 56, 57, -1, -1 },
     },
    {
     .unk_00 = 8,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 54, 55, 57, 58, 59, -1 },
     },
    {
     .unk_00 = 9,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 55, 56, 58, 59, -1, -1 },
     },
    {
     .unk_00 = 10,
     .unk_04 = 20,
     .unk_08 = 1,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 56, 57, 59, 48, -1, -1 },
     },
    {
     .unk_00 = 11,
     .unk_04 = 20,
     .unk_08 = 11,
     .unk_0A = 0,
     .unk_0B = 0,
     .unk_0C = { 58, 48, 57, 46, -1, -1 },
     },
};

void GymmickInit_Fuchsia(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_FUCHSIA);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FuchsiaGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(FuchsiaGymmickLocalData));
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    ov04_02256758(localData, HEAP_ID_FIELD1);
    for (int i = 0; i < 3; ++i) {
        localData->unk_1DB4[i].unk_2 = -1;
    }
}

void GymmickFree_Fuchsia(FieldSystem *fieldSystem) {
    u8 i; // declaration here is required to match
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    ov04_0225686C(localData);
    for (i = 0; i < 3; ++i) {
        if (localData->unk_1DB4[i].unk_0 != 0) {
            SysTask_Destroy(localData->unk_1DB4[i].unk_8);
        }
    }
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void ov04_022566EC(FieldSystem *fieldSystem, int x, int z) {
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    s16 r4 = ov04_022568F0(x, z);
    if (r4 < 0) {
        PlaySE(SEQ_SE_DP_WALL_HIT);
        return;
    }
    if (!ov04_02256920(localData->unk_1DB4, r4)) {
        ov04_02256950(localData, fieldSystem, r4);
        PlaySE(SEQ_SE_GS_TOUMEINAKABEHIT);
    }
}

void ov04_02256734(SysTask *sysTask, void *data) {
    FuchsiaGymmickLocalData_Sub1DB4 *r5 = data;
    FuchsiaGymmickLocalData_Sub00D4_Sub004 *r4 = r5->unk_4;
    if (ov04_02256A54(r4->unk_04, 4)) {
        ov04_02256B3C(r5);
    } else {
        Field3dObject_Draw(&r4->unk_54);
    }
}

void ov04_02256758(FuchsiaGymmickLocalData *localData, enum HeapID heapID) {
    u8 i;

    HeapExp_FndInitAllocator(&localData->unk_0000, heapID, 0x20);

    for (i = 0; i < 12; ++i) {
        FuchsiaGymmickLocalData_Sub00D4_Sub004 *sp20;
        u8 j;

        localData->unk_00D4[i].unk_000 = 0;
        Field3dModel_LoadFromFilesystem(&localData->unk_0010[i], NARC_a_2_4_6, i, heapID);
        for (j = 0; j < 3; ++j) {
            u8 k;

            sp20 = &localData->unk_00D4[i].unk_004[j];
            sp20->unk_00 = FALSE;
            for (k = 0; k < 4; ++k) {
                Field3dModelAnimation_LoadFromFilesystem(&sp20->unk_04[k], &localData->unk_0010[i], NARC_a_2_4_6, 12 + k * 12 + i, heapID, &localData->unk_0000);
            }
            Field3dObject_InitFromModel(&sp20->unk_54, &localData->unk_0010[i]);
            for (k = 0; k < 4; ++k) {
                Field3dObject_AddAnimation(&sp20->unk_54, &sp20->unk_04[k]);
                Field3dModelAnimation_FrameSet(&sp20->unk_04[k], 0);
            }
            VecFx32 sp28 = { 0, 0, 0 };
            Field3dObject_SetPosEx(&sp20->unk_54, sp28.x, sp28.y, sp28.z);
            Field3dObject_SetActiveFlag(&sp20->unk_54, FALSE);
        }
    }
}

void ov04_0225686C(FuchsiaGymmickLocalData *localData) {
    u8 i;
    for (i = 0; i < 12; ++i) {
        u8 j;
        FuchsiaGymmickLocalData_Sub00D4_Sub004 *sp0;
        Field3dModel_Unload(&localData->unk_0010[i]);
        for (j = 0; j < 3; ++j) {
            u8 k;
            sp0 = &localData->unk_00D4[i].unk_004[j];
            for (k = 0; k < 4; ++k) {
                Field3dModelAnimation_Unload(&sp0->unk_04[k], &localData->unk_0000);
            }
        }
    }
}

s16 ov04_022568F0(int x, int z) {
    for (s16 i = 0; i < 60; ++i) {
        if (x == ov04_0225766C[i].unk_00 && z == ov04_0225766C[i].unk_04) {
            return i;
        }
    }

    return -1;
}

BOOL ov04_02256920(FuchsiaGymmickLocalData_Sub1DB4 *a0, s16 a1) {
    for (u8 i = 0; i < 3; ++i) {
        if (a0[i].unk_0 && a0[i].unk_2 == a1) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov04_02256950(FuchsiaGymmickLocalData *localData, FieldSystem *fieldSystem, u8 a2) {
    u8 i;
    u8 r2;
    FuchsiaGymmickLocalData_Sub1DB4 *r5 = &localData->unk_1DB4[localData->unk_00D0];

    if (r5->unk_0) {
        GF_ASSERT(FALSE);
        return;
    }
    ov04_02256AC4(localData, a2);
    r5->unk_0 = TRUE;
    r5->unk_2 = a2;
    r2 = ov04_0225766C[a2].unk_08;
    r5->unk_4 = ov04_02256A90(&localData->unk_00D4[r2]);
    r5->unk_8 = SysTask_CreateOnMainQueue(ov04_02256734, r5, 0);
    Field3dObject_SetActiveFlag(&r5->unk_4->unk_54, TRUE);
    VecFx32 sp4 = { 0, 0, 0 };
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &sp4);
    sp4.x = FX32_ONE * ((8 + 16 * ov04_0225766C[a2].unk_00) + 16 * ov04_0225766C[a2].unk_0A);
    sp4.z = FX32_ONE * ((8 + 16 * ov04_0225766C[a2].unk_04) + 16 * ov04_0225766C[a2].unk_0B);
    Field3dObject_SetPosEx(&r5->unk_4->unk_54, sp4.x, sp4.y, sp4.z);
    for (i = 0; i < 4; ++i) {
        Field3dModelAnimation_FrameSet(&r5->unk_4->unk_04[i], 0);
    }
    localData->unk_00D0 = (localData->unk_00D0 + 1) % 3;
}

BOOL ov04_02256A54(Field3DModelAnimation *anim, u8 num) {
    u8 i;
    u8 count = 0;

    for (i = 0; i < num; ++i) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&anim[i], FX32_ONE)) {
            ++count;
        }
    }

    return count == num;
}

FuchsiaGymmickLocalData_Sub00D4_Sub004 *ov04_02256A90(FuchsiaGymmickLocalData_Sub00D4 *a0) {
    GF_ASSERT(!a0->unk_004[a0->unk_000].unk_00);
    FuchsiaGymmickLocalData_Sub00D4_Sub004 *ret = &a0->unk_004[a0->unk_000];
    ret->unk_00 = TRUE;
    a0->unk_000 = (a0->unk_000 + 1) % 3;
    return ret;
}

void ov04_02256AC4(FuchsiaGymmickLocalData *localData, const u8 a1) {
    u8 i;
    u8 j;
    for (i = 0; i < 6; ++i) {
        if (ov04_0225766C[a1].unk_0C[i] < 0) {
            break;
        }
        for (j = 0; j < 3; ++j) {
            s16 r0;
            if (!localData->unk_1DB4[j].unk_0) {
                continue;
            }
            r0 = localData->unk_1DB4[j].unk_2;
            if (ov04_0225766C[a1].unk_0C[i] == r0) {
                ov04_02256B3C(&localData->unk_1DB4[j]);
                break;
            }
        }
    }
}

void ov04_02256B3C(FuchsiaGymmickLocalData_Sub1DB4 *a0) {
    Field3dObject_SetActiveFlag(&a0->unk_4->unk_54, FALSE);
    a0->unk_4->unk_00 = FALSE;
    a0->unk_0 = FALSE;
    a0->unk_2 = -1;
    a0->unk_4 = NULL;
    SysTask_Destroy(a0->unk_8);
    a0->unk_8 = NULL;
}
