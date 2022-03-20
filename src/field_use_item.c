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
#include "unk_02054E00.h"
#include "unk_0205B6E8.h"
#include "map_header.h"
#include "constants/items.h"
#include "constants/sndseq.h"

struct ItemUseFuncDat {
    ItemMenuUseFunc menu;
    ItemFieldUseFunc field;
    ItemCheckUseFunc check;
};

BOOL sub_02064AD0(TaskManager *taskManager);
void ItemMenuUseFunc_HealingItem(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
u32 ItemCheckUseFunc_Dummy(const struct ItemUseData *dat);
void ItemMenuUseFunc_Bicycle(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL Task_MountOrDismountBicycle(TaskManager *taskManager);

u32 ItemCheckUseFunc_Berry(const struct ItemUseData *dat);
u32 ItemCheckUseFunc_Bicycle(const struct ItemUseData *dat);
u32 ItemCheckUseFunc_EscapeRope(const struct ItemUseData *dat);
u32 ItemCheckUseFunc_FishingRod(const struct ItemUseData *dat);

BOOL ItemFieldUseFunc_ApricornBox(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_BerryPots(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_Bicycle(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_DowsingMchn(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_GbSounds(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_Generic(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_GoodRod(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_Gracidea(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_OldRod(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_PalPad(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_SuperRod(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_UnownReport(struct ItemUseTaskData *data);
BOOL ItemFieldUseFunc_VSRecorder(struct ItemUseTaskData *data);

void ItemMenuUseFunc_ApricornBox(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Berry(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_BerryPots(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_DowsingMchn(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_EscapeRope(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_EvoStone(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_GoodRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Gracidea(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Honey(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_Mail(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_OldRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_PalPad(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_SuperRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_TMHM(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_UnownReport(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
void ItemMenuUseFunc_VSRecorder(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);

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

    sub_0203DBF8(fsys, &dummy);
    dat->playerAvatar = fsys->playerAvatar;
}

struct AlphItemUseData *sub_02064A68(int a0, u16 a1, u16 a2, u16 a3, u16 a4) {
    struct AlphItemUseData *ret = AllocFromHeap((HeapID)32, sizeof(struct AlphItemUseData));
    ret->scriptNo = a0;
    ret->unk4 = a1;
    ret->unk6 = a2;
    ret->unk8 = a3;
    ret->unkA = a4;

    return ret;
}

void sub_02064A8C(struct ItemUseTaskData2 *dat, int unused, int a2) {
#pragma unused(unused)
    FieldSystem *fsys = TaskManager_GetSys(dat->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(dat->taskManager);
    sub_020505C0(fsys);
    env->unk_0354 = sub_02064AD0;
    env->unk_0380 = sub_02064A68(a2, dat->itemId, 0, 0, 0);
    env->unk_0026 = 12;
}

BOOL sub_02064AD0(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct AlphItemUseData *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    LocalMapObject *sp0;

    switch (*state_p) {
    case 0:
        sub_0203DBF8(fsys, &sp0);
        QueueScript(taskManager, env->scriptNo, sp0, NULL);
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8000) = env->unk4;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8001) = env->unk6;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8002) = env->unk8;
        *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8003) = env->unkA;
        (*state_p)++;
        break;
    case 1:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void ItemMenuUseFunc_HealingItem(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
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
    env->unk_0380 = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}

u32 ItemCheckUseFunc_Dummy(const struct ItemUseData *data) {
    return ITEMUSEERROR_OAKSWORDS;
}

void ItemMenuUseFunc_Bicycle(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2) {
    FieldSystem *fsys = TaskManager_GetSys(data->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(data->taskManager);
    sub_020505C0(fsys);
    env->unk_0354 = Task_MountOrDismountBicycle;
    env->unk_0380 = NULL;
    env->unk_0026 = 12;
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
    env->unk_0380 = usedat;
    sub_0203C8F0(env, sub_0203CA9C);
}
