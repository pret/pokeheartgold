#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct ViridianGymmickLocalData_Sub054_Sub008 {
    Field3DModelAnimation unk_00;
    Field3dObject unk_14;
} ViridianGymmickLocalData_Sub054_Sub008;

typedef struct ViridianGymmickLocalData_Sub054 {
    int unk_000;
    int unk_004;
    ViridianGymmickLocalData_Sub054_Sub008 unk_008[4];
    SysTask *unk_238;
} ViridianGymmickLocalData_Sub054; // size: 0x23C

typedef struct ViridianGymmickLocalData {
    NNSFndAllocator unk_000;
    Field3dModel unk_010[4];
    int unk_050;
    ViridianGymmickLocalData_Sub054 unk_054[3];
} ViridianGymmickLocalData; // size: 0x708

void ov04_02256C20(ViridianGymmickLocalData *localData, enum HeapID heapID);
void ov04_02256D00(ViridianGymmickLocalData *localData);
void ov04_02256D68(ViridianGymmickLocalData_Sub054 *a0, FieldSystem *fieldSystem, u8 a2);

void GymmickInit_Viridian(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VIRIDIAN);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(ViridianGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(ViridianGymmickLocalData));
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    ov04_02256C20(localData, HEAP_ID_FIELD1);
}

void GymmickFree_Viridian(FieldSystem *fieldSystem) {
    u8 i;
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    ov04_02256D00(localData);
    for (i = 0; i < 3; ++i) {
        if (localData->unk_054[i].unk_000) {
            SysTask_Destroy(localData->unk_054[i].unk_238);
        }
    }
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void ov04_02256BE4(FieldSystem *fieldSystem, u8 arg1) {
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (!localData->unk_054[localData->unk_050].unk_000) {
        ov04_02256D68(&localData->unk_054[localData->unk_050], fieldSystem, arg1);
        localData->unk_050 = (localData->unk_050 + 1) % 3;
    } else {
        GF_ASSERT(FALSE);
    }
}

void ov04_02256C20(ViridianGymmickLocalData *localData, enum HeapID heapID) {
    u8 i;
    u8 j;
    u8 k;

    HeapExp_FndInitAllocator(&localData->unk_000, heapID, 0x20);

    for (i = 0; i < 4; ++i) {
        Field3dModel_LoadFromFilesystem(&localData->unk_010[i], NARC_a_2_5_5, i + 4, heapID);
    }

    for (j = 0; j < 3; ++j) {
        ViridianGymmickLocalData_Sub054 *r7;

        localData->unk_050 = 0;
        r7 = &localData->unk_054[j];
        r7->unk_000 = 0;
        r7->unk_004 = 0;
        for (k = 0; k < 4; ++k) {
            Field3dModelAnimation_LoadFromFilesystem(&r7->unk_008[k].unk_00, &localData->unk_010[k], NARC_a_2_5_5, k, heapID, &localData->unk_000);
            Field3dObject_InitFromModel(&r7->unk_008[k].unk_14, &localData->unk_010[k]);
            Field3dObject_AddAnimation(&r7->unk_008[k].unk_14, &r7->unk_008[k].unk_00);
            Field3dModelAnimation_FrameSet(&r7->unk_008[k].unk_00, 0);
            VecFx32 sp20 = { 0, 0, 0 };
            Field3dObject_SetPosEx(&r7->unk_008[j].unk_14, sp20.x, sp20.y, sp20.z); // bug: wrong index
            Field3dObject_SetActiveFlag(&r7->unk_008[k].unk_14, FALSE);
        }
    }
}

void ov04_02256D00(ViridianGymmickLocalData *localData) {
    u8 i;
    u8 j;
    u8 k;

    for (i = 0; i < 4; ++i) {
        Field3dModel_Unload(&localData->unk_010[i]);
    }

    for (j = 0; j < 3; ++j) {
        ViridianGymmickLocalData_Sub054 *r4 = &localData->unk_054[j];
        for (k = 0; k < 4; ++k) {
            Field3dModelAnimation_Unload(&r4->unk_008[k].unk_00, &localData->unk_000);
        }
    }
}
