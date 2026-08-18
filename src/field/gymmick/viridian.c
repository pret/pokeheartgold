#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct ViridianGymmickLocalData_Sub054 {
    int unk_000;
    int unk_004;
    u8 filler_008[0x230];
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
