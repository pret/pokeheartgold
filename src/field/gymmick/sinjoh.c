#include "field_system.h"
#include "overlay_04.h"

typedef struct SinjohGymmickLocalData {
    FieldSystem *unk_000;
    u32 filler_004[0x230 / 4];
    SysTask *unk_234;
} SinjohGymmickLocalData; // size: 0x238

void ov04_02256F50(SinjohGymmickLocalData *localData);
void ov04_02257148(SysTask *sysTask, void *taskData);

void GymmickInit_Sinjoh(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(SinjohGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(SinjohGymmickLocalData));
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->unk_000 = fieldSystem;
    ov04_02256F50(localData);
    localData->unk_234 = SysTask_CreateOnMainQueue(ov04_02257148, localData, 1);
}
