#include "field_warp_tasks.h"
#include "main.h"
#include "map_events.h"
#include "math_util.h"
#include "overlay_manager.h"
#include "poke_overlay.h"
#include "system.h"
#include "overlay_35.h"
#include "field_system.h"
#include "unk_02092BB8.h"
#include "unk_02092BE8.h"
#include "unk_02056D7C.h"
#include "unk_02035900.h"
#include "unk_0205CB48.h"
#include "overlay_01_021F6830.h"
#include "overlay_01_021E6880.h"
#include "overlay_01_021EF7A0.h"
#include "overlay_01_021F3D38.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_124.h"
#include "constants/maps.h"

FS_EXTERN_OVERLAY(OVY_60);
FS_EXTERN_OVERLAY(OVY_124);
FS_EXTERN_OVERLAY(field);

const OVY_MGR_TEMPLATE gApplication_NewGameFieldsys = {
    .init = Field_NewGame_AppInit,
    .exec = Field_AppExec,
    .exit = Field_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE
};

const OVY_MGR_TEMPLATE gApplication_ContinueFieldsys = {
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

BOOL Field_Continue_AppInit(OVY_MANAGER *man, int *unused) {
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

BOOL Field_NewGame_AppInit(OVY_MANAGER *man, int *unused) {
    sFieldSysPtr = FieldSystem_New(man);
    CallFieldTask_NewGame(sFieldSysPtr);
    return TRUE;
}

BOOL Field_AppExec(OVY_MANAGER *man, int *unused) {
    if (FieldSystem_Main(OverlayManager_GetData(man))) {
        return TRUE;
    }
    return FALSE;
}

extern OVY_MGR_TEMPLATE ov60_021EAFE0;

BOOL Field_AppExit(OVY_MANAGER *man, int *unused) {
    FieldSystem_Delete(man);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_60), &ov60_021EAFE0);
    return TRUE;
}

extern OVY_MGR_TEMPLATE ov01_02206378;

void sub_0203DEF0(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->unk0->unk4 == NULL);
    GF_ASSERT(fieldSystem->unk0->unk0 == NULL);

    HandleLoadOverlay(FS_OVERLAY_ID(field), OVY_LOAD_ASYNC);

    fieldSystem->unk6C = 0;
    fieldSystem->unk0->unk8 = FALSE;
    fieldSystem->unk0->unk0 = OverlayManager_New(&ov01_02206378, fieldSystem, HEAP_ID_FIELD);
}

void sub_0203DF34(FieldSystem *fieldSystem) {
    fieldSystem->unk6C = 0;
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
    return (fieldSystem->unk0->unk0 != NULL);
}

BOOL sub_0203DF8C(FieldSystem *fieldSystem) {
    return (fieldSystem->unk0->unk0 && fieldSystem->unk6C);
}

BOOL sub_0203DFA4(FieldSystem *fieldSystem) {
    return (fieldSystem->unk0->unk4 != NULL);
}

void FieldSystem_LaunchApplication(FieldSystem *fieldSystem, const OVY_MGR_TEMPLATE *template, void *parentWork) {
    GF_ASSERT(fieldSystem->unk0->unk4 == NULL);

    sub_0203DF34(fieldSystem);

    fieldSystem->unk0->unk4 = OverlayManager_New(template, parentWork, HEAP_ID_FIELD);
}

FieldSystem *FieldSystem_New(OVY_MANAGER *man) {
    CreateHeap(3, 11, 0x1C000);
    CreateHeap(3, 32, 0x4000);
    CreateHeap(0, 89, 0x570);
    FieldSystem *fieldSystem = OverlayManager_CreateAndGetData(man, sizeof(FieldSystem), HEAP_ID_FIELD);
    MI_CpuFill8(fieldSystem, 0, sizeof(FieldSystem));
    fieldSystem->unk0 = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct FieldSystemUnkSub0));

    fieldSystem->unk0->unk0 = NULL;
    fieldSystem->unk0->unk4 = NULL;
    fieldSystem->unk0->unk8 = FALSE;
    fieldSystem->unk0->unkC = FALSE;

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_124), OVY_LOAD_ASYNC);

    FieldSystem_Init(man, fieldSystem);

    UnloadOverlayByID(FS_OVERLAY_ID(OVY_124));

    return fieldSystem;
}

void FieldSystem_Delete(OVY_MANAGER *man) {
    FieldSystem *fieldSystem = OverlayManager_GetData(man);
    MapMatrix_Free(fieldSystem->mapMatrix);
    Field_FreeMapEvents(fieldSystem);
    FreeToHeap(fieldSystem->unk94);
    sub_02092BD0(fieldSystem->unkA8);
    sub_02092DD8(fieldSystem->unk114);
    FreeToHeap(fieldSystem->unk0);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_89);
    DestroyHeap(HEAP_ID_FIELD);
    DestroyHeap(HEAP_ID_32);
}

static void ppOverlayManager_RunFrame_DeleteIfFinished(OVY_MANAGER **man) {
    if (*man && OverlayManager_Run(*man)) {
        OverlayManager_Delete(*man);
        *man = NULL;
    }
}

static BOOL FieldSystem_Main(FieldSystem *fieldSystem) {
    sub_0203E15C(fieldSystem);
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

BOOL sub_0203E13C(FieldSystem *fieldSystem) {
    if (!fieldSystem->unk0->unk8 && fieldSystem->unk6C && !FieldSystem_TaskIsRunning(fieldSystem)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203E15C(FieldSystem *fieldSystem) {
    Unk_0203E15C unkStruct;

    BOOL flag = sub_0203E13C(fieldSystem);

    if (flag) {
        sub_0205CE68(fieldSystem->playerAvatar);
        ov01_021E6928(&unkStruct, fieldSystem, gSystem.newKeys, gSystem.heldKeys);
    }

    int unkVar = fieldSystem->unk70;

    if (fieldSystem->location->mapId == MAP_D31R0201) {
        unkVar = 0;
    }

    switch (unkVar) {
    case 3:
        if (flag) {
            if (sub_02057A0C()) {
                if (ov01_021E6E00(&unkStruct, fieldSystem) == TRUE) {
                    flag = FALSE;
                }
            } else {
                flag = FALSE;
            }
        }
        sub_020573F0(fieldSystem, flag);
        break;
    case 2:
        if (flag && ov01_021E6EFC(&unkStruct, fieldSystem) != TRUE) {
            sub_0205CB48(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, unkStruct.unk6, unkStruct.unk8, 0);
        }
        break;
    case 4:
        if (flag) {
            if (ov01_021E6FD4(&unkStruct, fieldSystem) == TRUE) {
                ov01_021EFACC(fieldSystem->unk4->unk8);
                ov01_021F3DFC(fieldSystem, 4);
                ov01_021F2F24(fieldSystem->playerAvatar);
                ov01_021F6830(fieldSystem, 0, 1);
                break;
            }
            if (gSystem.newKeys & PAD_BUTTON_A) {
                ov01_021EFACC(fieldSystem->unk4->unk8);
            }
            flag = 0;
            if (sub_0203E324()) {
                flag = ov35_02259DB8();
            }
            sub_0205CB48(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, unkStruct.unk6, unkStruct.unk8, flag);
        }
        break;
    default:
        if (flag) {
            flag = ov01_021E6AF4(&unkStruct, fieldSystem);
            if (flag) {
                ov01_021EFACC(fieldSystem->unk4->unk8);
                ov01_021F3DFC(fieldSystem, 4);
                sub_0205CF44(fieldSystem->playerAvatar);
                ov01_021F2F24(fieldSystem->playerAvatar);
                ov01_021F6830(fieldSystem, 0, 1);
                if (flag != 2) {
                    sub_02092FA8(fieldSystem->unk114);
                }
            } else {
                if (gSystem.newKeys & PAD_BUTTON_A) {
                    ov01_021EFACC(fieldSystem->unk4->unk8);
                }
                flag = 0;
                if (sub_0203E324()) {
                    flag = ov35_02259DB8();
                }
                sub_0205CB48(fieldSystem->playerAvatar, fieldSystem->unk2C, -1, unkStruct.unk6, unkStruct.unk8, flag);
            }
        }
        break;
    }
}

void sub_0203E2F4() {
    sFieldSysPtr->unk0->unk8 = TRUE;
    sub_02037504();
}

void sub_0203E30C() {
    sFieldSysPtr->unk0->unk8 = FALSE;
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
