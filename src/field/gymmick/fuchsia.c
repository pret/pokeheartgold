#include "field_system.h"
#include "overlay_04.h"

typedef struct FuchsiaGymmickLocalData_Sub1DB4 {
    u16 unk_0;
    s16 unk_2;
    u8 filler_4[4];
    SysTask *unk_8;
} FuchsiaGymmickLocalData_Sub1DB4; // size: 0xC

typedef struct FuchsiaGymmickLocalData {
    u8 filler_0000[0x1DB4];
    FuchsiaGymmickLocalData_Sub1DB4 unk_1DB4[3];
} FuchsiaGymmickLocalData; // size: 0x1DD8

void ov04_02256758(FuchsiaGymmickLocalData *localData, enum HeapID heapID);
void ov04_0225686C(FuchsiaGymmickLocalData *localData);

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
