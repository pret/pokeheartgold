#include "scrcmd.h"
#include "unk_020632B0.h"
#include "encounter.h"
#include "event_data.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "map_header.h"
#include "unk_02054E00.h"
#include "field_black_out.h"
#include "battle/battle_setup.h"
#include "script_pokemon_util.h"
#include "field_map_object.h"
#include "sound_02004A44.h"

BOOL ScrCmd_GetTrainerPathToPlayer(ScriptContext *ctx) {
    int *sp18, *encounterType, *sp10, *r7;
    LocalMapObject **localMapObject;
    FieldSystem *fieldSystem = ctx->fieldSystem;

    u16 trainerNum = ScriptGetVar(ctx);
    if (trainerNum == 0) {
        sp18 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_FIELD_00);
        sp10 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_FIELD_04);
        FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_FIELD_08);
        FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_ID);
        encounterType = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_ENCOUNTER_TYPE);
        localMapObject = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_EVENT);
        r7 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_FIELD_18);
    } else {
        sp18 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_FIELD_00);
        sp10 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_FIELD_04);
        FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_FIELD_08);
        FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_ID);
        encounterType = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_ENCOUNTER_TYPE);
        localMapObject = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_EVENT);
        r7 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_FIELD_18);
    }

    *r7 = sub_0206457C(fieldSystem, *localMapObject, fieldSystem->playerAvatar, *sp10, *sp18, 0, *encounterType, trainerNum);
    return FALSE;
}

BOOL ScrCmd_TrainerStepTowardsPlayer(ScriptContext *ctx) {
    int *r5;
    u16 trainerNum = ScriptGetVar(ctx);
    u16 *var1 = ScriptGetVarPointer(ctx);

    *var1 = 0;
    if (trainerNum == 0) {
        r5 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_FIELD_18);
    } else {
        r5 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_FIELD_18);
    }

    if (*r5 == 0) {
        *var1 = 1;
        return TRUE;
    }

    if (sub_02064598() == TRUE) {
        sub_020645AC(*r5);
        *r5 = 0;
        *var1 = 1;
    }

    return TRUE;
}

BOOL ScrCmd_GetTrainerEyeType(ScriptContext *ctx) {
    u16 *encounterType = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_ENCOUNTER_TYPE);
    u16 *retEncounterType = ScriptGetVarPointer(ctx);
    *retEncounterType = *encounterType;
    return FALSE;
}

BOOL ScrCmd_GetEyeTrainerNum(ScriptContext *ctx) {
    u16 *trainerId0 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ENGAGED_TRAINER_0_ID);
    u16 *trainerId1 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ENGAGED_TRAINER_1_ID);
    u16 trainerNum = ScriptGetVar(ctx);
    u16 *retTrainerId = ScriptGetVarPointer(ctx);

    if (trainerNum == 0) {
        *retTrainerId = *trainerId0;
    } else {
        *retTrainerId = *trainerId1;
    }

    return FALSE;
}

BOOL ScrCmd_GetTrainerNum(ScriptContext *ctx) {
    u16 *script = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u16 *retTrainerNum = ScriptGetVarPointer(ctx);
    *retTrainerNum = ScriptNumToTrainerNum(*script);
    return FALSE;
}

BOOL ScrCmd_TrainerBattle(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *script = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u32 *winFlag = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    u8 var2 = ScriptReadByte(ctx);
    u8 var3 = ScriptReadByte(ctx);
    u16 followerTrainerNum = 0;

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(ctx->fieldSystem->saveData)) == TRUE) {
        followerTrainerNum = Save_VarsFlags_GetFollowerTrainerNum(Save_VarsFlags_Get(fieldSystem->saveData));
    }

    SetupAndStartTrainerBattle(ctx->taskman, var0, var1, followerTrainerNum, var2, var3, HEAP_ID_FIELD, winFlag);
    return TRUE;
}

BOOL ScrCmd_MultiBattle(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    u16 var2 = ScriptGetVar(ctx);
    u8 var3 = ScriptReadByte(ctx);

    SetupAndStartTrainerBattle(ctx->taskman, var1, var2, var0, 0, var3, HEAP_ID_FIELD, winFlag);
    return TRUE;
}

BOOL ScrCmd_GetTrainerMsgParams(ScriptContext *ctx) {
    u16 *script = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u16 *msgPtr0 = ScriptGetVarPointer(ctx);
    u16 *msgPtr1 = ScriptGetVarPointer(ctx);
    u16 *msgPtr2 = ScriptGetVarPointer(ctx);

    int msg0, msg1, msg2;
    if (!(u16)TrainerNumIsDouble(ScriptNumToTrainerNum(*script))) {
        msg0 = TRMSG_INTRO;
        msg1 = TRMSG_AFTER;
        msg2 = TRMSG_INTRO;
    } else {
        if (!(u16)ScriptNoToDoublePartnerNo(*script)) {
            msg0 = TRMSG_DBL_INTRO_1;
            msg1 = TRMSG_DBL_AFTER_1;
            msg2 = TRMSG_DBL_1POKE_1;
        } else {
            msg0 = TRMSG_DBL_INTRO_2;
            msg1 = TRMSG_DBL_AFTER_2;
            msg2 = TRMSG_DBL_1POKE_2;
        }
    }

    *msgPtr0 = msg0;
    *msgPtr1 = msg1;
    *msgPtr2 = msg2;
    return FALSE;
}

BOOL ScrCmd_GetRematchMsgParams(ScriptContext *ctx) {
    u16 *script = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u16 *msgPtr0 = ScriptGetVarPointer(ctx);
    u16 *msgPtr1 = ScriptGetVarPointer(ctx);
    u16 *msgPtr2 = ScriptGetVarPointer(ctx);

    u16 msg0, msg1, msg2;
    if (!(u16)TrainerNumIsDouble(ScriptNumToTrainerNum(*script))) {
        msg0 = TRMSG_PHONE_REMATCH_INTRO;
        msg1 = TRMSG_INTRO;
        msg2 = TRMSG_INTRO;
    } else {
        if (!(u16)ScriptNoToDoublePartnerNo(*script)) {
            msg0 = TRMSG_PHONE_REMATCH_DBL_INTRO_1;
            msg1 = TRMSG_INTRO;
            msg2 = TRMSG_DBL_1POKE_1;
        } else {
            msg0 = TRMSG_PHONE_REMATCH_DBL_INTRO_2;
            msg1 = TRMSG_INTRO;
            msg2 = TRMSG_DBL_1POKE_2;
        }
    }

    *msgPtr0 = msg0;
    *msgPtr1 = msg1;
    *msgPtr2 = msg2;
    return FALSE;
}

BOOL ScrCmd_TrainerIsDoubleBattle(ScriptContext *ctx) {
    u16 *script = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u16 *retDoubleBattle = ScriptGetVarPointer(ctx);
    *retDoubleBattle = TrainerNumIsDouble(ScriptNumToTrainerNum(*script));
    return FALSE;
}

BOOL ScrCmd_EncounterMusic(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    BOOL isKanto = MapHeader_IsKanto(ctx->fieldSystem->location->mapId);
    BGM_SaveStateAndPlayNew(Trainer_GetEncounterMusic(var0, isKanto));
    return TRUE;
}

BOOL ScrCmd_WhiteOut(ScriptContext *ctx) {
    CallFieldTask_BlackOut(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_CheckBattleWon(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 *retBattleWon = ScriptGetVarPointer(ctx);
    *retBattleWon = IsBattleResultWin(*winFlag);
    return TRUE;
}

BOOL ScrCmd_StaticWildWonOrCaughtCheck(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    u8 var0 = ScriptReadByte(ctx);

    int val;
    if (var0 == 1) {
        val = IsBattleResultStaticWildWin(VarGet(ctx->fieldSystem, VAR_BATTLE_RESULT));
    } else {
        val = IsBattleResultStaticWildWin(*(u32 *)FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG));
    }

    *retPtr = val;
    return TRUE;
}

BOOL Scrcmd_LatiCaughtCheck(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = IsBattleResultLatiCaught(*winFlag);
    return TRUE;
}

BOOL ScrCmd_PartyCheckForDouble(ScriptContext *ctx) {
    u16 *doubleBattlePtr = ScriptGetVarPointer(ctx);
    *doubleBattlePtr = HasEnoughAlivePokemonForDoubleBattle(SaveArray_Party_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_223(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    SetupAndStartTrainerBattle(ctx->taskman, 1, 0, 0, 0, 0, HEAP_ID_FIELD, winFlag);
    return TRUE;
}

BOOL ScrCmd_224(ScriptContext *ctx) {
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u32 mapObjectId = MapObject_GetID(*lastInteracted);
    TrainerFlagSet(ctx->fieldSystem->saveData, (u16)mapObjectId);
    return FALSE;
}

BOOL ScrCmd_GotoIfTrainerDefeated(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u32 offset = ScriptReadWord(ctx);
    u32 mapObjectId = MapObject_GetID(*lastInteracted);

    if (TrainerFlagCheck(fieldSystem->saveData, (u16)mapObjectId) == TRUE) {
        ScriptJump(ctx, ctx->script_ptr + offset);
        return TRUE;
    }
    return FALSE;
}
