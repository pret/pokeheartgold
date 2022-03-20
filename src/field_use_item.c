#include "task.h"
#include "field_use_item.h"
#include "sys_flags.h"
#include "unk_02054648.h"
#include "unk_0203DB6C.h"
#include "constants/items.h"

struct ItemUseFuncDat {
    ItemMenuUseFunc menu;
    ItemFieldUseFunc field;
    ItemCheckUseFunc check;
};

BOOL sub_02064AD0(TaskManager *taskManager);

BOOL ItemCheckUseFunc_Berry(const struct ItemUseData *dat);
BOOL ItemCheckUseFunc_Bicycle(const struct ItemUseData *dat);
BOOL ItemCheckUseFunc_Dummy(const struct ItemUseData *dat);
BOOL ItemCheckUseFunc_EscapeRope(const struct ItemUseData *dat);
BOOL ItemCheckUseFunc_FishingRod(const struct ItemUseData *dat);

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

BOOL ItemMenuUseFunc_ApricornBox(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_Berry(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_BerryPots(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_Bicycle(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_DowsingMchn(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_EscapeRope(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_EvoStone(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_GoodRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_Gracidea(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_HealingItem(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_Honey(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_Mail(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_OldRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_PalPad(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_SuperRod(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_TMHM(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_UnownReport(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);
BOOL ItemMenuUseFunc_VSRecorder(struct ItemUseTaskData2 *data, const struct ItemUseData *dat2);

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
    dat->unk04 = sub_0205C700(fsys->playerAvatar);

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
    struct UnkStruct_BagViewApplicationMaybe *env = TaskManager_GetEnv(dat->taskManager);
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
