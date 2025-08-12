#include "start_menu.h"

#include "global.h"

#include "constants/map_sections.h"
#include "constants/sndseq.h"
#include "constants/start_menu_icons.h"
#include "constants/std_script.h"

#include "msgdata/msg/msg_0196.h"

#include "bag_view.h"
#include "field_move.h"
#include "field_move_environment.h"
#include "field_system.h"
#include "field_use_item.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "map_header.h"
#include "map_object.h"
#include "menu_input_state.h"
#include "overlay_01.h"
#include "overlay_01_021F6830.h"
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
#include "unk_02034B0C.h"
#include "unk_02037C94.h"
#include "unk_02054E00.h"
#include "unk_0205A44C.h"
#include "unk_0205AC88.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "unk_02067A60.h"
#include "unk_02068FC8.h"
#include "unk_020755E8.h"
#include "unk_02092BE8.h"

typedef enum StartMenuAction {
    START_MENU_ACTION_POKEDEX,
    START_MENU_ACTION_POKEMON,
    START_MENU_ACTION_BAG,
    START_MENU_ACTION_TRAINER_CARD,
    START_MENU_ACTION_SAVE,
    START_MENU_ACTION_OPTIONS,
    START_MENU_ACTION_RUNNING_SHOES,
    START_MENU_ACTION_7,
    START_MENU_ACTION_RETIRE,
    START_MENU_ACTION_9,
    START_MENU_ACTION_10,
    START_MENU_ACTION_POKEGEAR,
    START_MENU_ACTION_12,
} StartMenuAction;

typedef enum StartMenuActionDisable {
    START_MENU_ACTION_DISABLE_POKEDEX,
    START_MENU_ACTION_DISABLE_POKEMON,
    START_MENU_ACTION_DISABLE_BAG,
    START_MENU_ACTION_DISABLE_TRAINER_CARD,
    START_MENU_ACTION_DISABLE_SAVE,
    START_MENU_ACTION_DISABLE_OPTIONS,
    START_MENU_ACTION_DISABLE_RUNNING_SHOES,
    START_MENU_ACTION_DISABLE_7,
    START_MENU_ACTION_DISABLE_RETIRE,
    START_MENU_ACTION_DISABLE_POKEGEAR,
} StartMenuActionDisable;

typedef struct StartMenuActionFunc {
    int ident;
    TaskFunc func;
} StartMenuActionFunc;

typedef struct UnkStruct_0203CA9C_Case8 {
    u8 partySlot;
    u8 evoType;
    u16 evoParam;
    u16 species;
    int evoMethod;
} UnkStruct_0203CA9C_Case8;

typedef struct UnkStruct_0203D580 {
    u16 itemId;
    u16 unk_2;
} UnkStruct_0203D580;

typedef struct StartMenuAfterEvoPartySlotBak {
    int partySlot;
} StartMenuAfterEvoPartySlotBak;

#define STARTMENUTASKFUNC_CANCEL ((TaskFunc) - 2)
#define STARTMENUTASKFUNC_NONE   ((TaskFunc) - 1)

static StartMenuTaskData *StartMenu_Create(void);
static u32 FieldSystem_GetStartMenuButtonInhibitFlags_Normal(FieldSystem *fieldSystem);
static u32 FieldSystem_GetStartMenuButtonInhibitFlags_Safari(FieldSystem *fieldSystem);
static u32 FieldSystem_GetStartMenuButtonInhibitFlags_BugContest(FieldSystem *fieldSystem);
static u32 FieldSystem_GetStartMenuButtonInhibitFlags_PalPark(FieldSystem *fieldSystem);
static u32 FieldSystem_GetStartMenuButtonInhibitFlags_BattleTowerMultiPartnerSelectRoom(FieldSystem *fieldSystem);
static u32 sub_0203BEE0(FieldSystem *fieldSystem);
static u32 sub_0203BEE8(FieldSystem *fieldSystem);
static BOOL Task_StartMenu(TaskManager *taskManager);
static void Task_StartMenu_DrawCursor(TaskManager *taskManager);
static void StartMenuButton_Insert(u8 *insertionOrderDest, u8 *displayOrderDest, u32 *pLength, u8 item, vu32 position);
static u32 StartMenu_BuildActionLists(StartMenuTaskData *startMenu, u8 *insertionOrderDest, u8 *displayOrderDest);
static void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
static BOOL FieldSystem_StartMenuActionIsAvailable(FieldSystem *fieldSystem, StartMenuAction action);
static void FieldSystem_ResetGearRingManagerIfNotSelectingSaveOrPokegear(FieldSystem *fieldSystem);
static BOOL Task_StartMenu_HandleInput(TaskManager *taskManager);
static BOOL StartMenu_HandleKeyInput(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static BOOL StartMenu_HandleTouchInput(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static void sub_0203C69C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
static void StartMenu_CreateCursor(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender);
static void StartMenu_DestroyCursor(StartMenuTaskData *startMenu);
static void Task_StartMenu_WaitFade(TaskManager *taskManager);
static void Task_StartMenu_WaitApp(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Pokedex(TaskManager *taskManager);
static BOOL Task_StartMenu_OpenPokedex(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleReturn_Pokedex(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Pokemon(TaskManager *taskManager);
static BOOL Task_StartMenu_Pokemon(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Bag(TaskManager *taskManager);
static BOOL Task_StartMenu_Bag(TaskManager *taskManager);
static void sub_0203CF74(PartyMenuArgs *partyMenuArgs, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
static BOOL Task_StartMenu_HandleReturn(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_TrainerCard(TaskManager *taskManager);
static BOOL sub_0203D1CC(TaskManager *taskManager);
static BOOL sub_0203D218(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Save(TaskManager *taskManager);
static void sub_0203D264(TaskManager *taskManager);
static void sub_0203D288(TaskManager *taskManager);
static BOOL sub_0203D2CC(TaskManager *taskManager);
static void sub_0203D2EC(TaskManager *taskManager);
static void sub_0203D304(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Options(TaskManager *taskManager);
static BOOL Task_StartMenu_Options(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleReturn_Options(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_RemovedEasyChatThing(TaskManager *taskManager);
static BOOL Task_StartMenu_RemovedEasyChatThing(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleReturn_RemovedEasyChatThing(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Retire(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleSelection_Pokegear(TaskManager *taskManager);
static BOOL Task_StartMenu_Pokegear(TaskManager *taskManager);
static BOOL Task_StartMenu_HandleReturn_Pokegear(TaskManager *taskManager);
static BOOL sub_0203D580(TaskManager *taskManager);
static void sub_0203D664(TaskManager *taskManager, int a1);
static BOOL sub_0203D6C8(TaskManager *taskManager);
static void sub_0203D940(FieldSystem *fieldSystem, StartMenuTaskData *startMenu, u8 a2);
static void Task_StartMenu_Evolution(TaskManager *taskManager);
static void Task_StartMenu_WaitEvolution(TaskManager *taskManager);

static const int sActionToIconIndex[] = {
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

static const StartMenuActionFunc sStartMenuActions[] = {
    [START_MENU_ACTION_POKEDEX] = { .ident = msg_0196_00000, .func = Task_StartMenu_HandleSelection_Pokedex              },
    [START_MENU_ACTION_POKEMON] = { .ident = msg_0196_00001, .func = Task_StartMenu_HandleSelection_Pokemon              },
    [START_MENU_ACTION_BAG] = { .ident = msg_0196_00002, .func = Task_StartMenu_HandleSelection_Bag                  },
    [START_MENU_ACTION_TRAINER_CARD] = { .ident = msg_0196_00003, .func = Task_StartMenu_HandleSelection_TrainerCard          },
    [START_MENU_ACTION_SAVE] = { .ident = msg_0196_00004, .func = Task_StartMenu_HandleSelection_Save                 },
    [START_MENU_ACTION_OPTIONS] = { .ident = msg_0196_00005, .func = Task_StartMenu_HandleSelection_Options              },
    [START_MENU_ACTION_RUNNING_SHOES] = { .ident = msg_0196_00006, .func = STARTMENUTASKFUNC_CANCEL                            },
    [START_MENU_ACTION_7] = { .ident = msg_0196_00007, .func = Task_StartMenu_HandleSelection_RemovedEasyChatThing },
    [START_MENU_ACTION_RETIRE] = { .ident = msg_0196_00008, .func = Task_StartMenu_HandleSelection_Retire               },
    [START_MENU_ACTION_9] = { .ident = msg_0196_00014, .func = Task_StartMenu_HandleSelection_Pokegear             },
    [START_MENU_ACTION_10] = { .ident = msg_0196_00014, .func = Task_StartMenu_HandleSelection_Pokegear             },
    [START_MENU_ACTION_POKEGEAR] = { .ident = msg_0196_00014, .func = Task_StartMenu_HandleSelection_Pokegear             },
    [START_MENU_ACTION_12] = { .ident = msg_0196_00014, .func = sub_0203D2CC                                        },
};

static const u8 _020FA0AC[] = {
    1, 4
};

const u8 _020FA0B0[] = {
    0, 1, 2, 3, 4
};

static const u8 sPockets[] = {
    POCKET_ITEMS,
    POCKET_MEDICINE,
    POCKET_BALLS,
    POCKET_TMHMS,
    POCKET_BERRIES,
    POCKET_MAIL,
    POCKET_BATTLE_ITEMS,
    POCKET_KEY_ITEMS,
    POCKET_BAG_VIEW_END
};

BOOL FieldSystem_MapIsNotMysteryZone(FieldSystem *fieldSystem) {
    return MapHeader_GetMapSec(fieldSystem->location->mapId) != MAPSEC_MYSTERY_ZONE;
}

void StartMenu_Init(FieldSystem *fieldSystem) {
    StartMenuTaskData *startMenu = StartMenu_Create();
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_Safari(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_BugContest(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_PalPark(fieldSystem);
    } else if (FieldSystem_MapIsBattleTowerMultiPartnerSelectRoom(fieldSystem) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_BattleTowerMultiPartnerSelectRoom(fieldSystem);
    } else {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_Normal(fieldSystem);
    }
    startMenu->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, Task_StartMenu, startMenu);
}

void sub_0203BCDC(FieldSystem *fieldSystem) {
    StartMenuTaskData *startMenu = StartMenu_Create();
    startMenu->inhibitIconFlags = sub_0203BEE0(fieldSystem);
    startMenu->unk_350 = TRUE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, Task_StartMenu, startMenu);
}

void sub_0203BD20(FieldSystem *fieldSystem) {
    StartMenuTaskData *startMenu = StartMenu_Create();
    startMenu->inhibitIconFlags = sub_0203BEE8(fieldSystem);
    startMenu->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, Task_StartMenu, startMenu);
}

void sub_0203BD64(FieldSystem *fieldSystem) {
    PlaySE(SEQ_SE_DP_WIN_OPEN);
    StartMenuTaskData *startMenu = StartMenu_Create();
    startMenu->unk_350 = FALSE;
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_Safari(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_BugContest(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_PalPark(fieldSystem);
    } else if (FieldSystem_MapIsBattleTowerMultiPartnerSelectRoom(fieldSystem) == TRUE) {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_BattleTowerMultiPartnerSelectRoom(fieldSystem);
    } else if (fieldSystem->unk70 == 3) {
        startMenu->inhibitIconFlags = sub_0203BEE8(fieldSystem);
    } else if (fieldSystem->unk70 == 2) {
        startMenu->inhibitIconFlags = sub_0203BEE0(fieldSystem);
        startMenu->unk_350 = TRUE;
    } else {
        startMenu->inhibitIconFlags = FieldSystem_GetStartMenuButtonInhibitFlags_Normal(fieldSystem);
    }
    TaskManager_Jump(fieldSystem->taskman, Task_StartMenu, startMenu);
}

static StartMenuTaskData *StartMenu_Create(void) {
    StartMenuTaskData *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(StartMenuTaskData));
    MI_CpuClearFast(ret, sizeof(StartMenuTaskData));
    ret->state = 0;
    ret->lastButtonSelected = 0;
    ret->exitTaskEnvironment = NULL;
    return ret;
}

static u32 FieldSystem_GetStartMenuButtonInhibitFlags_Normal(FieldSystem *fieldSystem) {
    u32 ret = 0;
    if (!CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ACTION_DISABLE_POKEDEX);
    }
    if (!CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ACTION_DISABLE_POKEMON);
    }
    if (!CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_BAG)) {
        ret |= (1 << START_MENU_ACTION_DISABLE_BAG);
    }
    if (!CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ACTION_DISABLE_POKEGEAR);
    }
    if (MapHeader_MapIsAmitySquare(fieldSystem->location->mapId) == TRUE) {
        ret |= (1 << START_MENU_ACTION_DISABLE_POKEMON) | (1 << START_MENU_ACTION_DISABLE_BAG);
    }
    ret |= (1 << START_MENU_ACTION_DISABLE_7) | (1 << START_MENU_ACTION_DISABLE_RETIRE);
    return ret;
}

static u32 FieldSystem_GetStartMenuButtonInhibitFlags_Safari(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_7);
}

static u32 FieldSystem_GetStartMenuButtonInhibitFlags_BugContest(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_BAG) | (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_7);
}

static u32 FieldSystem_GetStartMenuButtonInhibitFlags_PalPark(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_BAG) | (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_7);
}

static u32 FieldSystem_GetStartMenuButtonInhibitFlags_BattleTowerMultiPartnerSelectRoom(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_POKEDEX) | (1 << START_MENU_ACTION_DISABLE_BAG) | (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_7) | (1 << START_MENU_ACTION_DISABLE_RETIRE) | (1 << START_MENU_ACTION_DISABLE_POKEGEAR);
}

static u32 sub_0203BEE0(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_RETIRE);
}

static u32 sub_0203BEE8(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ACTION_DISABLE_POKEDEX) | (1 << START_MENU_ACTION_DISABLE_SAVE) | (1 << START_MENU_ACTION_DISABLE_7) | (1 << START_MENU_ACTION_DISABLE_RETIRE) | (1 << START_MENU_ACTION_DISABLE_POKEGEAR);
}

static BOOL Task_StartMenu(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    switch (startMenu->state) {
    case START_MENU_STATE_INIT:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        if (ov01_021F6B00(fieldSystem)) {
            ov01_021F6A9C(fieldSystem, 0, NULL);
            startMenu->state = START_MENU_STATE_2;
            break;
        }
        // fallthrough
    case START_MENU_STATE_INIT_FORCE_CURSOR:
        ItemCheckUseData_Init(fieldSystem, &startMenu->itemCheckUseData);
        FieldMove_InitCheckData(fieldSystem, &startMenu->fieldMoveCheckData);
        Task_StartMenu_DrawCursor(taskManager);
        fieldSystem->unkD2_0 = 1;
        startMenu->state = START_MENU_STATE_HANDLE_INPUT;
        break;
    case START_MENU_STATE_2:
        if (ov01_021F6B10(fieldSystem) == 6) {
            Task_StartMenu_DrawCursor(taskManager);
            fieldSystem->unkD2_0 = 1;
        } else if (ov01_021F6B10(fieldSystem) == 1) {
            ItemCheckUseData_Init(fieldSystem, &startMenu->itemCheckUseData);
            FieldMove_InitCheckData(fieldSystem, &startMenu->fieldMoveCheckData);
            startMenu->state = START_MENU_STATE_HANDLE_INPUT;
        }
        break;
    case START_MENU_STATE_HANDLE_INPUT:
        if (!Task_StartMenu_HandleInput(taskManager)) {
            return FALSE;
        }
        break;
    case START_MENU_STATE_WAIT_FADE:
        Task_StartMenu_WaitFade(taskManager);
        break;
    case START_MENU_STATE_WAIT_APP:
        Task_StartMenu_WaitApp(taskManager);
        break;
    case START_MENU_STATE_SAVE:
        sub_0203D264(taskManager);
        break;
    case START_MENU_STATE_7:
        sub_0203D288(taskManager);
        break;
    case START_MENU_STATE_EVOLUTION:
        Task_StartMenu_Evolution(taskManager);
        break;
    case START_MENU_STATE_WAIT_EVOLUTION:
        Task_StartMenu_WaitEvolution(taskManager);
        break;
    case START_MENU_STATE_RETURN:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            Task_StartMenu_DrawCursor(taskManager);
            fieldSystem->unkD2_0 = 1;
            ov01_021E636C(1);
            startMenu->state = START_MENU_STATE_RETURN_WAIT_FADE;
        }
        break;
    case START_MENU_STATE_10:
        if (sub_020505C8(fieldSystem)) {
            ov01_021E636C(1);
            startMenu->state = START_MENU_STATE_11;
        }
        break;
    case START_MENU_STATE_11:
        if (IsPaletteFadeFinished()) {
            sub_0203C69C(startMenu, fieldSystem);
            Heap_Free(startMenu);
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            return TRUE;
        }
        break;
    case START_MENU_STATE_12:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            ov01_021E636C(1);
            startMenu->state = START_MENU_STATE_13;
        }
        break;
    case START_MENU_STATE_13:
        if (IsPaletteFadeFinished()) {
            TaskManager_Jump(taskManager, startMenu->exitTaskFunc, startMenu->exitTaskEnvironment);
            Heap_Free(startMenu);
        }
        break;
    case START_MENU_STATE_14:
        startMenu->exitTaskFunc(taskManager);
        break;
    case START_MENU_STATE_18:
        Heap_Free(startMenu);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case START_MENU_STATE_CLOSE:
        sub_0203C69C(startMenu, fieldSystem);
        sub_0203C38C(startMenu, fieldSystem);
        fieldSystem->unkD2_0 = 2;
        ScheduleBgTilemapBufferTransfer(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        Heap_Free(startMenu);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case START_MENU_STATE_RETURN_WAIT_FADE:
        if (IsPaletteFadeFinished()) {
            startMenu->state = START_MENU_STATE_HANDLE_INPUT;
        }
        break;
    case START_MENU_STATE_19:
        sub_0203D2EC(taskManager);
        break;
    case START_MENU_STATE_20:
        sub_0203D304(taskManager);
        break;
    }
    if (startMenu->cursorActive) {
        SpriteList_RenderAndAnimateSprites(startMenu->spriteList);
    }
    return FALSE;
}

static void Task_StartMenu_DrawCursor(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    u32 numActiveButtons = StartMenu_BuildActionLists(startMenu, startMenu->insertionOrder, startMenu->selectionToAction);
    startMenu->numActiveButtons = numActiveButtons;
    startMenu->lastButtonSelected = 0;
    for (int i = 0; i < numActiveButtons; ++i) {
        if (fieldSystem->unk90 == startMenu->insertionOrder[i]) {
            startMenu->lastButtonSelected = i;
        }
    }
    startMenu->cursorActive = TRUE;
    GfGfxLoader_LoadCharData(NARC_a_0_1_4, 12, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 15, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1C0, 0x20, HEAP_ID_FIELD);
    GfGfxLoader_LoadScrnData(NARC_a_0_1_4, 13, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    StartMenu_CreateCursor(startMenu, startMenu->insertionOrder, numActiveButtons, PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(fieldSystem->saveData)));
}

static void StartMenuButton_Insert(u8 *insertionOrderDest, u8 *displayOrderDest, u32 *pLength, u8 item, vu32 position) {
    insertionOrderDest[*pLength] = item;
    if (position == -1u) {
        position = *pLength;
    }
    displayOrderDest[position] = item;
    ++(*pLength);
}

static u32 StartMenu_BuildActionLists(StartMenuTaskData *startMenu, u8 *insertionOrderDest, u8 *displayOrderDest) {
    u32 numIcons = 0;

    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_RETIRE))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_RETIRE, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_7))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_7, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_POKEDEX))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_POKEDEX, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_POKEMON))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_POKEMON, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_BAG))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_BAG, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_POKEGEAR))) {
        if (startMenu->unk_350) {
            StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_12, -1u);
        } else {
            StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_POKEGEAR, -1u);
        }
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_TRAINER_CARD))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_TRAINER_CARD, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_SAVE))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_SAVE, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_OPTIONS))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_OPTIONS, -1u);
    }
    if (!(startMenu->inhibitIconFlags & (1 << START_MENU_ACTION_DISABLE_RUNNING_SHOES))) {
        StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_RUNNING_SHOES, -1u);
    }
    StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_9, 7);
    StartMenuButton_Insert(insertionOrderDest, displayOrderDest, &numIcons, START_MENU_ACTION_10, 8);
    return numIcons;
}

static void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem) {
    StartMenu_DestroyCursor(startMenu);
    FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, 0x20, 0x18, 0);
    startMenu->cursorActive = FALSE;
}

static BOOL FieldSystem_StartMenuActionIsAvailable(FieldSystem *fieldSystem, StartMenuAction action) {
    return FieldSystem_ShouldDrawStartMenuIcon(fieldSystem, (StartMenuIcon)sActionToIconIndex[action]);
}

BOOL FieldSystem_ShouldDrawStartMenuIcon(FieldSystem *fieldSystem, StartMenuIcon icon) {
    switch (icon) {
    case START_MENU_ICON_POKEDEX:
        return CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICON_POKEMON:
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

static void FieldSystem_ResetGearRingManagerIfNotSelectingSaveOrPokegear(FieldSystem *fieldSystem) {
    if (fieldSystem->lastStartMenuAction != START_MENU_ACTION_SAVE && fieldSystem->lastStartMenuAction != START_MENU_ACTION_POKEGEAR) {
        GearPhoneRingManager_ResetIfActive(fieldSystem->phoneRingManager);
    }
}

static BOOL Task_StartMenu_HandleInput(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!ov01_021F6B00(fieldSystem) && ov01_021F6B10(fieldSystem) == TRUE) {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (!StartMenu_HandleKeyInput(taskManager, fieldSystem, startMenu)) {
                return FALSE;
            }
            FieldSystem_ResetGearRingManagerIfNotSelectingSaveOrPokegear(fieldSystem);
        } else {
            if (fieldSystem->lastTouchMenuInput == 0) {
                if (gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_X)) {
                    PlaySE(SEQ_SE_GS_GEARCANCEL);
                    startMenu->state = START_MENU_STATE_CLOSE;
                }
            } else {
                if (!StartMenu_HandleTouchInput(taskManager, fieldSystem, startMenu)) {
                    return FALSE;
                }
                FieldSystem_ResetGearRingManagerIfNotSelectingSaveOrPokegear(fieldSystem);
            }
        }
    }
    return TRUE;
}

static BOOL StartMenu_HandleKeyInput(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->unkD3 < startMenu->numActiveButtons) {
        PlaySE(SEQ_SE_DP_SELECT);
        MenuInputStateMgr_SetState(&fieldSystem->menuInputState, MENU_INPUT_STATE_BUTTONS);
        startMenu->selectedIndex = fieldSystem->unkD3;
        if (sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func == STARTMENUTASKFUNC_CANCEL) {
            startMenu->state = START_MENU_STATE_CLOSE;
        } else if (sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func != STARTMENUTASKFUNC_NONE) {
            if (FieldSystem_StartMenuActionIsAvailable(fieldSystem, (StartMenuAction)startMenu->selectionToAction[startMenu->selectedIndex])) {
                TaskFunc func = sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func;
                sub_0203DF64(fieldSystem, 0);
                ov01_021F6B50(fieldSystem);
                fieldSystem->lastTouchMenuInput = 0;
                fieldSystem->lastStartMenuAction = startMenu->selectionToAction[startMenu->selectedIndex];
                return func(taskManager);
            }
        }
    }

    return TRUE;
}

static BOOL StartMenu_HandleTouchInput(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->lastTouchMenuInput != 0) {
        MenuInputStateMgr_SetState(&fieldSystem->menuInputState, MENU_INPUT_STATE_TOUCH);
    }
    switch (fieldSystem->lastTouchMenuInput) {
    case 1:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        startMenu->state = START_MENU_STATE_CLOSE;
        fieldSystem->lastTouchMenuInput = 0;
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
        fieldSystem->unkD3 = fieldSystem->lastTouchMenuInput - 2;
        if (fieldSystem->unkD3 < startMenu->numActiveButtons) {
            PlaySE(SEQ_SE_DP_SELECT);
            startMenu->selectedIndex = fieldSystem->unkD3;
            if (sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func == STARTMENUTASKFUNC_CANCEL) {
                startMenu->state = START_MENU_STATE_CLOSE;
                fieldSystem->lastTouchMenuInput = 0;
            } else if (sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func != STARTMENUTASKFUNC_NONE) {
                if (FieldSystem_StartMenuActionIsAvailable(fieldSystem, (StartMenuAction)startMenu->selectionToAction[startMenu->selectedIndex])) {
                    TaskFunc func = sStartMenuActions[startMenu->selectionToAction[startMenu->selectedIndex]].func;
                    fieldSystem->lastTouchMenuInput = 0;
                    sub_0203DF64(fieldSystem, 1);
                    ov01_021F6B50(fieldSystem);
                    fieldSystem->lastStartMenuAction = startMenu->selectionToAction[startMenu->selectedIndex];
                    return func(taskManager);
                } else {
                    fieldSystem->lastTouchMenuInput = 0;
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

static void StartMenu_CreateCursor(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender) {
    startMenu->spriteList = G2dRenderer_Init(1, &startMenu->g2dRenderer, HEAP_ID_FIELD);
    for (int i = 0; i < 4; ++i) {
        startMenu->gfxResMan[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, HEAP_ID_FIELD);
    }
    startMenu->gfxResObj[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(startMenu->gfxResMan[GF_GFX_RES_TYPE_CHAR], NARC_a_0_1_4, 64, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_FIELD);
    startMenu->gfxResObj[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(startMenu->gfxResMan[GF_GFX_RES_TYPE_PLTT], NARC_a_0_1_4, 61, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, HEAP_ID_FIELD);
    startMenu->gfxResObj[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(startMenu->gfxResMan[GF_GFX_RES_TYPE_CELL], NARC_a_0_1_4, 62, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_FIELD);
    startMenu->gfxResObj[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(startMenu->gfxResMan[GF_GFX_RES_TYPE_ANIM], NARC_a_0_1_4, 63, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_FIELD);
    sub_0200ADA4(startMenu->gfxResObj[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B00C(startMenu->gfxResObj[GF_GFX_RES_TYPE_PLTT]);
    sub_0200A740(startMenu->gfxResObj[GF_GFX_RES_TYPE_PLTT]);
    CreateSpriteResourcesHeader(&startMenu->spriteResourcesHeader, 0, 0, 0, 0, -1, -1, 0, 0, startMenu->gfxResMan[GF_GFX_RES_TYPE_CHAR], startMenu->gfxResMan[GF_GFX_RES_TYPE_PLTT], startMenu->gfxResMan[GF_GFX_RES_TYPE_CELL], startMenu->gfxResMan[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    SpriteTemplate spriteTemplate;
    spriteTemplate.spriteList = startMenu->spriteList;
    spriteTemplate.header = &startMenu->spriteResourcesHeader;
    spriteTemplate.position.z = 0;
    spriteTemplate.scale.x = FX32_ONE;
    spriteTemplate.scale.y = FX32_ONE;
    spriteTemplate.scale.z = FX32_ONE;
    spriteTemplate.rotation = 0;
    spriteTemplate.priority = 0;
    spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate.heapId = HEAP_ID_FIELD;
    spriteTemplate.header = &startMenu->spriteResourcesHeader; // second assign is necessary to match
    spriteTemplate.position.x = FX32_CONST(100);
    spriteTemplate.position.y = FX32_CONST(144);
    startMenu->cursorSprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(startMenu->cursorSprite, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void StartMenu_DestroyCursor(StartMenuTaskData *startMenu) {
    sub_0200AEB0(startMenu->gfxResObj[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(startMenu->gfxResObj[GF_GFX_RES_TYPE_PLTT]);
    for (u16 i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(startMenu->gfxResMan[i]);
    }
    SpriteList_Delete(startMenu->spriteList);
}

static void Task_StartMenu_WaitFade(TaskManager *taskManager) {
    if (IsPaletteFadeFinished()) {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

        sub_0203C38C(startMenu, fieldSystem);
        fieldSystem->unkD2_0 = 0;
        startMenu->exitTaskFunc(taskManager);
        startMenu->state = START_MENU_STATE_WAIT_APP;
    }
}

static void Task_StartMenu_WaitApp(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
        startMenu->exitTaskFunc(taskManager);
        if (startMenu->state == START_MENU_STATE_RETURN && MenuInputStateMgr_GetState(&fieldSystem->menuInputState) == TRUE) {
            startMenu->state = START_MENU_STATE_10;
        }
    }
}

void StartMenu_SetExitTaskFunc(StartMenuTaskData *startMenu, TaskFunc func) {
    startMenu->exitTaskFunc = func;
    startMenu->state = START_MENU_STATE_WAIT_APP;
}

static BOOL Task_StartMenu_HandleSelection_Pokedex(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_OpenPokedex;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_OpenPokedex(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    Location *position = LocalFieldData_GetCurrentPosition(localFieldData);
    Location *specialSpawnWarp = LocalFieldData_GetSpecialSpawnWarpPtr(localFieldData);
    PokedexArgs *pokedexArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokedexArgs));
    MI_CpuClear8(pokedexArgs, sizeof(PokedexArgs));
    pokedexArgs->pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    pokedexArgs->playerProfile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    pokedexArgs->unk_08 = fieldSystem->unkA8;
    pokedexArgs->menuInputStatePtr = &fieldSystem->menuInputState;
    int x = GetPlayerXCoord(fieldSystem->playerAvatar);
    int y = GetPlayerZCoord(fieldSystem->playerAvatar);
    pokedexArgs->mapMatrixId = MapMatrix_GetMapHeader(fieldSystem->mapMatrix, x / 32, y / 32);
    pokedexArgs->mapId = position->mapId;
    if (MapHeader_MapIsOnMainMatrix(pokedexArgs->mapMatrixId)) {
        pokedexArgs->x = x;
        pokedexArgs->y = y;
    } else {
        s16 wmX;
        s16 wmY;
        MapHeader_GetWorldMapCoords(pokedexArgs->mapMatrixId, &wmX, &wmY);
        if (wmX == 0 && wmY == 0) {
            pokedexArgs->x = specialSpawnWarp->x;
            pokedexArgs->y = specialSpawnWarp->y;
        } else {
            pokedexArgs->x = wmX * 32;
            pokedexArgs->y = wmY * 32;
        }
    }
    Pokedex_LaunchApp(fieldSystem, pokedexArgs);
    startMenu->exitTaskEnvironment = pokedexArgs;
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn_Pokedex;
    return FALSE;
}

static BOOL Task_StartMenu_HandleReturn_Pokedex(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    FieldSystem_LoadFieldOverlay(fieldSystem);
    if (startMenu->exitTaskEnvironment != NULL) {
        Heap_FreeExplicit(HEAP_ID_FIELD, startMenu->exitTaskEnvironment);
    }
    startMenu->state = START_MENU_STATE_RETURN;
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_Pokemon(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_Pokemon;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_Pokemon(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->fieldMoveCheckData, 0);
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn_Pokemon;
    return FALSE;
}

BOOL Task_StartMenu_HandleReturn_Pokemon(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
    memcpy(partyMenuArgs, startMenu->exitTaskEnvironment, sizeof(PartyMenuArgs));
    Heap_Free(startMenu->exitTaskEnvironment);

    switch (partyMenuArgs->selectedAction) {
    case PARTY_MENU_ACTION_RETURN_1: {
        PokemonSummaryArgs *pokemonSummaryArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        pokemonSummaryArgs->party = SaveArray_Party_Get(fieldSystem->saveData);
        pokemonSummaryArgs->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        pokemonSummaryArgs->unk11 = 1;
        pokemonSummaryArgs->partySlot = partyMenuArgs->partySlot;
        pokemonSummaryArgs->partyCount = Party_GetCount(pokemonSummaryArgs->party);
        pokemonSummaryArgs->moveToLearn = 0;
        pokemonSummaryArgs->unk12 = 0;
        pokemonSummaryArgs->ribbons = Save_SpecialRibbons_Get(fieldSystem->saveData);
        pokemonSummaryArgs->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        pokemonSummaryArgs->unk2C = sub_02088288(fieldSystem->saveData);
        pokemonSummaryArgs->unk28 = 0;
        pokemonSummaryArgs->menuInputStatePtr = &fieldSystem->menuInputState;
        pokemonSummaryArgs->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(pokemonSummaryArgs, _020FA0B0);
        sub_0208AD34(pokemonSummaryArgs, Save_PlayerData_GetProfile(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, pokemonSummaryArgs);
        startMenu->exitTaskEnvironment = pokemonSummaryArgs;
        StartMenu_SetExitTaskFunc(startMenu, sub_0203D580);
        break;
    }
    case PARTY_MENU_ACTION_RETURN_4: {
        PokemonSummaryArgs *pokemonSummaryArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        pokemonSummaryArgs->party = SaveArray_Party_Get(fieldSystem->saveData);
        pokemonSummaryArgs->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        pokemonSummaryArgs->unk11 = 1;
        pokemonSummaryArgs->partySlot = partyMenuArgs->partySlot;
        pokemonSummaryArgs->partyCount = 1;
        pokemonSummaryArgs->moveToLearn = partyMenuArgs->moveId;
        pokemonSummaryArgs->unk12 = 2;
        pokemonSummaryArgs->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        pokemonSummaryArgs->unk2C = sub_02088288(fieldSystem->saveData);
        pokemonSummaryArgs->unk28 = 0;
        pokemonSummaryArgs->menuInputStatePtr = &fieldSystem->menuInputState;
        pokemonSummaryArgs->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(pokemonSummaryArgs, _020FA0AC);
        sub_0208AD34(pokemonSummaryArgs, Save_PlayerData_GetProfile(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, pokemonSummaryArgs);
        UnkStruct_0203D580 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203D580));
        unk->itemId = partyMenuArgs->itemId;
        unk->unk_2 = 0;
        startMenu->exitTaskEnvironment2 = unk;
        startMenu->exitTaskEnvironment = pokemonSummaryArgs;
        StartMenu_SetExitTaskFunc(startMenu, sub_0203D580);
        break;
    }
    case PARTY_MENU_ACTION_RETURN_5: {
        PokemonSummaryArgs *pokemonSummaryArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
        pokemonSummaryArgs->party = SaveArray_Party_Get(fieldSystem->saveData);
        pokemonSummaryArgs->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        pokemonSummaryArgs->unk11 = 1;
        pokemonSummaryArgs->partySlot = partyMenuArgs->partySlot;
        pokemonSummaryArgs->partyCount = 1;
        pokemonSummaryArgs->moveToLearn = partyMenuArgs->moveId;
        pokemonSummaryArgs->unk12 = 2;
        pokemonSummaryArgs->natDexEnabled = SaveArray_IsNatDexEnabled(fieldSystem->saveData);
        pokemonSummaryArgs->unk2C = sub_02088288(fieldSystem->saveData);
        pokemonSummaryArgs->unk28 = 0;
        pokemonSummaryArgs->menuInputStatePtr = &fieldSystem->menuInputState;
        pokemonSummaryArgs->isFlag982Set = sub_0208828C(fieldSystem->saveData);
        sub_02089D40(pokemonSummaryArgs, _020FA0AC);
        sub_0208AD34(pokemonSummaryArgs, Save_PlayerData_GetProfile(fieldSystem->saveData));
        PokemonSummary_LearnForget_LaunchApp(fieldSystem, pokemonSummaryArgs);
        UnkStruct_0203D580 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203D580));
        unk->itemId = ITEM_NONE;
        unk->unk_2 = partyMenuArgs->levelUpMoveSearchState;
        startMenu->exitTaskEnvironment2 = unk;
        startMenu->exitTaskEnvironment = pokemonSummaryArgs;
        StartMenu_SetExitTaskFunc(startMenu, sub_0203D580);
        break;
    }
    case PARTY_MENU_ACTION_RETURN_6:
        startMenu->exitTaskEnvironment = sub_0203EFEC(fieldSystem, 2, partyMenuArgs->partySlot, ItemToMailId(partyMenuArgs->itemId), HEAP_ID_FIELD);
        if (partyMenuArgs->context == PARTY_MENU_CONTEXT_10) {
            startMenu->exitTaskEnvironment2 = sub_0203D818(partyMenuArgs->itemId, 0, partyMenuArgs->partySlot);
        } else {
            startMenu->exitTaskEnvironment2 = sub_0203D818(partyMenuArgs->itemId, 1, partyMenuArgs->partySlot);
        }
        StartMenu_SetExitTaskFunc(startMenu, Task_ReturnToMenuFromMail);
        break;
    case PARTY_MENU_ACTION_RETURN_READ_MAIL:
        startMenu->exitTaskEnvironment = sub_0203F050(fieldSystem, Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), partyMenuArgs->partySlot), HEAP_ID_FIELD);
        startMenu->exitTaskEnvironment2 = sub_0203D818(partyMenuArgs->itemId, 2, partyMenuArgs->partySlot);
        StartMenu_SetExitTaskFunc(startMenu, Task_ReturnToMenuFromMail);
        break;
    case 3: {
        StartMenuAfterEvoPartySlotBak *afterEvoPartySlot = AllocFromHeap(HEAP_ID_FIELD, sizeof(StartMenuAfterEvoPartySlotBak));
        afterEvoPartySlot->partySlot = partyMenuArgs->partySlot;
        startMenu->exitTaskEnvironment2 = afterEvoPartySlot;
        Bag *bag = Save_Bag_Get(fieldSystem->saveData);
        PlayerProfile *playerProfile = Save_PlayerData_GetProfile(fieldSystem->saveData);
        (void)playerProfile;
        startMenu->exitTaskEnvironment = Bag_CreateView(bag, sPockets, HEAP_ID_FIELD);
        sub_0207789C(startMenu->exitTaskEnvironment, fieldSystem->saveData, 1, fieldSystem->bagCursor, &fieldSystem->menuInputState);
        Bag_LaunchApp(fieldSystem, startMenu->exitTaskEnvironment);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        break;
    }
    case PARTY_MENU_ACTION_RETURN_EVO_ITEM_USE: {
        UnkStruct_0203CA9C_Case8 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203CA9C_Case8));
        unk->evoParam = partyMenuArgs->itemId;
        unk->evoType = EVOCTX_ITEM_USE;
        unk->partySlot = partyMenuArgs->partySlot;
        unk->species = partyMenuArgs->species;
        unk->evoMethod = partyMenuArgs->evoMethod;
        startMenu->exitTaskEnvironment = unk;
        startMenu->state = START_MENU_STATE_EVOLUTION;
        break;
    }
    case PARTY_MENU_ACTION_RETURN_EVO_RARE_CANDY: {
        UnkStruct_0203CA9C_Case8 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203CA9C_Case8));
        unk->evoParam = MapHeader_GetMapEvolutionMethod(fieldSystem->location->mapId);
        unk->evoType = EVOCTX_LEVELUP;
        unk->partySlot = partyMenuArgs->partySlot;
        unk->species = partyMenuArgs->species;
        unk->evoMethod = partyMenuArgs->evoMethod;
        startMenu->exitTaskEnvironment = unk;
        startMenu->state = START_MENU_STATE_EVOLUTION;
        break;
    }
    case PARTY_MENU_ACTION_RETURN_CUT:
    case PARTY_MENU_ACTION_RETURN_FLY:
    case PARTY_MENU_ACTION_RETURN_SURF:
    case PARTY_MENU_ACTION_RETURN_STRENGTH:
    case PARTY_MENU_ACTION_RETURN_ROCK_SMASH:
    case PARTY_MENU_ACTION_RETURN_WATERFALL:
    case PARTY_MENU_ACTION_RETURN_ROCK_CLIMB:
    case PARTY_MENU_ACTION_RETURN_WHIRLPOOL:
    case PARTY_MENU_ACTION_RETURN_FLASH:
    case PARTY_MENU_ACTION_RETURN_TELEPORT:
    case PARTY_MENU_ACTION_RETURN_DIG:
    case PARTY_MENU_ACTION_RETURN_SWEET_SCENT:
    case PARTY_MENU_ACTION_RETURN_CHATTER:
    case PARTY_MENU_ACTION_RETURN_HEADBUTT: {
        FieldMoveUseData fieldMoveUseData;

        fieldMoveUseData.fieldMoveIdx = partyMenuArgs->selectedAction - PARTY_MENU_ACTION_RETURN_FIELD_MOVE_BEGIN;
        fieldMoveUseData.partySlot = partyMenuArgs->partySlot;
        fieldMoveUseData.taskManager = taskManager;
        ((FieldMoveUseFunc)FieldMove_GetMoveFunc(FIELD_MOVE_FUNC_USE, fieldMoveUseData.fieldMoveIdx))(&fieldMoveUseData, &startMenu->fieldMoveCheckData);
        break;
    }
    case PARTY_MENU_ACTION_RETURN_10:
        startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        break;
    default:
        if (partyMenuArgs->context == PARTY_MENU_CONTEXT_USE_ITEM || partyMenuArgs->context == PARTY_MENU_CONTEXT_TM_HM || partyMenuArgs->context == PARTY_MENU_CONTEXT_REPLACE_MOVE_TMHM || partyMenuArgs->context == PARTY_MENU_CONTEXT_EVO_STONE || partyMenuArgs->context == PARTY_MENU_CONTEXT_REPLACE_MOVE_LEVELUP) {
            startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
            if (partyMenuArgs->partySlot >= 6) {
                sub_020778E0(startMenu->exitTaskEnvironment, 0);
            } else {
                sub_020778E0(startMenu->exitTaskEnvironment, partyMenuArgs->partySlot);
            }
            StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        } else if (partyMenuArgs->context == PARTY_MENU_CONTEXT_9) {
            startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
            StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        } else {
            FieldSystem_LoadFieldOverlay(fieldSystem);
            startMenu->state = START_MENU_STATE_RETURN;
        }
        break;
    }
    Heap_Free(partyMenuArgs);
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_Bag(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_Bag;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_Bag(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
    sub_020778E0(startMenu->exitTaskEnvironment, 0);
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn;
    ov01_021F4440(fieldSystem);
    return FALSE;
}

static void sub_0203CF74(PartyMenuArgs *partyMenuArgs, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
    partyMenuArgs->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenuArgs->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenuArgs->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenuArgs->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenuArgs->fieldMoveCheckData = &startMenu->fieldMoveCheckData;
    partyMenuArgs->unk_25 = 0;
    partyMenuArgs->fieldSystem = fieldSystem;
    partyMenuArgs->menuInputStatePtr = &fieldSystem->menuInputState;
}

static BOOL Task_StartMenu_HandleReturn(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    BagView *bagView = BagView_New(HEAP_ID_FIELD);
    memcpy(bagView, startMenu->exitTaskEnvironment, BagView_sizeof());
    Heap_Free(startMenu->exitTaskEnvironment);

    switch (sub_0207790C(bagView)) {
    case 0: {
        ItemMenuUseData itemMenuUseData;
        itemMenuUseData.itemId = BagView_GetItemId(bagView);
        itemMenuUseData.partySlot = sub_02077914(bagView);
        itemMenuUseData.taskManager = taskManager;
        ItemMenuUseFunc func = GetItemFieldUseFunc(USE_ITEM_TASK_MENU, GetItemAttr(itemMenuUseData.itemId, ITEMATTR_FIELDUSEFUNC, HEAP_ID_FIELD));
        func(&itemMenuUseData, &startMenu->itemCheckUseData);
        break;
    }
    case 1:
        sub_0203D664(taskManager, BagView_GetItemId(bagView));
        break;
    case 2: {
        PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
        memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
        sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
        partyMenuArgs->context = PARTY_MENU_CONTEXT_9;
        partyMenuArgs->itemId = BagView_GetItemId(bagView);
        FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
        startMenu->exitTaskEnvironment = partyMenuArgs;
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
        break;
    }
    case 4: {
        Party *party = SaveArray_Party_Get(fieldSystem->saveData);
        StartMenuAfterEvoPartySlotBak *unk = startMenu->exitTaskEnvironment2;
        int monSlot = unk->partySlot;
        u16 itemId = BagView_GetItemId(bagView);
        Pokemon *pokemon = Party_GetMonByIndex(party, monSlot);
        Heap_Free(startMenu->exitTaskEnvironment2);
        if (ItemIdIsMail(itemId) == TRUE && !GetMonData(pokemon, MON_DATA_HELD_ITEM, NULL)) {
            startMenu->exitTaskEnvironment = sub_0203EFEC(fieldSystem, 2, monSlot, ItemToMailId(itemId), HEAP_ID_FIELD);
            startMenu->exitTaskEnvironment2 = sub_0203D818(itemId, 0, monSlot);
            StartMenu_SetExitTaskFunc(startMenu, Task_ReturnToMenuFromMail);
        } else {
            PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
            memset(partyMenuArgs, 0, sizeof(PartyMenuArgs));
            sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
            partyMenuArgs->party = party;
            partyMenuArgs->itemId = BagView_GetItemId(bagView);
            partyMenuArgs->partySlot = monSlot;
            if (partyMenuArgs->itemId == ITEM_NONE) {
                partyMenuArgs->context = PARTY_MENU_CONTEXT_0;
            } else {
                partyMenuArgs->context = PARTY_MENU_CONTEXT_10;
            }
            FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
            startMenu->exitTaskEnvironment = partyMenuArgs;
            StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
        }
        break;
    }
    case 3:
    case 5:
    default:
        FieldSystem_LoadFieldOverlay(fieldSystem);
        startMenu->state = START_MENU_STATE_RETURN;
        break;
    }
    Heap_Free(bagView);
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_TrainerCard(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = sub_0203D1CC;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL sub_0203D1CC(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = sub_020691C4(HEAP_ID_FIELD);
    TrainerCardAppArgs *trainerCard = startMenu->exitTaskEnvironment;
    sub_02068FC8(1, 1, 0, 255, fieldSystem, trainerCard);
    TrainerCard_LaunchApp(fieldSystem, trainerCard);
    startMenu->exitTaskFunc = sub_0203D218;
    return FALSE;
}

static BOOL sub_0203D218(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    sub_020691E0(startMenu->exitTaskEnvironment);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    startMenu->state = START_MENU_STATE_RETURN;
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_Save(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    ov01_021F6A9C(fieldSystem, 1, NULL);
    startMenu->state = START_MENU_STATE_SAVE;
    return TRUE;
}

static void sub_0203D264(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (ov01_021F6B00(fieldSystem) == TRUE) {
        startMenu->state = START_MENU_STATE_7;
    }
}

static void sub_0203D288(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!ov01_021F6B00(fieldSystem) && ov01_021F6B10(fieldSystem) == TRUE) {
        if (fieldSystem->lastTouchMenuInput == 1) {
            fieldSystem->lastTouchMenuInput = 0;
            startMenu->state = START_MENU_STATE_CLOSE;
        } else {
            startMenu->state = START_MENU_STATE_HANDLE_INPUT;
        }
    }
}

static BOOL sub_0203D2CC(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    ov01_021F6A9C(fieldSystem, 8, NULL);
    startMenu->state = START_MENU_STATE_19;
    return TRUE;
}

static void sub_0203D2EC(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    startMenu->state = START_MENU_STATE_20;
}

static void sub_0203D304(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->state = START_MENU_STATE_CLOSE;
}

static BOOL Task_StartMenu_HandleSelection_Options(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_Options;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_Options(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = OptionsMenu_LaunchApp(fieldSystem);
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn_Options;
    return FALSE;
}

static BOOL Task_StartMenu_HandleReturn_Options(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    Heap_Free(startMenu->exitTaskEnvironment);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    startMenu->state = START_MENU_STATE_RETURN;
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_RemovedEasyChatThing(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_RemovedEasyChatThing;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_RemovedEasyChatThing(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = EasyChat_CreateArgs(2, 0, fieldSystem->saveData, &fieldSystem->menuInputState, HEAP_ID_FIELD);
    MailMessage mailMessage;
    MailMsg_Init_WithBank(&mailMessage, MAILMSG_BANK_0295_GMM);
    sub_02090D20(startMenu->exitTaskEnvironment, &mailMessage);
    EasyChat_LaunchApp(fieldSystem, startMenu->exitTaskEnvironment);
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn_RemovedEasyChatThing;
    return FALSE;
}

static BOOL Task_StartMenu_HandleReturn_RemovedEasyChatThing(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!sub_02090D48(startMenu->exitTaskEnvironment)) {
        MailMessage mailMessage;
        sub_02090D60(startMenu->exitTaskEnvironment, &mailMessage);
        if (sub_02035650()) {
            sub_0205AB88(&mailMessage);
            sub_0205AA6C(fieldSystem->unk80, &mailMessage);
        }
        startMenu->state = START_MENU_STATE_10;
    } else {
        startMenu->state = START_MENU_STATE_RETURN;
    }
    EasyChat_FreeArgs(startMenu->exitTaskEnvironment);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    sub_0205AD0C(fieldSystem->unk84);
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_Retire(TaskManager *taskManager) {
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
    Heap_Free(startMenu);
    return FALSE;
}

static BOOL Task_StartMenu_HandleSelection_Pokegear(TaskManager *taskManager) {
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    startMenu->exitTaskFunc = Task_StartMenu_Pokegear;
    startMenu->state = START_MENU_STATE_WAIT_FADE;
    return TRUE;
}

static BOOL Task_StartMenu_Pokegear(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = PokegearPhone_LaunchApp(fieldSystem);
    startMenu->exitTaskFunc = Task_StartMenu_HandleReturn_Pokegear;
    return FALSE;
}

static BOOL Task_StartMenu_HandleReturn_Pokegear(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    FieldSystem_LoadFieldOverlay(fieldSystem);
    if (startMenu->exitTaskEnvironment != NULL) {
        Heap_FreeExplicit(HEAP_ID_FIELD, startMenu->exitTaskEnvironment);
    }
    startMenu->state = START_MENU_STATE_RETURN;
    return FALSE;
}

static BOOL sub_0203D580(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    PokemonSummaryArgs *summaryArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PokemonSummaryArgs));
    memcpy(summaryArgs, startMenu->exitTaskEnvironment, sizeof(PokemonSummaryArgs));
    Heap_Free(startMenu->exitTaskEnvironment);
    if (summaryArgs->unk12 == 2) {
        PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
        UnkStruct_0203D580 *r7 = startMenu->exitTaskEnvironment2;
        sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
        partyMenuArgs->itemId = r7->itemId;
        partyMenuArgs->partySlot = summaryArgs->partySlot;
        partyMenuArgs->moveId = summaryArgs->moveToLearn;
        partyMenuArgs->selectedMoveIdx = summaryArgs->unk16;
        if (r7->itemId != ITEM_NONE) {
            partyMenuArgs->context = PARTY_MENU_CONTEXT_REPLACE_MOVE_TMHM;
            partyMenuArgs->levelUpMoveSearchState = 0;
        } else {
            partyMenuArgs->context = PARTY_MENU_CONTEXT_REPLACE_MOVE_LEVELUP;
            partyMenuArgs->levelUpMoveSearchState = r7->unk_2;
        }
        partyMenuArgs->menuInputStatePtr = &fieldSystem->menuInputState;
        FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
        Heap_Free(startMenu->exitTaskEnvironment2);
        startMenu->exitTaskEnvironment = partyMenuArgs;
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
    } else {
        startMenu->exitTaskEnvironment = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->fieldMoveCheckData, summaryArgs->partySlot);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
    }
    Heap_Free(summaryArgs);
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
    StartMenu_SetExitTaskFunc(startMenu, sub_0203D6C8);
}

static BOOL sub_0203D6C8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    BagCursor_Field_PocketSetPosition(fieldSystem->bagCursor, POCKET_BERRIES, 0, 0);
    Heap_FreeExplicit(HEAP_ID_FIELD, startMenu->exitTaskEnvironment);
    startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
    StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
    return FALSE;
}

BOOL Task_ReturnToMenuFromAppItem(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    Heap_FreeExplicit(HEAP_ID_FIELD, startMenu->exitTaskEnvironment);
    startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
    StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
    return FALSE;
}

BOOL Task_UseFlyInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    FieldMoveData *flyMap = startMenu->exitTaskEnvironment2;
    int partySlot = flyMap->partySlot;
    Heap_FreeExplicit(HEAP_ID_FIELD, flyMap);
    PokegearArgs *pokegearArgs = startMenu->exitTaskEnvironment;
    if (!pokegearArgs->unk_14) {
        Heap_FreeExplicit(HEAP_ID_FIELD, pokegearArgs);
        startMenu->exitTaskEnvironment = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->fieldMoveCheckData, partySlot);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
    } else {
        Pokemon *pokemon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), partySlot);
        struct UnkStruct_02067BF8 *r5 = sub_02067BF8(HEAP_ID_FIELD, fieldSystem, pokemon, partySlot, pokegearArgs->unk_20, pokegearArgs->mapCursorX * 32 + 0x10, pokegearArgs->mapCursorY * 32 + 0x10);
        Heap_FreeExplicit(HEAP_ID_FIELD, startMenu->exitTaskEnvironment);
        FieldSystem_LoadFieldOverlay(fieldSystem);
        startMenu->exitTaskFunc = sub_02067C30;
        startMenu->exitTaskEnvironment = r5;
        startMenu->state = START_MENU_STATE_12;
    }
    return FALSE;
}

UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 kind, u8 partySlot) {
    UnkStruct_0203D818 *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203D818));
    ret->itemId = itemId;
    ret->partySlot = partySlot;
    ret->kind = kind;
    return ret;
}

BOOL Task_ReturnToMenuFromMail(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    UnkStruct_0203D818 *unk = startMenu->exitTaskEnvironment2;
    switch (unk->kind) {
    case 3:
        sub_02090F90(startMenu->exitTaskEnvironment);
        startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        break;
    case 2:
        sub_02090F90(startMenu->exitTaskEnvironment);
        startMenu->exitTaskEnvironment = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->fieldMoveCheckData, unk->partySlot);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
        break;
    case 0:
        if (sub_02090F6C(startMenu->exitTaskEnvironment) == TRUE) {
            sub_0203D940(fieldSystem, startMenu, 12);
        } else {
            sub_02090F90(startMenu->exitTaskEnvironment);
            startMenu->exitTaskEnvironment = PartyMenu_LaunchApp_Unk1(fieldSystem, &startMenu->fieldMoveCheckData, unk->partySlot);
            StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
        }
        break;
    case 1:
        if (sub_02090F6C(startMenu->exitTaskEnvironment) == TRUE) {
            sub_0203D940(fieldSystem, startMenu, 11);
        } else {
            sub_02090F90(startMenu->exitTaskEnvironment);
            startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
            StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
        }
        break;
    }
    Heap_Free(startMenu->exitTaskEnvironment2);
    return FALSE;
}

static void sub_0203D940(FieldSystem *fieldSystem, StartMenuTaskData *startMenu, u8 a2) {
    UnkStruct_0203D818 *unk = startMenu->exitTaskEnvironment2;
    PartyMenuArgs *partyMenuArgs = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuArgs));
    sub_0203CF74(partyMenuArgs, fieldSystem, startMenu);
    partyMenuArgs->itemId = unk->itemId;
    partyMenuArgs->partySlot = unk->partySlot;
    partyMenuArgs->context = a2;
    sub_02090F70(startMenu->exitTaskEnvironment, Party_GetMonByIndex(partyMenuArgs->party, unk->partySlot));
    sub_02090F90(startMenu->exitTaskEnvironment);
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, partyMenuArgs);
    startMenu->exitTaskEnvironment = partyMenuArgs;
    StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn_Pokemon);
}

BOOL Task_ReturnToMenuFromVSRecorder(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
    StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
    return FALSE;
}

static void Task_StartMenu_Evolution(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    UnkStruct_0203CA9C_Case8 *unk = startMenu->exitTaskEnvironment;
    Sound_Stop();
    CreateHeap(HEAP_ID_3, HEAP_ID_EVOLUTION, 0x30000);

    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    Pokemon *pokemon = Party_GetMonByIndex(party, unk->partySlot);
    EvolutionTaskData *evolution;
    if (unk->evoType == EVOCTX_LEVELUP) {
        evolution = sub_02075A7C(party, pokemon, unk->species, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), sub_02088288(fieldSystem->saveData), Save_Pokedex_Get(fieldSystem->saveData), Save_Bag_Get(fieldSystem->saveData), Save_GameStats_Get(fieldSystem->saveData), unk->evoMethod, TRUE, HEAP_ID_EVOLUTION);
    } else {
        evolution = sub_02075A7C(party, pokemon, unk->species, Save_PlayerData_GetOptionsAddr(fieldSystem->saveData), sub_02088288(fieldSystem->saveData), Save_Pokedex_Get(fieldSystem->saveData), Save_Bag_Get(fieldSystem->saveData), Save_GameStats_Get(fieldSystem->saveData), unk->evoMethod, FALSE, HEAP_ID_EVOLUTION);
    }
    StartMenuAfterEvoPartySlotBak *newEnv = AllocFromHeap(HEAP_ID_FIELD, sizeof(StartMenuAfterEvoPartySlotBak));
    newEnv->partySlot = unk->partySlot;
    startMenu->exitTaskEnvironment2 = newEnv;
    Heap_Free(startMenu->exitTaskEnvironment);
    startMenu->exitTaskEnvironment = evolution;
    startMenu->state = START_MENU_STATE_WAIT_EVOLUTION;
}

static void Task_StartMenu_WaitEvolution(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *startMenu = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (sub_02075D3C(startMenu->exitTaskEnvironment) == TRUE) {
        sub_02075D4C(startMenu->exitTaskEnvironment);
        DestroyHeap(HEAP_ID_EVOLUTION);
        StopBGM(SEQ_GS_SHINKA, 0);
        sub_02004AD8(0);
        sub_02055164(fieldSystem, fieldSystem->location->mapId);
        startMenu->exitTaskEnvironment = sub_0203E3FC(fieldSystem, &startMenu->itemCheckUseData);
        StartMenuAfterEvoPartySlotBak *unk = startMenu->exitTaskEnvironment2;
        sub_020778E0(startMenu->exitTaskEnvironment, unk->partySlot);
        Heap_Free(startMenu->exitTaskEnvironment2);
        StartMenu_SetExitTaskFunc(startMenu, Task_StartMenu_HandleReturn);
    }
}
