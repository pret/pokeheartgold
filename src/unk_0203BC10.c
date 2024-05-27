#include "constants/std_script.h"
#include "global.h"
#include "unk_0203BC10.h"
#include "bag_view.h"
#include "constants/sndseq.h"
#include "field_map_object.h"
#include "field_move.h"
#include "field_use_item.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "map_header.h"
#include "constants/map_sections.h"
#include "overlay_01.h"
#include "pokedex.h"
#include "pokedex_util.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200FA24.h"
#include "unk_020183F0.h"
#include "unk_02034B0C.h"
#include "unk_02037C94.h"
#include "unk_02054E00.h"
#include "unk_0205A44C.h"
#include "unk_0205AC88.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "constants/start_menu_icons.h"
#include "unk_020755E8.h"
#include "unk_02092BE8.h"
#include "overlay_01_021F6830.h"
#include "unk_02068FC8.h"

typedef enum StartMenuIconInternal {
    START_MENU_ICON_INTERNAL_POKEDEX,
    START_MENU_ICOM_INTERNAL_POKEMON,
    START_MENU_ICON_INTERNAL_BAG,
    START_MENU_ICON_INTERNAL_TRAINER_CARD,
    START_MENU_ICON_INTERNAL_SAVE,
    START_MENU_ICON_INTERNAL_OPTIONS,
    START_MENU_ICON_INTERNAL_RUNNING_SHOES,
    START_MENU_ICON_INTERNAL_7,
    START_MENU_ICON_INTERNAL_8,
    START_MENU_ICON_INTERNAL_9,
    START_MENU_ICON_INTERNAL_10,
    START_MENU_ICON_INTERNAL_11,
    START_MENU_ICON_INTERNAL_POKEGEAR,
} StartMenuIconInternal;

typedef enum StartMenuIconInhibit {
    START_MENU_ICON_INHIBIT_POKEDEX,
    START_MENU_ICOM_INHIBIT_POKEMON,
    START_MENU_ICON_INHIBIT_BAG,
    START_MENU_ICON_INHIBIT_TRAINER_CARD,
    START_MENU_ICON_INHIBIT_SAVE,
    START_MENU_ICON_INHIBIT_OPTIONS,
    START_MENU_ICON_INHIBIT_RUNNING_SHOES,
    START_MENU_ICON_INHIBIT_7,
    START_MENU_ICON_INHIBIT_8,
    START_MENU_ICON_INHIBIT_POKEGEAR,
} StartMenuIconInhibit;

typedef struct StartMenuAction {
    int ident;
    TaskFunc func;
} StartMenuAction;

typedef struct UnkStruct_0203CA9C_Case8 {
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
    u16 unk_4;
    int unk_8;
} UnkStruct_0203CA9C_Case8;

#define STARTMENUTASKFUNC_CANCEL     ((TaskFunc)-2)
#define STARTMENUTASKFUNC_NONE    ((TaskFunc)-1)

static StartMenuTaskData *sub_0203BE34(void);
static u32 sub_0203BE60(FieldSystem *fieldSystem);
static u32 sub_0203BECC(FieldSystem *fieldSystem);
static u32 sub_0203BED0(FieldSystem *fieldSystem);
static u32 sub_0203BED4(FieldSystem *fieldSystem);
static u32 sub_0203BED8(FieldSystem *fieldSystem);
static u32 sub_0203BEE0(FieldSystem *fieldSystem);
static u32 sub_0203BEE8(FieldSystem *fieldSystem);
static BOOL sub_0203BEF0(TaskManager *taskManager);
static void sub_0203C14C(TaskManager *taskManager);
static void sub_0203C1FC(u8 *a0, u8 *a1, u32 *a2, u8 a3, vu32 a4);
static u32 sub_0203C220(StartMenuTaskData *startMenu, u8 *a1, u8 *a2);
static void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
static BOOL sub_0203C3B8(FieldSystem *fieldSystem, int a1);
static void sub_0203C460(FieldSystem *fieldSystem);
static BOOL sub_0203C47C(TaskManager *taskManager);
static BOOL sub_0203C508(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static BOOL sub_0203C5A4(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static void sub_0203C69C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
static void sub_0203C6C8(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender);
static void sub_0203C830(StartMenuTaskData *startMenu);
static void sub_0203C870(TaskManager *taskManager);
static void sub_0203C8B0(TaskManager *taskManager);
static BOOL sub_0203C8FC(TaskManager *taskManager);
static BOOL sub_0203C920(TaskManager *taskManager);
static BOOL sub_0203CA14(TaskManager *taskManager);
static BOOL sub_0203CA44(TaskManager *taskManager);
static BOOL sub_0203CA68(TaskManager *taskManager);
static BOOL sub_0203CF0C(TaskManager *taskManager);
static BOOL sub_0203CF30(TaskManager *taskManager);
static void sub_0203CF74(PartyMenuArgs *partyMenuArgs, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static BOOL sub_0203CFC0(TaskManager *taskManager);
static BOOL sub_0203D1A8(TaskManager *taskManager);
static BOOL sub_0203D1CC(TaskManager *taskManager);
static BOOL sub_0203D218(TaskManager *taskManager);
static BOOL sub_0203D244(TaskManager *taskManager);
static void sub_0203D264(TaskManager *taskManager);
static void sub_0203D288(TaskManager *taskManager);
static BOOL sub_0203D2CC(TaskManager *taskManager);
static void sub_0203D2EC(TaskManager *taskManager);
static void sub_0203D304(TaskManager *taskManager);
static BOOL sub_0203D318(TaskManager *taskManager);
static BOOL sub_0203D33C(TaskManager *taskManager);
static BOOL sub_0203D368(TaskManager *taskManager);
static BOOL sub_0203D394(TaskManager *taskManager);
static BOOL sub_0203D3B8(TaskManager *taskManager);
static BOOL sub_0203D418(TaskManager *taskManager);
static BOOL sub_0203D488(TaskManager *taskManager);
static BOOL sub_0203D500(TaskManager *taskManager);
static BOOL sub_0203D524(TaskManager *taskManager);
static BOOL sub_0203D550(TaskManager *taskManager);
static BOOL sub_0203D580(TaskManager *taskManager);
static void sub_0203D664(TaskManager *taskManager, int a1);
static BOOL sub_0203D6C8(TaskManager *taskManager);
static void sub_0203D940(FieldSystem *fieldSystem, StartMenuTaskData *startMenu, u8 a2);
static void sub_0203D9E8(TaskManager *taskManager);
static void sub_0203DAE4(TaskManager *taskManager);

static const int _020FA0C4[] = {
    0,
    1,
    2,
    4,
    5,
    6,
    100,
    100,
    100,
    100,
    100,
    3,
};

static const StartMenuAction _020FA0F4[] = {
    { 0, sub_0203C8FC},
    { 1, sub_0203CA44},
    { 2, sub_0203CF0C},
    { 3, sub_0203D1A8},
    { 4, sub_0203D244},
    { 5, sub_0203D318},
    { 6, STARTMENUTASKFUNC_CANCEL},
    { 7, sub_0203D394},
    { 8, sub_0203D488},
    {14, sub_0203D500},
    {14, sub_0203D500},
    {14, sub_0203D500},
    {14, sub_0203D2CC},
};

static const u8 _020FA0AC[] = {
    1, 4
};

const u8 _020FA0B0[] = {
    0, 1, 2, 3, 4
};

static const u8 _020FA0B8[] = {
    0, 1, 2, 3, 4, 5, 6, 7, 0xFF
};

BOOL sub_0203BC10(FieldSystem *fieldSystem) {
    return MapHeader_GetMapSec(fieldSystem->location->mapId) != MAPSEC_MYSTERY_ZONE;
}

void sub_0203BC28(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BCDC(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE0(fieldSystem);
    r4->unk_350 = TRUE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD20(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE8(fieldSystem);
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD64(FieldSystem *fieldSystem) {
    PlaySE(SEQ_SE_DP_WIN_OPEN);
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_350 = FALSE;
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else if (fieldSystem->unk70 == 3) {
        r4->unk_34C = sub_0203BEE8(fieldSystem);
    } else if (fieldSystem->unk70 == 2) {
        r4->unk_34C = sub_0203BEE0(fieldSystem);
        r4->unk_350 = TRUE;
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    TaskManager_Jump(fieldSystem->taskman, sub_0203BEF0, r4);
}

static StartMenuTaskData *sub_0203BE34(void) {
    StartMenuTaskData *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(StartMenuTaskData));
    MI_CpuClearFast(ret, sizeof(StartMenuTaskData));
    ret->state = 0;
    ret->unk_024 = 0;
    ret->atexit_TaskEnv = NULL;
    return ret;
}

static u32 sub_0203BE60(FieldSystem *fieldSystem) {
    u32 ret = 0;
    if (!CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICON_INHIBIT_POKEDEX);
    }
    if (!CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICOM_INHIBIT_POKEMON);
    }
    if (!CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_BAG)) {
        ret |= (1 << START_MENU_ICON_INHIBIT_BAG);
    }
    if (!CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
    }
    if (MapHeader_MapIsAmitySquare(fieldSystem->location->mapId) == TRUE) {
        ret |= (1 << START_MENU_ICOM_INHIBIT_POKEMON) | (1 << START_MENU_ICON_INHIBIT_BAG);
    }
    ret |= (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8);
    return ret;
}

static u32 sub_0203BECC(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

static u32 sub_0203BED0(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

static u32 sub_0203BED4(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

static u32 sub_0203BED8(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_POKEDEX) | (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8) | (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
}

static u32 sub_0203BEE0(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_8);
}

static u32 sub_0203BEE8(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_POKEDEX) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8) | (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
}

static BOOL sub_0203BEF0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    switch (startMenu->state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        if (ov01_021F6B00(fieldSystem)) {
            ov01_021F6A9C(fieldSystem, 0, NULL);
            startMenu->state = 2;
            break;
        }
        // fallthrough
    case 1:
        ItemCheckUseData_Init(fieldSystem, &startMenu->unk_358);
        FieldSystem_MakeFieldMoveCheckData(fieldSystem, &startMenu->unk_370);
        sub_0203C14C(taskManager);
        fieldSystem->unkD2_0 = 1;
        startMenu->state = 3;
        break;
    case 2:
        if (ov01_021F6B10(fieldSystem) == 6) {
            sub_0203C14C(taskManager);
            fieldSystem->unkD2_0 = 1;
        } else if (ov01_021F6B10(fieldSystem) == 1) {
            ItemCheckUseData_Init(fieldSystem, &startMenu->unk_358);
            FieldSystem_MakeFieldMoveCheckData(fieldSystem, &startMenu->unk_370);
            startMenu->state = 3;
        }
        break;
    case 3:
        if (!sub_0203C47C(taskManager)) {
            return FALSE;
        }
        break;
    case 4:
        sub_0203C870(taskManager);
        break;
    case 5:
        sub_0203C8B0(taskManager);
        break;
    case 6:
        sub_0203D264(taskManager);
        break;
    case 7:
        sub_0203D288(taskManager);
        break;
    case 8:
        sub_0203D9E8(taskManager);
        break;
    case 9:
        sub_0203DAE4(taskManager);
        break;
    case 15:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            sub_0203C14C(taskManager);
            fieldSystem->unkD2_0 = 1;
            ov01_021E636C(1);
            startMenu->state = 17;
        }
        break;
    case 10:
        if (sub_020505C8(fieldSystem)) {
            ov01_021E636C(1);
            startMenu->state = 11;
        }
        break;
    case 11:
        if (IsPaletteFadeFinished()) {
            sub_0203C69C(startMenu, fieldSystem);
            FreeToHeap(startMenu);
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            return TRUE;
        }
        break;
    case 12:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            ov01_021E636C(1);
            startMenu->state = 13;
        }
        break;
    case 13:
        if (IsPaletteFadeFinished()) {
            TaskManager_Jump(taskManager, startMenu->atexit_TaskFunc, startMenu->atexit_TaskEnv);
            FreeToHeap(startMenu);
        }
        break;
    case 14:
        startMenu->atexit_TaskFunc(taskManager);
        break;
    case 18:
        FreeToHeap(startMenu);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case 16:
        sub_0203C69C(startMenu, fieldSystem);
        sub_0203C38C(startMenu, fieldSystem);
        fieldSystem->unkD2_0 = 2;
        ScheduleBgTilemapBufferTransfer(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        FreeToHeap(startMenu);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case 17:
        if (IsPaletteFadeFinished()) {
            startMenu->state = 3;
        }
        break;
    case 19:
        sub_0203D2EC(taskManager);
        break;
    case 20:
        sub_0203D304(taskManager);
        break;
    }
    if (startMenu->unk_020) {
        sub_0202457C(startMenu->unk_1D4);
    }
    return FALSE;
}

static void sub_0203C14C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    u32 r6 = sub_0203C220(startMenu, startMenu->unk_030, startMenu->unk_03A);
    startMenu->unk_02C = r6;
    startMenu->unk_024 = 0;
    for (int i = 0; i < r6; ++i) {
        if (fieldSystem->unk90 == startMenu->unk_030[i]) {
            startMenu->unk_024 = i;
        }
    }
    startMenu->unk_020 = TRUE;
    GfGfxLoader_LoadCharData(NARC_a_0_1_4, 12, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 15, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1C0, 0x20, HEAP_ID_FIELD);
    GfGfxLoader_LoadScrnData(NARC_a_0_1_4, 13, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    sub_0203C6C8(startMenu, startMenu->unk_030, r6, PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fieldSystem->saveData)));
}

static void sub_0203C1FC(u8 *a0, u8 *a1, u32 *a2, u8 a3, vu32 a4) {
    a0[*a2] = a3;
    if (a4 == -1u) {
        a4 = *a2;
    }
    a1[a4] = a3;
    ++(*a2);
}

static u32 sub_0203C220(StartMenuTaskData *startMenu, u8 *a1, u8 *a2) {
    u32 sp4 = 0;

    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_8))) {
        sub_0203C1FC(a1, a2, &sp4, 8, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_7))) {
        sub_0203C1FC(a1, a2, &sp4, 7, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_POKEDEX))) {
        sub_0203C1FC(a1, a2, &sp4, 0, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICOM_INHIBIT_POKEMON))) {
        sub_0203C1FC(a1, a2, &sp4, 1, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_BAG))) {
        sub_0203C1FC(a1, a2, &sp4, 2, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_POKEGEAR))) {
        if (startMenu->unk_350) {
            sub_0203C1FC(a1, a2, &sp4, 12, -1u);
        } else {
            sub_0203C1FC(a1, a2, &sp4, 11, -1u);
        }
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_TRAINER_CARD))) {
        sub_0203C1FC(a1, a2, &sp4, 3, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_SAVE))) {
        sub_0203C1FC(a1, a2, &sp4, 4, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_OPTIONS))) {
        sub_0203C1FC(a1, a2, &sp4, 5, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_RUNNING_SHOES))) {
        sub_0203C1FC(a1, a2, &sp4, 6, -1u);
    }
    sub_0203C1FC(a1, a2, &sp4, 9, 7);
    sub_0203C1FC(a1, a2, &sp4, 10, 8);
    return sp4;
}

static void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem) {
    sub_0203C830(startMenu);
    FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, 0x20, 0x18, 0);
    startMenu->unk_020 = FALSE;
}

static BOOL sub_0203C3B8(FieldSystem *fieldSystem, int a1) {
    return sub_0203C3CC(fieldSystem, _020FA0C4[a1]);
}

BOOL sub_0203C3CC(FieldSystem *fieldSystem, int a1) {
    switch (a1) {
    case START_MENU_ICON_POKEDEX:
        return CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICOM_POKEMON:
        return CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICON_BAG:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_BAG);
    case START_MENU_ICON_POKEGEAR:
        return CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICON_TRAINER_CARD:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_TRAINER_CARD);
    case START_MENU_ICON_SAVE:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_SAVE_BUTTON);
    case START_MENU_ICON_OPTIONS:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_OPTIONS_BUTTON);
    case START_MENU_ICON_RUNNING_SHOES:
        return PlayerSaveData_CheckRunningShoes(LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData)));
    default:
        return TRUE;
    }
}

static void sub_0203C460(FieldSystem *fieldSystem) {
    if (fieldSystem->unkE0 != 4 && fieldSystem->unkE0 != 11) {
        sub_02092FA8(fieldSystem->unk114);
    }
}

static BOOL sub_0203C47C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!ov01_021F6B00(fieldSystem) && ov01_021F6B10(fieldSystem) == TRUE) {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (!sub_0203C508(taskManager, fieldSystem, startMenu)) {
                return FALSE;
            }
            sub_0203C460(fieldSystem);
        } else {
            if (fieldSystem->unkD0 == 0) {
                if (gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_X)) {
                    PlaySE(SEQ_SE_GS_GEARCANCEL);
                    startMenu->state = 16;
                }
            } else {
                if (!sub_0203C5A4(taskManager, fieldSystem, startMenu)) {
                    return FALSE;
                }
                sub_0203C460(fieldSystem);
            }
        }
    }
    return TRUE;
}

static BOOL sub_0203C508(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->unkD3 < startMenu->unk_02C) {
        PlaySE(SEQ_SE_DP_SELECT);
        sub_02018410(&fieldSystem->unk_10C, 0);
        startMenu->unk_028 = fieldSystem->unkD3;
        if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func == STARTMENUTASKFUNC_CANCEL) {
            startMenu->state = 16;
        } else if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func != STARTMENUTASKFUNC_NONE) {
            if (sub_0203C3B8(fieldSystem, startMenu->unk_03A[startMenu->unk_028])) {
                TaskFunc func = _020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func;
                sub_0203DF64(fieldSystem, 0);
                ov01_021F6B50(fieldSystem);
                fieldSystem->unkD0 = 0;
                fieldSystem->unkE0 = startMenu->unk_03A[startMenu->unk_028];
                return func(taskManager);
            }
        }
    }

    return TRUE;
}

static BOOL sub_0203C5A4(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->unkD0 != 0) {
        sub_02018410(&fieldSystem->unk_10C, 1);
    }
    switch (fieldSystem->unkD0) {
    case 1:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        startMenu->state = 16;
        fieldSystem->unkD0 = 0;
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
        fieldSystem->unkD3 = fieldSystem->unkD0 - 2;
        if (fieldSystem->unkD3 < startMenu->unk_02C) {
            PlaySE(SEQ_SE_DP_SELECT);
            startMenu->unk_028 = fieldSystem->unkD3;
            if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func == STARTMENUTASKFUNC_CANCEL) {
                startMenu->state = 16;
                fieldSystem->unkD0 = 0;
            } else if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func != STARTMENUTASKFUNC_NONE) {
                if (sub_0203C3B8(fieldSystem, startMenu->unk_03A[startMenu->unk_028])) {
                    TaskFunc func = _020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func;
                    fieldSystem->unkD0 = 0;
                    sub_0203DF64(fieldSystem, 1);
                    ov01_021F6B50(fieldSystem);
                    fieldSystem->unkE0 = startMenu->unk_03A[startMenu->unk_028];
                    return func(taskManager);
                } else {
                    fieldSystem->unkD0 = 0;
                }
            }
        }
        break;
    }
    return TRUE;
}

static void sub_0203C69C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem) {
    if (sub_02035650() && startMenu->unk_350) {
        sub_0205AD0C(fieldSystem->unk84);
        sub_02037FF0();
        sub_0205A904(0);
    }
}

static void sub_0203C6C8(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender) {
    startMenu->unk_1D4 = G2dRenderer_Init(1, &startMenu->unk_1D8, HEAP_ID_FIELD);
    for (int i = 0; i < 4; ++i) {
        startMenu->unk_300[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, HEAP_ID_FIELD);
    }
    startMenu->unk_310[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_CHAR], NARC_a_0_1_4, 64, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_PLTT], NARC_a_0_1_4, 61, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_CELL], NARC_a_0_1_4, 62, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_ANIM], NARC_a_0_1_4, 63, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_FIELD);
    sub_0200ADA4(startMenu->unk_310[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B00C(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    sub_0200A740(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    CreateSpriteResourcesHeader(&startMenu->unk_320, 0, 0, 0, 0, -1, -1, 0, 0, startMenu->unk_300[GF_GFX_RES_TYPE_CHAR], startMenu->unk_300[GF_GFX_RES_TYPE_PLTT], startMenu->unk_300[GF_GFX_RES_TYPE_CELL], startMenu->unk_300[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    SpriteTemplate spriteTemplate;
    spriteTemplate.spriteList = startMenu->unk_1D4;
    spriteTemplate.header = &startMenu->unk_320;
    spriteTemplate.position.z = 0;
    spriteTemplate.scale.x = FX32_ONE;
    spriteTemplate.scale.y = FX32_ONE;
    spriteTemplate.scale.z = FX32_ONE;
    spriteTemplate.rotation = 0;
    spriteTemplate.priority = 0;
    spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate.heapId = HEAP_ID_FIELD;
    spriteTemplate.header = &startMenu->unk_320;  // second assign is necessary to match
    spriteTemplate.position.x = FX32_CONST(100);
    spriteTemplate.position.y = FX32_CONST(144);
    startMenu->unk_344 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(startMenu->unk_344, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void sub_0203C830(StartMenuTaskData *startMenu) {
    sub_0200AEB0(startMenu->unk_310[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    for (u16 i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(startMenu->unk_300[i]);
    }
    SpriteList_Delete(startMenu->unk_1D4);
}

static void sub_0203C870(TaskManager *taskManager) {
    if (IsPaletteFadeFinished()) {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

        sub_0203C38C(startMenu, fieldSystem);
        fieldSystem->unkD2_0 = 0;
        startMenu->atexit_TaskFunc(taskManager);
        startMenu->state = 5;
    }
}

static void sub_0203C8B0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
        startMenu->atexit_TaskFunc(taskManager);
        if (startMenu->state == 15 && sub_020183F0(&fieldSystem->unk_10C) == TRUE) {
            startMenu->state = 10;
        }
    }
}

void sub_0203C8F0(StartMenuTaskData *startMenu, TaskFunc func) {
    startMenu->atexit_TaskFunc = func;
    startMenu->state = 5;
}

static BOOL sub_0203C8FC(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203C920;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203C920(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    Location *position = LocalFieldData_GetCurrentPosition(localFieldData);
    Location *specialSpawnWarp = LocalFieldData_GetSpecialSpawnWarpPtr(localFieldData);
    PokedexArgs *r5 = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokedexArgs));
    MI_CpuClear8(r5, sizeof(PokedexArgs));
    r5->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    r5->playerProfile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    r5->unk_08 = fieldSystem->unkA8;
    r5->unk_0C = &fieldSystem->unk_10C;
    int x = GetPlayerXCoord(fieldSystem->playerAvatar);
    int y = GetPlayerYCoord(fieldSystem->playerAvatar);
    r5->mapMatrixId = MapMatrix_GetMapHeader(fieldSystem->mapMatrix, x / 32, y / 32);
    r5->mapId = position->mapId;
    if (MapHeader_MapIsOnMainMatrix(r5->mapMatrixId)) {
        r5->x = x;
        r5->y = y;
    } else {
        s16 wmX;
        s16 wmY;
        MapHeader_GetWorldMapCoords(r5->mapMatrixId, &wmX, &wmY);
        if (wmX == 0 && wmY == 0) {
            r5->x = specialSpawnWarp->x;
            r5->y = specialSpawnWarp->y;
        } else {
            r5->x = wmX * 32;
            r5->y = wmY * 32;
        }
    }
    Pokedex_LaunchApp(fieldSystem, r5);
    startMenu->atexit_TaskEnv = r5;
    startMenu->atexit_TaskFunc = sub_0203CA14;
    return FALSE;
}

static BOOL sub_0203CA14(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    sub_020505C0(fieldSystem);
    if (startMenu->atexit_TaskEnv != NULL) {
        FreeToHeapExplicit(HEAP_ID_FIELD, startMenu->atexit_TaskEnv);
    }
    startMenu->state = 15;
    return FALSE;
}

static BOOL sub_0203CA44(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203CA68;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203CA68(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->unk_370, 0);
    startMenu->atexit_TaskFunc = sub_0203CA9C;
    return FALSE;
}

BOOL sub_0203CA9C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    PartyMenuArgs *r6 = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
    memcpy(r6, startMenu->atexit_TaskEnv, sizeof(PartyMenuArgs));
    FreeToHeap(startMenu->atexit_TaskEnv);

    switch (r6->unk_27) {
    case 1: {
        PokemonSummaryArgs *r7 = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        r7->party = SaveArray_Party_Get(fieldSystem->saveData);
        r7->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        r7->unk11 = 1;
        r7->unk14 = r6->unk_26;
        r7->partyCount = Party_GetCount(r7->party);
        r7->unk18 = 0;
        r7->unk12 = 0;
        r7->ribbons = Save_SpecialRibbons_Get(fieldSystem->saveData);
        r7->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        r7->unk2C = sub_02088288(fieldSystem->saveData);
        r7->unk28 = 0;
        r7->unk30 = &fieldSystem->unk_10C;
        r7->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(r7, _020FA0B0);
        sub_0208AD34(r7, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, r7);
        startMenu->atexit_TaskEnv = r7;
        sub_0203C8F0(startMenu, sub_0203D580);
        break;
    }
    case 4: {
        PokemonSummaryArgs *r7 = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        r7->party = SaveArray_Party_Get(fieldSystem->saveData);
        r7->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        r7->unk11 = 1;
        r7->unk14 = r6->unk_26;
        r7->partyCount = 1;
        r7->unk18 = r6->unk2A;
        r7->unk12 = 2;
        r7->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        r7->unk2C = sub_02088288(fieldSystem->saveData);
        r7->unk28 = 0;
        r7->unk30 = &fieldSystem->unk_10C;
        r7->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(r7, _020FA0AC);
        sub_0208AD34(r7, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, r7);
        u16 *unk = AllocFromHeap(HEAP_ID_FIELD, 2 * sizeof(u16));
        unk[0] = r6->itemId;
        unk[1] = 0;
        startMenu->unk_384 = unk;
        startMenu->atexit_TaskEnv = r7;
        sub_0203C8F0(startMenu, sub_0203D580);
        break;
    }
    case 5: {
        PokemonSummaryArgs *r7 = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        r7->party = SaveArray_Party_Get(fieldSystem->saveData);
        r7->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        r7->unk11 = 1;
        r7->unk14 = r6->unk_26;
        r7->partyCount = 1;
        r7->unk18 = r6->unk2A;
        r7->unk12 = 2;
        r7->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        r7->unk2C = sub_02088288(fieldSystem->saveData);
        r7->unk28 = 0;
        r7->unk30 = &fieldSystem->unk_10C;
        r7->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(r7, _020FA0AC);
        sub_0208AD34(r7, Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, r7);
        u16 *unk = AllocFromHeap(HEAP_ID_FIELD, 2 * sizeof(u16));
        unk[0] = 0;
        unk[1] = r6->unk_38;
        startMenu->unk_384 = unk;
        startMenu->atexit_TaskEnv = r7;
        sub_0203C8F0(startMenu, sub_0203D580);
        break;
    }
    case 6:
        startMenu->atexit_TaskEnv = sub_0203EFEC(fieldSystem, 2, r6->unk_26, ItemToMailId(r6->itemId), HEAP_ID_FIELD);
        if (r6->unk_24 == 10) {
            startMenu->unk_384 = sub_0203D818(r6->itemId, 0, r6->unk_26);
        } else {
            startMenu->unk_384 = sub_0203D818(r6->itemId, 1, r6->unk_26);
        }
        sub_0203C8F0(startMenu, sub_0203D830);
        break;
    case 7:
        startMenu->atexit_TaskEnv = sub_0203F050(fieldSystem, Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), r6->unk_26), HEAP_ID_FIELD);
        startMenu->unk_384 = sub_0203D818(r6->itemId, 2, r6->unk_26);
        sub_0203C8F0(startMenu, sub_0203D830);
        break;
    case 3: {
        int *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(int));
        *unk = r6->unk_26;
        startMenu->unk_384 = unk;
        Bag *bag = Save_Bag_Get(fieldSystem->saveData);
        PlayerProfile *playerProfile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
        (void)playerProfile;
        startMenu->atexit_TaskEnv = Bag_CreateView(bag, _020FA0B8, HEAP_ID_FIELD);
        sub_0207789C(startMenu->atexit_TaskEnv, fieldSystem->saveData, 1, fieldSystem->bagCursor, &fieldSystem->unk_10C);
        Bag_LaunchApp(fieldSystem, startMenu->atexit_TaskEnv);
        sub_0203C8F0(startMenu, sub_0203CFC0);
        break;
    }
    case 8: {
        UnkStruct_0203CA9C_Case8 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203CA9C_Case8));
        unk->unk_2 = r6->itemId;
        unk->unk_1 = 3;
        unk->unk_0 = r6->unk_26;
        unk->unk_4 = r6->unk_3C;
        unk->unk_8 = r6->unk_40;
        startMenu->atexit_TaskEnv = unk;
        startMenu->state = 8;
        break;
    }
    case 9: {
        UnkStruct_0203CA9C_Case8 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203CA9C_Case8));
        unk->unk_2 = MapHeader_GetMapEvolutionMethod(fieldSystem->location->mapId);
        unk->unk_1 = 0;
        unk->unk_0 = r6->unk_26;
        unk->unk_4 = r6->unk_3C;
        unk->unk_8 = r6->unk_40;
        startMenu->atexit_TaskEnv = unk;
        startMenu->state = 8;
        break;
    }
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24: {
        FieldMoveUseData sp4;

        sp4.fieldMoveIdx = r6->unk_27 - 11;
        sp4.partySlot = r6->unk_26;
        sp4.taskManager = taskManager;
        ((FieldMoveUseFunc)PartyMenu_GetFieldMoveFunc(FIELD_MOVE_FUNC_USE, sp4.fieldMoveIdx))(&sp4, &startMenu->unk_370);
        break;
    }
    case 10:
        startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
        sub_0203C8F0(startMenu, sub_0203CFC0);
        break;
    default:
        if (r6->unk_24 == 5 || r6->unk_24 == 6 || r6->unk_24 == 7 || r6->unk_24 == 16 || r6->unk_24 == 8) {
            startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
            if (r6->unk_26 >= 6) {
                sub_020778E0(startMenu->atexit_TaskEnv, 0);
            } else {
                sub_020778E0(startMenu->atexit_TaskEnv, r6->unk_26);
            }
            sub_0203C8F0(startMenu, sub_0203CFC0);
        } else if (r6->unk_24 == 9) {
            startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
            sub_0203C8F0(startMenu, sub_0203CFC0);
        } else {
            sub_020505C0(fieldSystem);
            startMenu->state = 15;
        }
        break;
    }
    FreeToHeap(r6);
    return FALSE;
}

static BOOL sub_0203CF0C(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203CF30;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203CF30(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
    sub_020778E0(startMenu->atexit_TaskEnv, 0);
    startMenu->atexit_TaskFunc = sub_0203CFC0;
    ov01_021F4440(fieldSystem);
    return FALSE;
}

static void sub_0203CF74(PartyMenuArgs *partyMenuArgs, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
    partyMenuArgs->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenuArgs->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenuArgs->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenuArgs->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenuArgs->unk_18 = &startMenu->unk_370;
    partyMenuArgs->unk_25 = 0;
    partyMenuArgs->fieldSystem = fieldSystem;
    partyMenuArgs->unk20 = &fieldSystem->unk_10C;
}

static BOOL sub_0203CFC0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    BagView *bagView = BagView_New(HEAP_ID_FIELD);
    memcpy(bagView, startMenu->atexit_TaskEnv, BagView_sizeof());
    FreeToHeap(startMenu->atexit_TaskEnv);

    switch (sub_0207790C(bagView)) {
    case 0: {
        ItemMenuUseData sp10;
        sp10.itemId = sub_02077904(bagView);
        sp10.unk6 = sub_02077914(bagView);
        sp10.taskManager = taskManager;
        ItemMenuUseFunc func = GetItemFieldUseFunc(USE_ITEM_TASK_MENU, GetItemAttr(sp10.itemId, ITEMATTR_FIELDUSEFUNC, HEAP_ID_FIELD));
        func(&sp10, &startMenu->unk_358);
        break;
    }
    case 1:
        sub_0203D664(taskManager, sub_02077904(bagView));
        break;
    case 2: {
        PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
        memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
        sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
        partyMenuArgs->unk_24 = 9;
        partyMenuArgs->itemId = sub_02077904(bagView);
        FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
        startMenu->atexit_TaskEnv = partyMenuArgs;
        sub_0203C8F0(startMenu, sub_0203CA9C);
        break;
    }
    case 4: {
        Party *party = SaveArray_Party_Get(fieldSystem->saveData);
        int *unk = startMenu->unk_384;
        int monId = *unk;
        u16 itemId = sub_02077904(bagView);
        Pokemon *pokemon = Party_GetMonByIndex(party, monId);
        FreeToHeap(startMenu->unk_384);
        if (ItemIdIsMail(itemId) == TRUE && !GetMonData(pokemon, MON_DATA_HELD_ITEM, NULL)) {
            startMenu->atexit_TaskEnv = sub_0203EFEC(fieldSystem, 2, monId, ItemToMailId(itemId), HEAP_ID_FIELD);
            startMenu->unk_384 = sub_0203D818(itemId, 0, monId);
            sub_0203C8F0(startMenu, sub_0203D830);
        } else {
            PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
            memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
            sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
            partyMenuArgs->party = party;
            partyMenuArgs->itemId = sub_02077904(bagView);
            partyMenuArgs->unk_26 = monId;
            if (partyMenuArgs->itemId == ITEM_NONE) {
                partyMenuArgs->unk_24 = 0;
            } else {
                partyMenuArgs->unk_24 = 10;
            }
            FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
            startMenu->atexit_TaskEnv = partyMenuArgs;
            sub_0203C8F0(startMenu, sub_0203CA9C);
        }
        break;
    }
    case 3:
    case 5:
    default:
        sub_020505C0(fieldSystem);
        startMenu->state = 15;
        break;
    }
    FreeToHeap(bagView);
    return FALSE;
}

static BOOL sub_0203D1A8(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203D1CC;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203D1CC(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = sub_020691C4(HEAP_ID_FIELD);
    TrainerCardAppArgs *trainerCard = startMenu->atexit_TaskEnv;
    sub_02068FC8(1, 1, 0, 255, fieldSystem, trainerCard);
    TrainerCard_LaunchApp(fieldSystem, trainerCard);
    startMenu->atexit_TaskFunc = sub_0203D218;
    return FALSE;
}

static BOOL sub_0203D218(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    sub_020691E0(startMenu->atexit_TaskEnv);
    sub_020505C0(fieldSystem);
    startMenu->state = 15;
    return FALSE;
}

static BOOL sub_0203D244(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    ov01_021F6A9C(fieldSystem, 1, NULL);
    startMenu->state = 6;
    return TRUE;
}

static void sub_0203D264(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (ov01_021F6B00(fieldSystem) == TRUE) {
        startMenu->state = 7;
    }
}

static void sub_0203D288(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!ov01_021F6B00(fieldSystem) && ov01_021F6B10(fieldSystem) == TRUE) {
        if (fieldSystem->unkD0 == 1) {
            fieldSystem->unkD0 = 0;
            startMenu->state = 16;
        } else {
            startMenu->state = 3;
        }
    }
}

static BOOL sub_0203D2CC(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    ov01_021F6A9C(fieldSystem, 8, NULL);
    startMenu->state = 19;
    return TRUE;
}

static void sub_0203D2EC(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    startMenu->state = 20;
}

static void sub_0203D304(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->state = 16;
}

static BOOL sub_0203D318(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203D33C;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203D33C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = OptionsMenu_LaunchApp(fieldSystem);
    startMenu->atexit_TaskFunc = sub_0203D368;
    return FALSE;
}

static BOOL sub_0203D368(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    FreeToHeap(startMenu->atexit_TaskEnv);
    sub_020505C0(fieldSystem);
    startMenu->state = 15;
    return FALSE;
}

static BOOL sub_0203D394(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203D3B8;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203D3B8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = EasyChat_CreateArgs(2, 0, fieldSystem->saveData, &fieldSystem->unk_10C, HEAP_ID_FIELD);
    MAIL_MESSAGE mailMessage;
    MailMsg_Init_WithBank(&mailMessage, MAILMSG_BANK_0295_GMM);
    sub_02090D20(startMenu->atexit_TaskEnv, &mailMessage);
    EasyChat_LaunchApp(fieldSystem, startMenu->atexit_TaskEnv);
    startMenu->atexit_TaskFunc = sub_0203D418;
    return FALSE;
}

static BOOL sub_0203D418(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!sub_02090D48(startMenu->atexit_TaskEnv)) {
        MAIL_MESSAGE mailMessage;
        sub_02090D60(startMenu->atexit_TaskEnv, &mailMessage);
        if (sub_02035650()) {
            sub_0205AB88(&mailMessage);
            sub_0205AA6C(fieldSystem->unk80, &mailMessage);
        }
        startMenu->state = 10;
    } else {
        startMenu->state = 15;
    }
    EasyChat_FreeArgs(startMenu->atexit_TaskEnv);
    sub_020505C0(fieldSystem);
    sub_0205AD0C(fieldSystem->unk84);
    return FALSE;
}

static BOOL sub_0203D488(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    sub_0203C38C(startMenu, fieldSystem);
    fieldSystem->unkD2_0 = 0;
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        StartScriptFromMenu(taskManager, std_safari_exit, NULL);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        StartScriptFromMenu(taskManager, std_bug_contest_retire, NULL);
    } else {
        StartScriptFromMenu(taskManager, 4, NULL);
    }
    FreeToHeap(startMenu);
    return FALSE;
}

static BOOL sub_0203D500(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->atexit_TaskFunc = sub_0203D524;
    startMenu->state = 4;
    return TRUE;
}

static BOOL sub_0203D524(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = PokegearPhone_LaunchApp(fieldSystem);
    startMenu->atexit_TaskFunc = sub_0203D550;
    return FALSE;
}

static BOOL sub_0203D550(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    sub_020505C0(fieldSystem);
    if (startMenu->atexit_TaskEnv != NULL) {
        FreeToHeapExplicit(HEAP_ID_FIELD, startMenu->atexit_TaskEnv);
    }
    startMenu->state = 15;
    return FALSE;
}

static BOOL sub_0203D580(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    PokemonSummaryArgs *summaryArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
    memcpy(summaryArgs, startMenu->atexit_TaskEnv, sizeof(PokemonSummaryArgs));
    FreeToHeap(startMenu->atexit_TaskEnv);
    if (summaryArgs->unk12 == 2) {
        PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
        u16 *r7 = startMenu->unk_384;
        sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
        partyMenuArgs->itemId = r7[0];
        partyMenuArgs->unk_26 = summaryArgs->unk14;
        partyMenuArgs->unk2A = summaryArgs->unk18;
        partyMenuArgs->unk2C = summaryArgs->unk16;
        if (r7[0] != ITEM_NONE) {
            partyMenuArgs->unk_24 = 7;
            partyMenuArgs->unk_38 = 0;
        } else {
            partyMenuArgs->unk_24 = 8;
            partyMenuArgs->unk_38 = r7[1];
        }
        partyMenuArgs->unk20 = &fieldSystem->unk_10C;
        FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
        FreeToHeap(startMenu->unk_384);
        startMenu->atexit_TaskEnv = partyMenuArgs;
        sub_0203C8F0(startMenu, sub_0203CA9C);
    } else {
        startMenu->atexit_TaskEnv = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->unk_370, summaryArgs->unk14);
        sub_0203C8F0(startMenu, sub_0203CA9C);
    }
    FreeToHeap(summaryArgs);
    return FALSE;
}

static void sub_0203D664(TaskManager *taskManager, int a1) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    Bag *bag = Save_Bag_Get(fieldSystem->saveData);
    for (u8 i = 0; i < NUM_BERRIES; ++i) {
        if (Bag_HasItem(bag, BerryToItemId(i), 1, HEAP_ID_FIELD)) {}
    }
    u8 scroll, position;
    BagCursor_Field_PocketGetPosition(fieldSystem->bagCursor, POCKET_BERRIES, &position, &scroll);
    sub_0203C8F0(startMenu, sub_0203D6C8);
}

static BOOL sub_0203D6C8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    BagCursor_Field_PocketSetPosition(fieldSystem->bagCursor, POCKET_BERRIES, 0, 0);
    FreeToHeapExplicit(HEAP_ID_FIELD, startMenu->atexit_TaskEnv);
    startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
    sub_0203C8F0(startMenu, sub_0203CFC0);
    return FALSE;
}

BOOL sub_0203D718(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    FreeToHeapExplicit(HEAP_ID_FIELD, startMenu->atexit_TaskEnv);
    startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
    sub_0203C8F0(startMenu, sub_0203CFC0);
    return FALSE;
}

BOOL Task_UseFlyInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    struct FlyTaskStruct *flyMap = startMenu->unk_384;
    int partySlot = flyMap->partySlot;
    FreeToHeapExplicit(HEAP_ID_FIELD, flyMap);
    PokegearArgs *pokegearArgs = startMenu->atexit_TaskEnv;
    if (!pokegearArgs->unk_14) {
        FreeToHeapExplicit(HEAP_ID_FIELD, pokegearArgs);
        startMenu->atexit_TaskEnv = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->unk_370, partySlot);
        sub_0203C8F0(startMenu, sub_0203CA9C);
    } else {
        Pokemon *pokemon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), partySlot);
        struct UnkStruct_02067BF8 *r5 = sub_02067BF8(HEAP_ID_FIELD, fieldSystem, pokemon, partySlot, pokegearArgs->unk_20, pokegearArgs->unk_18 * 32 + 0x10, pokegearArgs->unk_1C * 32 + 0x10);
        FreeToHeapExplicit(HEAP_ID_FIELD, startMenu->atexit_TaskEnv);
        sub_020505C0(fieldSystem);
        startMenu->atexit_TaskFunc = sub_02067C30;
        startMenu->atexit_TaskEnv = r5;
        startMenu->state = 12;
    }
    return FALSE;
}

struct UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 a1, u8 a2) {
    struct UnkStruct_0203D818 *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct UnkStruct_0203D818));
    ret->itemId = itemId;
    ret->unk2 = a2;
    ret->unk3 = a1;
    return ret;
}

BOOL sub_0203D830(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    struct UnkStruct_0203D818 *unk = startMenu->unk_384;
    switch (unk->unk3) {
    case 3:
        sub_02090F90(startMenu->atexit_TaskEnv);
        startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
        sub_0203C8F0(startMenu, sub_0203CFC0);
        break;
    case 2:
        sub_02090F90(startMenu->atexit_TaskEnv);
        startMenu->atexit_TaskEnv = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->unk_370, unk->unk2);
        sub_0203C8F0(startMenu, sub_0203CA9C);
        break;
    case 0:
        if (sub_02090F6C(startMenu->atexit_TaskEnv) == TRUE) {
            sub_0203D940(fieldSystem, startMenu, 12);
        } else {
            sub_02090F90(startMenu->atexit_TaskEnv);
            startMenu->atexit_TaskEnv = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->unk_370, unk->unk2);
            sub_0203C8F0(startMenu, sub_0203CA9C);
        }
        break;
    case 1:
        if (sub_02090F6C(startMenu->atexit_TaskEnv) == TRUE) {
            sub_0203D940(fieldSystem, startMenu, 11);
        } else {
            sub_02090F90(startMenu->atexit_TaskEnv);
        startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
        sub_0203C8F0(startMenu, sub_0203CFC0);
        }
        break;
    }
    FreeToHeap(startMenu->unk_384);
    return FALSE;
}

static void sub_0203D940(FieldSystem *fieldSystem, StartMenuTaskData *startMenu, u8 a2) {
    struct UnkStruct_0203D818 *unk = startMenu->unk_384;
    PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
    sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
    partyMenuArgs->itemId = unk->itemId;
    partyMenuArgs->unk_26 = unk->unk2;
    partyMenuArgs->unk_24 = a2;
    sub_02090F70(startMenu->atexit_TaskEnv, Party_GetMonByIndex(partyMenuArgs->party, unk->unk2));
    sub_02090F90(startMenu->atexit_TaskEnv);
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
    startMenu->atexit_TaskEnv = partyMenuArgs;
    sub_0203C8F0(startMenu, sub_0203CA9C);
}

BOOL sub_0203D9B4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
    sub_0203C8F0(startMenu, sub_0203CFC0);
    return FALSE;
}

static void sub_0203D9E8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    UnkStruct_0203CA9C_Case8 *unk = startMenu->atexit_TaskEnv;
    Sound_Stop();
    CreateHeap(HEAP_ID_3, HEAP_ID_EVOLUTION, 0x30000);

    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *pokemon = Party_GetMonByIndex(party, unk->unk_0);
    EvolutionTaskData *evolution;
    if (unk->unk_1 == 0) {  // explicit equality is required to match
        evolution = sub_02075A7C(party, pokemon, unk->unk_4, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), sub_02088288(fieldSystem->saveData), Save_Pokedex_Get(fieldSystem->saveData), Save_Bag_Get(fieldSystem->saveData), Save_GameStats_Get(fieldSystem->saveData), unk->unk_8, TRUE, HEAP_ID_EVOLUTION);
    } else {
        evolution = sub_02075A7C(party, pokemon, unk->unk_4, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), sub_02088288(fieldSystem->saveData), Save_Pokedex_Get(fieldSystem->saveData), Save_Bag_Get(fieldSystem->saveData), Save_GameStats_Get(fieldSystem->saveData), unk->unk_8, FALSE, HEAP_ID_EVOLUTION);
    }
    int *newEnv = AllocFromHeap(HEAP_ID_FIELD, sizeof(int));
    *newEnv = unk->unk_0;
    startMenu->unk_384 = newEnv;
    FreeToHeap(startMenu->atexit_TaskEnv);
    startMenu->atexit_TaskEnv = evolution;
    startMenu->state = 9;
}

static void sub_0203DAE4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (sub_02075D3C(startMenu->atexit_TaskEnv) == TRUE) {
        sub_02075D4C(startMenu->atexit_TaskEnv);
        DestroyHeap(HEAP_ID_EVOLUTION);
        StopBGM(SEQ_GS_SHINKA, 0);
        sub_02004AD8(0);
        sub_02055164(fieldSystem, fieldSystem->location->mapId);
        startMenu->atexit_TaskEnv = sub_0203E3FC(fieldSystem, &startMenu->unk_358);
        int *unk = startMenu->unk_384;
        sub_020778E0(startMenu->atexit_TaskEnv, *unk);
        FreeToHeap(startMenu->unk_384);
        sub_0203C8F0(startMenu, sub_0203CFC0);
    }
}
