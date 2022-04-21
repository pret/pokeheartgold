#include "gymmick_overlay.h"
#include "unk_0203DE74.h"
#include "field_map_object.h"
#include "overlay_01.h"
#include "fieldmap.h"
#include "task.h"
#include "unk_02005D10.h"
#include "fielddata/script/scr_seq/event_T27GYM0101.h"

struct EcruteakGymmickWork {
    int candleIds[4];
    int currentCandle;
    SysTask *sysTask;
    LocalMapObject *trainerObj;
};

struct EcruteakCandleExtinguishWork {
    int state;
    int extinguishFrame;
    int delayCounter;
    FieldSystem *fsys;
};

static void fsys_ActiveSpritesSetMdlFlagEnableFlagAll(FieldSystem *fsys);
static void SysTask_CandlePosTracksTrainerObj(SysTask *task, FieldSystem *fsys);
static BOOL Task_ExtinguishCandle(TaskManager *taskManager);
static u8 trainerObjToCandleIdx(LocalMapObject *object);

void InitEcruteakGymPuzzleGimmick(FieldSystem *fsys) {
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_ECRUTEAK);
    struct EcruteakGymmickWork *gymWork = OverlayGymmick_AllocWork(fsys, sizeof(struct EcruteakGymmickWork));
    int i, i2;
    char fog_tbl[32];
    VecFx32 pos;

    fsys->unk_11C = 0x100;
    ov01_021EA864(fsys->fogSystem, -1, TRUE, 0, 10, 0);
    ov01_021EA89C(fsys->fogSystem, -1, RGB_BLACK, 31);
    for (i = 0; i < 32; i++) {
        fog_tbl[i] = -1;
    }
    ov01_021EA8C4(fsys->fogSystem, fog_tbl);
    fsys_ActiveSpritesSetMdlFlagEnableFlagAll(fsys);
    for (i2 = 0; i2 < 4; i2++) {
        MapObject_GetPositionVec(GetMapObjectByID(fsys->mapObjectMan, obj_T27GYM0101_itako + i2), &pos);
        gymWork->candleIds[i2] = AddBgModelFromTemplate(
            fsys->bgModels,
            128,
            &pos,
            NULL,
            fsys->_3dAnimationMgr
        );
        if (gymmickUnion->ecruteak.candles[i2]) {
            ov01_021F3B2C(BgModelList_GetEventByIndex(fsys->bgModels, gymWork->candleIds[i2]), 1);
        }
    }
}

void DeleteEcruteakGymPuzzleGimmick(FieldSystem *fsys) {
    FreeToHeap(fsys->unk4->unk_24);
    fsys->unk4->unk_24 = NULL;
}

void Fsys_EcruteakGymEyeTrainerApproachCarryCandleEffectBegin(FieldSystem *fsys) {
    struct EcruteakGymmickWork *gymWork = fsys->unk4->unk_24;
    LocalMapObject **p_trainerObject = FieldSysGetAttrAddr(fsys, SCRIPTENV_EYE_TRAINER_1_OBJPTR);
    int candleIdx = trainerObjToCandleIdx(*p_trainerObject);
    if (candleIdx == 4) {
        GF_ASSERT(0);
        return;
    }
    gymWork->currentCandle = candleIdx;
    gymWork->trainerObj = *p_trainerObject;
    gymWork->sysTask = CreateSysTask((SysTaskFunc)SysTask_CandlePosTracksTrainerObj, fsys, 0);
}

void Fsys_EcruteakGymTrainerApproachCarryCandleEffectEnd(FieldSystem *fsys) {
    struct EcruteakGymmickWork *gymWork = fsys->unk4->unk_24;
    DestroySysTask(gymWork->sysTask);
}

void Fsys_EcruteakGymExtinguishCandle(FieldSystem *fsys, enum ScriptEnvField field) {
    struct EcruteakGymmickWork *gymWork = fsys->unk4->unk_24;
    LocalMapObject **p_object = FieldSysGetAttrAddr(fsys, field);
    struct EcruteakCandleExtinguishWork *taskWork;

    gymWork->currentCandle = trainerObjToCandleIdx(*p_object);
    gymWork->trainerObj = *p_object;
    taskWork = AllocFromHeapAtEnd(11, sizeof(struct EcruteakCandleExtinguishWork));
    taskWork->state = 0;
    taskWork->extinguishFrame = 1;
    taskWork->delayCounter = 0;
    taskWork->fsys = fsys;
    TaskManager_Call(fsys->taskman, Task_ExtinguishCandle, taskWork);
}

static void SysTask_CandlePosTracksTrainerObj(SysTask *task, FieldSystem *fsys) {
    struct EcruteakGymmickWork *gymWork = fsys->unk4->unk_24;
    VecFx32 pos;

    MapObject_GetPositionVec(gymWork->trainerObj, &pos);
    BgModel_SetPosition(BgModelList_GetEventByIndex(fsys->bgModels, gymWork->candleIds[gymWork->currentCandle]), &pos);
}

static BOOL Task_ExtinguishCandle(TaskManager *taskManager) {
    struct EcruteakCandleExtinguishWork *taskWork = TaskManager_GetEnv(taskManager);
    struct EcruteakGymmickWork *gymWork = taskWork->fsys->unk4->unk_24;
    BgModelEvent *candleModel;
    union GymmickUnion *gymmickUnion;
    VecFx32 *scale_vec;

    switch (taskWork->state) {
    case 0:
        if (taskWork->delayCounter++ < 30) {
            break;
        }
        PlaySE(SEQ_SE_GS_ROUSOKU_KIERU);
        taskWork->state++;
        break;
    case 1:
        candleModel = BgModelList_GetEventByIndex(taskWork->fsys->bgModels, gymWork->candleIds[gymWork->currentCandle]);
        if (taskWork->extinguishFrame >= 4) {
            ov01_021F3B2C(candleModel, 1);
            gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(taskWork->fsys)), GYMMICK_ECRUTEAK);
            gymmickUnion->ecruteak.candles[gymWork->currentCandle] = TRUE;
            ov01_021FA930(gymWork->trainerObj, 250);
            taskWork->state++;
        } else {
            taskWork->extinguishFrame++;
        }
        scale_vec = BgModelEvent_GetScaleVecPtr(candleModel);
        scale_vec->x = FX32_ONE / taskWork->extinguishFrame;
        scale_vec->y = FX32_ONE / taskWork->extinguishFrame;
        scale_vec->z = FX32_ONE / taskWork->extinguishFrame;
        break;
    case 2:
        if (!ov01_021FA2D4(gymWork->trainerObj)) {
            fsys_ActiveSpritesSetMdlFlagEnableFlagAll(taskWork->fsys);
            FreeToHeap(taskWork);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static const int sMortyGymTrainerObjectIds[] = {
    obj_T27GYM0101_itako,
    obj_T27GYM0101_itako_2,
    obj_T27GYM0101_itako_3,
    obj_T27GYM0101_itako_4,
};

static u8 trainerObjToCandleIdx(LocalMapObject *object) {
    int objectId = MapObject_GetID(object);
    u8 i;
    for (i = 0; i < 4; i++) {
        if (objectId == sMortyGymTrainerObjectIds[i]) {
            break;
        }
    }
    return i;
}

static void fsys_ActiveSpritesSetMdlFlagEnableFlagAll(FieldSystem *fsys) {
    int i;
    int nObjects = MapObjectMan_GetCount(fsys->mapObjectMan);
    LocalMapObject *objArray = MapObjectMan_GetArray(fsys->mapObjectMan);

    for (i = 0; i < nObjects; i++) {
        if (MapObject_IsInUse(objArray) == TRUE) {
            NNS_G3dMdlSetMdlFogEnableFlagAll(sub_02023F90(ov01_021F72DC(objArray)), FALSE);
        }
        sub_0205F1D0(&objArray);
    }
}
