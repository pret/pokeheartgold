#include "field_system.h"
#include "overlay_04.h"

typedef struct VermilionGymmickLocalData {
    FieldSystem *fieldSystem;
} VermilionGymmickLocalData;

void GymmickInit_Vermilion(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VERMILION);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(VermilionGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(VermilionGymmickLocalData));
    VermilionGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;

    if (gymmickUnion->vermilion.gates[0]) {
        UnkStruct_FieldSysC0_SubC *gate1Render = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 199);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 199);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &gate1Render->renderObj, 199, i);
        }
    }

    if (gymmickUnion->vermilion.gates[1]) {
        UnkStruct_FieldSysC0_SubC *gate1Render = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 200);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 200);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &gate1Render->renderObj, 200, i);
        }
    }
}

void GymmickFree_Vermilion(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

u8 ov04_022563C4(FieldSystem *fieldSystem, u8 canId) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VERMILION);

    if (gymmickUnion->vermilion.gates[0] && gymmickUnion->vermilion.gates[1]) {
        return 4;
    }

    if (gymmickUnion->vermilion.gates[0]) {
        if (canId == gymmickUnion->vermilion.switches[1]) {
            return 2;
        } else {
            return 3;
        }
    }

    return canId == gymmickUnion->vermilion.switches[0];
}
