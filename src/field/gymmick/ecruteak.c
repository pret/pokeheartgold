#include "constants/sprites.h"

#include "fielddata/script/scr_seq/event_T27GYM0101.h"

#include "field_system.h"
#include "overlay_01_021F72DC.h"
#include "overlay_01_021F944C.h"
#include "overlay_04.h"
#include "unk_02005D10.h"
#include "unk_02023694.h"

#define NUM_CANDLES 4

typedef struct EcruteakGymmickLocalData {
    int unk_00[NUM_CANDLES];
    int unk_10;
    SysTask *unk_14;
    LocalMapObject *unk_18;
} EcruteakGymmickLocalData; // size: 0x1C

typedef struct EcruteakExtinguishCandleTaskData {
    int unk_0;
    int unk_4;
    int unk_8;
    FieldSystem *unk_C;
} EcruteakExtinguishCandleTaskData;

void ov04_02254E20(SysTask *task, void *data);
BOOL ov04_02254E50(TaskManager *taskman);
u8 ov04_MortyGymTrainerObjectToCandleIdx(LocalMapObject *mapObject);
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

    for (int i = 0; i < NUM_CANDLES; ++i) {
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

void EcruteakGymmick_BindCandleToTrainerObject(FieldSystem *fieldSystem) {
    EcruteakGymmickLocalData *localData = fieldSystem->unk4->unk24;

    LocalMapObject **attrPtr = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_EVENT);
    u8 candleIdx = ov04_MortyGymTrainerObjectToCandleIdx(*attrPtr);
    if (candleIdx == NUM_CANDLES) {
        GF_ASSERT(FALSE);
        return;
    }
    localData->unk_10 = candleIdx;
    localData->unk_18 = *attrPtr;
    localData->unk_14 = SysTask_CreateOnMainQueue(ov04_02254E20, fieldSystem, 0);
}

void EcruteakGymmick_UnbindCandleFromTrainerObject(FieldSystem *fieldSystem) {
    EcruteakGymmickLocalData *localData = fieldSystem->unk4->unk24;
    SysTask_Destroy(localData->unk_14);
}

void EcruteakGymmick_ExtinguishCandle(FieldSystem *fieldSystem, ScriptEnvField field) {
    EcruteakGymmickLocalData *localData = fieldSystem->unk4->unk24;
    LocalMapObject **attrPtr = FieldSysGetAttrAddr(fieldSystem, field);
    localData->unk_10 = ov04_MortyGymTrainerObjectToCandleIdx(*attrPtr);
    localData->unk_18 = *attrPtr;
    EcruteakExtinguishCandleTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(EcruteakExtinguishCandleTaskData));
    taskData->unk_0 = 0;
    taskData->unk_4 = 1;
    taskData->unk_8 = 0;
    taskData->unk_C = fieldSystem;
    TaskManager_Call(fieldSystem->taskman, ov04_02254E50, taskData);
}

void ov04_02254E20(SysTask *task, void *data) {
    FieldSystem *fieldSystem = data;
    EcruteakGymmickLocalData *localData = fieldSystem->unk4->unk24;
    VecFx32 objectPos;
    MapObject_CopyPositionVector(localData->unk_18, &objectPos);
    MapProp_SetTranslation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->unk_00[localData->unk_10]), &objectPos);
}

BOOL ov04_02254E50(TaskManager *taskman) {
    EcruteakExtinguishCandleTaskData *taskData = TaskManager_GetEnvironment(taskman);
    EcruteakGymmickLocalData *localData = taskData->unk_C->unk4->unk24;

    switch (taskData->unk_0) {
    case 0:
        if (taskData->unk_8++ >= 30) {
            PlaySE(SEQ_SE_GS_ROUSOKU_KIERU);
            ++taskData->unk_0;
        }
        break;
    case 1: {
        MapProp *mapProp = MapPropManager_GetMapPropByIndex(taskData->unk_C->mapPropManager, localData->unk_00[localData->unk_10]);
        if (taskData->unk_4 >= 4) {
            MapProp_SetCulled(mapProp, TRUE);
            GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(taskData->unk_C)), GYMMICK_ECRUTEAK);
            gymmickUnion->ecruteak.candles[localData->unk_10] = TRUE;
            ov01_021FA930(localData->unk_18, SPRITE_ITAKO_);
            ++taskData->unk_0;
        } else {
            ++taskData->unk_4;
        }
        VecFx32 *scale = MapProp_GetScale(mapProp);
        scale->x = FX32_ONE / taskData->unk_4;
        scale->y = FX32_ONE / taskData->unk_4;
        scale->z = FX32_ONE / taskData->unk_4;
        break;
    }
    case 2:
        if (!ov01_021FA2D4(localData->unk_18)) {
            ov04_02254F44(taskData->unk_C);
            Heap_Free(taskData);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

u8 ov04_MortyGymTrainerObjectToCandleIdx(LocalMapObject *mapObject) {
    static const u32 sMortyGymTrainerObjectIds[NUM_CANDLES] = {
        obj_T27GYM0101_itako,
        obj_T27GYM0101_itako_2,
        obj_T27GYM0101_itako_3,
        obj_T27GYM0101_itako_4,
    };

    u32 mapObjectId = MapObject_GetID(mapObject);
    u8 i;
    for (i = 0; i < NUM_CANDLES; ++i) {
        if (sMortyGymTrainerObjectIds[i] == mapObjectId) {
            break;
        }
    }

    return i;
}

void ov04_02254F44(FieldSystem *fieldSystem) {
    int i;
    int numObjects = MapObjectManager_GetObjectCount(fieldSystem->mapObjectManager);
    LocalMapObject *objects = MapObjectManager_GetObjects(fieldSystem->mapObjectManager);
    for (i = 0; i < numObjects; ++i) {
        if (MapObject_CheckActive(objects) == TRUE) {
            NNS_G3dMdlSetMdlFogEnableFlagAll(sub_02023F90(ov01_021F72DC(objects)), FALSE);
        }
        MapObjectArray_NextObject2(&objects);
    }
}
