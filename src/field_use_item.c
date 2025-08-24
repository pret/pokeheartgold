#include "field_use_item.h"

#include "constants/items.h"
#include "constants/sndseq.h"

#include "fielddata/script/scr_seq/event_D24R0202.h"
#include "fielddata/script/scr_seq/event_D24R0206.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"

#include "alph_checks.h"
#include "bag_view.h"
#include "follow_mon.h"
#include "launch_application.h"
#include "map_header.h"
#include "map_object.h"
#include "metatile_behavior.h"
#include "overlay_01.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_02.h"
#include "overlay_113.h"
#include "overlay_43.h"
#include "overlay_58.h"
#include "party_menu.h"
#include "render_window.h"
#include "save_arrays.h"
#include "script.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "start_menu.h"
#include "sys_flags.h"
#include "system.h"
#include "task.h"
#include "text.h"
#include "unk_0200FA24.h"
#include "unk_0203DB6C.h"
#include "unk_02054648.h"
#include "unk_02054E00.h"
#include "unk_02062108.h"
#include "unk_02066EDC.h"

struct ItemUseFuncDat {
    ItemMenuUseFunc menu;
    ItemFieldUseFunc field;
    ItemCheckUseFunc check;
};

static struct AlphItemUseData *CreateAlphItemUseWork(int scriptNo, u16 var_8000, u16 var_8001, u16 var_8002, u16 var_8003);
static void ExitMenuAndJumpToAlphChamberReaction(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2, int scriptNo);
static BOOL Task_UseItemInAlphChamber(TaskManager *taskManager);
static void ItemMenuUseFunc_HealingItem(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static enum ItemUseError ItemCheckUseFunc_Dummy(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_Bicycle(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_Bicycle(struct ItemFieldUseData *data);
static BOOL Task_MountOrDismountBicycle(TaskManager *taskManager);
static enum ItemUseError ItemCheckUseFunc_Bicycle(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_TMHM(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_Mail(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static enum ItemUseError ItemCheckUseFunc_Berry(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_Berry(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_PalPad(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_PalPad(struct ItemFieldUseData *data);
static PalPadArgs *_CreatePalPadArgs(FieldSystem *fieldSystem);
static void ItemMenuUseFunc_Honey(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_OldRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_OldRod(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_GoodRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_GoodRod(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_SuperRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_SuperRod(struct ItemFieldUseData *data);
static enum ItemUseError ItemCheckUseFunc_FishingRod(const struct ItemCheckUseData *data);
static BOOL ItemFieldUseFunc_Generic(struct ItemFieldUseData *data);
static BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager);
static void ItemMenuUseFunc_EvoStone(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_EscapeRope(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static enum ItemUseError ItemCheckUseFunc_EscapeRope(const struct ItemCheckUseData *data);
static BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager);
static void ItemMenuUseFunc_ApricornBox(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_ApricornBox(struct ItemFieldUseData *data);
static ApricornBoxArgs *_CreateApricornBoxWork(FieldSystem *fieldSystem);
static void ItemMenuUseFunc_BerryPots(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_BerryPots(struct ItemFieldUseData *data);
static struct BerryPotsArgs *_BerryPotsArgs_New(FieldSystem *fieldSystem);
static void ItemMenuUseFunc_UnownReport(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_UnownReport(struct ItemFieldUseData *data);
static UnownReportArgs *_CreateUnownReportWork(FieldSystem *fieldSystem);
static void ItemMenuUseFunc_DowsingMchn(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_DowsingMchn(struct ItemFieldUseData *data);
static BOOL Task_ActivateDowsingMchnUI(TaskManager *taskManager);
static BOOL ItemFieldUseFunc_GbSounds(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_Gracidea(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_Gracidea(struct ItemFieldUseData *data);
static PartyMenuArgs *_CreateGracideaWork(FieldSystem *fieldSystem);
static void ItemMenuUseFunc_VSRecorder(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_VSRecorder(struct ItemFieldUseData *data);
static void *_VsRecorderInit(FieldSystem *fieldSystem);
static BOOL KeyItemIdSpawnsSubprocess(FieldSystem *fieldSystem, u16 itemId);
static void RegisteredItem_GoToPrintErrorTask(struct ItemFieldUseData *data, enum ItemUseError error);
static BOOL Task_RegisteredItem_GoToApp(TaskManager *taskManager);
static void RegisteredItem_CreateGoToAppTask(struct ItemFieldUseData *data, FieldApplicationWorkCtor ctor, BOOL no_app);

static const struct ItemUseFuncDat sItemFieldUseFuncs[] = {
    { NULL,                        ItemFieldUseFunc_Generic,     NULL                        },
    { ItemMenuUseFunc_HealingItem, NULL,                         NULL                        },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_Bicycle,     ItemFieldUseFunc_Bicycle,     ItemCheckUseFunc_Bicycle    },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_TMHM,        NULL,                         NULL                        },
    { ItemMenuUseFunc_Mail,        NULL,                         NULL                        },
    { ItemMenuUseFunc_Berry,       NULL,                         ItemCheckUseFunc_Berry      },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_PalPad,      ItemFieldUseFunc_PalPad,      NULL                        },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_Honey,       NULL,                         NULL                        },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_OldRod,      ItemFieldUseFunc_OldRod,      ItemCheckUseFunc_FishingRod },
    { ItemMenuUseFunc_GoodRod,     ItemFieldUseFunc_GoodRod,     ItemCheckUseFunc_FishingRod },
    { ItemMenuUseFunc_SuperRod,    ItemFieldUseFunc_SuperRod,    ItemCheckUseFunc_FishingRod },
    { NULL,                        ItemFieldUseFunc_Generic,     NULL                        },
    { ItemMenuUseFunc_EvoStone,    NULL,                         NULL                        },
    { ItemMenuUseFunc_EscapeRope,  NULL,                         ItemCheckUseFunc_EscapeRope },
    { NULL,                        NULL,                         ItemCheckUseFunc_Dummy      },
    { ItemMenuUseFunc_ApricornBox, ItemFieldUseFunc_ApricornBox, NULL                        },
    { ItemMenuUseFunc_BerryPots,   ItemFieldUseFunc_BerryPots,   NULL                        },
    { ItemMenuUseFunc_UnownReport, ItemFieldUseFunc_UnownReport, NULL                        },
    { ItemMenuUseFunc_DowsingMchn, ItemFieldUseFunc_DowsingMchn, NULL                        },
    { NULL,                        ItemFieldUseFunc_GbSounds,    NULL                        },
    { ItemMenuUseFunc_Gracidea,    ItemFieldUseFunc_Gracidea,    NULL                        },
    { ItemMenuUseFunc_VSRecorder,  ItemFieldUseFunc_VSRecorder,  NULL                        },
};

void *GetItemFieldUseFunc(int funcType, u16 itemType) {
    if (funcType == USE_ITEM_TASK_MENU) {
        return sItemFieldUseFuncs[itemType].menu;
    } else if (funcType == USE_ITEM_TASK_FIELD) {
        return sItemFieldUseFuncs[itemType].field;
    } else {
        return sItemFieldUseFuncs[itemType].check;
    }
}

void ItemCheckUseData_Init(FieldSystem *fieldSystem, struct ItemCheckUseData *dat) {
    int x, y;
    LocalMapObject *dummy;

    dat->fieldSystem = fieldSystem;
    dat->mapId = fieldSystem->location->mapId;
    dat->haveFollower = Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData));
    dat->haveRocketCostume = Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(fieldSystem->saveData));
    dat->playerState = PlayerAvatar_GetState(fieldSystem->playerAvatar);

    x = GetPlayerXCoord(fieldSystem->playerAvatar);
    y = GetPlayerZCoord(fieldSystem->playerAvatar);
    dat->standingTile = GetMetatileBehavior(fieldSystem, x, y);

    switch (PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar)) {
    case DIR_NORTH:
        y--;
        break;
    case DIR_SOUTH:
        y++;
        break;
    case DIR_EAST:
        x++;
        break;
    case DIR_WEST:
        x--;
        break;
    }
    dat->facingTile = GetMetatileBehavior(fieldSystem, x, y);

    FieldSystem_GetFacingObject(fieldSystem, &dummy);
    dat->playerAvatar = fieldSystem->playerAvatar;
}

static struct AlphItemUseData *CreateAlphItemUseWork(int scriptNo, u16 var_8000, u16 var_8001, u16 var_8002, u16 var_8003) {
    struct AlphItemUseData *ret = Heap_Alloc((enum HeapID)32, sizeof(struct AlphItemUseData));
    ret->scriptNo = scriptNo;
    ret->var_8000 = var_8000;
    ret->var_8001 = var_8001;
    ret->var_8002 = var_8002;
    ret->var_8003 = var_8003;

    return ret;
}

static void ExitMenuAndJumpToAlphChamberReaction(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2, int scriptNo) {
#pragma unused(dat2)
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_UseItemInAlphChamber;
    env->exitTaskEnvironment = CreateAlphItemUseWork(scriptNo, data->itemId, 0, 0, 0);
    env->state = 12;
}

static BOOL Task_UseItemInAlphChamber(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct AlphItemUseData *env = TaskManager_GetEnvironment(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    LocalMapObject *sp0;

    switch (*state_p) {
    case 0:
        FieldSystem_GetFacingObject(fieldSystem, &sp0);
        QueueScript(taskManager, env->scriptNo, sp0, NULL);
        *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8000) = env->var_8000;
        *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8001) = env->var_8001;
        *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8002) = env->var_8002;
        *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8003) = env->var_8003;
        (*state_p)++;
        break;
    case 1:
        Heap_Free(env);
        return TRUE;
    }

    return FALSE;
}

static void ItemMenuUseFunc_HealingItem(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    PartyMenuArgs *usedat = Heap_Alloc(HEAP_ID_FIELD2, sizeof(PartyMenuArgs));
    memset(usedat, 0, sizeof(PartyMenuArgs));
    usedat->party = SaveArray_Party_Get(fieldSystem->saveData);
    usedat->bag = Save_Bag_Get(fieldSystem->saveData);
    usedat->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    usedat->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    usedat->unk_10 = sub_020270C4(fieldSystem->saveData);
    usedat->fieldMoveCheckData = &env->fieldMoveCheckData;
    usedat->unk_25 = 0;
    usedat->context = PARTY_MENU_CONTEXT_USE_ITEM;
    usedat->fieldSystem = fieldSystem;
    usedat->itemId = data->itemId;
    usedat->partySlot = data->partySlot;
    usedat->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, usedat);
    env->exitTaskEnvironment = usedat;
    StartMenu_SetExitTaskFunc(env, Task_StartMenu_HandleReturn_Pokemon);
}

static enum ItemUseError ItemCheckUseFunc_Dummy(const struct ItemCheckUseData *data) {
    return ITEMUSEERROR_OAKSWORDS;
}

static void ItemMenuUseFunc_Bicycle(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_MountOrDismountBicycle;
    env->exitTaskEnvironment = NULL;
    env->state = 12;
}

static BOOL ItemFieldUseFunc_Bicycle(struct ItemFieldUseData *data) {
    FieldSystem_CreateTask(data->fieldSystem, Task_MountOrDismountBicycle, NULL);
    data->fieldSystem->unkD2_7 = 1;
    return FALSE;
}

static BOOL Task_MountOrDismountBicycle(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    int r6;

    switch (*state_p) {
    case 0:
        if (FollowMon_IsActive(fieldSystem)) {
            if (MapObject_IsMovementPaused(FollowMon_GetMapObject(fieldSystem))) {
                if (PlayerAvatar_GetState(fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
                    r6 = 0x30;
                } else {
                    r6 = 0x38;
                }
                sub_0205FC94(FollowMon_GetMapObject(fieldSystem), r6);
                (*state_p)++;
            }
        } else {
            (*state_p)++;
        }
        break;
    case 1:
        if (PlayerAvatar_GetState(fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
            Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 1);
            Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
            FieldSystem_SetSavedMusicId(fieldSystem, 0);
            if (SndRadio_GetSeqNo() == 0) {
                FieldSystem_PlayOrFadeToNewMusicId(fieldSystem, FieldSystem_GetOverriddenMusicId(fieldSystem, fieldSystem->location->mapId), 1);
            }
            ov01_02205790(fieldSystem, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            if (FollowMon_IsActive(fieldSystem)) {
                sub_02069E84(FollowMon_GetMapObject(fieldSystem), 1);
                sub_02069DC8(FollowMon_GetMapObject(fieldSystem), TRUE);
            }
        } else {
            if (SndRadio_GetSeqNo() == 0) {
                FieldSystem_SetSavedMusicId(fieldSystem, SEQ_GS_BICYCLE);
                FieldSystem_PlayOrFadeToNewMusicId(fieldSystem, SEQ_GS_BICYCLE, 1);
            }
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar));
            Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 2);
            Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
            ov01_02205D68(fieldSystem);
            if (FollowMon_IsActive(fieldSystem)) {
                sub_02069E84(FollowMon_GetMapObject(fieldSystem), FALSE);
            }
        }
        (*state_p)++;
        break;
    case 2:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    }

    return FALSE;
}

static enum ItemUseError ItemCheckUseFunc_Bicycle(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (PlayerAvatar_IsBikeStateLocked(data->playerAvatar) == TRUE) {
        return ITEMUSEERROR_NODISMOUNT;
    }
    if (sub_0205B6F4(data->standingTile) == TRUE || sub_0205B8AC(data->standingTile) == TRUE) {
        return ITEMUSEERROR_OAKSWORDS;
    }
    if (!MapHeader_IsBikeAllowed(data->mapId)) {
        return ITEMUSEERROR_OAKSWORDS;
    }
    if (data->playerState == PLAYER_STATE_SURFING) {
        return ITEMUSEERROR_OAKSWORDS;
    }
    return ITEMUSEERROR_OKAY;
}

static void ItemMenuUseFunc_TMHM(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    PartyMenuArgs *usedat = Heap_Alloc(HEAP_ID_FIELD2, sizeof(PartyMenuArgs));
    memset(usedat, 0, sizeof(PartyMenuArgs));
    usedat->party = SaveArray_Party_Get(fieldSystem->saveData);
    usedat->bag = Save_Bag_Get(fieldSystem->saveData);
    usedat->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    usedat->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    usedat->fieldMoveCheckData = &env->fieldMoveCheckData;
    usedat->unk_25 = 0;
    usedat->context = PARTY_MENU_CONTEXT_TM_HM;
    usedat->fieldSystem = fieldSystem;
    usedat->itemId = data->itemId;
    usedat->partySlot = data->partySlot;
    usedat->moveId = TMHMGetMove(data->itemId);
    usedat->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, usedat);
    env->exitTaskEnvironment = usedat;
    StartMenu_SetExitTaskFunc(env, Task_StartMenu_HandleReturn_Pokemon);
}

static void ItemMenuUseFunc_Mail(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    UseMailArgs *mailWork = UseMail_CreateArgs(fieldSystem, 3, ItemToMailId(data->itemId), HEAP_ID_FIELD2);
    env->exitTaskEnvironment2 = sub_0203D818(data->itemId, 3, 0);
    env->exitTaskEnvironment = mailWork;
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromMail);
}

static enum ItemUseError ItemCheckUseFunc_Berry(const struct ItemCheckUseData *data) {
    return ITEMUSEERROR_OKAY; // It is always okay to use a Berry
}

static void ItemMenuUseFunc_Berry(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    ItemMenuUseFunc_HealingItem(data, dat2);
}

// Thou shalt not plant a berry in the field in Johto nor Kanto
BOOL Leftover_CanPlantBerry(const struct ItemCheckUseData *data) {
    return FALSE;
}

static void ItemMenuUseFunc_PalPad(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    env->exitTaskEnvironment = PalPad_LaunchApp(fieldSystem, fieldSystem->saveData, HEAP_ID_FIELD2);
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromAppItem);
}

static BOOL ItemFieldUseFunc_PalPad(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreatePalPadArgs, FALSE);
    return TRUE;
}

static PalPadArgs *_CreatePalPadArgs(FieldSystem *fieldSystem) {
    return PalPad_LaunchApp(fieldSystem, fieldSystem->saveData, HEAP_ID_FIELD2);
}

static void ItemMenuUseFunc_Honey(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    size_t size;
    void *honey_work;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    size = GetHoneySweetScentWorkSize();
    honey_work = Heap_AllocAtEnd(HEAP_ID_FIELD2, size);
    memset(honey_work, 0, size);
    env->exitTaskFunc = Task_HoneyOrSweetScent;
    env->exitTaskEnvironment = honey_work;
    env->state = 12;
    Bag_TakeItem(Save_Bag_Get(fieldSystem->saveData), data->itemId, 1, HEAP_ID_FIELD2);
}

static void ItemMenuUseFunc_OldRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_OverworldFish;
    env->exitTaskEnvironment = CreateFishingRodTaskEnv(fieldSystem, HEAP_ID_FIELD2, 0);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_OldRod(struct ItemFieldUseData *data) {
    FieldSystem_CreateTask(data->fieldSystem, Task_OverworldFish, CreateFishingRodTaskEnv(data->fieldSystem, HEAP_ID_FIELD1, 0));
    return FALSE;
}

static void ItemMenuUseFunc_GoodRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_OverworldFish;
    env->exitTaskEnvironment = CreateFishingRodTaskEnv(fieldSystem, HEAP_ID_FIELD2, 1);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_GoodRod(struct ItemFieldUseData *data) {
    FieldSystem_CreateTask(data->fieldSystem, Task_OverworldFish, CreateFishingRodTaskEnv(data->fieldSystem, HEAP_ID_FIELD1, 1));
    return FALSE;
}

static void ItemMenuUseFunc_SuperRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_OverworldFish;
    env->exitTaskEnvironment = CreateFishingRodTaskEnv(fieldSystem, HEAP_ID_FIELD2, 2);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_SuperRod(struct ItemFieldUseData *data) {
    FieldSystem_CreateTask(data->fieldSystem, Task_OverworldFish, CreateFishingRodTaskEnv(data->fieldSystem, HEAP_ID_FIELD1, 2));
    return FALSE;
}

static enum ItemUseError ItemCheckUseFunc_FishingRod(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (MetatileBehavior_IsSurfableWater(data->facingTile) == TRUE) {
        if (sub_0205BA30(data->standingTile) == TRUE || sub_0205BA24(data->standingTile) == TRUE) {
            if (MapObject_CheckFlag28(PlayerAvatar_GetMapObject(data->playerAvatar)) == TRUE) {
                return ITEMUSEERROR_OAKSWORDS;
            }
        }
        return ITEMUSEERROR_OKAY;
    }
    return ITEMUSEERROR_OAKSWORDS;
}

static BOOL ItemFieldUseFunc_Generic(struct ItemFieldUseData *data) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = Heap_Alloc(HEAP_ID_FIELD2, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    env->strbuf = String_New(128, HEAP_ID_FIELD2);
    TryFormatRegisteredKeyItemUseMessage(data->fieldSystem->saveData, env->strbuf, data->itemId, HEAP_ID_FIELD2);
    FieldSystem_CreateTask(data->fieldSystem, Task_PrintRegisteredKeyItemUseMessage, env);
    return FALSE;
}

static BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct RegisteredKeyItemUseMessagePrintTaskData *env = TaskManager_GetEnvironment(taskManager);
    Options *options;

    switch (env->state) {
    case 0:
        fieldSystem->unkD2_6 = TRUE;
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        sub_0205B514(fieldSystem->bgConfig, &env->window, 3);
        options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
        sub_0205B564(&env->window, options);
        env->printerId = sub_0205B5B4(&env->window, env->strbuf, options, TRUE);
        env->state++;
        break;
    case 1:
        if (IsPrintFinished(env->printerId) == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) || (gSystem.simulatedInputs & PAD_BUTTON_A)) {
                fieldSystem->unkD2_6 = FALSE;
                ClearFrameAndWindow2(&env->window, 0);
                env->state++;
            }
        }
        break;
    case 2:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        RemoveWindow(&env->window);
        String_Delete(env->strbuf);
        Heap_Free(env);
        return TRUE;
    }

    return FALSE;
}

static void ItemMenuUseFunc_EvoStone(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem;
    StartMenuTaskData *env;
    PartyMenuArgs *usedat;

    fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    if (data->itemId == ITEM_WATER_STONE && CheckUseWaterStoneInAlphChamber(fieldSystem)) {
        ExitMenuAndJumpToAlphChamberReaction(data, dat2, _EV_scr_seq_D24R0206_002 + 1);
        return;
    }
    env = TaskManager_GetEnvironment(data->taskManager);
    usedat = Heap_Alloc(HEAP_ID_FIELD2, sizeof(PartyMenuArgs));
    memset(usedat, 0, sizeof(PartyMenuArgs));
    usedat->party = SaveArray_Party_Get(fieldSystem->saveData);
    usedat->bag = Save_Bag_Get(fieldSystem->saveData);
    usedat->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    usedat->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    usedat->unk_10 = sub_020270C4(fieldSystem->saveData);
    usedat->fieldMoveCheckData = &env->fieldMoveCheckData;
    usedat->unk_25 = 0;
    usedat->context = PARTY_MENU_CONTEXT_EVO_STONE;
    usedat->itemId = data->itemId;
    usedat->partySlot = data->partySlot;
    usedat->fieldSystem = fieldSystem;
    usedat->menuInputStatePtr = &fieldSystem->menuInputState;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_PartyMenu, usedat);
    env->exitTaskEnvironment = usedat;
    StartMenu_SetExitTaskFunc(env, Task_StartMenu_HandleReturn_Pokemon);
}

static void ItemMenuUseFunc_EscapeRope(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem;
    StartMenuTaskData *env;

    if (CheckUseEscapeRopeInAlphChamber(dat2->fieldSystem)) {
        ExitMenuAndJumpToAlphChamberReaction(data, dat2, _EV_scr_seq_D24R0202_002 + 1);
        return;
    }

    fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_JumpToFieldEscapeRope;
    env->exitTaskEnvironment = NULL;
    env->state = 12;
    Bag_TakeItem(Save_Bag_Get(fieldSystem->saveData), data->itemId, 1, HEAP_ID_FIELD2);
}

static enum ItemUseError ItemCheckUseFunc_EscapeRope(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (CheckUseEscapeRopeInAlphChamber(data->fieldSystem)) {
        return ITEMUSEERROR_OKAY;
    }
    if (MapHeader_IsCave(data->mapId) == TRUE && MapHeader_IsEscapeRopeAllowed(data->mapId) == TRUE) {
        return ITEMUSEERROR_OKAY;
    }
    return ITEMUSEERROR_OAKSWORDS;
}

static BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager) {
    TaskManager_Jump(taskManager, Task_FieldEscapeRope, CreateFieldEscapeRopeTaskEnv(TaskManager_GetFieldSystem(taskManager), HEAP_ID_FIELD2));
    return FALSE;
}

static void ItemMenuUseFunc_ApricornBox(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    env->exitTaskEnvironment = ApricornBox_LaunchApp(fieldSystem, 1);
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromAppItem);
}

static BOOL ItemFieldUseFunc_ApricornBox(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateApricornBoxWork, FALSE);
    return TRUE;
}

static ApricornBoxArgs *_CreateApricornBoxWork(FieldSystem *fieldSystem) {
    return ApricornBox_LaunchApp(fieldSystem, 1);
}

static void ItemMenuUseFunc_BerryPots(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    env->exitTaskEnvironment = BerryPots_LaunchApp(fieldSystem);
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromAppItem);
}

static BOOL ItemFieldUseFunc_BerryPots(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_BerryPotsArgs_New, FALSE);
    return TRUE;
}

static struct BerryPotsArgs *_BerryPotsArgs_New(FieldSystem *fieldSystem) {
    return BerryPots_LaunchApp(fieldSystem);
}

static void ItemMenuUseFunc_UnownReport(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    env->exitTaskEnvironment = UnownReport_LaunchApp(fieldSystem);
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromAppItem);
}

static BOOL ItemFieldUseFunc_UnownReport(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateUnownReportWork, FALSE);
    return TRUE;
}

static UnownReportArgs *_CreateUnownReportWork(FieldSystem *fieldSystem) {
    return UnownReport_LaunchApp(fieldSystem);
}

static void ItemMenuUseFunc_DowsingMchn(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    env->exitTaskFunc = Task_ActivateDowsingMchnUI;
    env->exitTaskEnvironment = NULL;
    env->state = 12;
}

static BOOL ItemFieldUseFunc_DowsingMchn(struct ItemFieldUseData *data) {
    FieldSystem_CreateTask(data->fieldSystem, Task_ActivateDowsingMchnUI, NULL);
    return FALSE;
}

static BOOL Task_ActivateDowsingMchnUI(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        ov01_021F6A9C(fieldSystem, 4, NULL);
        fieldSystem->unkD2_7 = TRUE;
        (*state_p)++;
        break;
    case 1:
        if (ov01_021F6B10(fieldSystem) == TRUE) {
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static BOOL ItemFieldUseFunc_GbSounds(struct ItemFieldUseData *data) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = Heap_Alloc(HEAP_ID_FIELD2, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0010_bin, HEAP_ID_FIELD2);
    if (SoundSys_GetGBSoundsState() == TRUE) {
        env->strbuf = NewString_ReadMsgData(msgData, msg_0010_00105);
    } else {
        env->strbuf = NewString_ReadMsgData(msgData, msg_0010_00104);
    }
    DestroyMsgData(msgData);
    SoundSys_ToggleGBSounds();
    FieldSystem_CreateTask(data->fieldSystem, Task_PrintRegisteredKeyItemUseMessage, env);
    return FALSE;
}

static void ItemMenuUseFunc_Gracidea(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    env->exitTaskEnvironment = PartyMenu_LaunchApp_Gracidea(fieldSystem, HEAP_ID_FIELD2, ITEM_GRACIDEA);
    StartMenu_SetExitTaskFunc(env, Task_StartMenu_HandleReturn_Pokemon);
}

static BOOL ItemFieldUseFunc_Gracidea(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateGracideaWork, FALSE);
    return TRUE;
}

static PartyMenuArgs *_CreateGracideaWork(FieldSystem *fieldSystem) {
    return PartyMenu_LaunchApp_Gracidea(fieldSystem, HEAP_ID_FIELD2, ITEM_GRACIDEA);
}

static void ItemMenuUseFunc_VSRecorder(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(data->taskManager);
    StartMenuTaskData *env = TaskManager_GetEnvironment(data->taskManager);
    sub_0203F570(fieldSystem, fieldSystem->saveData);
    env->exitTaskEnvironment = NULL;
    StartMenu_SetExitTaskFunc(env, Task_ReturnToMenuFromVSRecorder);
}

static BOOL ItemFieldUseFunc_VSRecorder(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_VsRecorderInit, FALSE);
    return TRUE;
}

static void *_VsRecorderInit(FieldSystem *fieldSystem) {
    ov01_021F4440(fieldSystem);
    sub_0203F570(fieldSystem, fieldSystem->saveData);
    return NULL;
}

static u16 sStayInFieldItemIds[] = {
    ITEM_BICYCLE,
    ITEM_OLD_ROD,
    ITEM_GOOD_ROD,
    ITEM_SUPER_ROD,
    ITEM_POINT_CARD,
    ITEM_SEAL_CASE,
    ITEM_FASHION_CASE,
    ITEM_COIN_CASE,
};

static BOOL KeyItemIdSpawnsSubprocess(FieldSystem *fieldSystem, u16 itemId) {
    int i;

    for (i = 0; i < NELEMS(sStayInFieldItemIds); i++) {
        if (itemId == sStayInFieldItemIds[i]) {
            return FALSE;
        }
    }

    return TRUE;
}

int UseRegisteredItemButtonInField(FieldSystem *fieldSystem, u8 slot) {
    struct ItemFieldUseData *data;
    u16 itemId;
    u16 funcType;
    ItemFieldUseFunc fieldUseFunc;
    ItemCheckUseFunc checkUseFunc;
    BOOL result;
    enum ItemUseError error;

    GF_ASSERT(slot == 1 || slot == 2);
    if (FieldSystem_MapIsBattleTowerMultiPartnerSelectRoom(fieldSystem) == TRUE) {
        return 0;
    }
    if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        return 0;
    }
    if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        return 0;
    }
    if (ov01_021F6B10(fieldSystem) != TRUE) {
        return 0;
    }
    if (slot == 1) {
        itemId = Bag_GetRegisteredItem1(Save_Bag_Get(fieldSystem->saveData));
    } else {
        itemId = Bag_GetRegisteredItem2(Save_Bag_Get(fieldSystem->saveData));
    }
    if (itemId == ITEM_DOWSING_MCHN && ov01_021F6B00(fieldSystem) == 4) {
        return 0;
    }
    funcType = GetItemAttr(itemId, ITEMATTR_FIELDUSEFUNC, HEAP_ID_FIELD2);
    checkUseFunc = GetItemFieldUseFunc(USE_ITEM_TASK_CHECK, funcType);
    fieldUseFunc = GetItemFieldUseFunc(USE_ITEM_TASK_FIELD, funcType);
    if (fieldUseFunc == NULL) {
        return 0;
    }
    data = Heap_Alloc(HEAP_ID_FIELD2, sizeof(struct ItemFieldUseData));
    memset(data, 0, sizeof(struct ItemFieldUseData));
    data->fieldSystem = fieldSystem;
    data->itemId = itemId;
    ItemCheckUseData_Init(fieldSystem, &data->dat);
    result = FALSE;
    if (checkUseFunc == NULL) {
        result = fieldUseFunc(data);
    } else {
        error = checkUseFunc(&data->dat);
        if (error == ITEMUSEERROR_OKAY) {
            result = fieldUseFunc(data);
        } else {
            RegisteredItem_GoToPrintErrorTask(data, error);
        }
    }
    if (result == FALSE) {
        Heap_Free(data);
    } else if (KeyItemIdSpawnsSubprocess(fieldSystem, data->itemId)) {
        return 1;
    }
    return 2;
}

static void RegisteredItem_GoToPrintErrorTask(struct ItemFieldUseData *data, enum ItemUseError error) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = Heap_Alloc(HEAP_ID_FIELD2, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    env->strbuf = String_New(128, HEAP_ID_FIELD2);
    GetItemUseErrorMessage(Save_PlayerData_GetProfile(data->fieldSystem->saveData), env->strbuf, data->itemId, error, HEAP_ID_FIELD2);
    FieldSystem_CreateTask(data->fieldSystem, Task_PrintRegisteredKeyItemUseMessage, env);
}

static BOOL Task_RegisteredItem_GoToApp(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ItemFieldUseData *env = TaskManager_GetEnvironment(taskManager);

    switch (env->state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        ov01_021E636C(0);
        env->state = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            env->work = env->ctor(fieldSystem);
            if (env->no_app == FALSE) {
                env->state = 2;
            } else {
                env->state = 3;
            }
        }
        break;
    case 2:
        if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
            break;
        }
        // fallthrough
    case 3:
        if (env->work != NULL) {
            Heap_Free(env->work);
        }
        FieldSystem_LoadFieldOverlay(fieldSystem);
        env->state = 4;
        break;
    case 4:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            ov01_021E636C(1);
            env->state = 5;
        }
        break;
    case 5:
        if (IsPaletteFadeFinished()) {
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            Heap_Free(env);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static void RegisteredItem_CreateGoToAppTask(struct ItemFieldUseData *data, FieldApplicationWorkCtor ctor, BOOL no_app) {
    data->ctor = ctor;
    data->no_app = no_app;
    FieldSystem_CreateTask(data->fieldSystem, Task_RegisteredItem_GoToApp, data);
}
