#include "field_follow_poke.h"
#include "filesystem.h"
#include "overlay_01_022001E4.h"
#include "overlay_01_rock_smash_item.h"
#include "overlay_02.h"
#include "script.h"
#include "task.h"
#include "unk_02050660.h"
#include "unk_020689C8.h"
#include "constants/abilities.h"
#include "constants/items.h"

typedef struct {
    u16 odds;
    u16 type;
} ROCK_SMASH;

typedef struct {
    BOOL followMonKnowsHM;
    int ability;
    u16 *itemFound; // TODO: bool16
    u16 *item;
    ROCK_SMASH rockSmash;
    u32 unk14;
} RockSmashItemCheckWork;

static const u16 sRockSmashItems_Default[] = {
    ITEM_MAX_ETHER,
    ITEM_REVIVE,
    ITEM_HEART_SCALE,
    ITEM_RED_SHARD,
    ITEM_BLUE_SHARD,
    ITEM_GREEN_SHARD,
    ITEM_YELLOW_SHARD,
    ITEM_STAR_PIECE,
};

#ifdef HEARTGOLD
static const u16 sRockSmashItems_RuinsOfAlph[] = {
    ITEM_RED_SHARD,
    ITEM_YELLOW_SHARD,
    ITEM_HELIX_FOSSIL,
    ITEM_MAX_ETHER,
    ITEM_BLUE_SHARD,
    ITEM_GREEN_SHARD,
    ITEM_OLD_AMBER,
    ITEM_MAX_REVIVE,
};
#else
static const u16 sRockSmashItems_RuinsOfAlph[] = {
    ITEM_BLUE_SHARD,
    ITEM_GREEN_SHARD,
    ITEM_DOME_FOSSIL,
    ITEM_MAX_ETHER,
    ITEM_RED_SHARD,
    ITEM_YELLOW_SHARD,
    ITEM_OLD_AMBER,
    ITEM_MAX_REVIVE,
};
#endif //HEARTGOLD

#ifdef HEARTGOLD
static const u16 sRockSmashItems_CliffCave[] = {
    ITEM_MAX_ETHER,
    ITEM_PEARL,
    ITEM_BIG_PEARL,
    ITEM_RED_SHARD,
    ITEM_YELLOW_SHARD,
    ITEM_CLAW_FOSSIL,
    ITEM_CLAW_FOSSIL,
    ITEM_RARE_BONE,
};
#else
static const u16 sRockSmashItems_CliffCave[] = {
    ITEM_MAX_ETHER,
    ITEM_PEARL,
    ITEM_BIG_PEARL,
    ITEM_BLUE_SHARD,
    ITEM_GREEN_SHARD,
    ITEM_ROOT_FOSSIL,
    ITEM_ROOT_FOSSIL,
    ITEM_RARE_BONE,
};
#endif //HEARTGOLD

static BOOL Task_RockSmashItemCheck(TaskManager *taskman);
static BOOL CheckRockSmashItemDrop(FieldSystem *fsys, RockSmashItemCheckWork *a1);
static BOOL Task_GetRockSmashItem(TaskManager *taskman);
static int DrawRockSmashIdx(FieldSystem *fsys);

void FieldSys_RockSmashItemCheck(FieldSystem *fsys, int followMonKnowsHm, u16 *itemFound, u16 *item) {
    RockSmashItemCheckWork *env = AllocFromHeapAtEnd(11, sizeof(RockSmashItemCheckWork));
    env->followMonKnowsHM = followMonKnowsHm != 0;
    env->itemFound = itemFound;
    env->item = item;
    *env->itemFound = FALSE;
    *env->item = ITEM_NONE;
    TaskManager_Call(fsys->taskman, Task_RockSmashItemCheck, env);
}

static BOOL Task_RockSmashItemCheck(TaskManager *taskman) {
    int val;
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    RockSmashItemCheckWork *env = TaskManager_GetEnv(taskman);

    if (ov02_022470A0(fsys, &val)) {
        *env->itemFound = FALSE;
        *env->item = ITEM_NONE;
        FreeToHeap(env);
        sub_02050B90(fsys, taskman, val);
        return FALSE;
    }

    if (CheckRockSmashItemDrop(fsys, env)) {
        TaskManager_Jump(taskman, Task_GetRockSmashItem, env);
        return FALSE;
    }

    *env->itemFound = FALSE;
    *env->item = ITEM_NONE;
    FreeToHeap(env);
    return TRUE;
}

static BOOL CheckRockSmashItemDrop(FieldSystem *fsys, RockSmashItemCheckWork *env) {
    int odds;
    int ability;
    ROCK_SMASH data;

    ReadWholeNarcMemberByIdPair(&data, NARC_a_2_5_3, fsys->location->mapId);
    odds = data.odds;
    if (odds == 0) {
        return FALSE;
    }
    if (data.type >= NUM_ROCK_SMASH_TYPE) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    POKEMON *mon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), 0);
    if (GetMonData(mon, MON_DATA_IS_EGG, NULL) == 0) {
        ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
    } else {
        ability = NUM_ABILITIES;
    }
    env->ability = ability;

    switch (ability) {
    case ABILITY_SUCTION_CUPS:
        odds += 5;
        break;
    case ABILITY_MAGNET_PULL:
        odds += 5;
        break;
    case ABILITY_KEEN_EYE:
        odds += 5;
        break;
    }
    if (env->followMonKnowsHM) {
        odds += 5;
    }
    if (odds > 100) {
        odds = 100;
    }

    if (LCRandom() % 100 < odds) {
        env->rockSmash = data;
        return TRUE;
    }
    return FALSE;
}

static BOOL Task_GetRockSmashItem(TaskManager *taskman) {
    LocalMapObject *obj;

    int *state_p = TaskManager_GetStatePtr(taskman);
    RockSmashItemCheckWork *env = TaskManager_GetEnv(taskman);
    FieldSystem *fsys = TaskManager_GetSys(taskman);

    switch (*state_p) {
    case 0:
        if (env->followMonKnowsHM) {
            obj = FollowingPokemon_GetMapObject(fsys);
        } else {
            obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        }
        env->unk14 = ov01_02200540(obj, 0, 1);
        *state_p += 1;
        break;
    case 1:
        if (ov01_022003F4(env->unk14)) {
            sub_02068B48(env->unk14);
            *state_p += 1;
        }
        break;
    case 2:
        u32 idx = DrawRockSmashIdx(fsys);
        if ((env->ability == ABILITY_SERENE_GRACE || env->ability == ABILITY_SUPER_LUCK) && idx < 7) {
            idx = (u8)(idx + 1);
        }
        GF_ASSERT(idx < 8);

        u16 item;
        switch (env->rockSmash.type) {
        case ROCK_SMASH_TYPE_DEFAULT:
            item = sRockSmashItems_Default[idx];
            break;
        case ROCK_SMASH_TYPE_RUINS_OF_ALPH:
            item = sRockSmashItems_RuinsOfAlph[idx];
            break;
        case ROCK_SMASH_TYPE_CLIFF_CAVE:
            item = sRockSmashItems_CliffCave[idx];
            break;
        default:
            GF_ASSERT(FALSE);
            *env->itemFound = FALSE;
            *env->item = ITEM_NONE;
            FreeToHeap(env);
            return TRUE;
        }
        *env->itemFound = TRUE;
        *env->item = item;
        FreeToHeap(env);
        return TRUE;
    }
    return FALSE;
}

static int DrawRockSmashIdx(FieldSystem *fsys) {
    u8 rand = LCRandom() % 100;
    if (rand < 25) {
        return 0;
    }
    if (rand < 45) {
        return 1;
    }
    if (rand < 55) {
        return 2;
    }
    if (rand < 65) {
        return 3;
    }
    if (rand < 75) {
        return 4;
    }
    if (rand < 85) {
        return 5;
    }
    if (rand < 95) {
        return 6;
    }
    return 7;
}
