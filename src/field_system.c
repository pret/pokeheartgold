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

typedef struct UnkFsysInit {
    int unk0;
    int unk4;
} FsysInitWork;

static BOOL FieldSys_Main(FieldSystem *fsys);

BOOL Field_Continue_AppInit(OVY_MANAGER *man, int *unused) {
    FsysInitWork *args = OverlayManager_GetArgs(man);
    sFieldSysPtr = FieldSys_New(man);

    if (args->unk4) {
        CallFieldTask_ContinueGame_CommError(sFieldSysPtr);
    } else {
        CallFieldTask_ContinueGame_Normal(sFieldSysPtr);
    }

    args->unk4 = 0;

    return TRUE;
}

BOOL Field_NewGame_AppInit(OVY_MANAGER *man, int *unused) {
    sFieldSysPtr = FieldSys_New(man);
    CallFieldTask_NewGame(sFieldSysPtr);
    return TRUE;
}

BOOL Field_AppExec(OVY_MANAGER *man, int *unused) {
    if (FieldSys_Main(OverlayManager_GetData(man))) {
        return TRUE;
    }
    return FALSE;
}

extern OVY_MGR_TEMPLATE ov60_021EAFE0;

BOOL Field_AppExit(OVY_MANAGER *man, int *unused) {
    FieldSys_Delete(man);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_60), &ov60_021EAFE0);
    return TRUE;
}

extern OVY_MGR_TEMPLATE ov01_02206378;

void sub_0203DEF0(FieldSystem *fsys) {
    GF_ASSERT(fsys->unk0->unk4 == NULL);
    GF_ASSERT(fsys->unk0->unk0 == NULL);

    HandleLoadOverlay(FS_OVERLAY_ID(field), OVY_LOAD_ASYNC);

    fsys->unk6C = 0;
    fsys->unk0->unk8 = FALSE;
    fsys->unk0->unk0 = OverlayManager_New(&ov01_02206378, fsys, HEAP_ID_FIELD);
}

void sub_0203DF34(FieldSystem *fsys) {
    fsys->unk6C = 0;
}

u8 sub_0203DF3C(FieldSystem *fsys) {
    GF_ASSERT(fsys->unk_110 == 0 || fsys->unk_110 == 1);

    return fsys->unk_110;
}

void sub_0203DF64(FieldSystem *fsys, int a1) {
    GF_ASSERT(a1 == 0 || a1 == 1);
    fsys->unk_110 = a1;
}

BOOL sub_0203DF7C(FieldSystem *fsys) {
    return (fsys->unk0->unk0 != NULL);
}

BOOL sub_0203DF8C(FieldSystem *fsys) {
    return (fsys->unk0->unk0 && fsys->unk6C);
}

BOOL sub_0203DFA4(FieldSystem *fsys) {
    return (fsys->unk0->unk4 != NULL);
}

void FieldSys_LaunchApplication(FieldSystem *fsys, const OVY_MGR_TEMPLATE *template, void *parentWork) {
    GF_ASSERT(fsys->unk0->unk4 == NULL);

    sub_0203DF34(fsys);

    fsys->unk0->unk4 = OverlayManager_New(template, parentWork, HEAP_ID_FIELD);
}

FieldSystem *FieldSys_New(OVY_MANAGER *man) {
    CreateHeap(3, 11, 0x1C000);
    CreateHeap(3, 32, 0x4000);
    CreateHeap(0, 89, 0x570);
    FieldSystem *fsys = OverlayManager_CreateAndGetData(man, sizeof(FieldSystem), HEAP_ID_FIELD);
    MI_CpuFill8(fsys, 0, sizeof(FieldSystem));
    fsys->unk0 = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct FieldSystemUnkSub0));

    fsys->unk0->unk0 = NULL;
    fsys->unk0->unk4 = NULL;
    fsys->unk0->unk8 = FALSE;
    fsys->unk0->unkC = FALSE;

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_124), OVY_LOAD_ASYNC);

    FieldSystem_Init(man, fsys);

    UnloadOverlayByID(FS_OVERLAY_ID(OVY_124));

    return fsys;
}

void FieldSys_Delete(OVY_MANAGER *man) {
    FieldSystem *fsys = OverlayManager_GetData(man);
    MapMatrix_Free(fsys->mapMatrix);
    Field_FreeMapEvents(fsys);
    FreeToHeap(fsys->unk94);
    sub_02092BD0(fsys->unkA8);
    sub_02092DD8(fsys->unk114);
    FreeToHeap(fsys->unk0);
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

static BOOL FieldSys_Main(FieldSystem *fsys) {
    sub_0203E15C(fsys);
    if (Fsys_RunTaskFrame(fsys) == TRUE) {
        if (fsys->unk4) {
            ov01_021F6830(fsys, 0, 0);
        }
    }
    if (fsys->unk0->unk0) {
        ppOverlayManager_RunFrame_DeleteIfFinished(&fsys->unk0->unk0);
        if (!fsys->unk0->unk0) {
            UnloadOverlayByID(FS_OVERLAY_ID(field));
        }
    } else if (fsys->unk0->unk4) {
        ppOverlayManager_RunFrame_DeleteIfFinished(&fsys->unk0->unk4);
    }
    if (fsys->unk0->unkC && !fsys->taskman && !fsys->unk0->unk0 && !fsys->unk0->unk4) {
        return TRUE;
    }
    return FALSE;
}

BOOL sub_0203E13C(FieldSystem *fsys) {
    if (!fsys->unk0->unk8 && fsys->unk6C && !Fsys_TaskIsRunning(fsys)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203E15C(FieldSystem *fsys) {
    Unk_0203E15C unkStruct;

    BOOL flag = sub_0203E13C(fsys);

    if (flag) {
        sub_0205CE68(fsys->playerAvatar);
        ov01_021E6928(&unkStruct, fsys, gSystem.newKeys, gSystem.heldKeys);
    }

    int unkVar = fsys->unk70;

    if (fsys->location->mapId == MAP_D31R0201) {
        unkVar = 0;
    }

    switch (unkVar) {
    case 3:
        if (flag) {
            if (sub_02057A0C()) {
                if (ov01_021E6E00(&unkStruct, fsys) == TRUE) {
                    flag = FALSE;
                }
            } else {
                flag = FALSE;
            }
        }
        sub_020573F0(fsys, flag);
        break;
    case 2:
        if (flag && ov01_021E6EFC(&unkStruct, fsys) != TRUE) {
            sub_0205CB48(fsys->playerAvatar, fsys->unk2C, -1, unkStruct.unk6, unkStruct.unk8, 0);
        }
        break;
    case 4:
        if (flag) {
            if (ov01_021E6FD4(&unkStruct, fsys) == TRUE) {
                ov01_021EFACC(fsys->unk4->unk8);
                ov01_021F3DFC(fsys, 4);
                ov01_021F2F24(fsys->playerAvatar);
                ov01_021F6830(fsys, 0, 1);
                break;
            }
            if (gSystem.newKeys & PAD_BUTTON_A) {
                ov01_021EFACC(fsys->unk4->unk8);
            }
            flag = 0;
            if (sub_0203E324()) {
                flag = ov35_02259DB8();
            }
            sub_0205CB48(fsys->playerAvatar, fsys->unk2C, -1, unkStruct.unk6, unkStruct.unk8, flag);
        }
        break;
    default:
        if (flag) {
            flag = ov01_021E6AF4(&unkStruct, fsys);
            if (flag) {
                ov01_021EFACC(fsys->unk4->unk8);
                ov01_021F3DFC(fsys, 4);
                sub_0205CF44(fsys->playerAvatar);
                ov01_021F2F24(fsys->playerAvatar);
                ov01_021F6830(fsys, 0, 1);
                if (flag != 2) {
                    sub_02092FA8(fsys->unk114);
                }
            } else {
                if (gSystem.newKeys & PAD_BUTTON_A) {
                    ov01_021EFACC(fsys->unk4->unk8);
                }
                flag = 0;
                if (sub_0203E324()) {
                    flag = ov35_02259DB8();
                }
                sub_0205CB48(fsys->playerAvatar, fsys->unk2C, -1, unkStruct.unk6, unkStruct.unk8, flag);
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

void sub_0203E33C(FieldSystem *fsys, int a1) {
    fsys->unk1C = a1;
}

BGCONFIG *FieldSys_GetBgConfigPtr(FieldSystem *fsys) {
    return fsys->bgConfig;
}

SaveData *FieldSys_GetSaveDataPtr(FieldSystem *fsys) {
    return fsys->savedata;
}

void sub_0203E348() {
    LCRandom();
    LCRandom();
}

void sub_0203E354() {
    sFieldSysPtr->unkC4 = -2;
}
