#include "fielddata/script/scr_seq/event_T27GYM0101.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct EcruteakGymmickLocalData {
    int unk_00[4];
    u8 filler_10[12];
} EcruteakGymmickLocalData; // size: 0x1C

void ov04_02254F44(FieldSystem *fieldSystem);

void GymmickInit_Ecruteak(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_ECRUTEAK);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(EcruteakGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(EcruteakGymmickLocalData));
    EcruteakGymmickLocalData *localData = fieldSystem->unk4->unk24;
    fieldSystem->unk11C = FX32_CONST(0.0625);
    ov01_021EA864(fieldSystem->fog, -1, TRUE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x0020, 0);
    ov01_021EA89C(fieldSystem->fog, -1, 0, 31);

    s8 sp14[32];
    for (int i = 0; i < 32; ++i) {
        sp14[i] = -1;
    }
    ov01_021EA8C4(fieldSystem->fog, (u32 *)sp14);
    ov04_02254F44(fieldSystem);

    for (int i = 0; i < 4; ++i) {
        VecFx32 sp08;
        MapObject_CopyPositionVector(MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T27GYM0101_itako + i), &sp08);
        localData->unk_00[i] = MapPropManager_LoadOne(fieldSystem->mapPropManager, 128, &sp08, NULL, fieldSystem->mapPropAnimationManager);
        if (gymmickUnion->ecruteak.candles[i]) {
            MapProp_SetCulled(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->unk_00[i]), TRUE);
        }
    }
}

void GymmickFree_Ecruteak(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}
