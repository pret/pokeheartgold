#include "global.h"
#include "assert.h"
#include "save_vars_flags.h"
#include "field_map_object.h"
#include "field_player_avatar.h"
#include "field_system.h"
#include "field_warp_tasks.h"
#include "fieldmap.h"
#include "gf_gfx_loader.h"
#include "gymmick.h"
#include "heap.h"
#include "metatile_behavior.h"
#include "msgdata.h"
#include "npc_trade.h"
#include "player_data.h"
#include "pm_string.h"
#include "pokemon.h"
#include "save_local_field_data.h"
#include "save_misc_data.h"
#include "save_trainer_house.h"
#include "scrcmd.h"
#include "script.h"
#include "sys_flags.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_0203E348.h"
#include "unk_02054648.h"
#include "unk_0205FD20.h"
#include "unk_02062108.h"
#include "unk_0206D494.h"
#include "constants/npc_trade.h"
#include "msgdata/msg.naix"

typedef struct UnkStruct_0206D494 {
    LocalMapObject *unk00;
    LocalMapObject *unk04;
    u8 unk08;
    u8 unk09;
} UnkStruct_0206D494;

typedef struct UnkStruct_0206DB94 {
    u8 filler00[4];
    Pokemon *unk04;
    UnkStruct_0203EDDC *unk08;
} UnkStruct_0206DB94;

static BOOL sub_0206D4E4(TaskManager *taskManager);
static LocalMapObject *sub_0206D590(LocalMapObject *object);
static LocalMapObject *sub_0206D614(MapObjectManager *a0, u32 x, u32 a2, u32 y);
static u32 sub_0206D688(UnkStruct_0206D494 *a0);
static u32 sub_0206D7B8(LocalMapObject *object, u32 x, u32 height, u32 y);
static u32 sub_0206D81C(u32 direction);
static void sub_0206D850(PlayerAvatar *playerAvatar);
static BOOL MonIsInGameTradePokeInternal(Pokemon *mon, NPCTrade *trade, NpcTradeNum tradeNum);
static BOOL Task_BugContest_PromptSwapPokemon(TaskManager *taskManager);

BOOL sub_0206D494(FieldSystem *fieldSystem) {
    LocalMapObject *unk1 = sub_0205C600(fieldSystem->mapObjectManager);
    LocalMapObject *unk2 = sub_0206D590(unk1);
    if (unk2) {
        UnkStruct_0206D494 *unkStruct = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_0206D494));
        unkStruct->unk00 = unk2;
        unkStruct->unk04 = NULL;
        unkStruct->unk08 = MapObject_GetFacingDirection(unk1);
        unkStruct->unk09 = 0;
        FieldSystem_CreateTask(fieldSystem, sub_0206D4E4, unkStruct);
        PlaySE(SEQ_SE_GS_HYOUKAI_HIT);
        return TRUE;
    }
    else {
        return FALSE;
    }
}

static BOOL sub_0206D4E4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0206D494 *unkStruct = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    switch (*state) {
        case 0:
            if (MapObject_IsMovementPaused(sub_0205C600(fieldSystem->mapObjectManager))) {
                PlaySE(SEQ_SE_GS_HYOUKAI_SUBERU);
                (*state)++;
            }
            break;
        case 1:
            if (sub_0206D688(unkStruct)) {
                StopSE(SEQ_SE_GS_HYOUKAI_SUBERU, 0);
                (*state)++;
            }
            break;
        case 2:
            if (MapObject_IsMovementPaused(unkStruct->unk00)) {
                if (unkStruct->unk04 == NULL) {
                    (*state)++;
                } else if (MapObject_IsMovementPaused(unkStruct->unk04)) {
                    (*state)++;
                }
            }
            break;
        case 3:
            sub_0206D850(fieldSystem->playerAvatar);
            FreeToHeap(unkStruct);
            return TRUE;
    }
    return FALSE;
}

static LocalMapObject *sub_0206D590(LocalMapObject *object) {
    MapObjectManager *manager = MapObject_GetManager(object);
    u32 direction = MapObject_GetFacingDirection(object);
    u32 x = MapObject_GetCurrentX(object);
    u32 dx = GetDeltaXByFacingDirection(direction);
    u32 height = MapObject_GetCurrentHeight(object);
    u32 y = MapObject_GetCurrentY(object);
    u32 dy = GetDeltaYByFacingDirection(direction);
    LocalMapObject *obj = sub_0206D614(manager, x + dx, height, y + dy);
    if (obj) {
        if (MapObject_GetGfxID(obj) != SPRITE_ICE) {
            return NULL;
        }
        u32 dir = MapObject_GetFacingDirection(obj);
        if (dir != DIR_SOUTH) {
            GF_ASSERT(dir == DIR_NORTH);
            return NULL;
        }
        return obj;
    }
    return NULL;
}

static LocalMapObject *sub_0206D614(MapObjectManager *manager, u32 x, u32 a2, u32 y) {
    LocalMapObject *object = MapObjectManager_GetObjects(manager);
    u32 count = MapObjectManager_GetCount(manager);
    do {
        if (MapObject_GetFlagsMask(object, MAPOBJECTFLAG_ACTIVE)
                && !MapObject_GetFlagsMask(object, MAPOBJECTFLAG_UNK18)) {
            u32 curX = MapObject_GetCurrentX(object);
            u32 curY = MapObject_GetCurrentY(object);
            if (curX == x && curY == y) {
                s32 height = MapObject_GetCurrentHeight(object) - a2;
                if (height < 0) {
                    height = -height;
                }
                if (height < 2) {
                    return object;
                }
            }
        }
        sub_0205F1D0(&object);
    } while (--count);
    return NULL;
}

static u32 sub_0206D688(UnkStruct_0206D494 *a0) {
    switch (a0->unk09) {
        case 0:
            if (MapObject_IsMovementPaused(a0->unk00)) {
                u32 x = MapObject_GetCurrentX(a0->unk00);
                u32 dx = GetDeltaXByFacingDirection(a0->unk08);
                u32 height = MapObject_GetCurrentHeight(a0->unk00);
                u32 y = MapObject_GetCurrentY(a0->unk00);
                u32 dy = GetDeltaYByFacingDirection(a0->unk08);
                u32 flags = sub_0206D7B8(a0->unk00, x + dx, height, y + dy);
                if (flags & 2) {
                    MapObjectManager *manager = MapObject_GetManager(a0->unk00);
                    LocalMapObject *object = sub_0206D614(manager, x + dx, height, y + dy);
                    if (!object) {
                        GF_ASSERT(FALSE);
                        return TRUE;
                    }
                    if (MapObject_GetGfxID(object) == SPRITE_ICE) {
                        a0->unk04 = object;
                        MapObject_SetHeldMovement(a0->unk00, MOVEMENT_UNK_72);
                        a0->unk09 = 2;
                    } else {
                        a0->unk04 = NULL;
                        MapObject_SetHeldMovement(a0->unk00, MOVEMENT_UNK_72);
                        a0->unk09 = 2;
                    }
                } else {
                    if (flags & 1 || flags & 4) {
                        return TRUE;
                    }
                    MapObject_SetHeldMovement(a0->unk00, MOVEMENT_UNK_71);
                    a0->unk09 = 1;
                }
            }
            break;
        case 1:
            if (MapObject_IsMovementPaused(a0->unk00)) {
                u32 movement = sub_0206D81C(a0->unk08);
                if (movement != MOVEMENT_NONE) {
                    MapObject_SetHeldMovement(a0->unk00, movement);
                }
                else {
                    GF_ASSERT(FALSE);
                    return TRUE;
                }
                a0->unk09 = 0;
            }
            break;
        case 2:
            if (MapObject_IsMovementPaused(a0->unk00)) {
                PlaySE(SEQ_SE_GS_HYOUKAI_KETUGOU);
                if (a0->unk04) {
                    MapObject_SetHeldMovement(a0->unk04, MOVEMENT_FACE_UP);
                }
                MapObject_SetHeldMovement(a0->unk00, MOVEMENT_FACE_UP);
                return TRUE;
            }
            break;
    }
    return FALSE;
}

static u32 sub_0206D7B8(LocalMapObject *object, u32 x, u32 height, u32 y) {
    u32 unk;
    VecFx32 position;
    MapObject_GetPositionVec(object, &position);
    u32 flags = 0;
    if (sub_020549F4(MapObject_GetFieldSysPtr(object), &position, x, y, &unk) == 1) {
        flags |= 1;
    }
    u8 behavior = GetMetatileBehaviorAt(MapObject_GetFieldSysPtr(object), x, y);
    if (sub_0205B828(behavior) == 0) {
        flags |= 4;
    }
    if (sub_02060BFC(object, x, height, y) == 1) {
        flags |= 2;
    }
    return flags;
}

static u32 sub_0206D81C(u32 direction) {
    u32 movement = MOVEMENT_NONE;
    switch (direction) {
        case DIR_NORTH:
            movement = MOVEMENT_STEP_UP;
            break;
        case DIR_SOUTH:
            movement = MOVEMENT_STEP_DOWN;
            break;
        case DIR_WEST:
            movement = MOVEMENT_STEP_LEFT;
            break;
        case DIR_EAST:
            movement = MOVEMENT_STEP_RIGHT;
            break;
        default:
            GF_ASSERT(FALSE);
    }
    return movement;
}

static void sub_0206D850(PlayerAvatar *playerAvatar) {
    if (sub_0205CA38(playerAvatar) == TRUE) {
        MapObject_ClearFlagsBits(PlayerAvatar_GetMapObject(playerAvatar), MAPOBJECTFLAG_UNK7 | MAPOBJECTFLAG_UNK8);
        if (sub_0205CB2C(playerAvatar) == 0) {
            sub_0205C74C(playerAvatar);
        }
        sub_0205CA20(playerAvatar, 0);
        sub_0205CB14(playerAvatar, 0);
        sub_0205CAD0(playerAvatar, 0);
    }
    return;
}

BOOL MonIsInGameTradePoke(Pokemon *mon, NpcTradeNum tradeNum) {
    NPCTrade *trade = GfGfxLoader_LoadFromNarc(NARC_a_1_1_2, tradeNum, FALSE, HEAP_ID_FIELD, TRUE);
    BOOL result = MonIsInGameTradePokeInternal(mon, trade, tradeNum);
    FreeToHeap(trade);
    return result != FALSE;
}

BOOL MonIsFromTogepiEgg(Pokemon *mon, SaveData *saveData) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(saveData);
    SAVE_MISC_DATA *misc = Save_Misc_Get(saveData);
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    if (!(species == SPECIES_TOGEPI
            || species == SPECIES_TOGETIC
            || species == SPECIES_TOGEKISS)) {
        return FALSE;
    }
    // For some reason, the result of calls to GetMonData must be assigned
    // to explicit variables before being compared for the function to match,
    // even though the values are never used again afterwards. Also, the same
    // variables are used for different calls to GetMonData.
    u32 word = GetMonData(mon, MON_DATA_OTID, NULL);
    if (word != PlayerProfile_GetTrainerID(profile)) {
        return FALSE;
    }
    u8 byte = GetMonData(mon, MON_DATA_MET_GENDER, NULL);
    if (byte != PlayerProfile_GetTrainerGender(profile)) {
        return FALSE;
    }
    byte = GetMonData(mon, MON_DATA_GAME_LANGUAGE, NULL);
    if (byte != gGameLanguage) {
        return FALSE;
    }
    byte = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);
    if (byte != gGameVersion) {
        return FALSE;
    }
    SaveMisc_GetTogepiPersonalityGender(misc, &word, &byte);
    if (word != GetMonData(mon, MON_DATA_PERSONALITY, NULL)) {
        return FALSE;
    }
    if (byte != GetMonData(mon, MON_DATA_GENDER, NULL)) {
        return FALSE;
    }
    return TRUE;
}

static BOOL MonIsInGameTradePokeInternal(Pokemon *mon, NPCTrade *trade, NpcTradeNum tradeNum) {
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    // The game calls this function only for Kenya the Spearow from the
    // Route 35-Goldenrod City Gate, and Shuckie the Shuckle from Cianwood City,
    // thus possible evolutions from other in game trades are not considered here.
    if (tradeNum == NPC_TRADE_KENYA_SPEAROW) {
        if (!(species == SPECIES_SPEAROW || species == SPECIES_FEAROW)) {
            return FALSE;
        }
    }
    // no need to check for Shuckle here as it cannot evolve
    else if (species != trade->give_species) {
        return FALSE;
    }
    u32 otId = GetMonData(mon, MON_DATA_OTID, NULL);
    if (otId != trade->otId) {
        return FALSE;
    }
    u32 pid = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    if (pid != trade->pid) {
        return FALSE;
    }
    u8 gender = GetMonData(mon, MON_DATA_MET_GENDER, NULL);
    if (gender != trade->gender) {
        return FALSE;
    }
    u8 language = GetMonData(mon, MON_DATA_GAME_LANGUAGE, NULL);
    if (language != trade->language) {
        return FALSE;
    }
    u8 version = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);
    if (version != gGameVersion) {
        return FALSE;
    }
    MsgData *messageData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0200_bin, HEAP_ID_FIELD);
    String *monNickname = String_New(12, HEAP_ID_FIELD);
    GetMonData(mon, MON_DATA_NICKNAME_3, monNickname);
    String *tradeNickname = NewString_ReadMsgData(messageData, tradeNum);
    BOOL differentNickname = String_Compare(monNickname, tradeNickname);
    String_Delete(tradeNickname);
    String_Delete(monNickname);
    if (differentNickname) {
        DestroyMsgData(messageData);
        return FALSE;
    }
    String *monOtName = String_New(8, HEAP_ID_FIELD);
    GetMonData(mon, MON_DATA_OT_NAME_2, monOtName);
    String *tradeOtName = NewString_ReadMsgData(messageData, NPC_TRADE_OT_NUM(tradeNum));
    BOOL differentOtName = String_Compare(monOtName, tradeOtName);
    String_Delete(tradeOtName);
    String_Delete(monOtName);
    if (differentOtName) {
        DestroyMsgData(messageData);
        return FALSE;
    }
    DestroyMsgData(messageData);
    return TRUE;
}

BugContest *FieldSystem_BugContest_Get(FieldSystem *fieldSystem) {
    return fieldSystem->bugContest;
}

u16 *BugContest_GetSportBallsAddr(BugContest *contest) {
    return &(contest->sport_balls);
}

void FieldSystem_IncrementBugContestTimer(FieldSystem *fieldSystem, int duration) {
    BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
    if (contest && CheckFlag996(Save_VarsFlags_Get(fieldSystem->saveData))) {
        contest->elapsed_time += duration;
    }
}

void BugContest_WarpToJudging(TaskManager *taskManager, FieldSystem *fieldSystem) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    Location warp;
    warp.mapId = MAP_D22R0101; // national park
    warp.warpId = -1;
    warp.x = 46;
    warp.y = 50;
    warp.direction = 0;
    LocalFieldData_SetDynamicWarp(localFieldData, &warp);
    sub_020537A8(taskManager, LocalFieldData_GetDynamicWarp(localFieldData));
}

void BugContest_PromptSwapPokemon(TaskManager *taskManager, Pokemon *mon) {
    UnkStruct_0206DB94 *unkStruct = AllocFromHeapAtEnd(HEAP_ID_3, sizeof(UnkStruct_0206DB94));
    MI_CpuFill8(unkStruct, 0, sizeof(UnkStruct_0206DB94));
    unkStruct->unk04 = mon;
    TaskManager_Call(taskManager, Task_BugContest_PromptSwapPokemon, unkStruct);
}

static BOOL Task_BugContest_PromptSwapPokemon(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0206DB94 *unkStruct = TaskManager_GetEnvironment(taskManager);
    BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    switch (*state) {
        case 0:
            u32 noPokemonCaught = contest->caught_poke == SPECIES_NONE;
            unkStruct->unk08 = sub_0203EDDC(fieldSystem, unkStruct->unk04, contest->mon, noPokemonCaught);
            (*state)++;
            break;
        case 1:
            if (FieldSystem_ApplicationIsRunning(fieldSystem) == FALSE) {
                if (unkStruct->unk08->unk10 != contest->mon) {
                    CopyPokemonToPokemon(unkStruct->unk04, contest->mon);
                }
                if (!contest->caught_poke) {
                    contest->caught_poke = TRUE;
                }
                FreeToHeap(unkStruct->unk08);
                FreeToHeap(unkStruct);
                return TRUE;
            }
            break;
    }
    return FALSE;
}

BOOL ScrCmd_SetTrainerHouseSprite(ScriptContext *ctx) {
    u16 trainerNum = ScriptGetVar(ctx);
    u16 *hasTrainer = ScriptGetVarPointer(ctx);
    u16 *spriteId = GetVarPointer(ctx->fieldSystem, VAR_OBJ_1 + trainerNum);
    TrainerHouse *trainerHouse = Save_TrainerHouse_Get(ctx->fieldSystem->saveData);
    *hasTrainer = TrainerHouseSet_CheckHasData(&trainerHouse->sets[trainerNum]);
    if (*hasTrainer) {
        *spriteId = trainerHouse->sets[trainerNum].trainer.sprite;
    } else {
        *spriteId = 0;
    }
    return FALSE;
}

void FieldSystem_InitMystriStageGymmick(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    Save_Gymmick_Init(gymmick, GYMMICK_SINJOH);
    GymmickUnion *gymmickData = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_SINJOH);
    gymmickData->sinjoh.choice = 0;
}
