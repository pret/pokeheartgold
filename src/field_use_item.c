#include "task.h"
#include "field_use_item.h"
#include "sys_flags.h"
#include "unk_02054648.h"
#include "unk_0203DB6C.h"
#include "unk_0203DFA4.h"
#include "unk_02078E30.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "save_arrays.h"
#include "sound_radio.h"
#include "sound_02004A44.h"
#include "overlay_01.h"
#include "overlay_02.h"
#include "unk_02054E00.h"
#include "unk_0205B6E8.h"
#include "unk_0203E348.h"
#include "unk_0200E398.h"
#include "unk_0200FA24.h"
#include "text.h"
#include "field_alph_checks.h"
#include "map_header.h"
#include "system.h"
#include "unk_02066EDC.h"
#include "constants/items.h"
#include "constants/sndseq.h"
#include "fielddata/script/scr_seq/event_D24R0202.h"
#include "fielddata/script/scr_seq/event_D24R0206.h"
#include "msgdata/msg/msg_0010.h"

struct ItemUseFuncDat {
    ItemMenuUseFunc menu;
    ItemFieldUseFunc field;
    ItemCheckUseFunc check;
};

static struct AlphItemUseData *CreateAlphItemUseWork(int scriptNo, u16 var_8000, u16 var_8001, u16 var_8002, u16 var_8003);
static void ExitMenuAndJumpToAlphChamberReaction(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2, int scriptNo);
static BOOL Task_UseItemInAlphChamber(TaskManager *taskManager);
static void ItemMenuUseFunc_HealingItem(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static u32 ItemCheckUseFunc_Dummy(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_Bicycle(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_Bicycle(struct ItemFieldUseData *data);
static BOOL Task_MountOrDismountBicycle(TaskManager *taskManager);
static u32 ItemCheckUseFunc_Bicycle(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_TMHM(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_Mail(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static u32 ItemCheckUseFunc_Berry(const struct ItemCheckUseData *data);
static void ItemMenuUseFunc_Berry(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_PalPad(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_PalPad(struct ItemFieldUseData *data);
static struct PalPadWork *_CreatePalPadWork(FieldSystem *fsys);
static void ItemMenuUseFunc_Honey(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_OldRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_OldRod(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_GoodRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_GoodRod(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_SuperRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_SuperRod(struct ItemFieldUseData *data);
static u32 ItemCheckUseFunc_FishingRod(const struct ItemCheckUseData *data);
static BOOL ItemFieldUseFunc_Generic(struct ItemFieldUseData *data);
static BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager);
static void ItemMenuUseFunc_EvoStone(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static void ItemMenuUseFunc_EscapeRope(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static u32 ItemCheckUseFunc_EscapeRope(const struct ItemCheckUseData *data);
static BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager);
static void ItemMenuUseFunc_ApricornBox(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_ApricornBox(struct ItemFieldUseData *data);
static struct ApricornBoxWork *_CreateApricornBoxWork(FieldSystem *fsys);
static void ItemMenuUseFunc_BerryPots(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_BerryPots(struct ItemFieldUseData *data);
static struct BerryPotsWork *_CreateBerryPotsWork(FieldSystem *fsys);
static void ItemMenuUseFunc_UnownReport(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_UnownReport(struct ItemFieldUseData *data);
static struct UnownReportWork *_CreateUnownReportWork(FieldSystem *fsys);
static void ItemMenuUseFunc_DowsingMchn(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_DowsingMchn(struct ItemFieldUseData *data);
static BOOL Task_ActivateDowsingMchnUI(TaskManager *taskManager);
static BOOL ItemFieldUseFunc_GbSounds(struct ItemFieldUseData *data);
static void ItemMenuUseFunc_Gracidea(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_Gracidea(struct ItemFieldUseData *data);
static struct GracideaWork *_CreateGracideaWork(FieldSystem *fsys);
static void ItemMenuUseFunc_VSRecorder(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2);
static BOOL ItemFieldUseFunc_VSRecorder(struct ItemFieldUseData *data);
static void *_VsRecorderInit(FieldSystem *fsys);
static BOOL KeyItemIdSpawnsSubprocess(FieldSystem *fsys, u16 itemId);
static void RegisteredItem_GoToPrintErrorTask(struct ItemFieldUseData *data, u32 error);
static BOOL Task_RegisteredItem_GoToApp(TaskManager *taskManager);
static void RegisteredItem_CreateGoToAppTask(struct ItemFieldUseData *data, FieldApplicationWorkCtor ctor, BOOL no_app);

static const struct ItemUseFuncDat sItemFieldUseFuncs[] = {
    { NULL, ItemFieldUseFunc_Generic, NULL },
    { ItemMenuUseFunc_HealingItem, NULL, NULL },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_Bicycle, ItemFieldUseFunc_Bicycle, ItemCheckUseFunc_Bicycle },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_TMHM, NULL, NULL },
    { ItemMenuUseFunc_Mail, NULL, NULL },
    { ItemMenuUseFunc_Berry, NULL, ItemCheckUseFunc_Berry },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_PalPad, ItemFieldUseFunc_PalPad, NULL },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_Honey, NULL, NULL },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_OldRod, ItemFieldUseFunc_OldRod, ItemCheckUseFunc_FishingRod },
    { ItemMenuUseFunc_GoodRod, ItemFieldUseFunc_GoodRod, ItemCheckUseFunc_FishingRod },
    { ItemMenuUseFunc_SuperRod, ItemFieldUseFunc_SuperRod, ItemCheckUseFunc_FishingRod },
    { NULL, ItemFieldUseFunc_Generic, NULL },
    { ItemMenuUseFunc_EvoStone, NULL, NULL },
    { ItemMenuUseFunc_EscapeRope, NULL, ItemCheckUseFunc_EscapeRope },
    { NULL, NULL, ItemCheckUseFunc_Dummy },
    { ItemMenuUseFunc_ApricornBox, ItemFieldUseFunc_ApricornBox, NULL },
    { ItemMenuUseFunc_BerryPots, ItemFieldUseFunc_BerryPots, NULL },
    { ItemMenuUseFunc_UnownReport, ItemFieldUseFunc_UnownReport, NULL },
    { ItemMenuUseFunc_DowsingMchn, ItemFieldUseFunc_DowsingMchn, NULL },
    { NULL, ItemFieldUseFunc_GbSounds, NULL },
    { ItemMenuUseFunc_Gracidea, ItemFieldUseFunc_Gracidea, NULL },
    { ItemMenuUseFunc_VSRecorder, ItemFieldUseFunc_VSRecorder, NULL },
};

void *GetItemFieldUseFunc(int funcType, int itemType) {
    if (funcType == USE_ITEM_TASK_MENU) {
        return sItemFieldUseFuncs[itemType].menu;
    } else if (funcType == USE_ITEM_TASK_FIELD) {
        return sItemFieldUseFuncs[itemType].field;
    } else {
        return sItemFieldUseFuncs[itemType].check;
    }
}

void ItemCheckUseData_Init(FieldSystem *fsys, struct ItemCheckUseData *dat) {
    int x, y;
    LocalMapObject *dummy;

    dat->fsys = fsys;
    dat->mapId = fsys->location->mapId;
    dat->haveFollower = ScriptState_CheckHaveFollower(SavArray_Flags_get(fsys->savedata));
    dat->haveRocketCostume = ScriptState_CheckRocketCostumeFlag(SavArray_Flags_get(fsys->savedata));
    dat->playerState = PlayerAvatar_GetState(fsys->playerAvatar);

    x = GetPlayerXCoord(fsys->playerAvatar);
    y = GetPlayerYCoord(fsys->playerAvatar);
    dat->standingTile = GetMetatileBehaviorAt(fsys, x, y);

    switch (PlayerAvatar_GetFacingDirection(fsys->playerAvatar)) {
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
    dat->facingTile = GetMetatileBehaviorAt(fsys, x, y);

    Fsys_GetFacingObject(fsys, &dummy);
    dat->playerAvatar = fsys->playerAvatar;
}

static struct AlphItemUseData *CreateAlphItemUseWork(int scriptNo, u16 var_8000, u16 var_8001, u16 var_8002, u16 var_8003) {
    struct AlphItemUseData *ret = AllocFromHeap((HeapID)32, sizeof(struct AlphItemUseData));
    ret->scriptNo = scriptNo;
    ret->var_8000 = var_8000;
    ret->var_8001 = var_8001;
    ret->var_8002 = var_8002;
    ret->var_8003 = var_8003;

    return ret;
}

static void ExitMenuAndJumpToAlphChamberReaction(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2, int scriptNo) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_UseItemInAlphChamber;
    env->atexit_TaskEnv = CreateAlphItemUseWork(scriptNo, data->itemId, 0, 0, 0);
    env->state = 12;
}

static BOOL Task_UseItemInAlphChamber(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct AlphItemUseData *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    LocalMapObject *sp0;

    switch (*state_p) {
    case 0:
        Fsys_GetFacingObject(fsys, &sp0);
        QueueScript(taskManager, env->scriptNo, sp0, NULL);
        *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8000) = env->var_8000;
        *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8001) = env->var_8001;
        *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8002) = env->var_8002;
        *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8003) = env->var_8003;
        (*state_p)++;
        break;
    case 1:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void ItemMenuUseFunc_HealingItem(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    struct UseItemInPartyTaskEnv *usedat = AllocFromHeap(11, sizeof(struct UseItemInPartyTaskEnv));
    memset(usedat, 0, sizeof(struct UseItemInPartyTaskEnv));
    usedat->party = SavArray_PlayerParty_get(fsys->savedata);
    usedat->bag = Sav2_Bag_get(fsys->savedata);
    usedat->mailbox = Sav2_Mailbox_get(fsys->savedata);
    usedat->options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
    usedat->unk10 = sub_020270C4(fsys->savedata);
    usedat->unk18 = &env->unk_0370;
    usedat->unk25 = 0;
    usedat->unk24 = 5;
    usedat->fsys = fsys;
    usedat->itemId = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

static u32 ItemCheckUseFunc_Dummy(const struct ItemCheckUseData *data) {
    return ITEMUSEERROR_OAKSWORDS;
}

static void ItemMenuUseFunc_Bicycle(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_MountOrDismountBicycle;
    env->atexit_TaskEnv = NULL;
    env->state = 12;
}

static BOOL ItemFieldUseFunc_Bicycle(struct ItemFieldUseData *data) {
    FieldSys_CreateTask(data->fsys, Task_MountOrDismountBicycle, NULL);
    data->fsys->unkD2_7 = 1;
    return FALSE;
}

static BOOL Task_MountOrDismountBicycle(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    int r6;

    switch (*state_p) {
    case 0:
        if (FollowingPokemon_IsActive(fsys)) {
            if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(fsys))) {
                if (PlayerAvatar_GetState(fsys->playerAvatar) == PLAYER_STATE_CYCLING) {
                    r6 = 0x30;
                } else {
                    r6 = 0x38;
                }
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), r6);
                (*state_p)++;
            }
        } else {
            (*state_p)++;
        }
        break;
    case 1:
        if (PlayerAvatar_GetState(fsys->playerAvatar) == PLAYER_STATE_CYCLING) {
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fsys->playerAvatar));
            ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 1);
            ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
            Fsys_SetSavedMusicId(fsys, 0);
            if (SndRadio_GetSeqNo() == 0) {
                Fsys_PlayOrFadeToNewMusicId(fsys, Fsys_GetSurfOverriddenMusicId(fsys, fsys->location->mapId), 1);
            }
            ov01_02205790(fsys, PlayerAvatar_GetFacingDirection(fsys->playerAvatar));
            if (FollowingPokemon_IsActive(fsys)) {
                sub_02069E84(FollowingPokemon_GetMapObject(fsys), 1);
                sub_02069DC8(FollowingPokemon_GetMapObject(fsys), TRUE);
            }
        } else {
            if (SndRadio_GetSeqNo() == 0) {
                Fsys_SetSavedMusicId(fsys, SEQ_GS_BICYCLE);
                Fsys_PlayOrFadeToNewMusicId(fsys, SEQ_GS_BICYCLE, 1);
            }
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fsys->playerAvatar));
            ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 2);
            ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
            ov01_02205D68(fsys);
            if (FollowingPokemon_IsActive(fsys)) {
                sub_02069E84(FollowingPokemon_GetMapObject(fsys), FALSE);
            }
        }
        (*state_p)++;
        break;
    case 2:
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        return TRUE;
    }

    return FALSE;
}

static u32 ItemCheckUseFunc_Bicycle(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (sub_0205CABC(data->playerAvatar) == TRUE) {
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
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    struct UseItemInPartyTaskEnv *usedat = AllocFromHeap(11, sizeof(struct UseItemInPartyTaskEnv));
    memset(usedat, 0, sizeof(struct UseItemInPartyTaskEnv));
    usedat->party = SavArray_PlayerParty_get(fsys->savedata);
    usedat->bag = Sav2_Bag_get(fsys->savedata);
    usedat->mailbox = Sav2_Mailbox_get(fsys->savedata);
    usedat->options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
    usedat->unk18 = &env->unk_0370;
    usedat->unk25 = 0;
    usedat->unk24 = 6;
    usedat->fsys = fsys;
    usedat->itemId = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->unk2A = TMHMGetMove(data->itemId);
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

static void ItemMenuUseFunc_Mail(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    struct UseMailWork *mailWork = CreateUseMailWork(fsys, 3, ItemToMailId(data->itemId), 11);
    env->unk_0384 = sub_0203D818(data->itemId, 3, 0);
    env->atexit_TaskEnv = mailWork;
    sub_0203C8F0(env, sub_0203D830);
}

static u32 ItemCheckUseFunc_Berry(const struct ItemCheckUseData *data) {
    return ITEMUSEERROR_OKAY; // It is always okay to use a Berry
}

static void ItemMenuUseFunc_Berry(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    ItemMenuUseFunc_HealingItem(data, dat2);
}

// Thou shalt not plant a berry in the field in Johto nor Kanto
BOOL Leftover_CanPlantBerry(const struct ItemCheckUseData *data) {
    return FALSE;
}

static void ItemMenuUseFunc_PalPad(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreatePalPadWork(fsys, fsys->savedata, 11);
    sub_0203C8F0(env, sub_0203D718);
}

static BOOL ItemFieldUseFunc_PalPad(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreatePalPadWork, FALSE);
    return TRUE;
}

static struct PalPadWork *_CreatePalPadWork(FieldSystem *fsys) {
    return CreatePalPadWork(fsys, fsys->savedata, 11);
}

static void ItemMenuUseFunc_Honey(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    size_t size;
    void *honey_work;
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    size = GetHoneySweetScentWorkSize();
    honey_work = AllocFromHeapAtEnd(11, size);
    memset(honey_work, 0, size);
    env->atexit_TaskFunc = Task_HoneyOrSweetScent;
    env->atexit_TaskEnv = honey_work;
    env->state = 12;
    Bag_TakeItem(Sav2_Bag_get(fsys->savedata), data->itemId, 1, 11);
}

static void ItemMenuUseFunc_OldRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = CreateFishingRodTaskEnv(fsys, 11, 0);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_OldRod(struct ItemFieldUseData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, CreateFishingRodTaskEnv(data->fsys, 4, 0));
    return FALSE;
}

static void ItemMenuUseFunc_GoodRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = CreateFishingRodTaskEnv(fsys, 11, 1);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_GoodRod(struct ItemFieldUseData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, CreateFishingRodTaskEnv(data->fsys, 4, 1));
    return FALSE;
}

static void ItemMenuUseFunc_SuperRod(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = CreateFishingRodTaskEnv(fsys, 11, 2);
    env->state = 12;
}

static BOOL ItemFieldUseFunc_SuperRod(struct ItemFieldUseData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, CreateFishingRodTaskEnv(data->fsys, 4, 2));
    return FALSE;
}

static u32 ItemCheckUseFunc_FishingRod(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (sub_0205B778(data->facingTile) == TRUE) {
        if (sub_0205BA30(data->standingTile) == TRUE || sub_0205BA24(data->standingTile) == TRUE) {
            if (sub_0205F83C(PlayerAvatar_GetMapObject(data->playerAvatar)) == TRUE) {
                return ITEMUSEERROR_OAKSWORDS;
            }
        }
        return ITEMUSEERROR_OKAY;
    }
    return ITEMUSEERROR_OAKSWORDS;
}

static BOOL ItemFieldUseFunc_Generic(struct ItemFieldUseData *data) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = AllocFromHeap(11, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    env->strbuf = String_ctor(128, 11);
    TryFormatRegisteredKeyItemUseMessage(data->fsys->savedata, env->strbuf, data->itemId, 11);
    FieldSys_CreateTask(data->fsys, Task_PrintRegisteredKeyItemUseMessage, env);
    return FALSE;
}

static BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct RegisteredKeyItemUseMessagePrintTaskData *env = TaskManager_GetEnv(taskManager);
    OPTIONS *options;

    switch (env->state) {
    case 0:
        fsys->unkD2_6 = TRUE;
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        sub_0205B514(fsys->bg_config, &env->window, 3);
        options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
        sub_0205B564(&env->window, options);
        env->printerId = sub_0205B5B4(&env->window, env->strbuf, options, TRUE);
        env->state++;
        break;
    case 1:
        if (sub_0205B624(env->printerId) == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) || (gSystem.simulatedInputs & PAD_BUTTON_A)) {
                fsys->unkD2_6 = FALSE;
                ClearFrameAndWindow2(&env->window, 0);
                env->state++;
            }
        }
        break;
    case 2:
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        RemoveWindow(&env->window);
        String_dtor(env->strbuf);
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void ItemMenuUseFunc_EvoStone(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys;
    struct BagViewAppWork *env;
    struct UseItemInPartyTaskEnv *usedat;

    fsys = TaskManager_GetSys(data->taskManager);
    if (data->itemId == ITEM_WATER_STONE && CheckUseWaterStoneInAlphChamber(fsys)) {
        ExitMenuAndJumpToAlphChamberReaction(data, dat2, _EV_scr_seq_D24R0206_002 + 1);
        return;
    }
    env = TaskManager_GetEnv(data->taskManager);
    usedat = AllocFromHeap(11, sizeof(struct UseItemInPartyTaskEnv));
    memset(usedat, 0, sizeof(struct UseItemInPartyTaskEnv));
    usedat->party = SavArray_PlayerParty_get(fsys->savedata);
    usedat->bag = Sav2_Bag_get(fsys->savedata);
    usedat->mailbox = Sav2_Mailbox_get(fsys->savedata);
    usedat->options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
    usedat->unk10 = sub_020270C4(fsys->savedata);
    usedat->unk18 = &env->unk_0370;
    usedat->unk25 = 0;
    usedat->unk24 = 16;
    usedat->itemId = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->fsys = fsys;
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

static void ItemMenuUseFunc_EscapeRope(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys;
    struct BagViewAppWork *env;

    if (CheckUseEscapeRopeInAlphChamber(dat2->fsys)) {
        ExitMenuAndJumpToAlphChamberReaction(data, dat2, _EV_scr_seq_D24R0202_002 + 1);
        return;
    }

    fsys = TaskManager_GetSys(data->taskManager);
    env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_JumpToFieldEscapeRope;
    env->atexit_TaskEnv = NULL;
    env->state = 12;
    Bag_TakeItem(Sav2_Bag_get(fsys->savedata), data->itemId, 1, 11);
}

static u32 ItemCheckUseFunc_EscapeRope(const struct ItemCheckUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->haveRocketCostume == TRUE) {
        return ITEMUSEERROR_NOTNOW;
    }
    if (CheckUseEscapeRopeInAlphChamber(data->fsys)) {
        return ITEMUSEERROR_OKAY;
    }
    if (MapHeader_IsCave(data->mapId) == TRUE && MapHeader_IsEscapeRopeAllowed(data->mapId) == TRUE) {
        return ITEMUSEERROR_OKAY;
    }
    return ITEMUSEERROR_OAKSWORDS;
}

static BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager) {
    TaskManager_Jump(taskManager, Task_FieldEscapeRope, CreateFieldEscapeRopeTaskEnv(TaskManager_GetSys(taskManager), 11));
    return FALSE;
}

static void ItemMenuUseFunc_ApricornBox(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreateApricornBoxWork(fsys, 1);
    sub_0203C8F0(env, sub_0203D718);
}

static BOOL ItemFieldUseFunc_ApricornBox(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateApricornBoxWork, FALSE);
    return TRUE;
}

static struct ApricornBoxWork *_CreateApricornBoxWork(FieldSystem *fsys) {
    return CreateApricornBoxWork(fsys, 1);
}

static void ItemMenuUseFunc_BerryPots(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreateBerryPotsWork(fsys);
    sub_0203C8F0(env, sub_0203D718);
}

static BOOL ItemFieldUseFunc_BerryPots(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateBerryPotsWork, FALSE);
    return TRUE;
}

static struct BerryPotsWork *_CreateBerryPotsWork(FieldSystem *fsys) {
    return CreateBerryPotsWork(fsys);
}

static void ItemMenuUseFunc_UnownReport(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreateUnownReportWork(fsys);
    sub_0203C8F0(env, sub_0203D718);
}

static BOOL ItemFieldUseFunc_UnownReport(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateUnownReportWork, FALSE);
    return TRUE;
}

static struct UnownReportWork *_CreateUnownReportWork(FieldSystem *fsys) {
    return CreateUnownReportWork(fsys);
}

static void ItemMenuUseFunc_DowsingMchn(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_ActivateDowsingMchnUI;
    env->atexit_TaskEnv = NULL;
    env->state = 12;
}

static BOOL ItemFieldUseFunc_DowsingMchn(struct ItemFieldUseData *data) {
    FieldSys_CreateTask(data->fsys, Task_ActivateDowsingMchnUI, NULL);
    return FALSE;
}

static BOOL Task_ActivateDowsingMchnUI(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        ov01_021F6A9C(fsys, 4, NULL);
        fsys->unkD2_7 = TRUE;
        (*state_p)++;
        break;
    case 1:
        if (ov01_021F6B10(fsys) == TRUE) {
            MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static BOOL ItemFieldUseFunc_GbSounds(struct ItemFieldUseData *data) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = AllocFromHeap(11, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0010_bin, 11);
    if (SoundSys_GetGBSoundsState() == TRUE) {
        env->strbuf = NewString_ReadMsgData(msgData, msg_0010_00105);
    } else {
        env->strbuf = NewString_ReadMsgData(msgData, msg_0010_00104);
    }
    DestroyMsgData(msgData);
    SoundSys_ToggleGBSounds();
    FieldSys_CreateTask(data->fsys, Task_PrintRegisteredKeyItemUseMessage, env);
    return FALSE;
}

static void ItemMenuUseFunc_Gracidea(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = sub_0203FAE8(fsys, 11, ITEM_GRACIDEA);
    sub_0203C8F0(env, sub_0203CA9C);
}

static BOOL ItemFieldUseFunc_Gracidea(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_CreateGracideaWork, FALSE);
    return TRUE;
}

static struct GracideaWork *_CreateGracideaWork(FieldSystem *fsys) {
    return sub_0203FAE8(fsys, 11, ITEM_GRACIDEA);
}

static void ItemMenuUseFunc_VSRecorder(struct ItemMenuUseData *data, const struct ItemCheckUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_0203F570(fsys, fsys->savedata);
    env->atexit_TaskEnv = NULL;
    sub_0203C8F0(env, sub_0203D9B4);
}

static BOOL ItemFieldUseFunc_VSRecorder(struct ItemFieldUseData *data) {
    RegisteredItem_CreateGoToAppTask(data, (FieldApplicationWorkCtor)_VsRecorderInit, FALSE);
    return TRUE;
}

static void *_VsRecorderInit(FieldSystem *fsys) {
    ov01_021F4440(fsys);
    sub_0203F570(fsys, fsys->savedata);
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

static BOOL KeyItemIdSpawnsSubprocess(FieldSystem *fsys, u16 itemId) {
    int i;

    for (i = 0; i < NELEMS(sStayInFieldItemIds); i++) {
        if (itemId == sStayInFieldItemIds[i]) {
            return FALSE;
        }
    }

    return TRUE;
}

int UseRegisteredItemButtonInField(FieldSystem *fsys, u8 slot) {
    struct ItemFieldUseData *data;
    u16 itemId;
    u16 funcType;
    ItemFieldUseFunc fieldUseFunc;
    ItemCheckUseFunc checkUseFunc;
    BOOL result;
    u32 error;

    GF_ASSERT(slot == 1 || slot == 2);
    if (sub_02067584(fsys) == TRUE) {
         return 0;
    }
    if (ScriptState_CheckPalParkSysFlag(SavArray_Flags_get(fsys->savedata)) == TRUE) {
        return 0;
    }
    if (CheckFlag996(SavArray_Flags_get(fsys->savedata)) == TRUE) {
        return 0;
    }
    if (ov01_021F6B10(fsys) != TRUE) {
        return 0;
    }
    if (slot == 1) {
        itemId = Bag_GetRegisteredItemSlot1(Sav2_Bag_get(fsys->savedata));
    } else {
        itemId = Bag_GetRegisteredItemSlot2(Sav2_Bag_get(fsys->savedata));
    }
    if (itemId == ITEM_DOWSING_MCHN && ov01_021F6B00(fsys) == 4) {
        return 0;
    }
    funcType = GetItemAttr(itemId, ITEMATTR_FIELDUSEFUNC, 11);
    checkUseFunc = GetItemFieldUseFunc(USE_ITEM_TASK_CHECK, funcType);
    fieldUseFunc = GetItemFieldUseFunc(USE_ITEM_TASK_FIELD, funcType);
    if (fieldUseFunc == NULL) {
        return 0;
    }
    data = AllocFromHeap(11, sizeof(struct ItemFieldUseData));
    memset(data, 0, sizeof(struct ItemFieldUseData));
    data->fsys = fsys;
    data->itemId = itemId;
    ItemCheckUseData_Init(fsys, &data->dat);
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
        FreeToHeap(data);
    } else if (KeyItemIdSpawnsSubprocess(fsys, data->itemId)) {
        return 1;
    }
    return 2;
}

static void RegisteredItem_GoToPrintErrorTask(struct ItemFieldUseData *data, u32 error) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = AllocFromHeap(11, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->state = 0;
    env->strbuf = String_ctor(128, 11);
    GetItemUseErrorMessage(Sav2_PlayerData_GetProfileAddr(data->fsys->savedata), env->strbuf, data->itemId, error, 11);
    FieldSys_CreateTask(data->fsys, Task_PrintRegisteredKeyItemUseMessage, env);
}

static BOOL Task_RegisteredItem_GoToApp(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ItemFieldUseData *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        ov01_021E636C(0);
        env->state = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            env->work = env->ctor(fsys);
            if (env->no_app == FALSE) {
                env->state = 2;
            } else {
                env->state = 3;
            }
        }
        break;
    case 2:
        if (FieldSys_ApplicationIsRunning(fsys)) {
            break;
        }
        // fallthrough
    case 3:
        if (env->work != NULL) {
            FreeToHeap(env->work);
        }
        sub_020505C0(fsys);
        env->state = 4;
        break;
    case 4:
        if (sub_020505C8(fsys)) {
            MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
            ov01_021E636C(1);
            env->state = 5;
        }
        break;
    case 5:
        if (IsPaletteFadeFinished()) {
            MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
            FreeToHeap(env);
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static void RegisteredItem_CreateGoToAppTask(struct ItemFieldUseData *data, FieldApplicationWorkCtor ctor, BOOL no_app) {
    data->ctor = ctor;
    data->no_app = no_app;
    FieldSys_CreateTask(data->fsys, Task_RegisteredItem_GoToApp, data);
}
