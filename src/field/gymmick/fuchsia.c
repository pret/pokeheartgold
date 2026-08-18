#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"
#include "unk_02005D10.h"

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

void ov04_02256734(FieldSystem *fieldSystem, FuchsiaGymmickLocalData *localData);
void ov04_02256758(FuchsiaGymmickLocalData *localData, enum HeapID heapID);
void ov04_0225686C(FuchsiaGymmickLocalData *localData);
int ov04_022568F0(int x, int z);
BOOL ov04_02256920(FuchsiaGymmickLocalData_Sub1DB4 *a0, int a1);
ov04_02256950(FuchsiaGymmickLocalData *localData, FieldSystem *fieldSystem, u8 a2);
BOOL ov04_02256A54(Field3DModelAnimation *anim, u8 num);
void ov04_02256B3C(FuchsiaGymmickLocalData *localData);

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

    int r4 = ov04_022568F0(x, z);
    if (r4 < 0) {
        PlaySE(SEQ_SE_DP_WALL_HIT);
        return;
    }
    if (!ov04_02256920(localData->unk_1DB4, r4)) {
        ov04_02256950(localData, fieldSystem, r4);
        PlaySE(SEQ_SE_GS_TOUMEINAKABEHIT);
    }
}

void ov04_02256734(FieldSystem *fieldSystem, FuchsiaGymmickLocalData *localData) {
    FuchsiaGymmickLocalData_Sub00D4_Sub004 *r4 = localData->unk_0000.pHeap;
    if (ov04_02256A54(r4->unk_04, 4)) {
        ov04_02256B3C(localData);
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
