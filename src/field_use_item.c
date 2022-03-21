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
#include "overlay_01.h"
#include "overlay_02.h"
#include "unk_02054E00.h"
#include "unk_0205B6E8.h"
#include "unk_0203E348.h"
#include "unk_0200E398.h"
#include "text.h"
#include "field_alph_checks.h"
#include "map_header.h"
#include "system.h"
#include "constants/items.h"
#include "constants/sndseq.h"
#include "fielddata/script/scr_seq/event_D24R0202.h"
#include "fielddata/script/scr_seq/event_D24R0206.h"

struct ItemUseFuncDat {
    ItemMenuUseFunc menu;
    ItemFieldUseFunc field;
    ItemCheckUseFunc check;
};

typedef void *(*FieldApplicationWorkCtor)(FieldSystem *fsys);

BOOL Task_UseItemInAlphChamber(TaskManager *taskManager);
void ItemMenuUseFunc_HealingItem(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
u32 ItemCheckUseFunc_Dummy(const struct ItemUseData *dat);
void ItemMenuUseFunc_Bicycle(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL Task_MountOrDismountBicycle(TaskManager *taskManager);
BOOL ItemFieldUseFunc_Bicycle(struct ItemUseTaskData *data);
u32 ItemCheckUseFunc_Bicycle(const struct ItemUseData *dat);
void ItemMenuUseFunc_Berry(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_TMHM(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Mail(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
u32 ItemCheckUseFunc_Berry(const struct ItemUseData *dat);
void ItemMenuUseFunc_PalPad(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemFieldUseFunc_PalPad(struct ItemUseTaskData *data);
struct PalPadWork *sub_02064F70(FieldSystem *fsys);
void ItemMenuUseFunc_Honey(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_OldRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemFieldUseFunc_OldRod(struct ItemUseTaskData *data);
void ItemMenuUseFunc_GoodRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemFieldUseFunc_GoodRod(struct ItemUseTaskData *data);
void ItemMenuUseFunc_SuperRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemFieldUseFunc_SuperRod(struct ItemUseTaskData *data);
u32 ItemCheckUseFunc_FishingRod(const struct ItemUseData *dat);
BOOL ItemFieldUseFunc_Generic(struct ItemUseTaskData *data);
BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager);
void ItemMenuUseFunc_EvoStone(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_EscapeRope(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
u32 ItemCheckUseFunc_EscapeRope(const struct ItemUseData *dat);
BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager);
void ItemMenuUseFunc_ApricornBox(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemFieldUseFunc_ApricornBox(struct ItemUseTaskData *data);
struct ApricornBoxWork *sub_0206541C(FieldSystem *data);

BOOL ItemFieldUseFunc_BerryPots(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_DowsingMchn(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_GbSounds(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_Gracidea(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_UnownReport(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_VSRecorder(struct ItemUseTaskData *data);

void ItemMenuUseFunc_BerryPots(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_DowsingMchn(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Gracidea(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_UnownReport(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_VSRecorder(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);

void sub_020658B8(struct ItemUseTaskData *data, FieldApplicationWorkCtor ctor, u8 a2);

u16 _0210FAD8[] = {
    ITEM_BICYCLE,
    ITEM_OLD_ROD,
    ITEM_GOOD_ROD,
    ITEM_SUPER_ROD,
    ITEM_POINT_CARD,
    ITEM_SEAL_CASE,
    ITEM_FASHION_CASE,
    ITEM_COIN_CASE,
};

const struct ItemUseFuncDat _020FE264[] = {
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
        return _020FE264[itemType].menu;
    } else if (funcType == USE_ITEM_TASK_FIELD) {
        return _020FE264[itemType].field;
    } else {
        return _020FE264[itemType].check;
    }
}

void sub_020649B8(FieldSystem *fsys, struct ItemUseData *dat) {
    int x, y;
    LocalMapObject *dummy;

    dat->fsys = fsys;
    dat->mapId = fsys->location->mapId;
    dat->haveFollower = ScriptState_CheckHaveFollower(SavArray_Flags_get(fsys->savedata));
    dat->flag969set = CheckFlag969(SavArray_Flags_get(fsys->savedata));
    dat->unk04 = PlayerAvatar_IsOnBike(fsys->playerAvatar);

    x = GetPlayerXCoord(fsys->playerAvatar);
    y = GetPlayerYCoord(fsys->playerAvatar);
    dat->standingTile = sub_02054918(fsys, x, y);

    switch (PlayerAvatar_GetFacingDirection(fsys->playerAvatar)) {
    case DIR_SOUTH:
        y--;
        break;
    case DIR_NORTH:
        y++;
        break;
    case DIR_EAST:
        x++;
        break;
    case DIR_WEST:
        x--;
        break;
    }
    dat->facingTile = sub_02054918(fsys, x, y);

    Fsys_GetFacingObject(fsys, &dummy);
    dat->playerAvatar = fsys->playerAvatar;
}

struct AlphItemUseData *CreateAlphItemUseWork(int scriptNo, u16 var_8000, u16 var_8001, u16 var_8002, u16 var_8003) {
    struct AlphItemUseData *ret = AllocFromHeap((HeapID)32, sizeof(struct AlphItemUseData));
    ret->scriptNo = scriptNo;
    ret->var_8000 = var_8000;
    ret->var_8001 = var_8001;
    ret->var_8002 = var_8002;
    ret->var_8003 = var_8003;

    return ret;
}

void ExitMenuAndJumpToAlphChamberReaction(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2, int scriptNo) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_UseItemInAlphChamber;
    env->atexit_TaskEnv = CreateAlphItemUseWork(scriptNo, data->itemId, 0, 0, 0);
    env->state = 12;
}

BOOL Task_UseItemInAlphChamber(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct AlphItemUseData *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    LocalMapObject *sp0;

    switch (*state_p) {
    case 0:
        Fsys_GetFacingObject(fsys, &sp0);
        QueueScript(taskManager, env->scriptNo, sp0, NULL);
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8000) = env->var_8000;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8001) = env->var_8001;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8002) = env->var_8002;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8003) = env->var_8003;
        (*state_p)++;
        break;
    case 1:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void ItemMenuUseFunc_HealingItem(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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
    usedat->unk1C = fsys;
    usedat->unk28 = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

u32 ItemCheckUseFunc_Dummy(const struct ItemUseData *data) {
    return ITEMUSEERROR_OAKSWORDS;
}

void ItemMenuUseFunc_Bicycle(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_MountOrDismountBicycle;
    env->atexit_TaskEnv = NULL;
    env->state = 12;
}

BOOL ItemFieldUseFunc_Bicycle(struct ItemUseTaskData *data) {
    FieldSys_CreateTask(data->fsys, Task_MountOrDismountBicycle, NULL);
    data->fsys->unkD2_7 = 1;
    return FALSE;
}

BOOL Task_MountOrDismountBicycle(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    int r6;

    switch (*state_p) {
    case 0:
        if (FollowingPokemon_IsActive(fsys)) {
            if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(fsys))) {
                if (PlayerAvatar_IsOnBike(fsys->playerAvatar) == TRUE) {
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
        if (PlayerAvatar_IsOnBike(fsys->playerAvatar) == TRUE) {
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fsys->playerAvatar));
            ov01_021F1AFC(fsys->playerAvatar, 1);
            ov01_021F1B04(fsys->playerAvatar);
            sub_02054F28(fsys, 0);
            if (SndRadio_GetSeqNo() == 0) {
                sub_02054FDC(fsys, sub_02054F60(fsys, fsys->location->mapId), 1);
            }
            ov01_02205790(fsys, PlayerAvatar_GetFacingDirection(fsys->playerAvatar));
            if (FollowingPokemon_IsActive(fsys)) {
                sub_02069E84(FollowingPokemon_GetMapObject(fsys), 1);
                sub_02069DC8(FollowingPokemon_GetMapObject(fsys), TRUE);
            }
        } else {
            if (SndRadio_GetSeqNo() == 0) {
                sub_02054F28(fsys, SEQ_GS_BICYCLE);
                sub_02054FDC(fsys, SEQ_GS_BICYCLE, 1);
            }
            MapObject_UnpauseMovement(PlayerAvatar_GetMapObject(fsys->playerAvatar));
            ov01_021F1AFC(fsys->playerAvatar, 2);
            ov01_021F1B04(fsys->playerAvatar);
            ov01_02205D68(fsys);
            if (FollowingPokemon_IsActive(fsys)) {
                sub_02069E84(FollowingPokemon_GetMapObject(fsys), FALSE);
            }
        }
        (*state_p)++;
        break;
    case 2:
        MapObjectMan_UnpauseAllMovement(fsys->unk3C);
        return TRUE;
    }

    return FALSE;
}

u32 ItemCheckUseFunc_Bicycle(const struct ItemUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->flag969set == TRUE) {
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
    if (data->unk04 == 2) {
        return ITEMUSEERROR_OAKSWORDS;
    }
    return ITEMUSEERROR_OKAY;
}

void ItemMenuUseFunc_TMHM(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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
    usedat->unk1C = fsys;
    usedat->unk28 = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->unk2A = TMHMGetMove(data->itemId);
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

void ItemMenuUseFunc_Mail(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
#pragma unused(dat2)
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    struct UseMailWork *mailWork = CreateUseMailWork(fsys, 3, ItemToMailId(data->itemId), 11);
    env->unk_0384 = sub_0203D818(data->itemId, 3, 0);
    env->atexit_TaskEnv = mailWork;
    sub_0203C8F0(env, sub_0203D830);
}

u32 ItemCheckUseFunc_Berry(const struct ItemUseData *data) {
    return ITEMUSEERROR_OKAY; // It is always okay to use a Berry
}

void ItemMenuUseFunc_Berry(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    ItemMenuUseFunc_HealingItem(data, dat2);
}

BOOL sub_02064F24(const struct ItemUseData *data) {
    return FALSE;
}

void ItemMenuUseFunc_PalPad(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreatePalPadWork(fsys, fsys->savedata, 11);
    sub_0203C8F0(env, sub_0203D718);
}

BOOL ItemFieldUseFunc_PalPad(struct ItemUseTaskData *data) {
    sub_020658B8(data, (FieldApplicationWorkCtor)sub_02064F70, 0);
    return TRUE;
}

struct PalPadWork *sub_02064F70(FieldSystem *fsys) {
    return CreatePalPadWork(fsys, fsys->savedata, 11);
}

void ItemMenuUseFunc_Honey(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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

void ItemMenuUseFunc_OldRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = FishingRodTaskEnv(fsys, 11, 0);
    env->state = 12;
}

BOOL ItemFieldUseFunc_OldRod(struct ItemUseTaskData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, FishingRodTaskEnv(data->fsys, 4, 0));
    return FALSE;
}

void ItemMenuUseFunc_GoodRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = FishingRodTaskEnv(fsys, 11, 1);
    env->state = 12;
}

BOOL ItemFieldUseFunc_GoodRod(struct ItemUseTaskData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, FishingRodTaskEnv(data->fsys, 4, 1));
    return FALSE;
}

void ItemMenuUseFunc_SuperRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->atexit_TaskFunc = Task_OverworldFish;
    env->atexit_TaskEnv = FishingRodTaskEnv(fsys, 11, 2);
    env->state = 12;
}

BOOL ItemFieldUseFunc_SuperRod(struct ItemUseTaskData *data) {
    FieldSys_CreateTask(data->fsys, Task_OverworldFish, FishingRodTaskEnv(data->fsys, 4, 2));
    return FALSE;
}

u32 ItemCheckUseFunc_FishingRod(const struct ItemUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->flag969set == TRUE) {
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

BOOL ItemFieldUseFunc_Generic(struct ItemUseTaskData *data) {
    struct RegisteredKeyItemUseMessagePrintTaskData *env = AllocFromHeap(11, sizeof(struct RegisteredKeyItemUseMessagePrintTaskData));
    env->unk16 = 0;
    env->unk10 = String_ctor(128, 11);
    TryFormatRegisteredKeyItemUseMessage(data->fsys->savedata, env->unk10, data->itemId, 11);
    FieldSys_CreateTask(data->fsys, Task_PrintRegisteredKeyItemUseMessage, env);
    return FALSE;
}

BOOL Task_PrintRegisteredKeyItemUseMessage(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct RegisteredKeyItemUseMessagePrintTaskData *env = TaskManager_GetEnv(taskManager);
    OPTIONS *options;

    switch (env->unk16) {
    case 0:
        fsys->unkD2_6 = TRUE;
        MapObjectMan_PauseAllMovement(fsys->unk3C);
        sub_0205B514(fsys->bg_config, &env->unk0, 3);
        options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
        sub_0205B564(&env->unk0, options);
        env->unk14 = sub_0205B5B4(&env->unk0, env->unk10, options, TRUE);
        env->unk16++;
        break;
    case 1:
        if (sub_0205B624(env->unk14) == TRUE) {
            if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) || (gSystem.simulatedInputs & PAD_BUTTON_A)) {
                fsys->unkD2_6 = FALSE;
                ClearFrameAndWindow2(&env->unk0, 0);
                env->unk16++;
            }
        }
        break;
    case 2:
        MapObjectMan_UnpauseAllMovement(fsys->unk3C);
        RemoveWindow(&env->unk0);
        String_dtor(env->unk10);
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void ItemMenuUseFunc_EvoStone(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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
    usedat->unk28 = data->itemId;
    usedat->unk26 = data->unk6;
    usedat->unk1C = fsys;
    usedat->unk20 = &fsys->unk_10C;
    Fsys_LaunchApplication(fsys, &_0210159C, usedat);
    env->atexit_TaskEnv = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

void ItemMenuUseFunc_EscapeRope(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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

u32 ItemCheckUseFunc_EscapeRope(const struct ItemUseData *data) {
    if (data->haveFollower == TRUE) {
        return ITEMUSEERROR_NOFOLLOWER;
    }
    if (data->flag969set == TRUE) {
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

BOOL Task_JumpToFieldEscapeRope(TaskManager *taskManager) {
    TaskManager_Jump(taskManager, Task_FieldEscapeRope, CreateFieldEscapeRopeTaskEnv(TaskManager_GetSys(taskManager), 11));
    return FALSE;
}

void ItemMenuUseFunc_ApricornBox(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    env->atexit_TaskEnv = CreateApricornBoxWork(fsys, 1);
    sub_0203C8F0(env, sub_0203D718);
}

BOOL ItemFieldUseFunc_ApricornBox(struct ItemUseTaskData *data) {
    sub_020658B8(data, (FieldApplicationWorkCtor)sub_0206541C, 0);
    return TRUE;
}

struct ApricornBoxWork *sub_0206541C(FieldSystem *fsys) {
    return CreateApricornBoxWork(fsys, 1);
}
