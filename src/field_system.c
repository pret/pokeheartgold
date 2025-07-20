#include "field_system.h"

#include "constants/maps.h"

#include "field_warp_tasks.h"
#include "main.h"
#include "map_events.h"
#include "math_util.h"
#include "overlay_01_021E6880.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_021F3D38.h"
#include "overlay_01_021F6830.h"
#include "overlay_124.h"
#include "overlay_35.h"
#include "overlay_manager.h"
#include "poke_overlay.h"
#include "system.h"
#include "unk_02035900.h"
#include "unk_02056D7C.h"
#include "unk_0205CB48.h"
#include "unk_02092BB8.h"
#include "unk_02092BE8.h"

FS_EXTERN_OVERLAY(intro_title);
FS_EXTERN_OVERLAY(OVY_124);
FS_EXTERN_OVERLAY(field);

const OverlayManagerTemplate gApplication_NewGameFieldsys = {
    .init = Field_NewGame_AppInit,
    .exec = Field_AppExec,
    .exit = Field_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE
};

const OverlayManagerTemplate gApplication_ContinueFieldsys = {
    .init = Field_Continue_AppInit,
    .exec = Field_AppExec,
    .exit = Field_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE
};

static FieldSystem *sFieldSysPtr;

typedef struct UnkFieldSystemInit {
    int unk0;
    int unk4;
} FieldSystemInitWork;

static BOOL FieldSystem_Main(FieldSystem *fieldSystem);

BOOL Field_Continue_AppInit(OverlayManager *man, int *unused) {
    FieldSystemInitWork *args = OverlayManager_GetArgs(man);
    sFieldSysPtr = FieldSystem_New(man);

    if (args->unk4) {
        CallFieldTask_ContinueGame_CommError(sFieldSysPtr);
    } else {
        CallFieldTask_ContinueGame_Normal(sFieldSysPtr);
    }

    args->unk4 = 0;

    return TRUE;
}

BOOL Field_NewGame_AppInit(OverlayManager *man, int *unused) {
    sFieldSysPtr = FieldSystem_New(man);
    CallFieldTask_NewGame(sFieldSysPtr);
    return TRUE;
}

BOOL Field_AppExec(OverlayManager *man, int *unused) {
    if (FieldSystem_Main(OverlayManager_GetData(man))) {
        return TRUE;
    }
    return FALSE;
}

extern OverlayManagerTemplate gApplication_TitleScreen;

BOOL Field_AppExit(OverlayManager *man, int *unused) {
    FieldSystem_Delete(man);
    RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_TitleScreen);
    return TRUE;
}

extern OverlayManagerTemplate ov01_02206378;

void FieldSystem_LoadFieldOverlayInternal(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->unk0->unk4 == NULL);
    GF_ASSERT(fieldSystem->unk0->unk0 == NULL);

    HandleLoadOverlay(FS_OVERLAY_ID(field), OVY_LOAD_ASYNC);

    fieldSystem->unk6C = FALSE;
    fieldSystem->unk0->isPaused = FALSE;
    fieldSystem->unk0->unk0 = OverlayManager_New(&ov01_02206378, fieldSystem, HEAP_ID_FIELD);
}

void sub_0203DF34(FieldSystem *fieldSystem) {
    fieldSystem->unk6C = FALSE;
}

u8 sub_0203DF3C(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->unk_110 == 0 || fieldSystem->unk_110 == 1);

    return fieldSystem->unk_110;
}

void sub_0203DF64(FieldSystem *fieldSystem, int a1) {
    GF_ASSERT(a1 == 0 || a1 == 1);
    fieldSystem->unk_110 = a1;
}

BOOL sub_0203DF7C(FieldSystem *fieldSystem) {
    return fieldSystem->unk0->unk0 != NULL;
}

BOOL sub_0203DF8C(FieldSystem *fieldSystem) {
    return fieldSystem->unk0->unk0 != NULL && fieldSystem->unk6C;
}

BOOL sub_0203DFA4(FieldSystem *fieldSystem) {
    return fieldSystem->unk0->unk4 != NULL;
}

void FieldSystem_LaunchApplication(FieldSystem *fieldSystem, const OverlayManagerTemplate *template, void *parentWork) {
    GF_ASSERT(fieldSystem->unk0->unk4 == NULL);

    sub_0203DF34(fieldSystem);

    fieldSystem->unk0->unk4 = OverlayManager_New(template, parentWork, HEAP_ID_FIELD);
}

FieldSystem *FieldSystem_New(OverlayManager *man) {
    CreateHeap(HEAP_ID_3, HEAP_ID_FIELD, 0x1C000);
    CreateHeap(HEAP_ID_3, HEAP_ID_32, 0x4000);
    CreateHeap(HEAP_ID_DEFAULT, HEAP_ID_89, 0x570);
    FieldSystem *fieldSystem = OverlayManager_CreateAndGetData(man, sizeof(FieldSystem), HEAP_ID_FIELD);
    MI_CpuFill8(fieldSystem, 0, sizeof(FieldSystem));
    fieldSystem->unk0 = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct FieldSystemUnkSub0));

    fieldSystem->unk0->unk0 = NULL;
    fieldSystem->unk0->unk4 = NULL;
    fieldSystem->unk0->isPaused = FALSE;
    fieldSystem->unk0->unkC = FALSE;

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_124), OVY_LOAD_ASYNC);

    FieldSystem_Init(man, fieldSystem);

    UnloadOverlayByID(FS_OVERLAY_ID(OVY_124));

    return fieldSystem;
}

void FieldSystem_Delete(OverlayManager *man) {
    FieldSystem *fieldSystem = OverlayManager_GetData(man);
    MapMatrix_Free(fieldSystem->mapMatrix);
    Field_FreeMapEvents(fieldSystem);
    Heap_Free(fieldSystem->bagCursor);
    sub_02092BD0(fieldSystem->unkA8);
    GearPhoneRingManager_Delete(fieldSystem->phoneRingManager);
    Heap_Free(fieldSystem->unk0);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_89);
    DestroyHeap(HEAP_ID_FIELD);
    DestroyHeap(HEAP_ID_32);
}

static void ppOverlayManager_RunFrame_DeleteIfFinished(OverlayManager **man) {
    if (*man && OverlayManager_Run(*man)) {
        OverlayManager_Delete(*man);
        *man = NULL;
    }
}

static BOOL FieldSystem_Main(FieldSystem *fieldSystem) {
    FieldSystem_Control(fieldSystem);
    if (FieldSystem_RunTaskFrame(fieldSystem) == TRUE) {
        if (fieldSystem->unk4) {
            ov01_021F6830(fieldSystem, 0, 0);
        }
    }
    if (fieldSystem->unk0->unk0) {
        ppOverlayManager_RunFrame_DeleteIfFinished(&fieldSystem->unk0->unk0);
        if (!fieldSystem->unk0->unk0) {
            UnloadOverlayByID(FS_OVERLAY_ID(field));
        }
    } else if (fieldSystem->unk0->unk4) {
        ppOverlayManager_RunFrame_DeleteIfFinished(&fieldSystem->unk0->unk4);
    }
    if (fieldSystem->unk0->unkC && !fieldSystem->taskman && !fieldSystem->unk0->unk0 && !fieldSystem->unk0->unk4) {
        return TRUE;
    }
    return FALSE;
}

BOOL FieldSystem_IsPlayerMovementAllowed(FieldSystem *fieldSystem) {
    return !fieldSystem->unk0->isPaused && fieldSystem->unk6C && !FieldSystem_TaskIsRunning(fieldSystem);
}

void FieldSystem_Control(FieldSystem *fieldSystem) {
    FieldInput fieldInput;

    BOOL movementAllowed = FieldSystem_IsPlayerMovementAllowed(fieldSystem);

    if (movementAllowed) {
        PlayerAvatar_UpdateMovement(fieldSystem->playerAvatar);
        FieldInput_Update(&fieldInput, fieldSystem, gSystem.newKeys, gSystem.heldKeys);
    }

    int loadType = fieldSystem->unk70;

    if (fieldSystem->location->mapId == MAP_BATTLE_TOWER) {
        loadType = 0;
    }

    switch (loadType) {
    case 3:
        if (movementAllowed) {
            if (sub_02057A0C()) {
                if (FieldInput_Process_Colosseum(&fieldInput, fieldSystem) == TRUE) {
                    movementAllowed = FALSE;
                }
            } else {
                movementAllowed = FALSE;
            }
        }
        sub_020573F0(fieldSystem, movementAllowed);
        break;
    case 2:
        if (movementAllowed && FieldInput_Process_UnionRoom(&fieldInput, fieldSystem) != TRUE) {
            PlayerAvatar_MoveControl(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, fieldInput.unk6, fieldInput.unk8, 0);
        }
        break;
    case 4:
        if (movementAllowed) {
            if (FieldInput_Process_BattleTower(&fieldInput, fieldSystem) == TRUE) {
                FieldDrawMapName_Reset(fieldSystem->unk4->drawMapNameInfo);
                ov01_021F3DFC(fieldSystem, 4);
                ov01_021F2F24(fieldSystem->playerAvatar);
                ov01_021F6830(fieldSystem, 0, 1);
                break;
            }
            if (gSystem.newKeys & PAD_BUTTON_A) {
                FieldDrawMapName_Reset(fieldSystem->unk4->drawMapNameInfo);
            }
            movementAllowed = 0;
            if (sub_0203E324()) {
                movementAllowed = ov35_02259DB8();
            }
            PlayerAvatar_MoveControl(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, fieldInput.unk6, fieldInput.unk8, movementAllowed);
        }
        break;
    default:
        if (movementAllowed) {
            u32 newEvent = FieldInput_Process(&fieldInput, fieldSystem);
            if (newEvent) {
                FieldDrawMapName_Reset(fieldSystem->unk4->drawMapNameInfo);
                ov01_021F3DFC(fieldSystem, 4);
                sub_0205CF44(fieldSystem->playerAvatar);
                ov01_021F2F24(fieldSystem->playerAvatar);
                ov01_021F6830(fieldSystem, 0, 1);
                if (newEvent != 2) {
                    GearPhoneRingManager_ResetIfActive(fieldSystem->phoneRingManager);
                }
            } else {
                if (gSystem.newKeys & PAD_BUTTON_A) {
                    FieldDrawMapName_Reset(fieldSystem->unk4->drawMapNameInfo);
                }
                u32 flag = 0;
                if (sub_0203E324()) {
                    flag = ov35_02259DB8();
                }
                PlayerAvatar_MoveControl(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, fieldInput.unk6, fieldInput.unk8, flag);
            }
        }
        break;
    }
}

void sub_0203E2F4() {
    sFieldSysPtr->unk0->isPaused = TRUE;
    sub_02037504();
}

void sub_0203E30C() {
    sFieldSysPtr->unk0->isPaused = FALSE;
    sub_020374E4();
}

int sub_0203E324() {
    if (sFieldSysPtr->unk4 == NULL) {
        return 0;
    }
    return sFieldSysPtr->unk4->unk14;
}

void sub_0203E33C(FieldSystem *fieldSystem, int a1) {
    fieldSystem->unk1C = a1;
}

BgConfig *FieldSystem_GetBgConfigPtr(FieldSystem *fieldSystem) {
    return fieldSystem->bgConfig;
}

SaveData *FieldSystem_GetSaveData(FieldSystem *fieldSystem) {
    return fieldSystem->saveData;
}

void sub_0203E348() {
    LCRandom();
    LCRandom();
}

void sub_0203E354() {
    sFieldSysPtr->unkC4 = -2;
}
