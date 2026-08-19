#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct SinjohGymmickLocalData_Sub014 {
    Field3dModel unk_00;
    Field3DModelAnimation unk_14[2];
    Field3dObject unk_38;
    BOOL unk_B0;
} SinjohGymmickLocalData_Sub014;

typedef struct SinjohGymmickLocalData {
    FieldSystem *unk_000;
    NNSFndAllocator unk_004;
    SinjohGymmickLocalData_Sub014 unk_014[3];
    int unk_230;
    SysTask *unk_234;
} SinjohGymmickLocalData; // size: 0x238

void ov04_02256F50(SinjohGymmickLocalData *localData);
void ov04_022570EC(SinjohGymmickLocalData *localData);
void ov04_02257148(SysTask *sysTask, void *taskData);
BOOL ov04_02257308(TaskManager *taskman);

void GymmickInit_Sinjoh(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(SinjohGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(SinjohGymmickLocalData));
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->unk_000 = fieldSystem;
    ov04_02256F50(localData);
    localData->unk_234 = SysTask_CreateOnMainQueue(ov04_02257148, localData, 1);
}

void GymmickFree_Sinjoh(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    SysTask_Destroy(localData->unk_234);
    ov04_022570EC(localData);
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void ov04_02256ED8(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (u8 i = 0; i < 3; ++i) {
        Field3dObject_SetActiveFlag(&localData->unk_014[i].unk_38, FALSE);
    }
}

void ov04_02256F00(FieldSystem *fieldSystem, u8 a1) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (a1 > 3) {
        GF_ASSERT(FALSE);
        return;
    }
    GF_ASSERT(Field3dObject_GetActiveFlag(&localData->unk_014[0].unk_38));
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    gymmickUnion->sinjoh.choice = a1;
    localData->unk_230 = 1;
    TaskManager_Call(fieldSystem->taskman, ov04_02257308, localData);
}
