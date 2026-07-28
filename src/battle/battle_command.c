#include "battle/battle_command.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/battle_script.h"
#include "constants/battle_subscript.h"
#include "constants/items.h"
#include "constants/message_tags.h"
#include "constants/move_effects.h"
#include "constants/moves.h"
#include "constants/opcode.h"
#include "constants/pokemon.h"
#include "constants/sndseq.h"

#include "battle/battle_022378C0.h"
#include "battle/battle_02265E28.h"
#include "battle/battle_controller.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_controller_player.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"
#include "msgdata/msg/msg_0197.h"

#include "assert.h"
#include "gf_gfx_loader.h"
#include "item.h"
#include "naming_screen.h"
#include "obj_char_transfer.h"
#include "overlay_07.h"
#include "overlay_18.h"
#include "overlay_manager.h"
#include "palette.h"
#include "party.h"
#include "pokedex_util.h"
#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "pokemon_mood.h"
#include "render_window.h"
#include "sound.h"
#include "sound_chatot.h"
#include "sprite_system.h"
#include "sys_task_api.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02013534.h"
#include "unk_020163E0.h"
#include "unk_0208805C.h"

int BattleScriptReadWord(BattleContext *ctx);
static void BattleScriptIncrementPointer(BattleContext *ctx, int adrs);
static void BattleScriptJump(BattleContext *ctx, NarcId narcId, int adrs);
static void BattleScriptGotoSubscript(BattleContext *ctx, NarcId narcId, int adrs);
static void *BattleScriptGetVarPointer(BattleSystem *battleSystem, BattleContext *ctx, int var);
static int BattleSystem_GetBattlerIDBySide(BattleSystem *battleSystem, BattleContext *ctx, int side);
static void BattlerSetAbility(BattleContext *ctx, u8 a1, u8 a2);
static void BattlerSetItem(BattleContext *ctx, u8 battlerId, u16 item);
static void BattleScript_CalcEffortValues(Party *party, int slot, u32 species, u32 form);
static u32 BattleSystem_CalculateBallShakes(BattleSystem *battleSystem, BattleContext *ctx);
static s32 GetMonWeight(u16 species);
static void InitBattleMsgData(BattleContext *ctx, BattleMessageData *msgdata);
static int ov12_022480C0(BattleSystem *battleSystem, BattleContext *ctx, int side);
static int GetMoveMessageNo(BattleContext *ctx, int move);
static int ov12_0224810C(BattleContext *ctx, int);
static int ov12_02248184(BattleContext *ctx, int);
static int ov12_02248190(BattleContext *ctx, int);
static int ov12_0224819C(BattleSystem *battleSystem, BattleContext *ctx, int side);
static int ov12_022481D0(BattleContext *ctx, int);
static int ov12_022481DC(BattleContext *ctx, int);
static int ov12_022481E8(BattleSystem *battleSystem, BattleContext *ctx, int side);
static int ov12_02248200(BattleContext *ctx, int);
static int ov12_0224820C(BattleContext *ctx, int);
static int ov12_02248218(BattleSystem *battleSystem, BattleContext *ctx, int side);
static int ov12_02248220(BattleSystem *battleSystem, BattleContext *ctx, int side);
static void InitBattleMsg(BattleSystem *battleSystem, BattleContext *ctx, BattleMessageData *msgdata, BattleMessage *msg);
static void UpdateFriendshipFainted(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
static void BattleSystem_LoadLevelUpNameplate(BattleSystem *battleSystem, GetterWork *data, Pokemon *mon);
static void BattleSystem_UnloadLevelUpNameplate(BattleSystem *battleSystem, GetterWork *data);

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *battleSystem, BattleContext *ctx) {
    BOOL ret;

    do {
        ret = sBattleScriptCommandTable[ctx->battleScriptBuffer[ctx->scriptSeqNo]](battleSystem, ctx);
    } while (ctx->battleContinueFlag == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_LINK) == 0);

    ctx->battleContinueFlag = 0;

    return ret;
}

BOOL BtlCmd_PlayEncounterAnimation(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPlayEncounterAnimation(battleSystem, FALSE);
    return FALSE;
}

BOOL BtlCmd_SetPokemonEncounter(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    BattleScriptIncrementPointer(ctx, 1);
    switch (BattleScriptReadWord(ctx)) {
    default:
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonEncounter(battleSystem, battlerId);
            BattleSystem_SetPokedexSeen(battleSystem, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        break;
    case BATTLER_CATEGORY_ENEMY: {
        OpponentData *opponentData;
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitPokemonEncounter(battleSystem, battlerId);
                BattleSystem_SetPokedexSeen(battleSystem, battlerId);
            }
        }
        break;
    }
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSlideIn(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSlideIn(battleSystem, battlerId);
            BattleSystem_SetPokedexSeen(battleSystem, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitPokemonSlideIn(battleSystem, battlerId);
                BattleSystem_SetPokedexSeen(battleSystem, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, battlerId);
                BattleController_EmitPokemonSlideIn(battleSystem, battlerId);
                BattleSystem_SetPokedexSeen(battleSystem, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ATTACKER:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdAttacker);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdAttacker);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSlideIn(battleSystem, ctx->battlerIdAttacker);
        break;
    case BATTLER_CATEGORY_DEFENDER:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdTarget);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdTarget);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdTarget);
        BattleController_EmitPokemonSlideIn(battleSystem, ctx->battlerIdTarget);
        break;
    case BATTLER_CATEGORY_SWITCHED_MON:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdSwitch);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdSwitch);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSlideIn(battleSystem, ctx->battlerIdSwitch);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSendOut(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSendOut(battleSystem, battlerId, 0, 0);
            BattleSystem_SetPokedexSeen(battleSystem, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitPokemonSendOut(battleSystem, battlerId, 0, 0);
                BattleSystem_SetPokedexSeen(battleSystem, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, battlerId);
                BattleController_EmitPokemonSendOut(battleSystem, battlerId, 0, 0);
                BattleSystem_SetPokedexSeen(battleSystem, battlerId);
            }
        }
        break;
    case 1:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdAttacker);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdAttacker);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSendOut(battleSystem, ctx->battlerIdAttacker, 0, 0);
        break;
    case 2:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdTarget);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdTarget);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdTarget);
        BattleController_EmitPokemonSendOut(battleSystem, ctx->battlerIdTarget, 0, 0);
        break;
    case 6:
        opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdSwitch);
        if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(battleSystem, ctx, ctx->battlerIdSwitch);
        }
        BattleSystem_SetPokedexSeen(battleSystem, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSendOut(battleSystem, ctx->battlerIdSwitch, 0, 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_RecallPokemon(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitRecallPokemon(battleSystem, ctx, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if ((opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) == 0) {
                BattleController_EmitRecallPokemon(battleSystem, ctx, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY && !(ctx->switchInFlag & MaskOfFlagNo(battlerId))) {
                BattleController_EmitRecallPokemon(battleSystem, ctx, battlerId);
            }
        }
        break;
    default:
        BattleController_EmitRecallPokemon(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side));
        break;
    }

    return FALSE;
}

BOOL BtlCmd_DeletePokemon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));
    BattleController_EmitDeletePokemon(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_SetTrainerEncounter(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    case 0:
    default:
        if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
                if (opponentData->battlerType != BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                    BattleController_EmitTrainerEncounter(battleSystem, battlerId);
                }
            }
        } else {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                    break;
                }
                BattleController_EmitTrainerEncounter(battleSystem, battlerId);
            }
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitTrainerEncounter(battleSystem, battlerId);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitTrainerEncounter(battleSystem, battlerId);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ThrowPokeball(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitThrowPokeball(battleSystem, battlerId, unkC);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitThrowPokeball(battleSystem, battlerId, unkC);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitThrowPokeball(battleSystem, battlerId, unkC);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_TrainerSlideOut(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_SOLO_PLAYER || opponentData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                break;
            }
        }
        break;
    case 10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_SOLO_ENEMY || opponentData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                break;
            }
        }
        break;
    case 11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                break;
            }
        }
        break;
    case 12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_2) {
                BattleController_EmitTrainerSlideOut(battleSystem, battlerId);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_TrainerSlideIn(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 index = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) {
                    break;
                }
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) {
                    break;
                }
            }
        }
        break;
    case BATTLER_CATEGORY_PLAYER_SLOT_1:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_SOLO_PLAYER || opponentData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY_SLOT_1:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_SOLO_ENEMY || opponentData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_PLAYER_SLOT_2:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY_SLOT_2:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_2) {
                BattleController_EmitTrainerSlideIn(battleSystem, battlerId, index);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_BackgroundSlideIn(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    BattleScriptIncrementPointer(ctx, 1);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        BattleController_EmitBackgroundSlideIn(battleSystem, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideIn(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, 0);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if ((opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) == 0) {
                BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, 0);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, 0);
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideInDelay(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;
    u8 delay;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    delay = 0;

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, 0);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if ((opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) == 0) {
                BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitHealthbarSlideIn(battleSystem, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideOut(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideOut(battleSystem, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if ((opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) == 0 && (ctx->switchInFlag & MaskOfFlagNo(battlerId)) == 0) {
                BattleController_EmitHealthbarSlideOut(battleSystem, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                BattleController_EmitHealthbarSlideOut(battleSystem, battlerId);
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideOut(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side));
        break;
    }

    return FALSE;
}

BOOL BtlCmd_Wait(BattleSystem *battleSystem, BattleContext *ctx) {
    if (Link_QueueNotEmpty(ctx)) {
        BattleScriptIncrementPointer(ctx, 1);
    } else {
        Link_CheckTimeout(ctx);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

static void DamageCalcDefault(BattleSystem *battleSystem, BattleContext *ctx) {
    int type;

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->trainerAIData.moveData[ctx->moveNoCur].type;
    }

    ctx->damage = CalcMoveDamage(battleSystem, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget)], ctx->fieldCondition, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

    ctx->damage *= ctx->criticalMultiplier;

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_HP_DRAIN_ON_ATK) {
        ctx->damage = ctx->damage * (100 + GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0)) / 100;
    }

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_BOOST_REPEATED) {
        ctx->damage = ctx->damage * (10 + ctx->battleMons[ctx->battlerIdAttacker].unk88.metronomeTurns) / 10;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag) {
        if (ctx->meFirstTotal == ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount--;
        }
        if ((ctx->meFirstTotal - ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount) < 2) {
            ctx->damage = ctx->damage * 15 / 10;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag = 0;
        }
    }
}

BOOL BtlCmd_CalcDamage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(battleSystem, ctx);
    ctx->damage = ApplyDamageRange(battleSystem, ctx, ctx->damage);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_CalcDamageRaw(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(battleSystem, ctx);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_PrintAttackMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!(ctx->battleStatus & BATTLE_STATUS_NO_ATTACK_MESSAGE)) {
        BattleController_EmitPrintAttackMessage(battleSystem, ctx);
    }

    ctx->battleStatus |= BATTLE_STATUS_NO_ATTACK_MESSAGE;
    ctx->battleStatus2 |= BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE;

    return FALSE;
}

BOOL BtlCmd_PrintMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(battleSystem, ctx, &msgdata, &msg);
    BattleController_EmitPrintMessage(battleSystem, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintGlobalMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(battleSystem, ctx, &msgdata, &msg);

    msg.tag |= 128;

    BattleController_EmitPrintMessage(battleSystem, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPrintMessage(battleSystem, ctx, &ctx->buffMsg);
    return FALSE;
}

BOOL BtlCmd_BufferMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleMessageData msgdata;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(battleSystem, ctx, &msgdata, &ctx->buffMsg);

    return FALSE;
}

BOOL BtlCmd_BufferLocalMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(battleSystem, ctx, &msgdata, &msg);

    msg.tag |= 64;
    msg.battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitPrintMessage(battleSystem, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *battleSystem, BattleContext *ctx) {
    u16 move;

    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);

    if (battler == BATTLER_NONE) {
        move = ctx->moveTemp;
    } else {
        move = ctx->moveNoCur;
    }

    if ((!(ctx->battleStatus & BATTLE_STATUS_MOVE_ANIMATIONS_OFF) && BattleSystem_AreBattleAnimationsOn(battleSystem) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->battleStatus |= BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        BattleController_SetMoveAnimation(battleSystem, ctx, move);
    }

    if (!BattleSystem_AreBattleAnimationsOn(battleSystem)) {
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAIT_MOVE_ANIMATION);
    }

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimationOnMons(BattleSystem *battleSystem, BattleContext *ctx) {
    u16 move;

    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);
    u32 attackerSide = BattleScriptReadWord(ctx);
    u32 defenderSide = BattleScriptReadWord(ctx);

    if (battler == BATTLER_NONE) {
        move = ctx->moveTemp;
    } else {
        move = ctx->moveNoCur;
    }

    u32 attacker = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, attackerSide);
    u32 defender = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, defenderSide);

    if ((!(ctx->battleStatus & BATTLE_STATUS_MOVE_ANIMATIONS_OFF) && BattleSystem_AreBattleAnimationsOn(battleSystem) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->battleStatus |= BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        ov12_0226343C(battleSystem, ctx, move, attacker, defender);
    }

    if (!BattleSystem_AreBattleAnimationsOn(battleSystem)) {
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAIT_MOVE_ANIMATION);
    }

    return FALSE;
}

BOOL BtlCmd_FlickerMon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    BattleController_EmitMonFlicker(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), ctx->moveStatusFlag);

    return FALSE;
}

BOOL BtlCmd_UpdateHealthbarValue(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));

    if ((ctx->battleMons[battlerId].hp + ctx->hpCalc) <= 0) {
        ctx->hitDamage = ctx->battleMons[battlerId].hp * -1;
    } else {
        ctx->hitDamage = ctx->hpCalc;
    }

    if (ctx->hitDamage < 0) {
        ctx->totalDamage[battlerId] += (-1 * ctx->hitDamage);
    }

    ctx->battleMons[battlerId].hp += ctx->hpCalc;

    if (ctx->battleMons[battlerId].hp < 0) {
        ctx->battleMons[battlerId].hp = 0;
    } else if (ctx->battleMons[battlerId].hp > ctx->battleMons[battlerId].maxHp) {
        ctx->battleMons[battlerId].hp = ctx->battleMons[battlerId].maxHp;
    }

    CopyBattleMonToPartyMon(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_UpdateHealthbar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitHealthbarUpdate(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TryFaintMon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));

    if (ctx->battleMons[battlerId].hp == 0) {
        ctx->battlerIdFainted = battlerId;
        ctx->battleStatus |= MaskOfFlagNo(battlerId) << BATTLE_STATUS_FAINTED_SHIFT;
        ctx->totalTimesFainted[battlerId]++;
        UpdateFriendshipFainted(battleSystem, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_PlayFaintAnimation(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPlayFaintAnimation(battleSystem, ctx, ctx->battlerIdFainted);

    ctx->battleStatus &= (MaskOfFlagNo(ctx->battlerIdFainted) << BATTLE_STATUS_FAINTED_SHIFT) ^ -1;
    ctx->battleStatus2 |= MaskOfFlagNo(ctx->battlerIdFainted) << BATTLE_STATUS2_EXP_GAIN_SHIFT;
    ctx->playerActions[ctx->battlerIdFainted].command = CONTROLLER_COMMAND_40;

    InitFaintedWork(battleSystem, ctx, ctx->battlerIdFainted);

    return FALSE;
}

BOOL BtlCmd_WaitButtonABTime(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int waitFrames = BattleScriptReadWord(ctx);
    int waitIncrement;

    if (!(BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_LINK)) {
        if (gSystem.newKeys & 0xC03 || System_GetTouchNew()) {
            // TODO: Rename variable in struct
            ctx->unk_F0 = waitFrames;
        }
    }

    if (battleSystem->battleType & BATTLE_TYPE_LINK && !(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        waitIncrement = 2;
    } else {
        waitIncrement = 1;
    }

    if (waitFrames > ctx->unk_F0) {
        BattleScriptIncrementPointer(ctx, -2);
        ctx->unk_F0 += waitIncrement;
    } else {
        ctx->unk_F0 = 0;
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_PlaySound(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 sound = BattleScriptReadWord(ctx);

    BattleController_EmitPlaySE(battleSystem, ctx, sound, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side));

    return FALSE;
}

BOOL BtlCmd_CompareVarToValue(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 opcode = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(battleSystem, ctx, varId);

    switch (opcode) {
    case OPCODE_EQU:
        if (*var != cmp) {
            adrs = 0;
        }
        break;
    case OPCODE_NEQ:
        if (*var == cmp) {
            adrs = 0;
        }
        break;
    case OPCODE_GT:
        if (*var <= cmp) {
            adrs = 0;
        }
        break;
    case OPCODE_LTE:
        if (*var > cmp) {
            adrs = 0;
        }
        break;
    case OPCODE_FLAG_SET:
        if (!(*var & cmp)) {
            adrs = 0;
        }
        break;
    case OPCODE_FLAG_NOT:
        if (*var & cmp) {
            adrs = 0;
        }
        break;
    case OPCODE_AND:
        if ((*var & cmp) != cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CompareMonDataToValue(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 opcode = BattleScriptReadWord(ctx);
    u32 side = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int var = GetBattlerVar(ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), varId, NULL);

    switch (opcode) {
    case 0:
        if (var != cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (var == cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (var <= cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (var > cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if (!(var & cmp)) {
            adrs = 0;
        }
        break;
    case 5:
        if (var & cmp) {
            adrs = 0;
        }
        break;
    case 6:
        if ((var & cmp) != cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_FadeOutBattle(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitFadeOutBattle(battleSystem, ctx);

    return FALSE;
}

BOOL BtlCmd_GoToSubscript(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_0_1, BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_GoToEffectScript(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_3_0, ctx->trainerAIData.moveData[ctx->moveNoCur].effect);

    return FALSE;
}

BOOL BtlCmd_GoToMoveScript(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->battleStatus &= ~BATTLE_STATUS_NO_ATTACK_MESSAGE;
    ctx->battleStatus &= ~BATTLE_STATUS_MOVE_ANIMATIONS_OFF;

    ctx->moveNoCur = ctx->moveTemp;

    if (unkA == 0) {
        ctx->battlerIdTarget = ov12_022506D4(battleSystem, ctx, ctx->battlerIdAttacker, (u16)ctx->moveTemp, 1, 0);
        ov12_02250A18(battleSystem, ctx, ctx->battlerIdAttacker, ctx->moveTemp);
        ctx->playerActions[ctx->battlerIdAttacker].unk4 = ctx->battlerIdTarget;
    }

    if (ctx->battlerIdTarget == BATTLER_NONE) {
        ctx->commandNext = CONTROLLER_COMMAND_39;
        BattleScriptJump(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
    } else {
        BattleScriptJump(ctx, NARC_a_0_0_0, ctx->moveNoCur);
    }

    return FALSE;
}

BOOL BtlCmd_CalcCrit(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TUTORIAL) || (BattleSystem_GetBattleSpecial(battleSystem) & BATTLE_SPECIAL_FIRST_RIVAL)) {
        ctx->criticalMultiplier = 1;
    } else {
        ctx->criticalMultiplier = TryCriticalHit(battleSystem, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalCnt, ov12_022581D4(battleSystem, ctx, 0, ctx->battlerIdTarget));
    }

    return FALSE;
}

BOOL BtlCmd_CalcExpGain(BattleSystem *battleSystem, BattleContext *ctx) {
    int adrs;
    u32 battleType = BattleSystem_GetBattleType(battleSystem);
    OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, ctx->battlerIdFainted);

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    if ((opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) && !(battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK))) {
        int expMonsCnt = 0;
        int expShareMonsCnt = 0;
        u16 totalExp;
        u16 itemNo;
        Pokemon *mon;
        for (int i = 0; i < Party_GetCount(BattleSystem_GetParty(battleSystem, 0)); i++) {
            mon = BattleSystem_GetPartyMon(battleSystem, 0, i);
            if (GetMonData(mon, MON_DATA_SPECIES, 0) && GetMonData(mon, MON_DATA_HP, 0)) {
                if (ctx->unk_A4[(ctx->battlerIdFainted >> 1) & 1] & MaskOfFlagNo(i)) {
                    expMonsCnt++;
                }
                itemNo = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
                if (GetItemVar(ctx, itemNo, ITEM_VAR_HOLD_EFFECT) == HOLD_EFFECT_EXP_SHARE) {
                    expShareMonsCnt++;
                }
            }
        }
        totalExp = GetMonBaseStat(ctx->battleMons[ctx->battlerIdFainted].species, BASE_EXP_YIELD);
        totalExp = (totalExp * ctx->battleMons[ctx->battlerIdFainted].level) / 7;
        if (expShareMonsCnt) {
            ctx->gainedExp = (totalExp / 2) / expMonsCnt;
            if (ctx->gainedExp == 0) {
                ctx->gainedExp = 1;
            }
            ctx->partyGainedExp = (totalExp / 2) / expShareMonsCnt;
            if (ctx->partyGainedExp == 0) {
                ctx->partyGainedExp = 1;
            }
        } else {
            ctx->gainedExp = totalExp / expMonsCnt;
            if (ctx->gainedExp == 0) {
                ctx->gainedExp = 1;
            }
            ctx->partyGainedExp = 0;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

static void Task_GetExp(SysTask *task, void *data);

enum {
    DATA_GET_EXP_PRINTER_ID = 0,
    DATA_GET_EXP_FRAME_COUNTER,
    DATA_GET_EXP_LEARNSET_INDEX,
    DATA_GET_EXP_PREV_PROGRESS_TO_NEXT_LEVEL,
    DATA_GET_EXP_MOVE_TO_LEARN,
    DATA_GET_EXP_MOVE_SLOT_TO_FORGET,
    DATA_GET_EXP_PARTY_SLOT,
};

BOOL BtlCmd_StartGetExpTask(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->getterWork = Heap_Alloc(HEAP_ID_BATTLE, sizeof(GetterWork));

    ctx->getterWork->battleSystem = battleSystem;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->state = 0;
    ctx->getterWork->tempData[DATA_GET_EXP_PARTY_SLOT] = 0;

    SysTask_CreateOnMainQueue(Task_GetExp, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_WaitGetExpTask(BattleSystem *battleSystem, BattleContext *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_WaitGetExpTaskLoop(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptReadWord(ctx);

    return FALSE;
}

BOOL BtlCmd_ShowParty(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId, unkA, unkB;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    BattleScriptIncrementPointer(ctx, 1);

    unkB = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            unkB |= MaskOfFlagNo(battlerId);
            BattleController_EmitShowMonList(battleSystem, ctx, battlerId, 1, 0, 6);
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (BattleSystem_GetBattleType(battleSystem) == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) {
            unkA = BattleSystem_GetBattlerIdPartner(battleSystem, battlerId);
            if (!(unkB & MaskOfFlagNo(battlerId)) && !(unkB & MaskOfFlagNo(unkA))) {
                unkB |= MaskOfFlagNo(battlerId);
                BattleController_EmitShowWaitMessage(battleSystem, battlerId);
            }
        } else {
            if (!(unkB & MaskOfFlagNo(battlerId))) {
                BattleController_EmitShowWaitMessage(battleSystem, battlerId);
            }
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            ctx->battlerIdSwitch = battlerId;
            break;
        }
    }

    return FALSE;
}

BOOL BtlCmd_WaitMonSelection(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;

    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
    int switchCnt = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            switchCnt++;
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if ((ctx->unk_13C[battlerId] & 1) && BattleBuffer_GetNext(ctx, battlerId)) {
            ctx->unk_21A0[battlerId] = ctx->battleBuffer[battlerId][0] - 1;
            switchCnt--;
            if (!(ctx->battleStatus2 & (MaskOfFlagNo(battlerId) << BATTLE_STATUS_FAINTED_SHIFT))) {
                ctx->battleStatus2 |= (MaskOfFlagNo(battlerId) << BATTLE_STATUS_FAINTED_SHIFT);
                BattleController_EmitShowWaitMessage(battleSystem, battlerId);
            }
        }
    }

    if (switchCnt == 0) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if ((ctx->unk_13C[battlerId] & 1) && BattleBuffer_GetNext(ctx, battlerId)) {
                ov12_0223BDDC(battleSystem, battlerId, ctx->battleBuffer[battlerId][0]);
            }
        }
        ctx->battleStatus2 &= 0xf0ffffff;
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SwitchAndUpdateMon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    int battlerId;

    switch (side) {
    case BATTLER_CATEGORY_ATTACKER:
        battlerId = ctx->battlerIdAttacker;
        break;
    case BATTLER_CATEGORY_SWITCHED_MON:
        battlerId = ctx->battlerIdSwitch;
        break;
    case BATTLER_CATEGORY_FORCED_OUT:
        battlerId = ctx->battlerIdTarget;
        break;
    }

    ctx->unk_13C[battlerId] &= ~1;
    ctx->switchInFlag &= (MaskOfFlagNo(battlerId) ^ ~0);
    ctx->selectedMonIndex[battlerId] = ctx->unk_21A0[battlerId];
    ctx->unk_21A0[battlerId] = 6;

    BattleSystem_GetBattleMon(battleSystem, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    ov12_02256F78(battleSystem, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    ctx->hpTemp = ctx->battleMons[1].hp;

    InitSwitchWork(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_GoToIfAnySwitches(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    BattleScriptIncrementPointer(ctx, 1);

    u32 adrs = BattleScriptReadWord(ctx);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            ctx->battlerIdSwitch = battlerId;
            BattleScriptIncrementPointer(ctx, adrs);
            break;
        }
    }

    return FALSE;
}

static void Task_GetPokemon(SysTask *task, void *data);

BOOL BtlCmd_StartCatchMonTask(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int captureType = BattleScriptReadWord(ctx);

    ctx->getterWork = (GetterWork *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(GetterWork));
    ctx->getterWork->battleSystem = battleSystem;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->state = 0;
    ctx->getterWork->captureType = captureType;
    ctx->getterWork->ballID = ItemToBallId(ctx->itemTemp);

    SysTask_CreateOnMainQueue(Task_GetPokemon, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_WaitCatchMonTask(BattleSystem *battleSystem, BattleContext *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SetMultiHit(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int cnt = BattleScriptReadWord(ctx);
    int checkMultiHit = BattleScriptReadWord(ctx);

    if (ctx->multiHitCountTemp == 0) {
        if (cnt == 0) {
            if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SKILL_LINK) {
                cnt = 5;
            } else if ((cnt = BattleSystem_Random(battleSystem) & 3) < 2) {
                cnt += 2;
            } else {
                cnt = (BattleSystem_Random(battleSystem) & 3) + 2;
            }
        }
        ctx->multiHitCount = cnt;
        ctx->multiHitCountTemp = cnt;
        ctx->checkMultiHit = checkMultiHit;
    }

    return FALSE;
}

BOOL BtlCmd_UpdateVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(battleSystem, ctx, varId);

    switch (opcode) {
    case OPCODE_SET:
        *var = val;
        break;
    case OPCODE_ADD:
        *var += val;
        break;
    case OPCODE_SUB:
        *var -= val;
        break;
    case OPCODE_FLAG_ON:
        *var |= val;
        break;
    case OPCODE_FLAG_OFF:
        *var &= (val ^ ~0);
        break;
    case OPCODE_MUL:
        *var *= val;
        break;
    case OPCODE_DIV:
        *var /= val;
        break;
    case OPCODE_LEFT_SHIFT:
        *var <<= val;
        break;
    case OPCODE_RIGHT_SHIFT: {
        u32 uvar = *var;
        *var = uvar >> val;
        break;
    }
    case OPCODE_FLAG_INDEX:
        *var = MaskOfFlagNo(val);
        break;
    case OPCODE_GET:
        GF_ASSERT(FALSE);
        break;
    case OPCODE_SUB_TO_ZERO:
        *var -= val;
        if (*var < 0) {
            *var = 0;
        }
        break;
    case OPCODE_BITWISE_XOR:
        *var ^= val;
        break;
    case OPCODE_BITWISE_AND:
        *var &= val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ChangeStatStage(BattleSystem *battleSystem, BattleContext *ctx) {
    int change, stat;
    BattleMon *mon = &ctx->battleMons[ctx->battlerIdStatChange];

    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int unkD = 0;

    ctx->battleStatus &= ~BATTLE_STATUS_FAIL_STAT_STAGE_CHANGE;

    if (ctx->statChangeParam >= 46) {
        stat = ctx->statChangeParam - 46;
        change = -2;
        ctx->tempData = 13;
    } else if (ctx->statChangeParam >= 39) {
        stat = ctx->statChangeParam - 39;
        change = 2;
        ctx->tempData = 12;
    } else if (ctx->statChangeParam >= 22) {
        stat = ctx->statChangeParam - 22;
        change = -1;
        ctx->tempData = 13;
    } else {
        stat = ctx->statChangeParam - 15;
        change = 1;
        ctx->tempData = 12;
    }

    if (change > 0) { // Stat Increase
        if (mon->statChanges[stat + 1] == 12) {
            ctx->battleStatus |= BATTLE_STATUS_FAIL_STAT_STAGE_CHANGE;
            if (ctx->statChangeType == 3 || ctx->statChangeType == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
            } else {
                // "{0}'s {1} won't go any higher!"
                ctx->buffMsg.id = msg_0197_00142;
                ctx->buffMsg.tag = TAG_NICKNAME_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = stat + 1;
                BattleScriptIncrementPointer(ctx, unkA);
            }
        } else {
            if (ctx->statChangeType == 3) {
                // "{0}'s {1} raised its {2}!"
                ctx->buffMsg.id = msg_0197_00622;
                ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                ctx->buffMsg.param[2] = stat + 1;
            } else if (ctx->statChangeType == 5) {
                // "The {1} raised {0}'s {2}!"
                ctx->buffMsg.id = msg_0197_00756;
                ctx->buffMsg.tag = TAG_NICKNAME_ITEM_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->itemTemp;
                ctx->buffMsg.param[2] = stat + 1;
            } else {
                // "{0}'s {1} (sharply) rose!"
                ctx->buffMsg.id = (change == 1) ? msg_0197_00750 : msg_0197_00753;
                ctx->buffMsg.tag = TAG_NICKNAME_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = stat + 1;
            }
            mon->statChanges[stat + 1] += change;
            if (mon->statChanges[stat + 1] > 12) {
                mon->statChanges[stat + 1] = 12;
            }
        }
    } else { // Stat Decrease
        if (!(ctx->statChangeFlag & (1 << 27))) {
            if (ctx->battlerIdAttacker != ctx->battlerIdStatChange) {
                // Mist
                if (ctx->fieldSideConditionData[BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdStatChange)].mistTurns) {
                    // "{0} is protected by Mist!"
                    ctx->buffMsg.id = msg_0197_00273;
                    ctx->buffMsg.tag = TAG_NICKNAME;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    unkD = 1;
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_CLEAR_BODY) == TRUE || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_WHITE_SMOKE) == TRUE) {
                    if (ctx->statChangeType == 3) {
                        // "{0}'s {1} suppressed {2}'s {3}!"
                        ctx->buffMsg.id = msg_0197_00727;
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                        ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                        ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                    } else {
                        // "{0}'s {1} prevents stat loss!"
                        ctx->buffMsg.id = msg_0197_00669;
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                    }
                    unkD = TRUE;
                } else if ((CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_KEEN_EYE) == TRUE && (1 + stat) == 6) || (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_HYPER_CUTTER) == TRUE && (1 + stat) == 1)) {
                    if (ctx->statChangeType == 3) {
                        // "{0}'s {1} suppressed {2}'s {3}!"
                        ctx->buffMsg.id = msg_0197_00727;
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                        ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                        ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                    } else {
                        // "{0}'s {1} prvents {2} loss!"
                        ctx->buffMsg.id = msg_0197_00704;
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_STAT;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                        ctx->buffMsg.param[2] = stat + 1;
                    }
                    unkD = TRUE;
                } else if (mon->statChanges[1 + stat] == 0) {
                    ctx->battleStatus |= BATTLE_STATUS_FAIL_STAT_STAGE_CHANGE;
                    if (ctx->statChangeType == 2 || ctx->statChangeType == 3) {
                        BattleScriptIncrementPointer(ctx, unkB);
                        return FALSE;
                    } else {
                        // "{0}'s {1} won't go lower!"
                        ctx->buffMsg.id = msg_0197_00145;
                        ctx->buffMsg.tag = TAG_NICKNAME_STAT;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = stat + 1;
                        BattleScriptIncrementPointer(ctx, unkA);
                        return FALSE;
                    }
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_SHIELD_DUST) == TRUE && ctx->statChangeType == 2) {
                    unkD = 1;
                } else if (ctx->battleMons[ctx->battlerIdStatChange].status2 & STATUS2_SUBSTITUTE) {
                    unkD = 2;
                }
            } else if (mon->statChanges[1 + stat] == 0) {
                ctx->battleStatus |= BATTLE_STATUS_FAIL_STAT_STAGE_CHANGE;
                if (ctx->statChangeType == 2 || ctx->statChangeType == 3) {
                    BattleScriptIncrementPointer(ctx, unkB);
                    return FALSE;
                } else {
                    // "{0}'s {1} won't go lower!"
                    ctx->buffMsg.id = msg_0197_00145;
                    ctx->buffMsg.tag = TAG_NICKNAME_STAT;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = stat + 1;
                    BattleScriptIncrementPointer(ctx, unkA);
                    return FALSE;
                }
            }
            if (unkD == 2 && ctx->statChangeType == 1) {
                BattleScriptIncrementPointer(ctx, unkC);
                return FALSE;
            } else if (unkD && ctx->statChangeType == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
                return FALSE;
            } else if (unkD) {
                BattleScriptIncrementPointer(ctx, unkA);
                return FALSE;
            }
        }
        if (ctx->statChangeType == 3) {
            // "{0}'s {1} cuts {2}'s {3}!"
            ctx->buffMsg.id = msg_0197_00662;
            ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_STAT;
            ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
            ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdAttacker].ability;
            ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.param[3] = stat + 1;
        } else {
            // "{0}'s {1} [harshly] fell!"
            ctx->buffMsg.id = (change == -1) ? msg_0197_00762 : msg_0197_00765;
            ctx->buffMsg.tag = TAG_NICKNAME_STAT;
            ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.param[1] = stat + 1;
        }
        mon->statChanges[stat + 1] += change;
        if (mon->statChanges[stat + 1] < 0) {
            mon->statChanges[stat + 1] = 0;
        }
    }

    return FALSE;
}

BOOL BtlCmd_UpdateMonData(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int var = GetBattlerVar(ctx, battlerId, varId, NULL);

    switch (opcode) {
    case 7:
        var = val;
        break;
    case 8:
        var += val;
        break;
    case 9:
        var -= val;
        break;
    case 10:
        var |= val;
        break;
    case 11:
        var &= (val ^ ~0);
        break;
    case 12:
        var *= val;
        break;
    case 13:
        var /= val;
        break;
    case 14:
        var <<= val;
        break;
    case 15: {
        u32 uvar = var;
        var = uvar >> val;
        break;
    }
    case 16:
        var = MaskOfFlagNo(val);
        break;
    case 17:
        GF_ASSERT(FALSE);
        break;
    case 18:
        var -= val;
        if (var < 0) {
            var = 0;
        }
        break;
    case 19:
        var ^= val;
        break;
    case 20:
        var &= val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    if (varId == BMON_DATA_ABILITY) {
        BattlerSetAbility(ctx, battlerId, var);
    }

    SetBattlerVar(ctx, battlerId, varId, &var);
    CopyBattleMonToPartyMon(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_ClearVolatileStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int var = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    ctx->unk_218C[battlerId] |= var;

    return FALSE;
}

BOOL BtlCmd_ToggleVanish(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkA = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitToggleVanish(battleSystem, battlerId, unkA);

    return FALSE;
}

BOOL BtlCmd_CheckAbility(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == BATTLER_CATEGORY_ALL) {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if (unkA == 0) {
                if (GetBattlerAbility(ctx, battlerId) == ability) {
                    BattleScriptIncrementPointer(ctx, adrs);
                    ctx->battlerIdAbility = battlerId;
                    break;
                }
            } else if (GetBattlerAbility(ctx, battlerId) == ability) {
                break;
            }
        }
    } else {
        battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

        if (unkA == 0) {
            if (GetBattlerAbility(ctx, battlerId) == ability) {
                BattleScriptIncrementPointer(ctx, adrs);
                ctx->battlerIdAbility = battlerId;
            }
        } else if (GetBattlerAbility(ctx, battlerId) != ability) {
            BattleScriptIncrementPointer(ctx, adrs);
            ctx->battlerIdAbility = battlerId;
        }
    }

    return FALSE;
}

BOOL BtlCmd_Random(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int modulo = BattleScriptReadWord(ctx);
    modulo += 1;

    int x0 = BattleScriptReadWord(ctx);

    ctx->calcTemp = BattleSystem_Random(battleSystem) % modulo + x0;

    return FALSE;
}

BOOL BtlCmd_UpdateVar2(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int valId = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(battleSystem, ctx, varId);
    int *val = BattleScriptGetVarPointer(battleSystem, ctx, valId);

    switch (opcode) {
    case 7:
        *var = *val;
        break;
    case 8:
        *var += *val;
        break;
    case 9:
        *var -= *val;
        break;
    case 10:
        *var |= *val;
        break;
    case 11:
        *var &= (*val ^ ~0);
        break;
    case 12:
        *var *= *val;
        break;
    case 13:
        *var /= *val;
        break;
    case 14:
        *var <<= *val;
        break;
    case 15: {
        u32 uvar = *var;
        *var = uvar >> *val;
        break;
    }
    case 16:
        *var = MaskOfFlagNo(*val);
        break;
    case 17:
        *val = *var;
        break;
    case 18:
        *var -= *val;
        if (*var < 0) {
            *var = 0;
        }
        break;
    case 19:
        *var ^= *val;
        break;
    case 20:
        *var &= *val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_UpdateMonDataFromVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int valId = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    int var = GetBattlerVar(ctx, battlerId, varId, NULL);
    int *val = BattleScriptGetVarPointer(battleSystem, ctx, valId);

    switch (opcode) {
    case 7:
        var = *val;
        break;
    case 8:
        var += *val;
        break;
    case 9:
        var -= *val;
        break;
    case 10:
        var |= *val;
        break;
    case 11:
        var &= (*val ^ ~0);
        break;
    case 12:
        var *= *val;
        break;
    case 13:
        var /= *val;
        break;
    case 14:
        var <<= *val;
        break;
    case 15: {
        u32 uvar = var;
        var = uvar >> *val;
        break;
    }
    case 16:
        var = MaskOfFlagNo(*val);
        break;
    case 17:
        *val = var;
        break;
    case 18:
        var -= *val;
        if (var < 0) {
            var = 0;
        }
        break;
    case 19:
        var ^= *val;
        break;
    case 20:
        var &= *val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    if (opcode != 17) {
        if (varId == BMON_DATA_ABILITY) {
            BattlerSetAbility(ctx, battlerId, var);
        }
        SetBattlerVar(ctx, battlerId, varId, &var);
        CopyBattleMonToPartyMon(battleSystem, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_Goto(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptIncrementPointer(ctx, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_Call(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_CallFromVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int *var = BattleScriptGetVarPointer(battleSystem, ctx, BattleScriptReadWord(ctx));
    BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, *var);
    return FALSE;
}

BOOL BtlCmd_SetMirrorMove(BattleSystem *battleSystem, BattleContext *ctx) {
    int move = 0;
    int battleType = BattleSystem_GetBattleType(battleSystem);

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->moveNoCopied[ctx->battlerIdAttacker]) {
        move = ctx->moveNoCopied[ctx->battlerIdAttacker];
    } else if (battleType & BATTLE_TYPE_DOUBLES) {
        move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][0] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][1] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][2] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][3];
        if (move) {
            do {
                move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][BattleSystem_Random(battleSystem) % 4];
            } while (!move);
        }
    }
    if (move && IsMoveEncored(ctx, move) == TRUE) {
        ctx->battleStatus &= ~BATTLE_STATUS_NO_ATTACK_MESSAGE;
        ctx->battleStatus &= ~BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        ctx->moveNoCur = move;
        ctx->battlerIdTarget = ov12_022506D4(battleSystem, ctx, ctx->battlerIdAttacker, move, 1, 0);
        if (ctx->battlerIdTarget == BATTLER_NONE) {
            ctx->commandNext = CONTROLLER_COMMAND_39;
            BattleScriptJump(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
        } else {
            ctx->playerActions[ctx->battlerIdAttacker].unk4 = ctx->battlerIdTarget;
            BattleScriptJump(ctx, NARC_a_0_0_0, move);
        }
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
    }

    return FALSE;
}

BOOL BtlCmd_ResetAllStatChanges(BattleSystem *battleSystem, BattleContext *ctx) {
    int stat, battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int battlersMax = BattleSystem_GetMaxBattlers(battleSystem);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        for (stat = 0; stat < 8; stat++) {
            ctx->battleMons[battlerId].statChanges[stat] = 6;
        }
        ctx->battleMons[battlerId].status2 &= ~STATUS2_FOCUS_ENERGY;
    }

    return FALSE;
}

BOOL BtlCmd_LockMoveChoice(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    LockBattlerIntoCurrentMove(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_UnlockMoveChoice(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    UnlockBattlerOutOfCurrentMove(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_SetHealthbarStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    BattleController_EmitHealthbarStatus(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), status);

    return FALSE;
}

BOOL BtlCmd_PrintTrainerMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msg = BattleScriptReadWord(ctx);

    BattleController_EmitPrintTrainerMessage(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), msg);

    return FALSE;
}

extern u16 sPrizeMoneyTbl[0x81][2];

u32 CalcPrizeMoney(BattleSystem *battleSystem, BattleContext *ctx, int trainerIndex) {
    int i;
    TRPOKE *trPoke;
    u32 prizeMoney;
    u8 level = 0;
    u8 trainerClass;
    Trainer trainer;

    trPoke = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TRPOKE) * 6);

    TrainerData_ReadTrData(battleSystem->trainerId[trainerIndex], &trainer);
    TrainerData_ReadTrPoke(battleSystem->trainerId[trainerIndex], trPoke);

    switch (trainer.data.trainerType) {
    default:
    case 0: {
        TRPOKE_NOITEM_DFLTMOVES *pokeDef = (TRPOKE_NOITEM_DFLTMOVES *)trPoke;
        level = pokeDef[trainer.data.npoke - 1].level;
        break;
    }
    case 1: {
        TRPOKE_NOITEM_CUSTMOVES *pokeCust = (TRPOKE_NOITEM_CUSTMOVES *)trPoke;
        level = pokeCust[trainer.data.npoke - 1].level;
        break;
    }
    case 2: {
        TRPOKE_ITEM_DFLTMOVES *pokeItem = (TRPOKE_ITEM_DFLTMOVES *)trPoke;
        level = pokeItem[trainer.data.npoke - 1].level;
        break;
    }
    case 3: {
        TRPOKE_ITEM_CUSTMOVES *pokeCustItem = (TRPOKE_ITEM_CUSTMOVES *)trPoke;
        level = pokeCustItem[trainer.data.npoke - 1].level;
        break;
    }
    }

    i = 0;
    trainerClass = trainer.data.trainerClass;

    do {
        if (trainerClass != sPrizeMoneyTbl[i][0]) {
            i++;
            if (i < (int)NELEMS(sPrizeMoneyTbl)) {
                continue;
            }
        }

        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            GF_ASSERT(FALSE);
        }
        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            i = 2;
        }
        if (battleSystem->battleType & BATTLE_TYPE_TAG || battleSystem->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
            prizeMoney = level * 4 * ctx->prizeMoneyValue * sPrizeMoneyTbl[i][1];
            break;
        } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
            prizeMoney = level * 4 * ctx->prizeMoneyValue * 2 * sPrizeMoneyTbl[i][1];
            break;
        } else {
            prizeMoney = level * 4 * ctx->prizeMoneyValue * sPrizeMoneyTbl[i][1];
            break;
        }

    } while (TRUE);

    Heap_Free(trPoke);

    return prizeMoney;
}

BOOL BtlCmd_PayPrizeMoney(BattleSystem *battleSystem, BattleContext *ctx) {
    u32 prizeMoney;

    BattleScriptIncrementPointer(ctx, 1);

    if (battleSystem->battleOutcomeFlag == 1) {
        prizeMoney = CalcPrizeMoney(battleSystem, ctx, 1);
        if (battleSystem->battleType & BATTLE_TYPE_TAG || battleSystem->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
            prizeMoney += CalcPrizeMoney(battleSystem, ctx, 3);
        }
        PlayerProfile_AddMoney(BattleSystem_GetPlayerProfile(battleSystem, 0), prizeMoney);
    } else {
        prizeMoney = CalcMoneyLoss(battleSystem->trainerParty[0], battleSystem->playerProfile[0]);
        PlayerProfile_SubMoney(BattleSystem_GetPlayerProfile(battleSystem, 0), prizeMoney);
    }

    if (prizeMoney) {
        ctx->msgTemp = prizeMoney;
    } else {
        ctx->msgTemp = 0;
    }

    ctx->tempData = battleSystem->unk2474_1;

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimation(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSystem_AreBattleAnimationsOn(battleSystem) == TRUE || status == 15 || status == 16 || status == 25 || status == 26) {
        int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
        if (CheckStatusEffectsSubstitute(ctx, battlerId, status) == TRUE) {
            BattleController_EmitSetStatus2Effect(battleSystem, ctx, battlerId, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimationOnMons(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSystem_AreBattleAnimationsOn(battleSystem) == TRUE || status == 15 || status == 16 || status == 26 || status == 25) {
        int battlerIdA = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideA);
        int battlerIdB = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideB);
        if (CheckStatusEffectsSubstitute(ctx, battlerIdA, status) == TRUE && CheckStatusEffectsSubstitute(ctx, battlerIdB, status) == TRUE) {
            BattleController_EmitCopyStatus2Effect(battleSystem, ctx, battlerIdA, battlerIdB, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimationFromVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int *data = BattleScriptGetVarPointer(battleSystem, ctx, status);

    if (BattleSystem_AreBattleAnimationsOn(battleSystem) == TRUE || status == 15 || status == 16 || *data == 25 || *data == 26) {
        if (CheckStatusEffectsSubstitute(ctx, battlerId, *data) == TRUE) {
            BattleController_EmitSetStatus2Effect(battleSystem, ctx, battlerId, *data);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PrintRecallMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintReturnMessage(battleSystem, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_PrintSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintSendOutMessage(battleSystem, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_PrintEncounterMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintEncounterMessage(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_PrintFirstSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintFirstSendOutMessage(battleSystem, ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_PrintBufferedTrainerMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintTrainerMessage(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx)), ctx->msgTemp);

    return FALSE;
}

BOOL BtlCmd_TryConversion(BattleSystem *battleSystem, BattleContext *ctx) {
    int i, cnt, moveType;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    for (cnt = 0; cnt < MAX_MON_MOVES; cnt++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[cnt] == 0) {
            break;
        }
    }

    for (i = 0; i < cnt; i++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[i] != MOVE_CONVERSION) {
            moveType = ctx->trainerAIData.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
            if (GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) != moveType && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) != moveType) {
                break;
            }
        }
    }

    if (i == cnt) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            do {
                i = BattleSystem_Random(battleSystem) % cnt;
            } while (ctx->battleMons[ctx->battlerIdAttacker].moves[i] == MOVE_CONVERSION);
            moveType = ctx->trainerAIData.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
        } while (GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) == moveType || GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) == moveType);
        ctx->battleMons[ctx->battlerIdAttacker].type1 = moveType;
        ctx->battleMons[ctx->battlerIdAttacker].type2 = moveType;
        ctx->msgTemp = moveType;
    }

    return FALSE;
}

BOOL BtlCmd_CompareVarToVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 *var = BattleScriptGetVarPointer(battleSystem, ctx, varNo);
    u32 *cmp = BattleScriptGetVarPointer(battleSystem, ctx, cmpNo);

    switch (opcode) {
    case 0:
        if (*var != *cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (*var == *cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (*var <= *cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (*var > *cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if ((*var & *cmp) == 0) {
            adrs = 0;
        }
        break;
    case 5:
        if (*var & *cmp) {
            adrs = 0;
        }
        break;
    case 6:
        if ((*var & *cmp) != *cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CompareMonDataToVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 var = GetBattlerVar(ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side), varNo, NULL);
    u32 *cmp = BattleScriptGetVarPointer(battleSystem, ctx, cmpNo);

    switch (opcode) {
    case 0:
        if (var != *cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (var == *cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (var <= *cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (var > *cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if ((var & *cmp) == 0) {
            adrs = 0;
        }
        break;
    case 5:
        if (var & *cmp) {
            adrs = 0;
        }
        break;
    case 6:
        if ((var & *cmp) != *cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_AddPayDayMoney(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->msgTemp = ctx->unk_14C * ctx->prizeMoneyValue;

    if (ctx->msgTemp > 0xFFFF) {
        ctx->msgTemp = 0xFFFF;
    }

    PlayerProfile_AddMoney(BattleSystem_GetPlayerProfile(battleSystem, 0), ctx->msgTemp);

    return FALSE;
}

BOOL BtlCmd_TryLightScreen(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_LIGHT_SCREEN) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_LIGHT_SCREEN;
        ctx->fieldSideConditionData[unkA].lightScreenTurns = 5;
        ctx->fieldSideConditionData[unkA].lightScreenBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].lightScreenTurns += GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.tag = TAG_MOVE_SIDE;
        ctx->buffMsg.param[0] = ctx->moveNoCur;
        ctx->buffMsg.param[1] = ctx->battlerIdAttacker;
        if (GetMonsHitCount(battleSystem, ctx, 1, ctx->battlerIdAttacker) == 2) {
            // "{0} raised your team's Special Defence slightly!"
            ctx->buffMsg.id = msg_0197_00192;
        } else {
            // "{0} raised your team's Special Defence!"
            ctx->buffMsg.id = msg_0197_00190;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryReflect(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_REFLECT) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_REFLECT;
        ctx->fieldSideConditionData[unkA].reflectTurns = 5;
        ctx->fieldSideConditionData[unkA].reflectBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].reflectTurns += GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.tag = TAG_MOVE_SIDE;
        ctx->buffMsg.param[0] = ctx->moveNoCur;
        ctx->buffMsg.param[1] = ctx->battlerIdAttacker;
        if (GetMonsHitCount(battleSystem, ctx, 1, ctx->battlerIdAttacker) == 2) {
            // "{0} raised your team's Defence slightly!"
            ctx->buffMsg.id = msg_0197_00196;
        } else {
            // "{0} raised your team's Defence!"
            ctx->buffMsg.id = msg_0197_00194;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryMist(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_MIST) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_MIST;
        ctx->fieldSideConditionData[unkA].mistTurns = 5;
        ctx->fieldSideConditionData[unkA].mistBattler = ctx->battlerIdAttacker;
    }
    return FALSE;
}

BOOL BtlCmd_TryOHKOMove(BattleSystem *battleSystem, BattleContext *ctx) {
    u16 hitChance;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->battleStatus |= BATTLE_STATUS_FLAT_HIT_RATE;

    if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STURDY) == TRUE) {
        ctx->moveStatusFlag |= MOVE_STATUS_STURDY;
    } else {
        if (!(ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON) && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_NO_GUARD && GetBattlerAbility(ctx, ctx->battlerIdTarget) != ABILITY_NO_GUARD) {
            hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->trainerAIData.moveData[ctx->moveNoCur].accuracy;
            if ((BattleSystem_Random(battleSystem) % 100) < hitChance && (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level)) {
                hitChance = 1;
            } else {
                hitChance = 0;
            }
        } else {
            if ((((ctx->battleMons[ctx->battlerIdTarget].unk88.battlerIdLockOn == ctx->battlerIdAttacker) && (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON)) || GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NO_GUARD || GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_NO_GUARD) && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                hitChance = 1;
            } else {
                hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->trainerAIData.moveData[ctx->moveNoCur].accuracy;
                if ((BattleSystem_Random(battleSystem) % 100) < hitChance && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                    hitChance = 1;
                } else {
                    hitChance = 0;
                }
            }
            ctx->moveStatusFlag |= 1 << 10;
        }

        if (hitChance) {
            ctx->damage = -ctx->battleMons[ctx->battlerIdTarget].hp;
            ctx->moveStatusFlag |= 1 << 5;
        } else if (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
            ctx->moveStatusFlag |= 1;
        } else {
            ctx->moveStatusFlag |= 1 << 12;
        }
    }

    return FALSE;
}

BOOL BtlCmd_DivideVarByValue(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denom = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(battleSystem, ctx, varNo);

    *data = DamageDivide(*data, denom);

    return FALSE;
}

BOOL BtlCmd_DivideVarByVar(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denomNo = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(battleSystem, ctx, varNo);
    int *denom = BattleScriptGetVarPointer(battleSystem, ctx, denomNo);

    int sign;

    if (*data < 0) {
        sign = -1;
    } else {
        sign = 1;
    }

    *data /= *denom;

    if (*data == 0) {
        *data = sign;
    }

    return FALSE;
}

BOOL BtlCmd_TryMimic(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if ((!CheckLegalMimicMove(ctx->moveNoBattlerPrev[ctx->battlerIdTarget])) || (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_TRANSFORM) || (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_SUBSTITUTE) || ctx->moveNoBattlerPrev[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        int moveIndex = 0;
        int mimicIndex = -1;

        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
                break;
            }
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_MIMIC && mimicIndex == -1) {
                mimicIndex = moveIndex;
            }
        }

        if (moveIndex == MAX_MON_MOVES) {
            ctx->moveTemp = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].moves[mimicIndex] = ctx->moveTemp;
            if (ctx->trainerAIData.moveData[ctx->moveTemp].pp < 5) {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = ctx->trainerAIData.moveData[ctx->moveTemp].pp;
            } else {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = 5;
            }
            ctx->battleMons[ctx->battlerIdAttacker].unk88.mimicedMoveIndex |= MaskOfFlagNo(mimicIndex);

            if (ctx->moveTemp == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_Metronome(BattleSystem *battleSystem, BattleContext *ctx) {
    int metronomeIndex;
    u16 moveNo;

    BattleScriptIncrementPointer(ctx, 1);

    while (TRUE) {
        moveNo = (BattleSystem_Random(battleSystem) % 0x1d3) + 1;

        for (metronomeIndex = 0; metronomeIndex < MAX_MON_MOVES; metronomeIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[metronomeIndex] == moveNo) {
                break;
            }
        }

        if (metronomeIndex != MAX_MON_MOVES) {
            continue;
        }

        if (CheckLegalMetronomeMove(battleSystem, ctx, ctx->battlerIdAttacker, moveNo) == FALSE) {
            continue;
        }

        ctx->moveTemp = moveNo;

        break;
    }

    return FALSE;
}

BOOL BtlCmd_TryDisable(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int disabledMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);

    if ((ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove == 0) && disabledMoveIndex != 4 && ctx->battleMons[ctx->battlerIdTarget].movePPCur[disabledMoveIndex] && ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        ctx->moveTemp = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove = ctx->moveTemp;
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledTurns = BattleSystem_Random(battleSystem) % 4 + 3;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Counter(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdPhysicalDamage;

    int sideA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(battleSystem, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->commandNext = CONTROLLER_COMMAND_39;
                BattleScriptJump(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        ctx->moveStatusFlag |= MOVE_STATUS_FAILED;
    }

    return FALSE;
}

BOOL BtlCmd_MirrorCoat(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdSpecialDamage;

    int sideA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(battleSystem, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->commandNext = CONTROLLER_COMMAND_39;
                BattleScriptJump(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        ctx->moveStatusFlag |= MOVE_STATUS_FAILED;
    }

    return FALSE;
}

BOOL BtlCmd_TryEncore(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int encoredMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);

    if (IsMoveEncored(ctx, ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) == FALSE) {
        encoredMoveIndex = MAX_MON_MOVES;
    }

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == 0 && encoredMoveIndex != MAX_MON_MOVES && ctx->battleMons[ctx->battlerIdTarget].movePPCur[encoredMoveIndex] && ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        ctx->moveTemp = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove = ctx->moveTemp;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex = encoredMoveIndex;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredTurns = BattleSystem_Random(battleSystem) % 5 + 3;
    } else {
        ctx->moveStatusFlag |= 64;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryConversion2(BattleSystem *battleSystem, BattleContext *ctx) {
    int i, moveType;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    if (ctx->conversion2Move[ctx->battlerIdAttacker] && (ctx->conversion2BattlerId[ctx->battlerIdAttacker] != 255)) {
        if (BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->conversion2Move[ctx->battlerIdAttacker]) && (ctx->battleMons[ctx->conversion2BattlerId[ctx->battlerIdAttacker]].status2 & STATUS2_LOCKED_INTO_MOVE)) {
            BattleScriptIncrementPointer(ctx, adrs);
            return FALSE;
        } else {
            u8 typeMove, typeMon, val;
            moveType = ctx->conversion2Type[ctx->battlerIdAttacker];

            for (i = 0; i < 1000; i++) {
                GetTypeEffectivnessData(battleSystem, 0xffff, &typeMove, &typeMon, &val);
                if (typeMove == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) != typeMon && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) != typeMon) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeMon;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeMon;
                    ctx->msgTemp = typeMon;
                    return FALSE;
                }
            }

            i = 0;
            while (GetTypeEffectivnessData(battleSystem, i, &typeMove, &typeMon, &val) == TRUE) {
                if (typeMove == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) != typeMon && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) != typeMon) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeMon;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeMon;
                    ctx->msgTemp = typeMon;
                    return FALSE;
                }
                i++;
            }
        }
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_TrySketch(BattleSystem *battleSystem, BattleContext *ctx) {
    int moveIndex;
    int sketchIndex = -1;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_TRANSFORM || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_STRUGGLE || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_SKETCH || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_CHATTER || ctx->moveNoSketch[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] != MOVE_SKETCH && ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->moveNoSketch[ctx->battlerIdTarget]) {
                break;
            }
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_SKETCH && sketchIndex == -1) {
                sketchIndex = moveIndex;
            }
        }
        if (moveIndex == MAX_MON_MOVES) {
            ctx->battleMons[ctx->battlerIdAttacker].moves[sketchIndex] = ctx->moveNoSketch[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[sketchIndex] = ctx->trainerAIData.moveData[ctx->moveNoSketch[ctx->battlerIdTarget]].pp;
            BattleController_EmitBattleMonToPartyMonCopy(battleSystem, ctx, ctx->battlerIdAttacker);
            ctx->moveTemp = ctx->moveNoSketch[ctx->battlerIdTarget];
            if (ctx->moveTemp == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrySleepTalk(BattleSystem *battleSystem, BattleContext *ctx) {
    int moveIndex, nonSelectableMoves;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    nonSelectableMoves = 0;

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++) {
        if (CheckMoveCallsOtherMove(ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex]) || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_FOCUS_PUNCH || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_UPROAR || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_CHATTER || BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex])) {
            nonSelectableMoves |= MaskOfFlagNo(moveIndex);
        }
    }

    nonSelectableMoves = StruggleCheck(battleSystem, ctx, ctx->battlerIdAttacker, nonSelectableMoves, ~2);

    if (nonSelectableMoves == 15) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            moveIndex = BattleSystem_Random(battleSystem) % 4;
        } while (MaskOfFlagNo(moveIndex) & nonSelectableMoves);
        ctx->moveTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex];
    }

    return FALSE;
}

extern u8 sFlailDamageTable[6][2];

BOOL BtlCmd_CalcFlailPower(BattleSystem *battleSystem, BattleContext *ctx) {
    int i;
    int hpBarPixels;

    BattleScriptIncrementPointer(ctx, 1);

    hpBarPixels = CalculateHpBarPixelsLength(ctx->battleMons[ctx->battlerIdAttacker].hp, ctx->battleMons[ctx->battlerIdAttacker].maxHp, 64);
    for (i = 0; i < sizeof(sFlailDamageTable) / sizeof(sFlailDamageTable[0]); i++) {
        if (hpBarPixels <= sFlailDamageTable[i][0]) {
            break;
        }
    }

    ctx->movePower = sFlailDamageTable[i][1];

    return FALSE;
}

BOOL BtlCmd_TrySpite(BattleSystem *battleSystem, BattleContext *ctx) {
    int moveIndex, ppLoss;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        moveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);
        if (moveIndex == MAX_MON_MOVES || ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ppLoss = 4;
            if (ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] < ppLoss) {
                ppLoss = ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex];
            }
            ctx->moveTemp = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
            ctx->msgTemp = ppLoss;
            ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] -= ppLoss;
            CopyBattleMonToPartyMon(battleSystem, ctx, ctx->battlerIdTarget);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPartyStatusRefresh(BattleSystem *battleSystem, BattleContext *ctx) {
    u32 battleType = BattleSystem_GetBattleType(battleSystem);
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcTemp = 0;

    if (ctx->moveNoCur == MOVE_HEAL_BELL) {
        ctx->moveTemp = ctx->moveNoCur;
        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_SOUNDPROOF) {
            ctx->battleMons[ctx->battlerIdAttacker].status = STATUS_NONE;
            ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_NIGHTMARE;
        } else {
            ctx->calcTemp |= 5;
        }

        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BATTLER_CATEGORY_ATTACKER_PARTNER);
            if (!(ctx->switchInFlag & MaskOfFlagNo(battlerId))) {
                if (!CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF)) {
                    ctx->battleMons[battlerId].status = STATUS_NONE;
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                } else {
                    ctx->battlerIdTemp = battlerId;
                    ctx->calcTemp |= 10;
                }
            }
        } else {
            ctx->calcTemp |= 8;
        }
    } else { // aromatherapy
        ctx->battleMons[ctx->battlerIdAttacker].status = STATUS_NONE;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_NIGHTMARE;
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BATTLER_CATEGORY_ATTACKER_PARTNER);
            if (!(ctx->switchInFlag & MaskOfFlagNo(battlerId))) {
                ctx->battleMons[battlerId].status = STATUS_NONE;
                ctx->battleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
            }
        } else {
            ctx->calcTemp |= 8;
        }
    }

    BattleControl_EmitPartyStatusHeal(battleSystem, ctx, ctx->battlerIdAttacker, ctx->moveNoCur);

    return FALSE;
}

BOOL BtlCmd_TryStealItem(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(battleSystem);
    int fieldSide = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    if (BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker) && !(battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER))) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->fieldSideConditionData[fieldSide].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdAttacker])) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE || GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].item == ITEM_GRISEOUS_ORB) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].unk88.custapBerryFlag || ctx->battleMons[ctx->battlerIdTarget].unk88.quickClawFlag) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else {
        if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
            BattleScriptIncrementPointer(ctx, adrs2);
        } else if (ctx->battleMons[ctx->battlerIdAttacker].item || CanStealHeldItem(battleSystem, ctx, ctx->battlerIdTarget) == FALSE) {
            BattleScriptIncrementPointer(ctx, adrs1);
        }
    }

    return FALSE;
}

extern u16 sProtectSuccessChance[4];

BOOL BtlCmd_TryProtection(BattleSystem *battleSystem, BattleContext *ctx) {
    int flag;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_PROTECT && ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_DETECT && ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_ENDURE) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns = 0;
    }

    if (ctx->battlersOnField == 1) {
        flag = FALSE;
    } else {
        flag = TRUE;
    }

    if (sProtectSuccessChance[ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns] >= (u32)BattleSystem_Random(battleSystem) && flag) {
        if (ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_PROTECT) {
            ctx->turnData[ctx->battlerIdAttacker].protectFlag = TRUE;
            // "{0} protected itself!"
            ctx->buffMsg.id = msg_0197_00282;
        }
        if (ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_SURVIVE_WITH_1_HP) {
            ctx->turnData[ctx->battlerIdAttacker].endureFlag = TRUE;
            // "{0} braced itself!"
            ctx->buffMsg.id = msg_0197_00442;
        }
        ctx->buffMsg.tag = TAG_NICKNAME;
        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);

        if (ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns < NELEMS(sProtectSuccessChance) - 1) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns++;
        }

    } else {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns = 0;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySubstitute(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int subHp = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);

    if (ctx->battleMons[ctx->battlerIdAttacker].hp <= subHp) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->hpCalc = -subHp;
        ctx->battleMons[ctx->battlerIdAttacker].unk88.substituteHp = subHp;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_BIND;
    }

    return FALSE;
}

BOOL BtlCmd_TryWhirlwind(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    if (battleType & BATTLE_TYPE_TRAINER) {
        Party *party;
        Pokemon *mon;
        int partySize;
        int cnt = 0;
        int cntMax;
        int index0, indexEnd, monIndex, maxRand;
        int monIndexA, monIndexB;

        party = BattleSystem_GetParty(battleSystem, ctx->battlerIdTarget);
        partySize = BattleSystem_GetPartySize(battleSystem, ctx->battlerIdTarget);

        if (battleType & BATTLE_TYPE_MULTI || battleType & BATTLE_TYPE_TAG && BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget)) {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 1;
            monIndexA = ctx->selectedMonIndex[ctx->battlerIdTarget];
            monIndexB = ctx->selectedMonIndex[ctx->battlerIdTarget];
        } else if (battleType & BATTLE_TYPE_DOUBLES) {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 2;
            monIndexA = ctx->selectedMonIndex[ctx->battlerIdTarget];
            monIndexB = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, ctx->battlerIdTarget)];
        } else {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 1;
            monIndexA = ctx->selectedMonIndex[ctx->battlerIdTarget];
            monIndexB = ctx->selectedMonIndex[ctx->battlerIdTarget];
        }

        for (monIndex = index0; monIndex < indexEnd; monIndex++) {
            mon = Party_GetMonByIndex(party, monIndex);
            if (GetMonData(mon, MON_DATA_SPECIES, 0) != SPECIES_NONE
                && !GetMonData(mon, MON_DATA_IS_EGG, 0)
                && GetMonData(mon, MON_DATA_HP, 0) != 0) {
                cnt++;
            }
        }

        if (cnt <= cntMax) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else if (WhirlwindCheck(battleSystem, ctx)) {
            do {
                do {
                    monIndex = (BattleSystem_Random(battleSystem) % maxRand);
                    monIndex += index0;
                } while (monIndex == monIndexA || monIndex == monIndexB);
                mon = Party_GetMonByIndex(party, monIndex);
            } while (GetMonData(mon, MON_DATA_SPECIES, 0) == SPECIES_NONE
                || GetMonData(mon, MON_DATA_IS_EGG, 0) == TRUE
                || GetMonData(mon, MON_DATA_HP, 0) == 0);
            ctx->unk_21A0[ctx->battlerIdTarget] = monIndex;
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }

    } else if (WhirlwindCheck(battleSystem, ctx) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Transform(BattleSystem *battleSystem, BattleContext *ctx) {
    u32 i;
    u8 *src, *dest;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= STATUS2_TRANSFORM;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.disabledMove = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.disabledTurns = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.transformPersonality = ctx->battleMons[ctx->battlerIdTarget].personality;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.transformGender = ctx->battleMons[ctx->battlerIdTarget].gender;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.mimicedMoveIndex = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;

    src = (u8 *)&ctx->battleMons[ctx->battlerIdAttacker];
    dest = (u8 *)&ctx->battleMons[ctx->battlerIdTarget];

    for (i = 0; i < 40; i++) {
        src[i] = dest[i];
    }

    ctx->battleMons[ctx->battlerIdAttacker].sendOutFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].intimidateFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].traceFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].downloadFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].anticipationFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].forewarnFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].friskFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].moldBreakerFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].pressureFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.truantFlag = ctx->totalTurns & 1;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.slowStartTurns = ctx->totalTurns + 1;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartEnded = 0;

    for (i = 0; (int)i < MAX_MON_MOVES; i++) {
        if (ctx->trainerAIData.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp < 5) {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = ctx->trainerAIData.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = 5;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrySpikes(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker) ^ 1;

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers == 3) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SPIKES;
        ctx->fieldSideConditionData[fieldSide].spikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckSpikes(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(battleSystem, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers && ctx->battleMons[battlerId].hp) {
        ctx->hpCalc = (5 - ctx->fieldSideConditionData[fieldSide].spikesLayers) * 2;
        ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalc);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPerishSong(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    ctx->calcTemp = maxBattlers;

    int cnt = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_PERISH_SONG || ctx->battleMons[battlerId].hp == 0 || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF) == TRUE) {
            cnt++;
        } else {
            ctx->battleMons[battlerId].moveEffectFlags |= MOVE_EFFECT_FLAG_PERISH_SONG;
            ctx->battleMons[battlerId].unk88.perishSongTurns = 3;
        }
    }
    if (cnt == maxBattlers) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetTurnOrderBySpeed(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 *unkPtr = BattleScriptGetVarPointer(battleSystem, ctx, BattleScriptReadWord(ctx));

    *unkPtr = ctx->turnOrder[ctx->unk_3104];

    return FALSE;
}

BOOL BtlCmd_GoToIfValidMon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 varId = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);
    u32 *battlerId = BattleScriptGetVarPointer(battleSystem, ctx, varId);

    if (*battlerId < BattleSystem_GetMaxBattlers(battleSystem)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_EndOfTurnWeatherEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, BattleScriptReadWord(ctx));

    ctx->tempData = 0;
    ctx->hpCalc = 0;

    u32 type1 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL);
    u32 type2 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL);

    if (CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == 0 && CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == 0) {
        if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
            if (type1 != TYPE_ROCK && type2 != TYPE_ROCK && type1 != TYPE_STEEL && type2 != TYPE_STEEL && type1 != TYPE_GROUND && type2 != TYPE_GROUND && ctx->battleMons[battlerId].hp && GetBattlerAbility(ctx, battlerId) != ABILITY_SAND_VEIL && !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                ctx->moveTemp = MOVE_SANDSTORM;
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);
            }
        }
        if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN || GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                }
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->tempData = 2;
                }
            }
        }
        if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_ICE_BODY) {
                    if (ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp) {
                        ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                    }
                } else if (type1 != TYPE_ICE && type2 != TYPE_ICE && GetBattlerAbility(ctx, battlerId) != ABILITY_SNOW_CLOAK) {
                    ctx->moveTemp = MOVE_HAIL;
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);
                }
            }
        }
        if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp && GetBattlerAbility(ctx, battlerId) == ABILITY_RAIN_DISH) {
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
            }
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp && GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN) {
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 8);
            }
            if (ctx->battleMons[battlerId].hp && (u8)ctx->battleMons[battlerId].status && GetBattlerAbility(ctx, battlerId) == ABILITY_HYDRATION) {
                if (ctx->battleMons[battlerId].status & STATUS_SLEEP) {
                    ctx->msgTemp = 0;
                } else if (ctx->battleMons[battlerId].status & STATUS_POISON_ALL) {
                    ctx->msgTemp = 1;
                } else if (ctx->battleMons[battlerId].status & STATUS_BURN) {
                    ctx->msgTemp = 2;
                } else if (ctx->battleMons[battlerId].status & STATUS_PARALYSIS) {
                    ctx->msgTemp = 3;
                } else {
                    ctx->msgTemp = 4;
                }
                ctx->tempData = 1;
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_CalcRolloutPower(BattleSystem *battleSystem, BattleContext *ctx) {
    int i, j;
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].rolloutCount = ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    if (!(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_LOCKED_INTO_MOVE)) {
        LockBattlerIntoCurrentMove(battleSystem, ctx, ctx->battlerIdAttacker);
        ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount = 5;
    }

    if (--ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount == 0) {
        UnlockBattlerOutOfCurrentMove(battleSystem, ctx, ctx->battlerIdAttacker);
    }

    ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power;

    j = 5 - ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    for (i = 1; i < j; i++) {
        ctx->movePower *= 2;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_DEFENSE_CURL) {
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_CalcFuryCutterPower(BattleSystem *battleSystem, BattleContext *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount < 5) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount++;
    }

    ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power;

    for (i = 1; i < ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount; i++) {
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_TryAttract(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTemp].gender == ctx->battleMons[ctx->battlerIdStatChange].gender || ctx->battleMons[ctx->battlerIdStatChange].status2 & STATUS2_ATTRACT || ctx->battleMons[ctx->battlerIdTemp].gender == 2 || ctx->battleMons[ctx->battlerIdStatChange].gender == 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdStatChange].status2 |= MaskOfFlagNo(ctx->battlerIdTemp) << 16;
    }

    return FALSE;
}

BOOL BtlCmd_TrySafeguard(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int fieldSide = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[fieldSide] & SIDE_CONDITION_SAFEGUARD) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SAFEGUARD;
        ctx->fieldSideConditionData[fieldSide].safeguardTurns = 5;
        ctx->fieldSideConditionData[fieldSide].safeguardBattler = ctx->battlerIdAttacker;
        ctx->buffMsg.tag = TAG_NONE_SIDE;
        ctx->buffMsg.param[0] = ctx->battlerIdAttacker;
        // "Your team became cloaked in a mystical veil!"
        ctx->buffMsg.id = msg_0197_00198;
    }

    return FALSE;
}

BOOL BtlCmd_Present(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int adrs = BattleScriptReadWord(ctx);
    int rand = (u8)BattleSystem_Random(battleSystem);

    if (rand < 102) {
        ctx->movePower = 40;
    } else if (rand < 178) {
        ctx->movePower = 80;
    } else if (rand < 204) {
        ctx->movePower = 120;
    } else {
        ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdTarget].maxHp, 4);
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CalcMagnitudePower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->magnitude == 0) {
        ctx->magnitude = BattleSystem_Random(battleSystem) % 100;
        if (ctx->magnitude < 5) {
            ctx->movePower = 10;
            ctx->magnitude = 4;
        } else if (ctx->magnitude < 15) {
            ctx->movePower = 30;
            ctx->magnitude = 5;
        } else if (ctx->magnitude < 35) {
            ctx->movePower = 50;
            ctx->magnitude = 6;
        } else if (ctx->magnitude < 65) {
            ctx->movePower = 70;
            ctx->magnitude = 7;
        } else if (ctx->magnitude < 85) {
            ctx->movePower = 90;
            ctx->magnitude = 8;
        } else if (ctx->magnitude < 95) {
            ctx->movePower = 110;
            ctx->magnitude = 9;
        } else {
            ctx->movePower = 150;
            ctx->magnitude = 10;
        }
    }

    ctx->msgTemp = ctx->magnitude;

    return FALSE;
}

BOOL BtlCmd_TryReplaceFaintedMon(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (!CanSwitchMon(battleSystem, ctx, battlerId)) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else if (flag == 1) {
        ctx->unk_13C[battlerId] |= 1;
    }

    return FALSE;
}

BOOL BtlCmd_RapidSpin(BattleSystem *battleSystem, BattleContext *ctx) {
    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);

    // Binding Moves
    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_BIND) {
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_BIND;
        ctx->battlerIdTemp = ctx->battleMons[ctx->battlerIdAttacker].unk88.battlerIdBinding;
        ctx->moveTemp = ctx->battleMons[ctx->battlerIdAttacker].unk88.bindingMove;
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BREAK_BIND_EFFECT);
        return FALSE;
    }

    // Leech Seed
    if (ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED) {
        ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags &= ~MOVE_EFFECT_FLAG_LEECH_SEED;
        ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags &= ~3;
        ctx->moveTemp = 73;
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BLOW_AWAY_HAZARDS);
        return FALSE;
    }

    // Spikes
    if (ctx->fieldSideConditionData[side].spikesLayers) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_SPIKES;
        ctx->fieldSideConditionData[side].spikesLayers = 0;
        ctx->moveTemp = MOVE_SPIKES;
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BLOW_AWAY_HAZARDS);
        return FALSE;
    }

    // Toxic Spikes
    if (ctx->fieldSideConditionData[side].toxicSpikesLayers) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_TOXIC_SPIKES;
        ctx->fieldSideConditionData[side].toxicSpikesLayers = 0;
        ctx->moveTemp = MOVE_TOXIC_SPIKES;
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BLOW_AWAY_HAZARDS);
        return FALSE;
    }

    // Stealth Rocks
    if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_STEALTH_ROCKS) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_STEALTH_ROCKS;
        ctx->moveTemp = MOVE_STEALTH_ROCK;
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BLOW_AWAY_HAZARDS);
        return FALSE;
    }

    BattleScriptIncrementPointer(ctx, 1);

    return FALSE;
}

BOOL BtlCmd_WeatherHPRecovery(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!(ctx->fieldCondition & FIELD_CONDITION_WEATHER) || CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) || CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        ctx->hpCalc = ctx->battleMons[ctx->battlerIdAttacker].maxHp / 2;
    } else if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
        ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp * 20, 30);
    } else {
        ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);
    }

    return FALSE;
}

BOOL BtlCmd_CalcHiddenPowerParams(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = ((ctx->battleMons[ctx->battlerIdAttacker].hpIV & 2) >> 1) | (ctx->battleMons[ctx->battlerIdAttacker].atkIV & 2) | ((ctx->battleMons[ctx->battlerIdAttacker].defIV & 2) << 1) | ((ctx->battleMons[ctx->battlerIdAttacker].speedIV & 2) << 2) | ((ctx->battleMons[ctx->battlerIdAttacker].spAtkIV & 2) << 3) | ((ctx->battleMons[ctx->battlerIdAttacker].spDefIV & 2) << 4);
    ctx->moveType = (ctx->battleMons[ctx->battlerIdAttacker].hpIV & 1) | ((ctx->battleMons[ctx->battlerIdAttacker].atkIV & 1) << 1) | ((ctx->battleMons[ctx->battlerIdAttacker].defIV & 1) << 2) | ((ctx->battleMons[ctx->battlerIdAttacker].speedIV & 1) << 3) | ((ctx->battleMons[ctx->battlerIdAttacker].spAtkIV & 1) << 4) | ((ctx->battleMons[ctx->battlerIdAttacker].spDefIV & 1) << 5);

    ctx->movePower = ctx->movePower * 40 / 63 + 30;
    ctx->moveType = ctx->moveType * 15 / 63 + 1;

    if (ctx->moveType >= TYPE_MYSTERY) {
        ctx->moveType++;
    }

    return FALSE;
}

BOOL BtlCmd_CopyStatStages(BattleSystem *battleSystem, BattleContext *ctx) {
    int stat;

    BattleScriptIncrementPointer(ctx, 1);

    for (stat = 0; stat < 8; stat++) {
        ctx->battleMons[ctx->battlerIdAttacker].statChanges[stat] = ctx->battleMons[ctx->battlerIdTarget].statChanges[stat];
    }

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_FOCUS_ENERGY);

    return FALSE;
}

BOOL BtlCmd_TryFutureSight(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] == 0) {
        int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);
        ctx->fieldSideConditionFlags[side] |= SIDE_CONDITION_FUTURE_SIGHT;
        ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] = 3;
        ctx->fieldConditionData.futureSightMoveNo[ctx->battlerIdTarget] = ctx->moveNoCur;
        ctx->fieldConditionData.battlerIdFutureSight[ctx->battlerIdTarget] = ctx->battlerIdAttacker;
        int damage = CalcMoveDamage(battleSystem, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[side], ctx->fieldCondition, 0, 0, ctx->battlerIdAttacker, ctx->battlerIdTarget, 1) * -1;
        ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ApplyDamageRange(battleSystem, ctx, damage);
        if (ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag) {
            ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] * 15 / 10;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckMoveHit(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideAttacker = BattleScriptReadWord(ctx);
    int sideTarget = BattleScriptReadWord(ctx);
    int move = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerIdAttacker = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideAttacker);
    int battlerIdTarget = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideTarget);
    int moveMsgNo = GetMoveMessageNo(ctx, move);

    BattleSystem_CheckMoveHitEffect(battleSystem, ctx, battlerIdAttacker, battlerIdTarget, moveMsgNo);

    if (ctx->moveStatusFlag & 0x1fd849) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryTeleport(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 adrs = BattleScriptReadWord(ctx);

    if (CantEscape(battleSystem, ctx, ctx->battlerIdAttacker, NULL)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_BeatUp(BattleSystem *battleSystem, BattleContext *ctx) {
    int species;
    int form;
    int level;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int monCnt = BattleSystem_GetPartySize(battleSystem, ctx->battlerIdAttacker);

    if (ctx->multiHitCountTemp == 0) {
        ctx->multiHitCountTemp = 2;
        ctx->checkMultiHit = 253;
        ctx->beatUpCount = 0;

        while (TRUE) {
            mon = BattleSystem_GetPartyMon(battleSystem, ctx->battlerIdAttacker, ctx->beatUpCount);
            if (ctx->beatUpCount == ctx->selectedMonIndex[ctx->battlerIdAttacker]
                || (GetMonData(mon, MON_DATA_HP, 0) != 0
                    && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                    && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG
                    && GetMonData(mon, MON_DATA_STATUS, 0) == STATUS_NONE)) {
                break;
            }
            ctx->beatUpCount++;
        }
    }

    mon = BattleSystem_GetPartyMon(battleSystem, ctx->battlerIdAttacker, ctx->beatUpCount);
    species = GetMonData(mon, MON_DATA_SPECIES, 0);
    form = GetMonData(mon, MON_DATA_FORM, 0);
    level = GetMonData(mon, MON_DATA_LEVEL, 0);

    ctx->damage = GetMonBaseStat_HandleAlternateForm(species, form, BASE_ATK);
    ctx->damage *= ctx->trainerAIData.moveData[ctx->moveNoCur].power;
    ctx->damage *= (level * 2 / 5 + 2);
    ctx->damage /= (u32)GetMonBaseStat_HandleAlternateForm(ctx->battleMons[ctx->battlerIdTarget].species, ctx->battleMons[ctx->battlerIdTarget].form, BASE_DEF);
    ctx->damage /= 50;
    ctx->damage += 2;
    ctx->damage *= ctx->criticalMultiplier;
    if (ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag) {
        ctx->damage = ctx->damage * 15 / 10;
    }
    ctx->damage = ApplyDamageRange(battleSystem, ctx, ctx->damage);
    ctx->damage *= -1;

    // "{0}'s attack!"
    ctx->buffMsg.id = msg_0197_00481;
    ctx->buffMsg.tag = TAG_NICKNAME;
    ctx->buffMsg.param[0] = (ctx->battlerIdAttacker | (ctx->beatUpCount << 8));

    ctx->beatUpCount++;
    ctx->multiHitCount = 2;

    if (ctx->beatUpCount < monCnt) {
        while (TRUE) {
            mon = BattleSystem_GetPartyMon(battleSystem, ctx->battlerIdAttacker, ctx->beatUpCount);
            if (ctx->beatUpCount == ctx->selectedMonIndex[ctx->battlerIdAttacker]
                || (GetMonData(mon, MON_DATA_HP, 0) != 0
                    && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                    && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG
                    && GetMonData(mon, MON_DATA_STATUS, 0) == STATUS_NONE)) {
                break;
            }
            ctx->beatUpCount++;
            if (ctx->beatUpCount >= monCnt) {
                ctx->multiHitCount = 1;
                break;
            }
        }
    } else {
        ctx->multiHitCount = 1;
    }

    return FALSE;
}

BOOL BtlCmd_FollowMe(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    ctx->fieldSideConditionData[side].followMeFlag = TRUE;
    ctx->fieldSideConditionData[side].battlerIdFollowMe = ctx->battlerIdAttacker;

    return FALSE;
}

BOOL BtlCmd_TryHelpingHand(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    if (battleType & BATTLE_TYPE_DOUBLES) {
        battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, 16);
        if ((ctx->switchInFlag & MaskOfFlagNo(battlerId)) == 0 && ctx->playerActions[battlerId].command != CONTROLLER_COMMAND_40 && ctx->battleMons[battlerId].hp && !ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag && !ctx->turnData[battlerId].helpingHandFlag) {
            ctx->battlerIdTemp = battlerId;
            ctx->turnData[battlerId].helpingHandFlag = TRUE;
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySwapItems(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrsA = BattleScriptReadWord(ctx);
    int adrsB = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(battleSystem);
    int sideAttacker = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    int sideTarget = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);

    if (BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker) && (battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) == 0) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if ((ctx->fieldSideConditionData[sideAttacker].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdAttacker])) || (ctx->fieldSideConditionData[sideTarget].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdTarget]))) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if ((ctx->battleMons[ctx->battlerIdAttacker].item == 0 && ctx->battleMons[ctx->battlerIdTarget].item == 0) || !CanTrickHeldItem(ctx, ctx->battlerIdAttacker) || !CanTrickHeldItem(ctx, ctx->battlerIdTarget)) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrsB);
    }

    return FALSE;
}

BOOL BtlCmd_TryWish(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->fieldConditionData.wishTurns[ctx->battlerIdAttacker]) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldConditionData.wishTurns[ctx->battlerIdAttacker] = 2;
        ctx->fieldConditionData.wishTarget[ctx->battlerIdAttacker] = ctx->selectedMonIndex[ctx->battlerIdAttacker];
    }

    return FALSE;
}

BOOL BtlCmd_TryAssist(BattleSystem *battleSystem, BattleContext *ctx) {
    u32 unkA;
    u16 avaliableMoves[6 * 4];
    u16 move;
    int i, j, monCnt, moveCnt;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    unkA = BattleScriptReadWord(ctx);

    moveCnt = 0;
    monCnt = BattleSystem_GetPartySize(battleSystem, ctx->battlerIdAttacker);

    for (i = 0; i < monCnt; i++) {
        if (i != ctx->selectedMonIndex[ctx->battlerIdAttacker]) {
            mon = BattleSystem_GetPartyMon(battleSystem, ctx->battlerIdAttacker, i);
            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, 0);
                    if (CheckMoveCallsOtherMove(move) == FALSE && CheckLegalMetronomeMove(battleSystem, ctx, ctx->battlerIdAttacker, move) == TRUE) {
                        avaliableMoves[moveCnt] = move;
                        moveCnt++;
                    }
                }
            }
        }
    }

    if (moveCnt) {
        ctx->moveTemp = avaliableMoves[BattleSystem_Random(battleSystem) % moveCnt];
    } else {
        BattleScriptIncrementPointer(ctx, unkA);
    }

    return FALSE;
}

BOOL BtlCmd_TrySetMagicCoat(BattleSystem *battleSystem, BattleContext *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);
    u32 unkA = BattleScriptReadWord(ctx);

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSystem); i++) {}

    if (ctx->battlersOnField == 1) {
        BattleScriptIncrementPointer(ctx, unkA);
    } else {
        ctx->turnData[ctx->battlerIdAttacker].magicCoatFlag = 1;
    }

    return FALSE;
}

BOOL BtlCmd_MagicCoat(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    int battlerId = ctx->battlerIdAttacker;
    ctx->battlerIdMagicCoat = battlerId;
    ctx->battlerIdAttacker = ctx->battlerIdTarget;

    if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
        ctx->battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
    } else if (ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ADJACENT_OPPONENTS || ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ALL_ADJACENT) {
        ctx->battlerIdTarget = battlerId;
    } else {
        side = ov12_022506D4(battleSystem, ctx, ctx->battlerIdAttacker, (u16)ctx->moveNoCur, 1, 0);
        if (ctx->selfTurnData[side].lightningRodFlag || ctx->selfTurnData[side].stormDrainFlag) {
            ctx->battlerIdTarget = side;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
    }

    ctx->battleStatus2 |= BATTLE_STATUS2_MAGIC_COAT;

    return FALSE;
}

BOOL BtlCmd_CalcRevengeDamageMul(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ctx->turnData[ctx->battlerIdAttacker].physicalDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitPhysicalDamage & MaskOfFlagNo(ctx->battlerIdTarget)) || (ctx->turnData[ctx->battlerIdAttacker].specialDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitSpecialDamage & MaskOfFlagNo(ctx->battlerIdTarget))) {
        ctx->unk_2158 = 20;
    } else {
        ctx->unk_2158 = 10;
    }

    return FALSE;
}

BOOL BtlCmd_TryBreakScreens(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);

    if ((ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_REFLECT) || (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_LIGHT_SCREEN)) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_REFLECT;
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_LIGHT_SCREEN;
        ctx->fieldSideConditionData[side].reflectTurns = 0;
        ctx->fieldSideConditionData[side].lightScreenTurns = 0;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryYawn(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    u32 adrs = BattleScriptReadWord(ctx);
    if (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_YAWN) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags |= (2 << MOVE_EFFECT_FLAG_YAWN_SHIFT);
    }

    return FALSE;
}

BOOL BtlCmd_TryKnockOff(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        // "{0}'s {1} made {2} ineffective!"
        ctx->buffMsg.id = msg_0197_00714;
        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_MOVE;
        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdTarget);
        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdTarget].ability;
        ctx->buffMsg.param[2] = ctx->moveNoCur;
    } else if (ctx->battleMons[ctx->battlerIdTarget].item) {
        // "{0} knocked off {1}'s {2}!"
        ctx->buffMsg.id = msg_0197_00552;
        ctx->buffMsg.tag = TAG_NICKNAME_NICKNAME_ITEM;
        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
        ctx->buffMsg.param[1] = CreateNicknameTag(ctx, ctx->battlerIdTarget);
        ctx->buffMsg.param[2] = ctx->battleMons[ctx->battlerIdTarget].item;
        ctx->battleMons[ctx->battlerIdTarget].item = 0;
        ctx->fieldSideConditionData[side].battlerBitKnockedOffItem |= MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdTarget]);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CalcHPFalloffPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->movePower == 0) {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power * ctx->battleMons[ctx->battlerIdAttacker].hp / ctx->battleMons[ctx->battlerIdAttacker].maxHp;
        if (ctx->movePower == 0) {
            ctx->movePower = 1;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryImprison(BattleSystem *battleSystem, BattleContext *ctx) {
    int adrs, side, i, j, battlerId, maxBattlers, battlerIdA, battlerIdB;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    battlerIdA = ov12_0223ABB8(battleSystem, ctx->battlerIdAttacker, 0);
    battlerIdB = ov12_0223ABB8(battleSystem, ctx->battlerIdAttacker, 2);

    ctx->battleMons[battlerIdA].moveEffectFlags |= MOVE_EFFECT_FLAG_IMPRISON;
    ctx->battleMons[battlerIdB].moveEffectFlags |= MOVE_EFFECT_FLAG_IMPRISON;

    if (ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags & MOVE_EFFECT_FLAG_IMPRISON_USER) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
        maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if (side != BattleSystem_GetFieldSide(battleSystem, battlerId)) {
                for (i = 0; i < MAX_MON_MOVES; i++) {
                    for (j = 0; j < MAX_MON_MOVES; j++) {
                        if ((ctx->battleMons[ctx->battlerIdAttacker].moves[i] == ctx->battleMons[battlerId].moves[j]) && ctx->battleMons[ctx->battlerIdAttacker].moves[i] && ctx->battleMons[battlerId].moves[j]) {
                            break;
                        }
                    }
                    if (j != MAX_MON_MOVES) {
                        break;
                    }
                }
                if (j != MAX_MON_MOVES) {
                    break;
                }
            }
        }
        if (battlerId == maxBattlers) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags |= MOVE_EFFECT_FLAG_IMPRISON_USER;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryGrudge(BattleSystem *battleSystem, BattleContext *ctx) {
    int pos;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdFainted].moveEffectFlags & MOVE_EFFECT_FLAG_GRUDGE && BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker) != BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdFainted) && ctx->battleMons[ctx->battlerIdAttacker].hp && ctx->moveNoTemp != MOVE_STRUGGLE) {
        pos = ctx->movePos[ctx->battlerIdAttacker];
        ctx->battleMons[ctx->battlerIdAttacker].movePPCur[pos] = 0;
        ctx->moveTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[pos];
        CopyBattleMonToPartyMon(battleSystem, ctx, ctx->battlerIdAttacker);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySnatch(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    u32 maxBattlers;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    maxBattlers = 0;
    for (battlerId = 0; battlerId < BattleSystem_GetMaxBattlers(battleSystem); battlerId++) {
        if (ctx->battleMons[battlerId].hp) {
            maxBattlers++;
        }
    }

    if (ctx->battlersOnField == 1) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->turnData[ctx->battlerIdAttacker].snatchFlag = TRUE;
    }

    return FALSE;
}

extern u16 sLowKickDamageTable[6][2];

BOOL BtlCmd_CalcWeightBasedPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int cnt = 0;
    int weight = ctx->battleMons[ctx->battlerIdTarget].weight;

    do {
        if (sLowKickDamageTable[cnt][0] >= weight) {
            break;
        }
        cnt++;
    } while (sLowKickDamageTable[cnt][0] != 0xffff);

    if (sLowKickDamageTable[cnt][0] != 0xffff) {
        ctx->movePower = sLowKickDamageTable[cnt][1];
    } else {
        ctx->movePower = 120;
    }

    return FALSE;
}

BOOL BtlCmd_CalcWeatherBallParams(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        if (ctx->fieldCondition & FIELD_CONDITION_WEATHER) {
            ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power * 2;
            if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
                ctx->moveType = TYPE_WATER;
            }
            if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
                ctx->moveType = TYPE_ROCK;
            }
            if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
                ctx->moveType = TYPE_FIRE;
            }
            if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
                ctx->moveType = TYPE_ICE;
            }
        } else {
            ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryPursuit(BattleSystem *battleSystem, BattleContext *ctx) {
    int adrs, battlerId, maxBattlers, moveNo, moveIndex;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);
    maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->playerActions[battlerId].command != CONTROLLER_COMMAND_40 && ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].status & 39) && !CheckTruant(ctx, battlerId) && BattleSystem_GetFieldSide(battleSystem, battlerId) != BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdSwitch)) {
            if (ctx->battleMons[battlerId].unk88.encoredMove && ctx->battleMons[battlerId].unk88.encoredMove == ctx->battleMons[battlerId].moves[ctx->battleMons[battlerId].unk88.encoredMoveIndex]) {
                moveNo = ctx->battleMons[battlerId].unk88.encoredMove;
            } else {
                moveNo = GetBattlerSelectedMove(ctx, battlerId);
            }
            if (moveNo) {
                moveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[battlerId], moveNo);
                if (ctx->trainerAIData.moveData[moveNo].effect == MOVE_EFFECT_HIT_BEFORE_SWITCH && ctx->battleMons[battlerId].movePPCur[moveIndex]) {
                    ctx->battleMons[battlerId].movePPCur[moveIndex]--;
                    if (GetBattlerAbility(ctx, ctx->battlerIdSwitch) == ABILITY_PRESSURE && ctx->battleMons[battlerId].movePPCur[moveIndex]) {
                        ctx->battleMons[battlerId].movePPCur[moveIndex]--;
                    }
                    ov12_02252D14(battleSystem, ctx);
                    ctx->battlerIdAttacker = battlerId;
                    ctx->battlerIdTarget = ctx->battlerIdSwitch;
                    ctx->unk_2158 = 20;
                    ctx->moveNoCur = moveNo;
                    ctx->moveNoBattlerPrev[battlerId] = moveNo;
                    ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_40;
                    CopyBattleMonToPartyMon(battleSystem, ctx, battlerId);
                    break;
                }
            }
        }
    }

    if (battlerId == maxBattlers) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        int itemEffect = GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker);
        GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0);

        if (itemEffect == HOLD_EFFECT_CHOICE_ATK || itemEffect == HOLD_EFFECT_CHOICE_SPEED || itemEffect == HOLD_EFFECT_CHOICE_SPATK) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.moveNoChoice = moveNo;
        }
    }

    return FALSE;
}

BOOL BtlCmd_ApplyTypeEffectiveness(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->damage = ov12_02251D28(battleSystem, ctx, ctx->moveNoCur, ctx->moveType, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->damage, &ctx->moveStatusFlag);

    return FALSE;
}

BOOL BtlCmd_IfTurnFlag(BattleSystem *battleSystem, BattleContext *ctx) {
    int ret = FALSE;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    switch (flag) {
    case 0:
        if (ctx->turnData[battlerId].struggleFlag == val) {
            ret = TRUE;
        }
        break;
    case 1:
        if (ctx->turnData[battlerId].unk0_1 == val) {
            ret = TRUE;
        }
        break;
    case 2:
        if (ctx->turnData[battlerId].protectFlag == val) {
            ret = TRUE;
        }
        break;
    case 3:
        if (ctx->turnData[battlerId].helpingHandFlag == val) {
            ret = TRUE;
        }
        break;
    case 4:
        if (ctx->turnData[battlerId].magicCoatFlag == val) {
            ret = TRUE;
        }
        break;
    case 5:
        if (ctx->turnData[battlerId].snatchFlag == val) {
            ret = TRUE;
        }
        break;
    case 6:
        if (ctx->turnData[battlerId].roostFlag == val) {
            ret = TRUE;
        }
        break;
    }

    if (ret) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SetTurnFlag(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    switch (flag) {
    case 0:
        ctx->turnData[battlerId].struggleFlag = val;
        break;
    case 1:
        ctx->turnData[battlerId].unk0_1 = val;
        break;
    case 2:
        ctx->turnData[battlerId].protectFlag = val;
        break;
    case 3:
        ctx->turnData[battlerId].helpingHandFlag = val;
        break;
    case 4:
        ctx->turnData[battlerId].magicCoatFlag = val;
        break;
    case 5:
        ctx->turnData[battlerId].snatchFlag = val;
        break;
    case 6:
        ctx->turnData[battlerId].roostFlag = val;
        break;
    }

    return FALSE;
}

BOOL BtlCmd_CalcGyroBallPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + 25 * ctx->effectiveSpeed[ctx->battlerIdTarget] / ctx->effectiveSpeed[ctx->battlerIdAttacker];

    if (ctx->movePower > 150) {
        ctx->movePower = 150;
    }

    return FALSE;
}

BOOL BtlCmd_TryMetalBurst(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int sideA = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(battleSystem, ctx->turnData[ctx->battlerIdAttacker].unk38);

    if (ctx->turnData[ctx->battlerIdAttacker].unk34 && sideA != sideB && ctx->battleMons[ctx->turnData[ctx->battlerIdAttacker].unk38].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].unk34 * 15 / 10;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = ctx->turnData[ctx->battlerIdAttacker].unk38;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->commandNext = CONTROLLER_COMMAND_39;
                BattleScriptJump(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CalcPaybackPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->playerActions[ctx->battlerIdTarget].command == CONTROLLER_COMMAND_40) {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power * 2;
    } else {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power;
    }

    return FALSE;
}

extern u8 sTrumpCardPowerTable[];

BOOL BtlCmd_CalcTrumpCardPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u8 pp = ctx->battleMons[ctx->battlerIdAttacker].movePPCur[ctx->movePos[ctx->battlerIdAttacker]];

    if (pp > 4) {
        pp = 4;
    }

    ctx->movePower = sTrumpCardPowerTable[pp];

    return FALSE;
}

BOOL BtlCmd_CalcWringOutPower(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + (120 * ctx->battleMons[ctx->battlerIdTarget].hp) / ctx->battleMons[ctx->battlerIdTarget].maxHp;

    return FALSE;
}

BOOL BtlCmd_TryMeFirst(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u16 move;

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove && ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == ctx->battleMons[ctx->battlerIdTarget].moves[ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex]) {
        move = ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove;
    } else {
        move = GetBattlerSelectedMove(ctx, ctx->battlerIdTarget);
    }

    if (ctx->playerActions[ctx->battlerIdTarget].command != CONTROLLER_COMMAND_40 && ctx->turnData[ctx->battlerIdTarget].struggleFlag == 0 && CheckLegalMeFirstMove(ctx, move) == TRUE && ctx->trainerAIData.moveData[move].power) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag = TRUE;
        ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount = ctx->meFirstTotal;
        ctx->moveTemp = move;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryCopycat(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (CheckMoveCallsOtherMove(ctx->moveNoPrev) == FALSE && ctx->moveNoPrev && CheckLegalMetronomeMove(battleSystem, ctx, ctx->battlerIdAttacker, ctx->moveNoPrev) == TRUE) {
        ctx->moveTemp = ctx->moveNoPrev;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CalcPunishmentPower(BattleSystem *battleSystem, BattleContext *ctx) {
    int stat, cnt;

    BattleScriptIncrementPointer(ctx, 1);

    cnt = 0;
    for (stat = 0; stat < 8; stat++) {
        if (ctx->battleMons[ctx->battlerIdTarget].statChanges[stat] > 6) {
            cnt += ctx->battleMons[ctx->battlerIdTarget].statChanges[stat] - 6;
        }
    }

    ctx->movePower = 60 + 20 * cnt;

    if (ctx->movePower > 200) {
        ctx->movePower = 200;
    }

    return FALSE;
}

BOOL BtlCmd_TrySuckerPunch(BattleSystem *battleSystem, BattleContext *ctx) {
    int move;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove && ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == ctx->battleMons[ctx->battlerIdTarget].moves[ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex]) {
        move = ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove;
    } else {
        move = GetBattlerSelectedMove(ctx, ctx->battlerIdTarget);
    }

    if (ctx->playerActions[ctx->battlerIdTarget].command == CONTROLLER_COMMAND_40 || (ctx->trainerAIData.moveData[move].power == 0 && !ctx->turnData[ctx->battlerIdTarget].struggleFlag)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckSideCondition(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSystem_GetFieldSide(battleSystem, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side));

    int var;

    switch (unkB) {
    case 0:
    case 1:
        switch (flag) {
        case 0:
            var = ctx->fieldSideConditionData[fieldSide].reflectTurns;
            break;
        case 1:
            var = ctx->fieldSideConditionData[fieldSide].lightScreenTurns;
            break;
        case 2:
            var = ctx->fieldSideConditionData[fieldSide].mistTurns;
            break;
        case 3:
            var = ctx->fieldSideConditionData[fieldSide].safeguardTurns;
            break;
        case 4:
            var = ctx->fieldSideConditionData[fieldSide].spikesLayers;
            break;
        case 5:
            var = ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers;
            break;
        }
        break;
    case 2:
        switch (flag) {
        case 0:
            ctx->fieldSideConditionData[fieldSide].reflectTurns = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~1;
            break;
        case 1:
            ctx->fieldSideConditionData[fieldSide].lightScreenTurns = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~2;
            break;
        case 2:
            ctx->fieldSideConditionData[fieldSide].mistTurns = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~64;
            break;
        case 3:
            ctx->fieldSideConditionData[fieldSide].safeguardTurns = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~8;
            break;
        case 4:
            ctx->fieldSideConditionData[fieldSide].spikesLayers = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~4;
            break;
        case 5:
            ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers = 0;
            ctx->fieldSideConditionFlags[fieldSide] &= ~(1 << 10);
            break;
        }
        break;
    }

    if (unkB == 0 && !var) {
        BattleScriptIncrementPointer(ctx, adrs);
    }
    if (unkB == 1 && var) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryFeint(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!ctx->turnData[ctx->battlerIdTarget].protectFlag) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPyschoShift(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].status || ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_SUBSTITUTE || !ctx->battleMons[ctx->battlerIdAttacker].status) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryLastResort(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int cnt = GetBattlerLearnedMoveCount(battleSystem, ctx, ctx->battlerIdAttacker);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount < cnt - 1 || cnt < 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryToxicSpikes(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int side = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker) ^ 1;

    if (ctx->fieldSideConditionData[side].toxicSpikesLayers == 2) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = TRUE;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[side] |= (1 << 10);
        ctx->fieldSideConditionData[side].toxicSpikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckToxicSpikes(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(battleSystem, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers) {
        ctx->calcTemp = ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers;
        ctx->statChangeType = 6;
        ctx->battlerIdStatChange = battlerId;
        if (GetBattlerVar(ctx, ctx->battlerIdSwitch, BMON_DATA_TYPE_1, NULL) == TYPE_POISON || GetBattlerVar(ctx, ctx->battlerIdSwitch, BMON_DATA_TYPE_2, NULL) == TYPE_POISON) {
            ctx->fieldSideConditionFlags[fieldSide] &= ~(1 << 10);
            ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers = 0;
            ctx->calcTemp = 0;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckIgnorableAbility(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int flag = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == 0) {
        int index;
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

        for (index = 0; index < maxBattlers; index++) {
            battlerId = ctx->turnOrder[index];
            if (flag == 0) {
                if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ability) == TRUE && ctx->battleMons[battlerId].hp) {
                    BattleScriptIncrementPointer(ctx, adrs);
                    ctx->battlerIdAbility = battlerId;
                    break;
                }
            } else if (!CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ability) || !ctx->battleMons[battlerId].hp) {
                BattleScriptIncrementPointer(ctx, adrs);
                ctx->battlerIdAbility = battlerId;
                break;
            }
        }
    } else {
        battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
        if (flag == 0) {
            if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ability) == TRUE && ctx->battleMons[battlerId].hp) {
                BattleScriptIncrementPointer(ctx, adrs);
                ctx->battlerIdAbility = battlerId;
            }
        } else if (!CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ability) || !ctx->battleMons[battlerId].hp) {
            BattleScriptIncrementPointer(ctx, adrs);
            ctx->battlerIdAbility = battlerId;
        }
    }

    return FALSE;
}

BOOL BtlCmd_IfSameSide(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerIdA = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideA);
    int battlerIdB = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, sideB);

    if (BattleSystem_GetFieldSide(battleSystem, battlerIdA) == BattleSystem_GetFieldSide(battleSystem, battlerIdB)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

extern const u16 sPickupTable1[18];
extern const u16 sPickupTable2[11];
extern const u8 sPickupWeightTable[9];
extern const u8 sHoneyGatherChanceTable[10];

BOOL BtlCmd_GenerateEndOfBattleItem(BattleSystem *battleSystem, BattleContext *ctx) {
    int rnd, i, j, k;
    u16 species, item;
    u8 ability, lvl;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    for (i = 0; i < BattleSystem_GetPartySize(battleSystem, 0); i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, 0, i);
        species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
        ability = GetMonData(mon, MON_DATA_ABILITY, 0);
        if (ability == ABILITY_PICKUP
            && species != SPECIES_NONE
            && species != SPECIES_EGG
            && item == ITEM_NONE
            && !(BattleSystem_Random(battleSystem) % 10)) {
            rnd = BattleSystem_Random(battleSystem) % 100;
            lvl = (GetMonData(mon, MON_DATA_LEVEL, 0) - 1) / 10;
            if (lvl >= 10) {
                lvl = 9;
            }
            for (j = 0; j < 9; j++) {
                if (sPickupWeightTable[j] > rnd) {
                    SetMonData(mon, MON_DATA_HELD_ITEM, &sPickupTable1[lvl + j]);
                    break;
                } else if (rnd >= 98 && rnd <= 99) {
                    SetMonData(mon, MON_DATA_HELD_ITEM, &sPickupTable2[lvl + (99 - rnd)]);
                    break;
                }
            }
        }
        if (ability == ABILITY_HONEY_GATHER
            && species != SPECIES_NONE
            && species != SPECIES_EGG
            && item == ITEM_NONE) {
            j = 0;
            k = 10;
            lvl = GetMonData(mon, MON_DATA_LEVEL, 0);
            while (lvl > k) {
                j++;
                k += 10;
            }

            GF_ASSERT(j < 10);

            if ((BattleSystem_Random(battleSystem) % 100) < sHoneyGatherChanceTable[j]) {
                j = ITEM_HONEY;
                SetMonData(mon, MON_DATA_HELD_ITEM, &j);
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrickRoom(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].trickRoomFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_IfMovedThisTurn(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (ov12_0225561C(ctx, battlerId) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckItemHoldEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int flag = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int itemEffect = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (flag == 0) {
        if (GetBattlerHeldItemEffect(ctx, battlerId) == itemEffect) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else if (GetBattlerHeldItemEffect(ctx, battlerId) != itemEffect) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetItemHoldEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *holdEffect = BattleScriptGetVarPointer(battleSystem, ctx, varId);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    u16 item = GetBattlerHeldItem(ctx, battlerId);
    *holdEffect = GetItemVar(ctx, item, ITEM_VAR_HOLD_EFFECT);

    return FALSE;
}

BOOL BtlCmd_GetItemEffectParam(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *var = BattleScriptGetVarPointer(battleSystem, ctx, varId);
    u16 item = GetBattlerHeldItem(ctx, BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side));
    *var = GetItemVar(ctx, item, ITEM_VAR_MODIFIER);

    return FALSE;
}

extern const u8 sCamouflageTypeTable[13];

BOOL BtlCmd_TryCamouflage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    Terrain terrain = BattleSystem_GetTerrainId(battleSystem);
    if (terrain > TERRAIN_OTHERS) {
        terrain = TERRAIN_OTHERS;
    }
    int type = sCamouflageTypeTable[terrain];

    if (GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) != type && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) != type) {
        ctx->battleMons[ctx->battlerIdAttacker].type1 = type;
        ctx->battleMons[ctx->battlerIdAttacker].type2 = type;
        ctx->msgTemp = type;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

extern u16 sNaturePowerMoveTable[];

BOOL BtlCmd_GetTerrainMove(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSystem_GetTerrainId(battleSystem);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->moveTemp = sNaturePowerMoveTable[terrain];

    return FALSE;
}

extern u32 sSecretPowerEffectTable[];

BOOL BtlCmd_GetTerrainSecondaryEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSystem_GetTerrainId(battleSystem);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->unk_2174 = sSecretPowerEffectTable[terrain];

    return FALSE;
}

BOOL BtlCmd_CalcNaturalGiftParams(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int power = GetNaturalGiftPower(ctx, ctx->battlerIdAttacker);

    if (power) {
        ctx->movePower = power;
        ctx->moveType = GetNaturalGiftType(ctx, ctx->battlerIdAttacker);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPluck(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if ((ctx->battleMons[ctx->battlerIdTarget].item && ctx->battleMons[ctx->battlerIdTarget].unk88.custapBerryFlag) || TryEatOpponentBerry(battleSystem, ctx, ctx->battlerIdTarget) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs2);
    }

    return FALSE;
}

BOOL BtlCmd_TryFling(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (TryFling(battleSystem, ctx, ctx->battlerIdAttacker) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_YesNoMenu(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDrawYesNoBox(battleSystem, ctx, 0, 0, BattleScriptReadWord(ctx), 0, 0);

    return FALSE;
}

BOOL BtlCmd_WaitYesNoResult(BattleSystem *battleSystem, BattleContext *ctx) {
    u8 selection = BattleBuffer_GetNext(ctx, 0);

    if (selection) {
        BattleScriptIncrementPointer(ctx, 1);

        int adrsYes = BattleScriptReadWord(ctx);
        int adrsNo = BattleScriptReadWord(ctx);

        if (selection == 255) {
            BattleScriptIncrementPointer(ctx, adrsNo);
        } else {
            BattleScriptIncrementPointer(ctx, adrsYes);
        }

        ov12_0223BDDC(battleSystem, 0, selection);
    }

    ctx->battleContinueFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_ChoosePokemonMenu(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleSystem_GetMaxBattlers(battleSystem);
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitShowMonList(battleSystem, ctx, 0, 0, 0, 6);
    ctx->battlerIdSwitch = 0;

    return FALSE;
}

BOOL BtlCmd_WaitPokemonMenuResult(BattleSystem *battleSystem, BattleContext *ctx) {
    u8 selection = BattleBuffer_GetNext(ctx, 0);

    if (selection) {
        BattleScriptIncrementPointer(ctx, 1);
        int adrs = BattleScriptReadWord(ctx);

        if (selection == 255) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ctx->unk_21A0[0] = selection - 1;
        }
    }

    ctx->battleContinueFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_SetLinkBattleResult(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (BattleSystem_GetBattleType(battleSystem) & 4) {
        BattleController_EmitSetBattleResults(battleSystem);
    }

    return FALSE;
}

BOOL BtlCmd_CheckStealthRock(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(battleSystem, battlerId);
    int type1 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL);
    int type2 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL);

    if (ctx->fieldSideConditionFlags[fieldSide] & 128 && ctx->battleMons[battlerId].hp) {
        switch (CalculateTypeEffectiveness(TYPE_ROCK, type1, type2)) {
        case 160:
            ctx->hpCalc = 2;
            break;
        case 80:
            ctx->hpCalc = 4;
            break;
        case 40:
            ctx->hpCalc = 8;
            break;
        case 20:
            ctx->hpCalc = 16;
            break;
        case 10:
            ctx->hpCalc = 32;
            break;
        case 0:
            BattleScriptIncrementPointer(ctx, adrs);
            return FALSE;
        default:
            GF_ASSERT(FALSE);
            break;
        }
        ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalc);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckEffectActivation(BattleSystem *battleSystem, BattleContext *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SERENE_GRACE) {
        effectChance = ctx->trainerAIData.moveData[ctx->moveNoCur].effectChance * 2;
    } else {
        effectChance = ctx->trainerAIData.moveData[ctx->moveNoCur].effectChance;
    }

    GF_ASSERT(effectChance != 0);

    if ((BattleSystem_Random(battleSystem) % 100) < effectChance && ctx->battleMons[ctx->battlerIdStatChange].hp) {
        return FALSE;
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_CheckChatterActivation(BattleSystem *battleSystem, BattleContext *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int param;

    if (ctx->battleMons[ctx->battlerIdAttacker].species == SPECIES_CHATOT && ctx->battleMons[ctx->battlerIdTarget].hp && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 21))) {
        if ((BattleSystem_GetBattleSpecial(battleSystem) & BATTLE_SPECIAL_RECORDING) == FALSE) {
            param = sub_02006EFC(BattleSystem_GetChatotVoice(battleSystem, ctx->battlerIdAttacker));
        } else {
            param = BattleSystem_GetChatotVoiceParam(battleSystem, ctx->battlerIdAttacker);
        }

        switch (param) {
        default:
        case 0:
            effectChance = 0;
            break;
        case 1:
            effectChance = 10;
            break;
        case 2:
            effectChance = 30;
            break;
        }
        if ((BattleSystem_Random(battleSystem) % 100) > effectChance) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetCurrentMoveData(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcTemp = GetMoveTblAttr(&ctx->trainerAIData.moveData[ctx->moveNoCur], (MoveAttr)BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_SetMosaic(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int param = BattleScriptReadWord(ctx);
    int delay = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitPlayMosaicAnimation(battleSystem, battlerId, param, delay);

    return FALSE;
}

BOOL BtlCmd_ChangeForm(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    BattleController_EmitChangeForm(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_SetBattleBackground(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitSetBattleBackground(battleSystem, 0);
    return FALSE;
}

BOOL BtlCmd_UseBagItem(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleSystem_RecoverStatus(battleSystem, battlerId, ctx->selectedMonIndex[battlerId], 0, ctx->itemTemp);

    return FALSE;
}

BOOL BtlCmd_TryEscape(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (BattleTryRun(battleSystem, ctx, battlerId)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_ShowBattleStartPartyGauge(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitInitStartBallGauge(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_HideBattleStartPartyGauge(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitDeleteStartBallGauge(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_ShowPartyGauge(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitInitBallGauge(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_HidePartyGauge(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitDeleteBallGauge(battleSystem, battlerId);

    return FALSE;
}

BOOL BtlCmd_LoadPartyGaugeGraphics(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitLoadBallGfx(battleSystem);

    return FALSE;
}

BOOL BtlCmd_FreePartyGaugeGraphics(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDeleteBallGfx(battleSystem);

    return FALSE;
}

BOOL BtlCmd_IncrementGameStat(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int id = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitIncrementGameStat(battleSystem, battlerId, flag, id);

    return FALSE;
}

BOOL BtlCmd_RestoreSprite(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    ov12_02263F8C(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_TriggerAbilityOnHit(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (CheckAbilityEffectOnHit(battleSystem, ctx, &ctx->tempData) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SpriteToOAM(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                ov12_02264038(battleSystem, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                ov12_02264038(battleSystem, battlerId);
            }
        }
        break;
    default:
        battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
        ov12_02264038(battleSystem, battlerId);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_OAMToSprite(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                ov12_02264054(battleSystem, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(battleSystem, battlerId);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                ov12_02264054(battleSystem, battlerId);
            }
        }
        break;
    default:
        battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
        ov12_02264054(battleSystem, battlerId);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_CheckWhiteout(BattleSystem *battleSystem, BattleContext *ctx) {
    int i;
    int adrs;
    int battlerId;
    int partyHp = 0;

    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    adrs = BattleScriptReadWord(ctx);

    int battleType = BattleSystem_GetBattleType(battleSystem);
    battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (battleType & BATTLE_TYPE_MULTI || (battleType & BATTLE_TYPE_TAG && BattleSystem_GetFieldSide(battleSystem, battlerId))) {
        Party *party1 = BattleSystem_GetParty(battleSystem, battlerId);
        Party *party2 = BattleSystem_GetParty(battleSystem, BattleSystem_GetBattlerIdPartner(battleSystem, battlerId));

        BattleSystem_GetOpponentData(battleSystem, battlerId);

        for (i = 0; i < Party_GetCount(party1); i++) {
            mon = Party_GetMonByIndex(party1, i);
            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if ((battleType == 75 || battleType == 74) && BattleSystem_GetFieldSide(battleSystem, battlerId) == 0 && ov12_0223AB0C(battleSystem, battlerId) == 2) {

        } else {
            for (i = 0; i < Party_GetCount(party2); i++) {
                mon = Party_GetMonByIndex(party2, i);
                if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                    && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                    partyHp += GetMonData(mon, MON_DATA_HP, 0);
                }
            }
        }

        if (partyHp == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        Party *party = BattleSystem_GetParty(battleSystem, battlerId);

        BattleSystem_GetOpponentData(battleSystem, battlerId);

        for (i = 0; i < Party_GetCount(party); i++) {
            mon = Party_GetMonByIndex(party, i);
            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if (partyHp == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_BoostRandomStatBy2(BattleSystem *battleSystem, BattleContext *ctx) {
    int i, cnt;
    int statChanges[8];
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    cnt = 0;
    for (i = 1; i < 8; i++) {
        if (ctx->battleMons[ctx->battlerIdTarget].statChanges[i] < 12) {
            statChanges[cnt++] = i - 1;
        }
    }

    if (cnt) {
        ctx->unk_2170 = 39 + statChanges[BattleSystem_Random(battleSystem) % cnt];
        ctx->unk_2170 |= (1 << 31);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_RemoveItem(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    ctx->recycleItem[battlerId] = ctx->battleMons[battlerId].item;

    ctx->battleMons[battlerId].item = 0;

    CopyBattleMonToPartyMon(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_TryRecycle(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->recycleItem[ctx->battlerIdAttacker]) {
        ctx->itemTemp = ctx->recycleItem[ctx->battlerIdAttacker];
        ctx->recycleItem[ctx->battlerIdAttacker] = 0;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckItemHoldEffectOnHit(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (!CheckItemEffectOnHit(battleSystem, ctx, &ctx->tempData)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_PrintBattleResultMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintResultMessage(battleSystem);

    return FALSE;
}

BOOL BtlCmd_PrintEscapeMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitRunAwayMessage(battleSystem, ctx);

    return FALSE;
}

BOOL BtlCmd_PrintForfeitMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitForefitMessage(battleSystem);

    return FALSE;
}

BOOL BtlCmd_CheckHoldOnWith1HP(BattleSystem *battleSystem, BattleContext *ctx) {
    BOOL flag = FALSE;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    int itemEffect = GetBattlerHeldItemEffect(ctx, battlerId);
    int activationChance = GetHeldItemModifier(ctx, battlerId, 0);

    if (itemEffect == HOLD_EFFECT_MAYBE_ENDURE && (BattleSystem_Random(battleSystem) % 100) < activationChance) {
        flag = TRUE;
    }
    if (itemEffect == HOLD_EFFECT_ENDURE && ctx->battleMons[battlerId].hp == ctx->battleMons[battlerId].maxHp) {
        flag = TRUE;
    }

    if (flag && (ctx->battleMons[battlerId].hp + ctx->hpCalc) <= 0) {
        ctx->hpCalc = (ctx->battleMons[battlerId].hp - 1) * -1;
        ctx->moveStatusFlag |= 256;
    }

    return FALSE;
}

BOOL BtlCmd_TryRestoreStatusOnSwitch(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    if (ctx->battleMons[battlerId].hp && ctx->selectedMonIndex[battlerId] != 6) {
        Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battlerId, ctx->selectedMonIndex[battlerId]);
        int ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
        int status = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (ctx->battleMons[battlerId].ability != ABILITY_NATURAL_CURE && !CheckStatusHealSwitch(ctx, ability, status)) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckSubstitute(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (ctx->battleMons[battlerId].status2 & (1 << 24) || ctx->selfTurnData[battlerId].unk14 & 8) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckIgnoreWeather(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {

    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SetRandomTarget(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_CheckItemHoldEffectOnUTurn(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckItemEffectOnUTurn(battleSystem, ctx, &ctx->tempData)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_RefreshSprite(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitSwapToSubstituteSprite(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_PlayMoveHitSound(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitPlayMoveSE(battleSystem, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_PlayBGM(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int song = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleController_EmitPlaySong(battleSystem, battlerId, song);

    return FALSE;
}

BOOL BtlCmd_CheckSafariGameDone(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!(BattleSystem_GetPartySize(battleSystem, 0) != 6 || PCStorage_FindFirstBoxWithEmptySlot(battleSystem->storage) != 18)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_WaitTime(BattleSystem *battleSystem, BattleContext *ctx) {
    int tSpeed;

    BattleScriptIncrementPointer(ctx, 1);

    int wait = BattleScriptReadWord(ctx);

    if ((battleSystem->battleType & BATTLE_TYPE_LINK) && !(battleSystem->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
        tSpeed = 2;
    } else {
        tSpeed = 1;
    }

    if (wait > ctx->unk_F0) {
        BattleScriptIncrementPointer(ctx, -2);
        ctx->unk_F0 += tSpeed;
    } else {
        ctx->unk_F0 = 0;
    }

    ctx->battleContinueFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_CheckCurMoveIsType(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int type = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (ctx->trainerAIData.moveData[ctx->moveNoCur].type == type) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_LoadArchivedMonData(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int species = BattleScriptReadWord(ctx);
    int form = BattleScriptReadWord(ctx);
    int stat = BattleScriptReadWord(ctx);

    int *formPtr = BattleScriptGetVarPointer(battleSystem, ctx, form);

    ctx->calcTemp = GetMonBaseStat_HandleAlternateForm(species, *formPtr, stat);

    return FALSE;
}

BOOL BtlCmd_RefreshMonData(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    BattleSystem_ReloadMonData(battleSystem, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_222(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msgIndex = BattleScriptReadWord(ctx);

    int battlerId = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);

    if (TrainerMessageWithIdPairExists(BattleSystem_GetTrainerIndex(battleSystem, battlerId), msgIndex, HEAP_ID_BATTLE)) {
        ctx->msgTemp = msgIndex;
    } else {
        ctx->msgTemp = 0;
    }

    return FALSE;
}

BOOL BtlCmd_223(BattleSystem *battleSystem, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int a2 = BattleScriptReadWord(ctx);

    ov12_022645C8(battleSystem, ctx, a2 & 1);

    return FALSE;
}

BOOL BtlCmd_EndScript(BattleSystem *battleSystem, BattleContext *ctx) {
    ctx->battleContinueFlag = TRUE;

    return ov12_0224EC74(ctx);
}

int BattleScriptReadWord(BattleContext *ctx) {
    int data = ctx->battleScriptBuffer[ctx->scriptSeqNo];

    ctx->scriptSeqNo++;

    return data;
}

static void BattleScriptIncrementPointer(BattleContext *ctx, int adrs) {
    ctx->scriptSeqNo += adrs;
}

static void BattleScriptJump(BattleContext *ctx, NarcId narcId, int adrs) {
    ReadBattleScriptFromNarc(ctx, narcId, adrs);
}

static void BattleScriptGotoSubscript(BattleContext *ctx, NarcId narcId, int adrs) {
    ov12_0224EBDC(ctx, narcId, adrs);
}

static void *BattleScriptGetVarPointer(BattleSystem *battleSystem, BattleContext *ctx, int var) {
    switch (var) {
    case BSCRIPT_VAR_BATTLE_TYPE:
        return &battleSystem->battleType;
    case BSCRIPT_VAR_CRITICAL_BOOSTS:
        return &ctx->criticalCnt;
    case BSCRIPT_VAR_SIDE_EFFECT_FLAGS_DIRECT:
        return &ctx->unk_2170;
    case BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT:
        return &ctx->unk_2174;
    case BSCRIPT_VAR_SIDE_EFFECT_FLAGS_ABILITY:
        return &ctx->unk_2178;
    case BSCRIPT_VAR_SIDE_EFFECT_TYPE:
        return &ctx->statChangeType;
    case BSCRIPT_VAR_BATTLE_STATUS:
        return &ctx->battleStatus;
    case BSCRIPT_VAR_FIELD_CONDITION:
        return &ctx->fieldCondition;
    case BSCRIPT_VAR_POWER_MULTI:
        return &ctx->unk_2158;
    case BSCRIPT_VAR_CALC_TEMP:
        return &ctx->calcTemp;
    case BSCRIPT_VAR_MOVE_STATUS_FLAGS:
        return &ctx->moveStatusFlag;
    case BSCRIPT_VAR_SIDE_CONDITION_ATTACKER:
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker)];
    case BSCRIPT_VAR_SIDE_CONDITION_TARGET:
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget)];
    case BSCRIPT_VAR_SIDE_CONDITION_STAT_CHANGE:
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdStatChange)];
    case BSCRIPT_VAR_DAMAGE:
        return &ctx->damage;
    case BSCRIPT_VAR_BATTLER_ATTACKER:
        return &ctx->battlerIdAttacker;
    case BSCRIPT_VAR_BATTLER_TARGET:
        return &ctx->battlerIdTarget;
    case BSCRIPT_VAR_BATTLER_STAT_CHANGE:
        return &ctx->battlerIdStatChange;
    case BSCRIPT_VAR_BATTLER_FAINTED:
        return &ctx->battlerIdFainted;
    case BSCRIPT_VAR_BATTLER_SWITCH:
        return &ctx->battlerIdSwitch;
    case BSCRIPT_VAR_MSG_BATTLER_TEMP:
        return &ctx->battlerIdTemp;
    case BSCRIPT_VAR_ATTACKER_STORED_DAMAGE:
        return &ctx->unk_30E4[ctx->battlerIdAttacker];
    case BSCRIPT_VAR_MESSAGE:
        return &ctx->msgTemp;
    case BSCRIPT_VAR_PAY_DAY_COUNT:
        return &ctx->unk_14C;
    case BSCRIPT_VAR_MOVE_NO_CUR:
        return &ctx->moveNoCur;
    case BSCRIPT_VAR_TOTAL_TURNS:
        return &ctx->totalTurns;
    case BSCRIPT_VAR_MSG_ATTACKER:
        return &ctx->battlerIdLeechSeedRecv;
    case BSCRIPT_VAR_MSG_DEFENDER:
        return &ctx->battlerIdLeechSeeded;
    case BSCRIPT_VAR_MOVE_NO_TEMP:
        return &ctx->moveNoTemp;
    case BSCRIPT_VAR_LAST_BATTLER_ID:
        return &ctx->unk_98;
    case BSCRIPT_VAR_MOVE_POWER:
        return &ctx->movePower;
    case BSCRIPT_VAR_AFTER_MOVE_MESSAGE_TYPE:
        return &ctx->unk_38;
    case BSCRIPT_VAR_HP_CALC:
        return &ctx->hpCalc;
    case BSCRIPT_VAR_BATTLE_OUTCOME:
        return &battleSystem->battleOutcomeFlag;
    case BSCRIPT_VAR_SIDE_EFFECT_PARAM:
        return &ctx->statChangeParam;
    case BSCRIPT_VAR_MSG_MOVE_TEMP:
        return &ctx->moveTemp;
    case BSCRIPT_VAR_MSG_ITEM_TEMP:
        return &ctx->itemTemp;
    case BSCRIPT_VAR_MSG_ABILITY_TEMP:
        return &ctx->abilityTemp;
    case BSCRIPT_VAR_WEATHER_TURNS:
        return &ctx->fieldConditionData.weatherTurns;
    case BSCRIPT_VAR_BATTLER_SPEED_TEMP:
        return &ctx->unk_3104;
    case BSCRIPT_VAR_MULTI_HIT_LOOP:
        return &ctx->unk_2180;
    case BSCRIPT_VAR_PHYSICAL_DAMAGE:
        return &ctx->turnData[ctx->battlerIdAttacker].battlerBitPhysicalDamage;
    case BSCRIPT_VAR_SPECIAL_DAMAGE:
        return &ctx->turnData[ctx->battlerIdAttacker].battlerBitSpecialDamage;
    case BSCRIPT_VAR_TEMP_DATA:
        return &ctx->tempData;
    case BSCRIPT_VAR_CRIT_MULTIPLIER:
        return &ctx->criticalMultiplier;
    case BSCRIPT_VAR_ATTACKER_LAST_DAMAGE_TAKEN:
        return &ctx->turnData[ctx->battlerIdAttacker].unk34;
    case BSCRIPT_VAR_DEFENDER_LAST_DAMAGE_TAKEN:
        return &ctx->turnData[ctx->battlerIdTarget].unk34;
    case BSCRIPT_VAR_ATTACKER_SELF_TURN_STATUS_FLAGS:
        return &ctx->selfTurnData[ctx->battlerIdAttacker].unk14;
    case BSCRIPT_VAR_DEFENDER_SELF_TURN_STATUS_FLAGS:
        return &ctx->selfTurnData[ctx->battlerIdTarget].unk14;
    case BSCRIPT_VAR_SIDE_EFFECT_MON_SELF_TURN_STATUS_FLAGS:
        return &ctx->selfTurnData[ctx->battlerIdStatChange].unk14;
    case BSCRIPT_VAR_FLING_DATA:
        return &ctx->flingData;
    case BSCRIPT_VAR_FLING_SCRIPT:
        return &ctx->flingScript;
    case BSCRIPT_VAR_BATTLE_SYS_STATUS:
        return &battleSystem->battleSpecial;
    case BSCRIPT_VAR_ATTACKER_LOCKED_MOVE:
        return &ctx->moveNoLockedInto[ctx->battlerIdAttacker];
    case BSCRIPT_VAR_HIT_DAMAGE:
        return &ctx->hitDamage;
    case BSCRIPT_VAR_SAFARI_BALL_CNT:
        return &battleSystem->safariBallCnt;
    case BSCRIPT_VAR_SWITCHED_MON_TEMP:
        return &ctx->battlerIdSwitchTemp;
    case BSCRIPT_VAR_MOVE_TYPE:
        return &ctx->moveType;
    case BSCRIPT_VAR_MOVE_EFFECT_CHANCE:
        return &ctx->unk_2164;
    case BSCRIPT_VAR_REGULATION_FLAG:
        return &battleSystem->unk241C;
    case BSCRIPT_VAR_BATTLE_STATUS_2:
        return &ctx->battleStatus2;
    case BSCRIPT_VAR_TURN_ORDER_COUNTER:
        return &ctx->executionIndex;
    case BSCRIPT_VAR_MAX_BATTLERS:
        return &battleSystem->maxBattlers;
    case BSCRIPT_VAR_BATTLER_ATTACKER_TEMP:
        return &ctx->battlerIdAttackerTemp;
    case BSCRIPT_VAR_BATTLER_TARGET_TEMP:
        return &ctx->battlerIdTargetTemp;
    case BSCRIPT_VAR_PHYSICAL_DAMAGE_TAKEN:
        return &ctx->selfTurnData[ctx->battlerIdTarget].physicalDamage;
    case BSCRIPT_VAR_MSG_BATTLER_TEMP_ASSURANCE_DAMAGE_MASK:
        return &ctx->turnData[ctx->battlerIdTemp].unk3C;
    case BSCRIPT_VAR_DEFENDER_ASSURANCE_DAMAGE_MASK:
        return &ctx->turnData[ctx->battlerIdTarget].unk3C;
    case BSCRIPT_VAR_ATTACKER_SHELL_BELL_DAMAGE_DEALT:
        return &ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage;
    case BSCRIPT_VAR_WAITING_BATTLERS:
        return &ctx->battlersOnField;
    case BSCRIPT_VAR_70:
        return &battleSystem->unk2478;
    }

    return NULL;
}

enum {
    STATE_GET_EXP_START = 0,
    STATE_GET_EXP_WAIT_MESSAGE_PRINT,
    STATE_GET_EXP_WAIT_MESSAGE_DELAY,
    STATE_GET_EXP_GAUGE,
    STATE_GET_EXP_WAIT_GAUGE,
    STATE_GET_EXP_CHECK_LEVEL_UP,
    STATE_GET_EXP_WAIT_LEVEL_UP_EFFECT,
    STATE_GET_EXP_WAIT_LEVEL_UP_MESSAGE_PRINT,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_LOAD_ICON,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_INIT,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF_WAIT,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE,
    STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE_WAIT,
    STATE_GET_EXP_LEVEL_UP_CLEAR,
    STATE_GET_EXP_CHECK_LEARN_MOVE,
    STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT,
    STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT_WAIT,
    STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT,
    STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT_WAIT,
    STATE_GET_EXP_MAKE_IT_FORGET_PROMPT,
    STATE_GET_EXP_MAKE_IT_FORGET_ANSWER,
    STATE_GET_EXP_MAKE_IT_FORGET_WAIT,
    STATE_GET_EXP_MAKE_IT_FORGET_INPUT_TAKEN,
    STATE_GET_EXP_ONE_TWO_POOF,
    STATE_GET_EXP_ONE_TWO_POOF_WAIT,
    STATE_GET_EXP_FORGOT_HOW_TO_USE,
    STATE_GET_EXP_FORGOT_HOW_TO_USE_WAIT,
    STATE_GET_EXP_AND_DOTDOTDOT,
    STATE_GET_EXP_AND_DOTDOTDOT_WAIT,
    STATE_GET_EXP_LEARNED_MOVE,
    STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED,
    STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED_WAIT,
    STATE_GET_EXP_GIVE_UP_LEARNING_PROMPT,
    STATE_GET_EXP_GIVE_UP_LEARNING_ANSWER,
    STATE_GET_EXP_GIVE_UP_LEARNING_WAIT,
    STATE_GET_EXP_LEARNED_MOVE_WAIT,
    STATE_GET_EXP_CHECK_DONE,
    STATE_GET_EXP_DONE,
};

// Note: these structs are needed to match *only as long as the data is in the assembly*
// when the data gets decompiled, they should be embeded in the function as arrays
typedef struct TempStatsStruct {
    u32 stats[6];
} TempStatsStruct;

extern TempStatsStruct ov12_0226C354;
extern TempStatsStruct ov12_0226C36C;
extern TempStatsStruct ov12_0226C384;
extern TempStatsStruct ov12_0226C33C;

static void Task_GetExp(SysTask *task, void *inData) {
    int i;
    int slot;
    GetterWork *data = inData;
    Pokemon *mon;
    BattleMessage msg;
    int side;
    int expBattler;
    MsgData *msgLoader;
    u32 battleType;
    u16 item;
    int itemEffect;

    msgLoader = BattleSystem_GetMessageLoader(data->battleSystem);
    battleType = BattleSystem_GetBattleType(data->battleSystem);
    side = (data->ctx->battlerIdFainted >> 1) & 1; // Get side of fainted mon (left or right)
    expBattler = 0;

    // Figure out which mon we're working on
    for (slot = data->tempData[DATA_GET_EXP_PARTY_SLOT]; slot < BattleSystem_GetPartySize(data->battleSystem, expBattler); slot++) {
        mon = BattleSystem_GetPartyMon(data->battleSystem, expBattler, slot);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        itemEffect = GetItemAttr(item, ITEM_VAR_HOLD_EFFECT, HEAP_ID_BATTLE);

        if (itemEffect == HOLD_EFFECT_EXP_SHARE || (data->ctx->unk_A4[side] & MaskOfFlagNo(slot))) {
            break;
        }
    }

    if (slot == BattleSystem_GetPartySize(data->battleSystem, expBattler)) {
        data->state = STATE_GET_EXP_DONE;
    } else if ((battleType & BATTLE_TYPE_DOUBLES)
        && !(battleType & BATTLE_TYPE_AI)
        && data->ctx->selectedMonIndex[BATTLER_PLAYER2] == slot) {
        expBattler = 2;
    }

    switch (data->state) {
    case STATE_GET_EXP_START:
        item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        itemEffect = GetItemAttr(item, ITEM_VAR_HOLD_EFFECT, HEAP_ID_BATTLE);

        // Declare victory if all wild mons have been defeated
        if (!(battleType & BATTLE_TYPE_TRAINER)
            && data->ctx->battleMons[BATTLER_ENEMY].hp
                    + data->ctx->battleMons[BATTLER_ENEMY2].hp
                == 0
            && GetMonData(mon, MON_DATA_HP, NULL)
            && !data->ctx->unk_3144) {
            PlayBGM(SEQ_GS_WIN2);
            data->ctx->unk_3144 = TRUE;
            BattleSystem_SetCriticalHpMusicFlag(data->battleSystem, CRITICAL_MUSIC_OFF);
        }

        u32 totalExp = 0;
        // "{0} gained {1} Exp. Points!"
        msg.id = msg_0197_00001;

        if (GetMonData(mon, MON_DATA_HP, NULL) && GetMonData(mon, MON_DATA_LEVEL, NULL) != 100) {
            if (data->ctx->unk_A4[side] & MaskOfFlagNo(slot)) {
                totalExp = data->ctx->gainedExp;
            }

            if (itemEffect == HOLD_EFFECT_EXP_SHARE) {
                totalExp += data->ctx->partyGainedExp;
            }

            if (itemEffect == HOLD_EFFECT_EXP_UP) {
                totalExp = totalExp * 150 / 100;
            }

            if (battleType & BATTLE_TYPE_TRAINER) {
                totalExp = totalExp * 150 / 100;
            }

            if (!ov12_022568B0(data->battleSystem, mon)) {
                if (GetMonData(mon, MON_DATA_LANGUAGE, NULL) != gGameLanguage) {
                    totalExp = totalExp * 170 / 100;
                } else {
                    totalExp = totalExp * 150 / 100;
                }
                // "{0} gained a boosted {1} Exp. Points!"
                msg.id = msg_0197_00002;
            }

            u32 newExp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
            data->tempData[DATA_GET_EXP_PREV_PROGRESS_TO_NEXT_LEVEL] = newExp - GetMonBaseExperienceAtCurrentLevel(mon);
            newExp += totalExp;

            if (slot == data->ctx->selectedMonIndex[expBattler]) {
                data->ctx->battleMons[expBattler].exp = newExp;
            }

            SetMonData(mon, MON_DATA_EXPERIENCE, &newExp);

            BattleScript_CalcEffortValues(BattleSystem_GetParty(data->battleSystem, expBattler),
                slot,
                data->ctx->battleMons[data->ctx->battlerIdFainted].species,
                data->ctx->battleMons[data->ctx->battlerIdFainted].form);
        }

        if (totalExp) {
            msg.tag = TAG_NICKNAME_NUM;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = totalExp;
            data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_EXP_FRAME_COUNTER] = 7;
            data->state++;
        } else {
            data->state = STATE_GET_EXP_CHECK_DONE;
        }

        break;

    case STATE_GET_EXP_WAIT_MESSAGE_PRINT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID])) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_WAIT_MESSAGE_DELAY:
        if (--data->tempData[DATA_GET_EXP_FRAME_COUNTER] == 0) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_GAUGE:
        // Only animate the gauge for an active battler.
        if (slot == data->ctx->selectedMonIndex[expBattler]) {
            ov12_02263564(data->battleSystem, data->ctx, expBattler, data->tempData[DATA_GET_EXP_PREV_PROGRESS_TO_NEXT_LEVEL]);
            data->tempData[DATA_GET_EXP_PREV_PROGRESS_TO_NEXT_LEVEL] = 0;
            data->state++;
        } else {
            data->state = STATE_GET_EXP_CHECK_LEVEL_UP;
        }
        break;

    case STATE_GET_EXP_WAIT_GAUGE:
        if (Link_QueueNotEmpty(data->ctx)) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_CHECK_LEVEL_UP:
        if (Pokemon_TryLevelUp(mon)) {
            // Only play the special level-up animation for an active battler.
            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleController_EmitSetStatus2Effect(data->battleSystem, data->ctx, expBattler, 8);
                ov12_0226399C(data->battleSystem, expBattler);
            }

            data->state = STATE_GET_EXP_WAIT_LEVEL_UP_EFFECT;
        } else {
            data->state = STATE_GET_EXP_CHECK_DONE;
        }
        break;

    case STATE_GET_EXP_WAIT_LEVEL_UP_EFFECT:
        if (Link_QueueNotEmpty(data->ctx)) {
            TempStatsStruct stats = ov12_0226C354;
            int level = GetMonData(mon, MON_DATA_LEVEL, NULL);
            // Cache the stats from the previous level for later.
            data->ctx->prevLevelStats = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PokemonStats));
            PokemonStats *oldStats = data->ctx->prevLevelStats;
            for (i = 0; i < NUM_STATS; i++) {
                oldStats->stats[i] = GetMonData(mon, stats.stats[i], NULL);
            }

            MonApplyFriendshipMod(mon, MON_MOOD_MODIFIER_LEVEL_UP_IN_BATTLE, BattleSystem_GetLocation(data->battleSystem));
            ApplyMonMoodModifier(mon, 0);
            CalcMonStats(mon);

            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleSystem_ReloadMonData(data->battleSystem, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
            }

            data->ctx->levelUpMons |= MaskOfFlagNo(slot);
            ov12_02263A1C(data->battleSystem, data->ctx, expBattler);
            // "{0} grew to Lv. {1}!"
            msg.id = msg_0197_00003;
            msg.tag = TAG_NICKNAME_NUM;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = level;
            data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->state = STATE_GET_EXP_WAIT_LEVEL_UP_MESSAGE_PRINT;
        }
        break;

    case STATE_GET_EXP_WAIT_LEVEL_UP_MESSAGE_PRINT:
        if (TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID]) == 0) {
            data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_LOAD_ICON;
            data->tempData[DATA_GET_EXP_LEARNSET_INDEX] = 0;
        }
        break;

    case STATE_GET_EXP_LEVEL_UP_SUMMARY_LOAD_ICON:
        // Load the Pokemon's defining information on to a nameplate above the level up summary if they are not the active battler.
        if (data->ctx->selectedMonIndex[expBattler] != slot) {
            BattleSystem_LoadLevelUpNameplate(data->battleSystem, data, mon);
        }
        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_INIT;
        break;

    case STATE_GET_EXP_LEVEL_UP_SUMMARY_INIT: {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(data->battleSystem);
        Window *window = BattleSystem_GetWindow(data->battleSystem, 1);
        PaletteData *palette = BattleSystem_GetPaletteData(data->battleSystem);

        G2_SetBG0Priority(2);
        SetBgPriority(GF_BG_LYR_MAIN_1, 1);
        SetBgPriority(GF_BG_LYR_MAIN_2, 0);

        ov12_0223C224(data->battleSystem, 1);

        sub_0200E398(bgConfig, 2, 1, 0, HEAP_ID_BATTLE);
        PaletteData_LoadNarc(palette, NARC_a_0_3_8, sub_0200E3D8(), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 8 * 0x10);
        AddWindowParameterized(bgConfig, window, GF_BG_LYR_MAIN_2, 0x11, 0x7, 14, 12, 11, 9 + 1);
        FillWindowPixelBuffer(window, 0xFF);
        DrawFrameAndWindow1(window, FALSE, 1, 8);

        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF;
        break;
    }
    case STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF: {
        TempStatsStruct stats = ov12_0226C36C;
        TempStatsStruct monData = ov12_0226C384;

        Window *window = BattleSystem_GetWindow(data->battleSystem, 1);
        PokemonStats *oldStats = data->ctx->prevLevelStats;

        for (i = 0; i < NUM_STATS; i++) {
            // Stat name.
            msg.id = msg_0197_00947;
            msg.tag = TAG_STAT;
            msg.param[0] = stats.stats[i];

            ov12_0223C4E8(data->battleSystem, window, msgLoader, &msg, 0, 16 * i, 0, 0, 0);
            // "+{0}"
            msg.id = msg_0197_00948;
            msg.tag = TAG_NUMBERS;
            msg.param[0] = GetMonData(mon, monData.stats[i], NULL) - oldStats->stats[i];
            msg.numDigits = 2;

            ov12_0223C4E8(data->battleSystem, window, msgLoader, &msg, 80, 16 * i, 0, 0, 0);
        }

        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF_WAIT;
        break;
    }
    case STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE: {
        TempStatsStruct monData = ov12_0226C33C;
        Window *window = BattleSystem_GetWindow(data->battleSystem, 1);

        FillWindowPixelRect(window, 0xF, 80, 0, 36, 96); // clear out the diff section (keep the printed stat names)

        for (i = 0; i < NUM_STATS; i++) {
            // Just a number.
            msg.id = msg_0197_00949;
            msg.tag = TAG_NUMBERS;
            msg.param[0] = GetMonData(mon, monData.stats[i], NULL);
            msg.numDigits = 3;

            ov12_0223C4E8(data->battleSystem, window, msgLoader, &msg, 72, 16 * i, 0x2, 36, 0);
        }

        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE_WAIT;
        break;
    }
    case STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF_WAIT:
    case STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE_WAIT:
        if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_BUTTON_X | PAD_BUTTON_Y)) || System_GetTouchNew()) {
            PlaySE(SEQ_SE_DP_SELECT);
            data->state++;
        }
        break;

    case STATE_GET_EXP_LEVEL_UP_CLEAR: {
        Window *window = BattleSystem_GetWindow(data->battleSystem, 1);

        sub_0200E5D4(window, 0);
        RemoveWindow(window);

        G2_SetBG0Priority(1);
        SetBgPriority(GF_BG_LYR_MAIN_1, 0);
        SetBgPriority(GF_BG_LYR_MAIN_2, 1);

        ov12_0223C224(data->battleSystem, 0);

        if (data->ctx->selectedMonIndex[expBattler] != slot) {
            BattleSystem_UnloadLevelUpNameplate(data->battleSystem, data);
        }

        Heap_Free(data->ctx->prevLevelStats);
        data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        break;
    }

    case STATE_GET_EXP_CHECK_LEARN_MOVE: {
        u16 move;
        BgConfig *bgConfig = BattleSystem_GetBgConfig(data->battleSystem); // Unused, but must be kept to match.

        switch (MonTryLearnMoveOnLevelUp(mon, &data->tempData[DATA_GET_EXP_LEARNSET_INDEX], &move)) {
        case 0:
            data->state = STATE_GET_EXP_GAUGE;
            break;
        case 0xFFFE:
            break;
        case 0xFFFF:
            data->tempData[DATA_GET_EXP_MOVE_TO_LEARN] = move;
            data->state = STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT;
            break;
        default:
            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleSystem_ReloadMonData(data->battleSystem, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
            }
            // "{0} learned {1}!"
            msg.id = msg_0197_00004;
            msg.tag = TAG_NICKNAME_MOVE;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = move;
            data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->state = STATE_GET_EXP_LEARNED_MOVE_WAIT;
            break;
        }
        break;
    }

    case STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT:
        // "{0} wants to learn the move {1}."
        msg.id = msg_0197_01178;
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = data->tempData[DATA_GET_EXP_MOVE_TO_LEARN];
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT:
        // "But {0} can't learn more than four moves."
        msg.id = msg_0197_01179;
        msg.tag = TAG_NICKNAME;
        msg.param[0] = expBattler | (slot << 8);
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT_WAIT:
    case STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT_WAIT:
    case STATE_GET_EXP_ONE_TWO_POOF_WAIT:
    case STATE_GET_EXP_FORGOT_HOW_TO_USE_WAIT:
    case STATE_GET_EXP_AND_DOTDOTDOT_WAIT:
    case STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED_WAIT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID])) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_PROMPT:
        // "Make it forget another move?"
        BattleController_EmitDrawYesNoBox(data->battleSystem, data->ctx, expBattler, msg_0197_01180, 1, 0, 0);
        data->state++;
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_ANSWER:
        if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) { // TODO: could use a const
                data->state = STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED;
            } else {
                // "Which move should be forgotten?"
                msg.id = msg_0197_01183;
                msg.tag = TAG_NONE;
                data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
                data->state = STATE_GET_EXP_MAKE_IT_FORGET_WAIT;
            }
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_WAIT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID])) {
            ov12_02263D14(data->battleSystem, expBattler, data->tempData[DATA_GET_EXP_MOVE_TO_LEARN], slot);
            data->state++;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_INPUT_TAKEN:
        if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) {
            data->state = STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED;
        } else if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            data->tempData[DATA_GET_EXP_MOVE_SLOT_TO_FORGET] = data->ctx->battleBuffer[expBattler][0] - 1;
            data->state = STATE_GET_EXP_ONE_TWO_POOF;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED:
        // "Well, then..."
        msg.id = msg_0197_01184;
        msg.tag = TAG_NONE;
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_PROMPT:
        // "Should this Pokémon give up on learning this new move?"
        BattleController_EmitDrawYesNoBox(data->battleSystem, data->ctx, expBattler, msg_0197_01185, 2, data->tempData[DATA_GET_EXP_MOVE_TO_LEARN], 0);
        data->state++;
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_ANSWER:
        if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) {
                data->state = STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT;
            } else {
                // "{0} did not learn {1}."
                msg.id = msg_0197_01188;
                msg.tag = TAG_NICKNAME_MOVE;
                msg.param[0] = expBattler | (slot << 8);
                msg.param[1] = data->tempData[DATA_GET_EXP_MOVE_TO_LEARN];
                data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
                data->state = 35;
            }
        }
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_WAIT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID])) {
            // Check for another move to learn
            data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        }
        break;

    case STATE_GET_EXP_ONE_TWO_POOF:
        // "1, 2, and... ... Poof!"
        msg.id = msg_0197_01189;
        msg.tag = 0;
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_FORGOT_HOW_TO_USE:
        // "{0} forgot how to use {1}."
        msg.id = msg_0197_01190;
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = GetMonData(mon, MON_DATA_MOVE1 + data->tempData[DATA_GET_EXP_MOVE_SLOT_TO_FORGET], NULL);
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_AND_DOTDOTDOT:
        // "And..."
        msg.id = msg_0197_01191;
        msg.tag = TAG_NONE;
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
        data->state++;
        break;

    case STATE_GET_EXP_LEARNED_MOVE:
        // "{0} learned {1}!"
        msg.id = msg_0197_01192;
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = data->tempData[DATA_GET_EXP_MOVE_TO_LEARN];
        data->tempData[DATA_GET_EXP_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));

        i = 0;
        SetMonData(mon, MON_DATA_MOVE1_PP_UPS + data->tempData[DATA_GET_EXP_MOVE_SLOT_TO_FORGET], &i);
        MonSetMoveInSlot(mon, data->tempData[DATA_GET_EXP_MOVE_TO_LEARN], data->tempData[DATA_GET_EXP_MOVE_SLOT_TO_FORGET]);

        if (data->ctx->selectedMonIndex[expBattler] == slot) {
            BattleSystem_ReloadMonData(data->battleSystem, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
        }

        data->state = STATE_GET_EXP_LEARNED_MOVE_WAIT;
        break;

    case STATE_GET_EXP_LEARNED_MOVE_WAIT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_EXP_PRINTER_ID])) {
            // Check for another move to learn
            data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        }
        break;

    case STATE_GET_EXP_CHECK_DONE:
        data->ctx->unk_A4[side] &= (MaskOfFlagNo(slot) ^ 0xFFFFFFFF); // this mon is done
        data->tempData[DATA_GET_EXP_PARTY_SLOT] = slot + 1;
        data->state = STATE_GET_EXP_START; // go back to the top and get the next mon
        break;

    case STATE_GET_EXP_DONE:
        data->ctx->getterWork = NULL;
        Heap_Free(inData);
        SysTask_Destroy(task);
        break;
    }
}

static void BattleScript_CalcEffortValues(Party *party, int partySlot, u32 species, u32 form) {
    u8 stat_evs[6];
    s32 stat;
    u16 totalEVs;

    s16 gainedEVs = 0;
    struct BaseStats *baseStats = AllocAndLoadMonPersonal_HandleAlternateForm(species, form, HEAP_ID_BATTLE);
    Pokemon *mon = Party_GetMonByIndex(party, partySlot);
    u16 item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
    s32 holdEffect = GetItemAttr(item, ITEMATTR_HOLD_EFFECT, HEAP_ID_BATTLE);
    s32 holdEffectParam = GetItemAttr(item, ITEMATTR_HOLD_EFFECT_PARAM, HEAP_ID_BATTLE);

    totalEVs = 0;
    // Store any pre-existing EVs to use for comparison later.
    for (stat = STAT_HP; stat < STAT_ACC; stat++) {
        stat_evs[stat] = GetMonData(mon, stat + MON_DATA_HP_EV, NULL);
        totalEVs += stat_evs[stat];
    }

    for (stat = STAT_HP; stat < STAT_ACC; stat++) {
        // Don't bother running this loop if no more EVs can be gained.
        if (totalEVs >= MAX_EV_SUM) {
            break;
        }
        switch (stat) {
        case STAT_HP:
            gainedEVs = GetPersonalAttr(baseStats, BASE_HP_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_HP_EV_UP) { // Power Weight
                gainedEVs += holdEffectParam;
            }
            break;
        case STAT_ATK:
            gainedEVs = GetPersonalAttr(baseStats, BASE_ATK_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_ATK_EV_UP) { // Power Bracer
                gainedEVs += holdEffectParam;
            }
            break;
        case STAT_DEF:
            gainedEVs = GetPersonalAttr(baseStats, BASE_DEF_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_DEF_EV_UP) { // Power Belt
                gainedEVs += holdEffectParam;
            }
            break;
        case STAT_SPEED:
            gainedEVs = GetPersonalAttr(baseStats, BASE_SPEED_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_SPEED_EV_UP) { // Power Anklet
                gainedEVs += holdEffectParam;
            }
            break;
        case STAT_SPATK:
            gainedEVs = GetPersonalAttr(baseStats, BASE_SPATK_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_SPATK_EV_UP) { // Power Lens
                gainedEVs += holdEffectParam;
            }
            break;
        case STAT_SPDEF:
            gainedEVs = GetPersonalAttr(baseStats, BASE_SPDEF_YIELD);
            if (holdEffect == HOLD_EFFECT_LVLUP_SPDEF_EV_UP) { // Power Band
                gainedEVs += holdEffectParam;
            }
            break;
        }

        // Pokerus
        if (Party_MaskMonsWithPokerus(party, MaskOfFlagNo(partySlot))) {
            gainedEVs *= 2;
        }

        // Macho Brace
        if (holdEffect == HOLD_EFFECT_EVS_UP_SPEED_DOWN) {
            gainedEVs *= 2;
        }

        // If EVs added would cause the total of all EVs to exceed 510, reduce the gain to have the total at 510.
        // This has a very minor side effect of prioritizing EVs of a higher stat ID when reaching maximum total EVs, and discarding the remainder.
        s32 projectedTotalEVs = totalEVs + gainedEVs;
        if (projectedTotalEVs > MAX_EV_SUM) {
            gainedEVs -= projectedTotalEVs - MAX_EV_SUM;
        }

        // If EVs added to a specific stat would cause the total to exceed 255, reduce the gain to have the total at 255.
        // The maximum practical value for any stat EV total is 252, but the value's maximum was not limited to 252 until Generation VI.
        s32 projectedStatEVs = stat_evs[stat] + gainedEVs;
        if (projectedStatEVs > MAX_EV_PER_STAT) {
            gainedEVs -= projectedStatEVs - MAX_EV_PER_STAT;
        }

        stat_evs[stat] += gainedEVs;
        totalEVs += gainedEVs;
        SetMonData(mon, stat + MON_DATA_HP_EV, &stat_evs[stat]);
    }
    FreeMonPersonal(baseStats);
}

enum {
    STATE_GET_POKEMON_START = 0,
    STATE_GET_POKEMON_CHECK_IF_TRAINER,
    STATE_GET_POKEMON_CALCULATE_SHAKES,
    STATE_GET_POKEMON_BALL_FALL,
    STATE_GET_POKEMON_WAIT_FOR_BALL_FALL,
    STATE_GET_POKEMON_BALL_SHAKE,
    STATE_GET_POKEMON_BALL_SHAKE_DECREMENT,
    STATE_GET_POKEMON_BALL_CLICK,
    STATE_GET_POKEMON_GOTCHA,
    STATE_GET_POKEMON_BALL_FADE,
    STATE_GET_POKEMON_CHECK_MON_DATA, // 10
    STATE_GET_POKEMON_FADE_TO_POKEDEX,
    STATE_GET_POKEMON_POKEDEX_ENTRY,
    STATE_GET_POKEMON_DISMISS_POKEDEX_ENTRY,
    STATE_GET_POKEMON_MOVE_POKEPIC_TO_CENTER,
    STATE_GET_POKEMON_15,
    STATE_GET_POKEMON_ALREADY_CAUGHT,
    STATE_GET_POKEMON_FADE_TO_NICKNAME_ASK,
    STATE_GET_POKEMON_ASK_FOR_NICKNAME,
    STATE_GET_POKEMON_WAIT_FOR_YESNO,
    STATE_GET_POKEMON_PREPARE_NAMING_SCREEN, // 20
    STATE_GET_POKEMON_WAIT_FOR_NAMING_SCREEN,
    STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN,
    STATE_GET_POKEMON_STORE_NEW_MON_BUG_CONTEST,
    STATE_GET_POKEMON_STORE_MON_AFTER_NAMING_SCREEN,
    STATE_GET_POKEMON_FADE_UNNAMED_BOXED_MON,
    STATE_GET_POKEMON_BALL_BLOCKED,
    STATE_GET_POKEMON_NO_STEALING,
    STATE_GET_POKEMON_DONE_NO_STEALING,
    STATE_GET_POKEMON_BREAK_OUT,
    STATE_GET_POKEMON_BREAK_OUT_CLEANUP, // 30
    STATE_GET_POKEMON_BREAK_OUT_MESSAGE,
    STATE_GET_POKEMON_DONE_BREAK_OUT,
    STATE_GET_POKEMON_DONE_CAUGHT,
};

enum {
    DATA_GET_POKEMON_PRINTER_ID = 0,
    DATA_GET_POKEMON_FRAME_COUNTER,
    DATA_GET_POKEMON_BALL_SHAKES_TOTAL,
    DATA_GET_POKEMON_BALL_SHAKE_ANIMATIONS,
    DATA_GET_POKEMON_NEEDS_EXTRA_DISPOSAL_CHECK, // TODO: Needs a more accurate name.
};

enum {
    POINTER_GET_POKEMON_OVERLAY_MANAGER = 0,
    POINTER_GET_POKEMON_TASK_MANAGER,
    POINTER_GET_POKEMON_NAMING_SCREEN_OVERLAY_MANAGER = 0,
    POINTER_GET_POKEMON_NAMING_SCREEN_ARGS,
};

enum {
    BALL_ANIM_THROW = 0,
    BALL_ANIM_OPEN,
    BALL_ANIM_DEFLECT,
    BALL_ANIM_FALL,
    BALL_ANIM_SHAKE,
    BALL_ANIM_5, // Seemingly unused, at least here. When forcibly implemented, does not seem to do much for regular Pokeballs.
    BALL_ANIM_CLICK,
    BALL_ANIM_FADE,
};

static void Task_GetPokemon(SysTask *task, void *inData) {
    GetterWork *data = inData;
    SysTask *sysTask = task;
    PokepicManager *pokepicManager;
    MsgData *msgData = BattleSystem_GetMessageLoader(data->battleSystem);
    PaletteData *paletteData = BattleSystem_GetPaletteData(data->battleSystem);
    pokepicManager = BattleSystem_GetPokepicManager(data->battleSystem);

    s32 battlerId = BATTLER_ENEMY;
    if (MaskOfFlagNo(1) & data->ctx->switchInFlag) {
        battlerId = BATTLER_ENEMY2;
    }

    switch (data->state) {
    case STATE_GET_POKEMON_START:
        if (data->captureType == CAPTURE_NORMAL) {
            UnkStruct_134 unkStruct;
            unkStruct.unk8 = 3;
            unkStruct.heapID = HEAP_ID_BATTLE;
            unkStruct.unkC = battlerId + 20000;
            unkStruct.ball = data->ballID;
            unkStruct.spriteSystem = BattleSystem_GetSpriteSystem(data->battleSystem);
            unkStruct.paletteData = BattleSystem_GetPaletteData(data->battleSystem);
            unkStruct.unk14 = 1;
            unkStruct.unk18 = 0;
            unkStruct.battleSystem = data->battleSystem;
            if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_DOUBLES) {
                if (battlerId == BATTLER_ENEMY) {
                    unkStruct.unk0 = 16;
                } else { // BATTLER_ENEMY2, assumedly.
                    unkStruct.unk0 = 17;
                }
            } else { // This is a single battle.
                unkStruct.unk0 = 15;
            }
            data->ballData = ov07_02233DB8(&unkStruct); // Initializes whatever this is and gets it all ready to go.
            data->state = STATE_GET_POKEMON_CHECK_IF_TRAINER;
            PlaySE(SEQ_SE_DP_THROW);
            data->battleSystem->unk2422++;
            UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_THROW);
        } else { // CAPTURE_SAFARI
            OpponentData *opponentData = BattleSystem_GetOpponentData(data->battleSystem, BATTLER_PLAYER);
            if (ov07_02233F20(opponentData->ballData) != 4) { // Checks ballData->unk90.unk8.
                data->ballData = opponentData->ballData;
                opponentData->ballData = NULL;
                data->state = STATE_GET_POKEMON_CHECK_IF_TRAINER;
                PlaySE(SEQ_SE_DP_THROW);
                data->battleSystem->unk2422++;
                UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_THROW);
            }
        }
        data->tempData[DATA_GET_POKEMON_NEEDS_EXTRA_DISPOSAL_CHECK] = FALSE;
        break;
    case STATE_GET_POKEMON_CHECK_IF_TRAINER:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_THROW)) { // Likely checking if the current ball animation is still active. The second parameter is unused, as the same data is contained in unk8.
            if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_TRAINER) {
                sub_0200602C(SEQ_SE_DP_KON, 0x75);
                UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_DEFLECT);
                data->state = STATE_GET_POKEMON_BALL_BLOCKED;
                break;
            }
            sub_0200602C(SEQ_SE_DP_BOWA4, 0x75);
            UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_OPEN);
            data->state = STATE_GET_POKEMON_CALCULATE_SHAKES;
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 23;
        }
        break;
    case STATE_GET_POKEMON_CALCULATE_SHAKES:
        data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
        if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 23 frames have passed...
            ov12_022628A0(data->battleSystem, battlerId, data->ballID);
            data->tempData[DATA_GET_POKEMON_BALL_SHAKES_TOTAL] = BattleSystem_CalculateBallShakes(data->battleSystem, data->ctx);

            if (data->tempData[DATA_GET_POKEMON_BALL_SHAKES_TOTAL] < BALL_SHAKE_MAX) {
                data->tempData[DATA_GET_POKEMON_BALL_SHAKE_ANIMATIONS] = data->tempData[DATA_GET_POKEMON_BALL_SHAKES_TOTAL]; // Store the number of shake animations we actually need to do.
            } else {
                data->tempData[DATA_GET_POKEMON_BALL_SHAKE_ANIMATIONS] = 3; // Even if we should catch, there should still only be 3 shakes. The 4th is a different animation.
            }
            data->state = STATE_GET_POKEMON_BALL_FALL;
        }
        break;
    case STATE_GET_POKEMON_BALL_FALL:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_OPEN) && Link_QueueNotEmpty(data->ctx)) {
            UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_FALL);
            data->state = STATE_GET_POKEMON_WAIT_FOR_BALL_FALL;
        }
        break;
    case STATE_GET_POKEMON_WAIT_FOR_BALL_FALL:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_FALL)) {
            data->state = STATE_GET_POKEMON_BALL_SHAKE;
        }
        break;
    case STATE_GET_POKEMON_BALL_SHAKE:
        if (data->tempData[DATA_GET_POKEMON_BALL_SHAKE_ANIMATIONS] == 0) {              // If there are no more ball shake animations to do...
            if (data->tempData[DATA_GET_POKEMON_BALL_SHAKES_TOTAL] == BALL_SHAKE_MAX) { // If the Pokemon should be caught...
                data->state = STATE_GET_POKEMON_BALL_CLICK;
                data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 12;
                break;
            }
            data->state = STATE_GET_POKEMON_BREAK_OUT;
            break;
        }
        UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_SHAKE);
        data->state = STATE_GET_POKEMON_BALL_SHAKE_DECREMENT;
        data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 12;
        break;
    case STATE_GET_POKEMON_BALL_SHAKE_DECREMENT:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_SHAKE)) {
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
            if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 12 frames have passed...
                data->tempData[DATA_GET_POKEMON_BALL_SHAKE_ANIMATIONS]--;
                data->state = STATE_GET_POKEMON_BALL_SHAKE;
            }
        }
        break;
    case STATE_GET_POKEMON_BALL_CLICK:
        data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
        if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // Perform the next step when there are no more frames to wait.
            UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_CLICK);
            sub_0200602C(SEQ_SE_DP_GETTING, 0x75);
            data->state = STATE_GET_POKEMON_GOTCHA;
        }
        break;
    case STATE_GET_POKEMON_GOTCHA:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_CLICK)) {
            BattleMessage msg;
            // "Gotcha! {0} was caught!"
            msg.id = msg_0197_00867;
            msg.tag = TAG_NICKNAME | 0x80;
            msg.param[0] = battlerId;
            data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
            data->state = STATE_GET_POKEMON_BALL_FADE;
            PlayBGM(SEQ_GS_WIN2);
            BattleSystem_SetCriticalHpMusicFlag(data->battleSystem, 2);
        }
        break;
    case STATE_GET_POKEMON_BALL_FADE:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID])) { // Wait for the text box to finish printing.
            data->state = STATE_GET_POKEMON_CHECK_MON_DATA;
            UnkBallData_SetBallAnimation(data->ballData, BALL_ANIM_FADE);
        }
        break;
    case STATE_GET_POKEMON_CHECK_MON_DATA:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_FADE) && !(data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--, data->tempData[DATA_GET_POKEMON_FRAME_COUNTER])) {
            ov12_0223BD8C(data->battleSystem, battlerId);
            Pokemon *mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]); // Get the data of the caught Pokemon.
            if (BattleSystem_GetBattleType(data->battleSystem) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_TUTORIAL)) {           // If this was the Catching Demo or a Pal Park encounter...
                ov12_022567D4(data->battleSystem, data->ctx, BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]));
                sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                PaletteData_BeginPaletteFade(paletteData, 0xF, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
                Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
                data->state = STATE_GET_POKEMON_DONE_CAUGHT;
                data->tempData[DATA_GET_POKEMON_NEEDS_EXTRA_DISPOSAL_CHECK] = TRUE;
                break;
            }
            if (BattleSystem_CheckMonCaught(data->battleSystem, GetMonData(mon, MON_DATA_SPECIES, 0))) { // If this was already caught...
                if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {          // If this was the Bug Catching Contest...
                    sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                    PaletteData_BeginPaletteFade(paletteData, 0xF, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
                    Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
                    data->state = STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN;
                    data->tempData[DATA_GET_POKEMON_NEEDS_EXTRA_DISPOSAL_CHECK] = TRUE;
                    break;
                }
                sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                PaletteData_BeginPaletteFade(paletteData, 5, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
                Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
                data->state = STATE_GET_POKEMON_ALREADY_CAUGHT;
                break;
            }
            BattleMessage msg;
            // "{0}’s data has been added to the Pokédex."
            msg.id = msg_0197_00871;
            msg.tag = TAG_NICKNAME | 0x80;
            msg.param[0] = battlerId;
            data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
            data->state = STATE_GET_POKEMON_FADE_TO_POKEDEX;
            ov12_0223BB44(data->battleSystem);
        }
        break;
    case STATE_GET_POKEMON_FADE_TO_POKEDEX:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID])) { // Wait for the text box to finish printing.
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
            if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 30 frames have passed...
                data->state = STATE_GET_POKEMON_POKEDEX_ENTRY;
                PaletteData_BeginPaletteFade(paletteData, 5, 0xFFFF, 1, 0, 16, RGB_BLACK);
                Pokepic_StartPaletteFadeAll(pokepicManager, 0, 16, 0, RGB_BLACK);
                sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
            }
        }
        break;
    case STATE_GET_POKEMON_POKEDEX_ENTRY:
        if (!PaletteData_GetSelectedBuffersBitmask(paletteData)) {
            ov07_02233ECC(data->ballData);
            PokepicManager_DeleteAllPics(pokepicManager);
            ov12_02237CC4(data->battleSystem);
            ov12_02265FC4(ov12_0223A8F4(data->battleSystem, 0), 0);
            ov12_02265FC4(ov12_0223A8F4(data->battleSystem, 1), 0);
            ov12_02261294(BattleSystem_GetOpponentData(data->battleSystem, BATTLER_PLAYER), 0);
            UnkStruct_50C unkStruct;
            unkStruct.bgConfig = BattleSystem_GetBgConfig(data->battleSystem);
            unkStruct.paletteData = BattleSystem_GetPaletteData(data->battleSystem);
            unkStruct.pokepicManager = pokepicManager;
            unkStruct.heapID = HEAP_ID_BATTLE;
            unkStruct.mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]);
            unkStruct.natDexEnabled = Pokedex_IsNatDexEnabled(BattleSystem_GetPokedex(data->battleSystem));
            data->tempPointers[POINTER_GET_POKEMON_TASK_MANAGER] = ObjCharTransfer_PopTaskManager();
            data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER] = ov18_021F8974(&unkStruct);
            data->state = STATE_GET_POKEMON_DISMISS_POKEDEX_ENTRY;
        }
        break;
    case STATE_GET_POKEMON_DISMISS_POKEDEX_ENTRY:
        if (ov18_021F89C8(data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER]) == 1) {
            if (PAD_BUTTON_A & gSystem.newKeys) { // If the A button is pressed...
                data->state = STATE_GET_POKEMON_MOVE_POKEPIC_TO_CENTER;
            } else if (System_GetTouchNew()) { // If the touch screen is pressed...
                PlaySE(SEQ_SE_DP_SELECT);      // For some reason, a sound effect only plays if the touch screen is used here.
                data->state = STATE_GET_POKEMON_MOVE_POKEPIC_TO_CENTER;
            }
            if (data->state == STATE_GET_POKEMON_MOVE_POKEPIC_TO_CENTER) {
                if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
                    PaletteData_BeginPaletteFade(paletteData, 15, 0xFFFF, 1, 0, 16, RGB_BLACK);
                    Pokepic_StartPaletteFadeAll(pokepicManager, 0, 16, 0, RGB_BLACK);
                    break;
                }
                PaletteData_BeginPaletteFade(paletteData, 5, 0xFFFF, 1, 0, 16, RGB_BLACK);
            }
        }
        break;
    case STATE_GET_POKEMON_MOVE_POKEPIC_TO_CENTER:
        if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
            data->state = STATE_GET_POKEMON_STORE_NEW_MON_BUG_CONTEST;
            break;
        }
        Pokepic *pic = ov18_021F95F8(data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER]);
        Pokepic_AddAttr(pic, POKEPIC_X, 4);           // Move the Pokepic 4 pixels to the right each frame.
        if (Pokepic_GetAttr(pic, POKEPIC_X) >= 128) { // Stop when the Pokepic has reached the center of the screen.
            Pokepic_SetAttr(pic, POKEPIC_X, 128);
            ov18_021F95AC(data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER]);
            data->state = STATE_GET_POKEMON_15;
        }
        break;
    case STATE_GET_POKEMON_15:
        ov18_021F89D0(data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER]);
        ObjCharTransfer_PushTaskManager(data->tempPointers[POINTER_GET_POKEMON_TASK_MANAGER]);
        ov12_02237D00(data->battleSystem);
        PaletteData_BeginPaletteFade(paletteData, 5, 0xFFFF, 1, 16, 0, RGB_BLACK);
        data->state = STATE_GET_POKEMON_FADE_TO_NICKNAME_ASK;
        break;
    case STATE_GET_POKEMON_ALREADY_CAUGHT:
        if (!PaletteData_GetSelectedBuffersBitmask(paletteData)) {
            Pokemon *mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]);
            ov07_02233ECC(data->ballData);
            PokepicManager_DeleteAllPics(pokepicManager);
            ov12_02261294(BattleSystem_GetOpponentData(data->battleSystem, BATTLER_PLAYER), 0);
            ov12_02237CC4(data->battleSystem);
            ov12_02237D00(data->battleSystem);
            PokepicTemplate picTemplate;
            GetPokemonSpriteCharAndPlttNarcIds(&picTemplate, mon, 2);
            PokepicManager_CreatePokepic(pokepicManager, &picTemplate, 128, 72, 0, 0, 0, 0);
            PaletteData_BeginPaletteFade(paletteData, 5, 0xFFFF, 1, 16, 0, RGB_BLACK);
            Pokepic_StartPaletteFadeAll(pokepicManager, 16, 0, 0, RGB_BLACK);
            data->state = STATE_GET_POKEMON_FADE_TO_NICKNAME_ASK;
        }
        break;
    case STATE_GET_POKEMON_FADE_TO_NICKNAME_ASK:
        if (!PaletteData_GetSelectedBuffersBitmask(paletteData)) {
            data->state = STATE_GET_POKEMON_ASK_FOR_NICKNAME;
            sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 0);
            PaletteData_SetAutoTransparent(paletteData, 1);
        }
        break;
    case STATE_GET_POKEMON_ASK_FOR_NICKNAME:
        BattleController_EmitDrawYesNoBox(data->battleSystem, data->ctx, 0, 0x364, 5, 0, data->ctx->selectedMonIndex[battlerId] | battlerId); // Would you like to give {0} a nickname?
        data->state++;
        break;
    case STATE_GET_POKEMON_WAIT_FOR_YESNO:
        if (BattleBuffer_GetNext(data->ctx, BATTLER_PLAYER)) {             // Wait for the player to prompt the game to continue.
            if (BattleBuffer_GetNext(data->ctx, BATTLER_PLAYER) == 0xFF) { // If the player said no...
                data->state = STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN;
                break;
            }
            sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
            PaletteData_BeginPaletteFade(paletteData, 0xF, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
            Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
            data->state = STATE_GET_POKEMON_PREPARE_NAMING_SCREEN;
        }
        break;
    case STATE_GET_POKEMON_PREPARE_NAMING_SCREEN:
        if (!PaletteData_GetSelectedBuffersBitmask(paletteData)) {
            sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
            sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
            Pokemon *mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]);
            NamingScreenArgs *namingScreenArgs = NamingScreen_CreateArgs(HEAP_ID_BATTLE, NAME_SCREEN_POKEMON, GetMonData(mon, MON_DATA_SPECIES, 0), 10, BattleSystem_GetOptions(data->battleSystem), 0);
            data->tempPointers[POINTER_GET_POKEMON_NAMING_SCREEN_ARGS] = namingScreenArgs;
            if (BattleSystem_GetPartySize(data->battleSystem, 0) < PARTY_SIZE) {
                namingScreenArgs->battleMsgId = 0;
            } else {
                namingScreenArgs->battleMsgId = BattleSystem_MetBill(data->battleSystem) + 0x496; // {0} was transferred to {1} in someone’s/Bill's PC!
            }
            namingScreenArgs->monForm = GetMonData(mon, MON_DATA_FORM, 0);
            namingScreenArgs->pcStorage = BattleSystem_GetPcStorage(data->battleSystem);
            namingScreenArgs->monGender = GetMonData(mon, MON_DATA_GENDER, 0);
            data->tempPointers[POINTER_GET_POKEMON_NAMING_SCREEN_OVERLAY_MANAGER] = OverlayManager_New(&gOverlayTemplate_NamingScreen, namingScreenArgs, HEAP_ID_BATTLE);
            data->state = STATE_GET_POKEMON_WAIT_FOR_NAMING_SCREEN;
            BattleSystem_HpBar_Delete(data->battleSystem);

            for (int battlerId = 0; battlerId < BattleSystem_GetMaxBattlers(data->battleSystem); battlerId++) {
                OpponentData *opponentData = BattleSystem_GetOpponentData(data->battleSystem, battlerId);
                if (opponentData->managedSprite) {
                    Sprite_DeleteAndFreeResources(opponentData->managedSprite);
                    opponentData->managedSprite = NULL;
                }
            }

            ov12_02237B6C(data->battleSystem);
            ov12_0223BBF0(data->battleSystem, 1);
        }
        break;
    case STATE_GET_POKEMON_WAIT_FOR_NAMING_SCREEN:
        if (OverlayManager_Run(data->tempPointers[POINTER_GET_POKEMON_NAMING_SCREEN_OVERLAY_MANAGER])) {
            NamingScreenArgs *namingScreenArgs = data->tempPointers[POINTER_GET_POKEMON_NAMING_SCREEN_ARGS];
            Pokemon *mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]);
            if (!namingScreenArgs->noInput) {
                SetMonData(mon, MON_DATA_NICKNAME_STRING_AND_FLAG, namingScreenArgs->nameInputString);
                BattleSystem_GameStatIncrement(data->battleSystem, GAME_STAT_NICKNAMES_GIVEN);
            }
            NamingScreen_DeleteArgs(namingScreenArgs);
            OverlayManager_Delete(data->tempPointers[POINTER_GET_POKEMON_NAMING_SCREEN_OVERLAY_MANAGER]);
            ov12_0223BBF0(data->battleSystem, 2);
            data->state = STATE_GET_POKEMON_STORE_MON_AFTER_NAMING_SCREEN;
        }
        break;
    case STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN:
    case STATE_GET_POKEMON_STORE_NEW_MON_BUG_CONTEST:
    case STATE_GET_POKEMON_STORE_MON_AFTER_NAMING_SCREEN:
        if (!PaletteData_GetSelectedBuffersBitmask(paletteData)) {
            Party *party = BattleSystem_GetParty(data->battleSystem, BATTLER_PLAYER);
            Pokemon *mon = BattleSystem_GetPartyMon(data->battleSystem, battlerId, data->ctx->selectedMonIndex[battlerId]);
            BattleSystem_SetPokedexCaught(data->battleSystem, battlerId);
            ov12_022567D4(data->battleSystem, data->ctx, mon);
            ov12_0223B870(data->battleSystem, mon);
            BattleController_EmitIncrementGameStat(data->battleSystem, BATTLER_PLAYER, 0, GAME_STAT_CAUGHT_MON);
            if (BattleSystem_GetBattleType(data->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
                if (data->state == STATE_GET_POKEMON_STORE_NEW_MON_BUG_CONTEST) {
                    ov18_021F89D0(data->tempPointers[POINTER_GET_POKEMON_OVERLAY_MANAGER]);                // We have not overwritten our original OverlayManager if we arrive here through this state.
                    ObjCharTransfer_PushTaskManager(data->tempPointers[POINTER_GET_POKEMON_TASK_MANAGER]); // Nor our TaskManager.
                    ov12_02237D00(data->battleSystem);
                }
                CopyPokemonToPokemon(mon, BattleSystem_GetBugContestCaughtMon(data->battleSystem));
                if (data->state == STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN) {
                    sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                }
                data->state = STATE_GET_POKEMON_DONE_CAUGHT;
                break;
            }
            if (Party_AddMon(party, mon) == TRUE) {
                if (data->state == STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN) {
                    sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                    PaletteData_BeginPaletteFade(paletteData, 0xF, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
                    Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
                }
                data->state = STATE_GET_POKEMON_DONE_CAUGHT;
                break;
            }
            PCStorage *pcStorage = BattleSystem_GetPcStorage(data->battleSystem);
            int activeBox = PCStorage_GetActiveBox(pcStorage);
            int emptyBox = PCStorage_FindFirstBoxWithEmptySlot(pcStorage);
            PCStorage_SetActiveBox(pcStorage, emptyBox);

            for (s32 moveSlot = 0; moveSlot < 4; moveSlot++) {
                u32 maxPP = GetMonData(mon, MON_DATA_MOVE1_MAX_PP + moveSlot, 0);
                SetMonData(mon, MON_DATA_MOVE1_PP + moveSlot, &maxPP);
            }

            if (Mon_UpdateGiratinaForm(mon) != -1) {
                BattleSystem_SetPokedexCaught(data->battleSystem, battlerId);
            }
            PCStorage_PlaceMonInBoxFirstEmptySlot(pcStorage, emptyBox, Mon_GetBoxMon(mon));
            if (data->state == STATE_GET_POKEMON_STORE_MON_NO_NAMING_SCREEN) {
                BattleMessage msg;
                if (activeBox == emptyBox) {
                    // "{0} was transferred to {1} in [someone’s]/[Bill's] PC!"
                    msg.id = BattleSystem_MetBill(data->battleSystem) + msg_0197_01174;
                    msg.tag = TAG_NICKNAME_BOX | 0x80;
                    msg.param[0] = battlerId;
                    msg.param[1] = activeBox;
                } else {
                    // "{1} in [someone’s]/[Bill's] PC is full. {0} was transferred to {2} instead!"
                    msg.id = BattleSystem_MetBill(data->battleSystem) + msg_0197_01176;
                    msg.tag = TAG_NICKNAME_BOX_BOX | 0x80;
                    msg.param[0] = battlerId;
                    msg.param[1] = activeBox;
                    msg.param[2] = emptyBox;
                }
                data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
                data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
                data->state = STATE_GET_POKEMON_FADE_UNNAMED_BOXED_MON;
                break;
            }
            data->state = STATE_GET_POKEMON_DONE_CAUGHT;
        }
        break;
    case STATE_GET_POKEMON_FADE_UNNAMED_BOXED_MON:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID])) {
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
            if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 30 frames have passed...
                sub_0201649C(BattleSystem_GetMessageIcon(data->battleSystem), 1);
                PaletteData_BeginPaletteFade(paletteData, 0xF, 0xFFFF, 1, 0, 0x10, RGB_BLACK);
                Pokepic_StartPaletteFadeAll(pokepicManager, 0, 0x10, 0, RGB_BLACK);
                data->state = STATE_GET_POKEMON_DONE_CAUGHT;
            }
        }
        break;
    case STATE_GET_POKEMON_BALL_BLOCKED:
        if (!ov07_02232F60(data->ballData, BALL_ANIM_DEFLECT)) {
            ov07_02233ECC(data->ballData);
            BattleMessage msg;
            // "The Trainer blocked the Ball!"
            msg.id = msg_0197_00859;
            msg.tag = TAG_NONE;
            data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
            data->state = STATE_GET_POKEMON_NO_STEALING;
        }
        break;
    case STATE_GET_POKEMON_NO_STEALING:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID]) && !--data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]) {
            BattleMessage msg;
            // "Don’t be a thief!"
            msg.id = msg_0197_00860;
            msg.tag = TAG_NONE;
            data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
            data->state = STATE_GET_POKEMON_DONE_NO_STEALING;
        }
        break;
    case STATE_GET_POKEMON_DONE_NO_STEALING:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID])) {
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
            if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 30 frames have passed...
                data->ctx->getterWork = 0;
                Heap_Free(data);
                SysTask_Destroy(sysTask);
            }
        }
    default:
        break;
    case STATE_GET_POKEMON_BREAK_OUT:
        BattleController_EmitPokemonSendOut(data->battleSystem, battlerId, data->ballID, 1); // Breaking out hijacks the send out animation.
        data->state = STATE_GET_POKEMON_BREAK_OUT_CLEANUP;
        data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 2;
        break;
    case STATE_GET_POKEMON_BREAK_OUT_CLEANUP:
        data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
        if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 2 frames have passed...
            ov07_02233ECC(data->ballData);
            data->state = STATE_GET_POKEMON_BREAK_OUT_MESSAGE;
        }
        break;
    case STATE_GET_POKEMON_BREAK_OUT_MESSAGE:
        if (Link_QueueNotEmpty(data->ctx)) {
            BattleMessage msg;
            // Break-out messages, including ball shake offsets.
            msg.id = data->tempData[DATA_GET_POKEMON_BALL_SHAKES_TOTAL] + msg_0197_00863;
            msg.tag = TAG_NONE;
            data->tempData[DATA_GET_POKEMON_PRINTER_ID] = BattleSystem_PrintBattleMessage(data->battleSystem, msgData, &msg, BattleSystem_GetTextFrameDelay(data->battleSystem));
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] = 30;
            data->state = STATE_GET_POKEMON_DONE_BREAK_OUT;
        }
        break;
    case STATE_GET_POKEMON_DONE_BREAK_OUT:
        if (!TextPrinterCheckActive(data->tempData[DATA_GET_POKEMON_PRINTER_ID])) {
            data->tempData[DATA_GET_POKEMON_FRAME_COUNTER]--;
            if (data->tempData[DATA_GET_POKEMON_FRAME_COUNTER] == 0) { // After 30 frames have passed...
                data->ctx->getterWork = 0;
                Heap_Free(data);
                SysTask_Destroy(sysTask);
            }
        }
        break;
    case STATE_GET_POKEMON_DONE_CAUGHT:
        if (PaletteData_GetSelectedBuffersBitmask(paletteData) == 0) {
            if (data->tempData[DATA_GET_POKEMON_NEEDS_EXTRA_DISPOSAL_CHECK]) {
                ov07_02233ECC(data->ballData);
                PokepicManager_DeleteAllPics(pokepicManager);
            }
            data->battleSystem->battleOutcomeFlag = BATTLE_OUTCOME_MON_CAUGHT;
            data->ctx->getterWork = 0;
            Heap_Free(data);
            SysTask_Destroy(sysTask);
        }
        break;
    }
}

extern u8 sStandardBallCatchRates[4];
extern u8 sSafariCatchRateStages[13][2];
extern u16 sMoonBallPokemon[14];

#define CP_SQRT_32BIT_MODE (0UL << REG_CP_SQRTCNT_MODE_SHIFT)

static inline void CP_SetSqrtImm32_NS_(u32 param) {
    *((REGType32 *)REG_SQRT_PARAM_ADDR) = param;
}

static inline void CP_SetSqrtImm32(u32 param) {
    *((REGType32 *)REG_SQRT_PARAM_ADDR) = param;
}

static inline void CP_SetSqrt32(u32 param) {
    reg_CP_SQRTCNT = CP_SQRT_32BIT_MODE;
    CP_SetSqrtImm32_NS_(param);
}

static inline s32 CP_IsSqrtBusy(void) {
    return reg_CP_SQRTCNT & REG_CP_SQRTCNT_BUSY_MASK;
}

static inline void CP_WaitSqrt(void) {
    while (CP_IsSqrtBusy()) {
    }
}

static inline u32 CP_GetSqrtResultImm32(void) {
    return (u32)(*((REGType32 *)REG_SQRT_RESULT_ADDR));
}

static inline u32 CP_GetSqrtResult32(void) {
    CP_WaitSqrt();
    return CP_GetSqrtResultImm32();
}

static u32 BattleSystem_CalculateBallShakes(BattleSystem *bsys, BattleContext *ctx) {
    s32 catchRate;
    s32 targetMonType1 = 0;
    u32 ballMultiplier = 0;

    if (BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_PAL_PARK | BATTLE_TYPE_TUTORIAL)) {
        return BALL_SHAKE_MAX;
    }
    if (ctx->itemTemp == ITEM_SAFARI_BALL) {
        s32 normalCatchRate = GetMonBaseStat(ctx->battleMons[ctx->battlerIdTarget].species, BASE_CATCH_RATE);
        // Adjust the catch rate in the safari zone by the pokemon's caution level.
        catchRate = (sSafariCatchRateStages[ctx->safariCatchRateStage][0] * normalCatchRate) / sSafariCatchRateStages[ctx->safariCatchRateStage][1];
    } else {
        catchRate = GetMonBaseStat(ctx->battleMons[ctx->battlerIdTarget].species, BASE_CATCH_RATE);
    }

    ballMultiplier = 10; // All ball multipliers are /10, so this is x1.
    targetMonType1 = GetBattlerVar(ctx, ctx->battlerIdTarget, BMON_DATA_TYPE_1, 0);
    u32 targetMonType2 = GetBattlerVar(ctx, ctx->battlerIdTarget, BMON_DATA_TYPE_2, 0);
    u32 itemTemp = ctx->itemTemp;
    if (ctx->itemTemp > ITEM_SAFARI_BALL) { // Skip all balls that have no condition.
        switch (ctx->itemTemp) {
        case ITEM_NET_BALL: {
            if (targetMonType1 == TYPE_WATER || targetMonType2 == TYPE_WATER || targetMonType1 == TYPE_BUG || targetMonType2 == TYPE_BUG) {
                ballMultiplier = 30;
                break;
            }
            break;
        case ITEM_DIVE_BALL:
            if (BattleSystem_GetTerrainId(bsys) == TERRAIN_WATER) {
                ballMultiplier = 35;
                break;
            }
            break;
        case ITEM_NEST_BALL:
            u8 level = ctx->battleMons[ctx->battlerIdTarget].level;
            if (level < 40) {
                // Up to a 40/10 multiplier (x4).
                ballMultiplier = 40 - level;

                // Don't let the level "bonus" make the ball worse than a pokeball.
                if (ballMultiplier < 10) {
                    ballMultiplier = 10;
                }
                break;
            }
            break;
        }
        case ITEM_REPEAT_BALL:
            if (BattleSystem_CheckMonCaught(bsys, ctx->battleMons[ctx->battlerIdTarget].species) == TRUE) {
                ballMultiplier = 30;
            }
            break;
        case ITEM_TIMER_BALL:
            // Use the (turn count + 10)/10 as the multiplier.
            ballMultiplier = ctx->totalTurns + 10;

            // Then cap it at 40/10 multiplier (x4).
            if (ballMultiplier > 40) {
                ballMultiplier = 40;
            }
            break;
        case ITEM_DUSK_BALL:
            if (BattleSystem_GetTimezone(bsys) == 3 || BattleSystem_GetTimezone(bsys) == 4 || BattleSystem_GetTerrainId(bsys) == TERRAIN_CAVE) {
                ballMultiplier = 35;
            }
            break;
        case ITEM_QUICK_BALL:
            if (ctx->totalTurns < 1) {
                ballMultiplier = 40;
            }
            break;

        // All the apricorn balls directly alter catchRate instead of setting ballMultiplier.
        // The only side-effect is that catchRate is capped at 255, while ballMultiplier is uncapped.
        // Simply put, Pokemon with a very high base catch rate will see diminishing returns.
        case ITEM_FAST_BALL: {
            u32 speed = GetMonBaseStat(ctx->battleMons[ctx->battlerIdTarget].species, BASE_SPEED);
            if (speed >= 100) {
                catchRate *= 4;
            }
            break;
        }
        case ITEM_LEVEL_BALL: {
            u8 attackerLevel = ctx->battleMons[ctx->battlerIdAttacker].level;
            u8 defenderLevel = ctx->battleMons[ctx->battlerIdTarget].level;
            if (attackerLevel <= defenderLevel) {
            } else if (attackerLevel / 2 <= defenderLevel) {
                catchRate *= 2;
            } else if (attackerLevel / 4 <= defenderLevel) {
                catchRate *= 4;
            } else {
                catchRate *= 8;
            }
            break;
        }
        case ITEM_LURE_BALL:
            if (BattleSystem_IsFishing(bsys)) {
                catchRate *= 3;
            }
            break;
        case ITEM_HEAVY_BALL: {
            s32 weight = GetMonWeight(ctx->battleMons[ctx->battlerIdTarget].species);
            // Weight is in kilograms, moved to the left by 1 decimal point.
            if (weight >= 4096) { // 409.6 kg / 903.0 lbs. or more.
                catchRate += 40;
            } else if (weight >= 3072) { // 307.2 kg / 677.3 lbs. or more.
                catchRate += 30;
            } else if (weight >= 2048) { // 204.8 kg / 451.5 lbs. or more.
                catchRate += 20;
            } else if (catchRate < 1024) { // Catch rate is mistakenly checked here instead of weight, causing all Pokemon that do not benefit from the Heavy Ball to be penalized by it.
                catchRate -= 20;
            }
            break;
        }
        case ITEM_LOVE_BALL: {
            if (ctx->battleMons[ctx->battlerIdAttacker].species == ctx->battleMons[ctx->battlerIdTarget].species && ctx->battleMons[ctx->battlerIdAttacker].gender != ctx->battleMons[ctx->battlerIdTarget].gender) {
                catchRate *= 8;
            }
            break;
        }
        case ITEM_MOON_BALL: {
            u32 i;
            for (i = 0; i < NELEMS(sMoonBallPokemon); i++) {
                if (sMoonBallPokemon[i] == ctx->battleMons[ctx->battlerIdTarget].species) {
                    catchRate *= 4;
                    break;
                }
            }
            break;
        }
        case ITEM_SPORT_BALL:
            ballMultiplier = 15;
            break;
        case ITEM_FRIEND_BALL:
        // case ITEM_PARK_BALL:
        // case ITEM_CHERISH_BALL:
        default:
            ballMultiplier = 10;
        }
        if (catchRate > 0xFF) {
            catchRate = 0xFF;
        } else if (catchRate < 0) {
            catchRate = 1;
        }
    } else {
        // Item IDs from 2-5: Ultra Ball, Great Ball, Pokeball, Safari Ball.
        ballMultiplier = sStandardBallCatchRates[ctx->itemTemp - 2];
    }

    s32 maxHpTimes3 = ctx->battleMons[ctx->battlerIdTarget].maxHp * 3;
    u32 lostHp = maxHpTimes3 - (ctx->battleMons[ctx->battlerIdTarget].hp * 2);

    // This is written like ballMultiplier * (catch rate fraction) * (health fraction),
    // but the CPU actually does the operations from left to right, causing weird rounding issues.
    u32 baseCatchMultiplier = catchRate * ballMultiplier;
    u32 modifiedCatchRate = ((baseCatchMultiplier / 10) * lostHp) / maxHpTimes3;

    s32 status = ctx->battleMons[ctx->battlerIdTarget].status;
    if ((STATUS_SLEEP | STATUS_FREEZE) & status) {
        modifiedCatchRate *= 2;
    }
    if ((STATUS_BURN | STATUS_PARALYSIS | STATUS_BAD_POISON | STATUS_POISON) & status) {
        modifiedCatchRate = (modifiedCatchRate * 15) / 10;
    }

    s32 shakeCount;
    if (modifiedCatchRate >= 255) {
        shakeCount = BALL_SHAKE_MAX;
    } else {
        CP_SetSqrt32(0xFF0000U / modifiedCatchRate);
        CP_WaitSqrt();
        CP_SetSqrt32(CP_GetSqrtResult32());
        CP_WaitSqrt();
        u32 shakeProbability = 0xFFFF0U / CP_GetSqrtResult32();
        for (shakeCount = 0; shakeCount < BALL_SHAKE_MAX; shakeCount++) {
            if (BattleSystem_Random(bsys) >= shakeProbability) {
                break;
            }
        }
        if (ctx->itemTemp == ITEM_MASTER_BALL) {
            shakeCount = BALL_SHAKE_MAX;
        }
    }
    if (shakeCount < BALL_SHAKE_MAX) {
        return shakeCount;
    }
    if (ctx->itemTemp == ITEM_FRIEND_BALL) {
        u8 friendship = FRIENDSHIP_TIER_HI_MIN;
        SetMonData(BattleSystem_GetPartyMon(bsys, ctx->battlerIdTarget, 0), MON_DATA_FRIENDSHIP, &friendship);
    }
    return shakeCount;
}

static s32 GetMonWeight(u16 species) {
    s32 *weightList = GfGfxLoader_LoadFromNarc(NARC_application_zukanlist_zkn_data_zukan_data, 1, FALSE, HEAP_ID_3, TRUE);
    s32 weight = weightList[species];
    Heap_Free(weightList);
    return weight;
}

static int BattleSystem_GetBattlerIDBySide(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    int battlerID;
    switch (side) {
    default:
    case BATTLER_CATEGORY_ATTACKER:
        battlerID = ctx->battlerIdAttacker;
        break;
    case BATTLER_CATEGORY_DEFENDER:
        battlerID = ctx->battlerIdTarget;
        break;
    case BATTLER_CATEGORY_FAINTED_MON:
        battlerID = ctx->battlerIdFainted;
        break;
    case BATTLER_CATEGORY_SWITCHED_MON:
    case BATTLER_CATEGORY_SWITCHED_MON_AFTER:
        battlerID = ctx->battlerIdSwitch;
        break;
    case BATTLER_CATEGORY_SIDE_EFFECT_MON:
        battlerID = ctx->battlerIdStatChange;
        break;
    case BATTLER_CATEGORY_ABILITY_MON:
        battlerID = ctx->battlerIdAbility;
        break;
    case BATTLER_CATEGORY_ENEMY: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (opponentData->battlerType & BATTLER_TYPE_IS_ENEMY) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_ENEMY_SLOT_1: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (opponentData->battlerType == BATTLER_TYPE_ENEMY_SIDE_SLOT_1 || opponentData->battlerType == BATTLER_TYPE_SOLO_ENEMY) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_ENEMY_SLOT_2: {
        int battlerType = BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES ? BATTLER_TYPE_ENEMY_SIDE_SLOT_2 : BATTLER_TYPE_SOLO_ENEMY;
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (opponentData->battlerType == battlerType) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_PLAYER: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (!(opponentData->battlerType & BATTLER_TYPE_IS_ENEMY)) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_PLAYER_SLOT_1: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (opponentData->battlerType == BATTLER_TYPE_PLAYER_SIDE_SLOT_1 || opponentData->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_PLAYER_SLOT_2: {
        int battlerType = BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES ? BATTLER_TYPE_PLAYER_SIDE_SLOT_2 : BATTLER_TYPE_SOLO_PLAYER;
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            OpponentData *opponentData = BattleSystem_GetOpponentData(battleSystem, battlerID);
            if (opponentData->battlerType == battlerType) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_MSG_ATTACKER:
        battlerID = ctx->battlerIdLeechSeedRecv; // TODO: Rename these as part of BattleContext cleanup.
        break;
    case BATTLER_CATEGORY_MSG_DEFENDER:
        battlerID = ctx->battlerIdLeechSeeded;
        break;
    case BATTLER_CATEGORY_ATTACKER_PARTNER: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            if (battlerID != ctx->battlerIdAttacker
                && (BattleSystem_GetFieldSide(battleSystem, battlerID) == BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker))) {
                break;
            }
        }
        if (battlerID == maxBattlers) {
            battlerID = BATTLER_PLAYER;
        }
    } break;
    case BATTLER_CATEGORY_DEFENDER_PARTNER: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            if (battlerID != ctx->battlerIdTarget
                && BattleSystem_GetFieldSide(battleSystem, battlerID) == BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget)) {
                break;
            }
        }
        if (battlerID == maxBattlers) {
            battlerID = 0;
        }
    } break;
    case BATTLER_CATEGORY_ATTACKER_ENEMY: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        int attackerFieldSide = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdAttacker);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            if (attackerFieldSide != BattleSystem_GetFieldSide(battleSystem, battlerID)) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_DEFENDER_ENEMY: {
        int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
        int targetFieldSide = BattleSystem_GetFieldSide(battleSystem, ctx->battlerIdTarget);
        for (battlerID = 0; battlerID < maxBattlers; battlerID++) {
            if (targetFieldSide != BattleSystem_GetFieldSide(battleSystem, battlerID)) {
                break;
            }
        }
    } break;
    case BATTLER_CATEGORY_MSG_TEMP:
    case BATTLER_CATEGORY_MSG_BATTLER_TEMP:
        battlerID = ctx->battlerIdTemp;
        break;
    }

    if (battlerID == BATTLER_NONE) {
        GF_AssertFail();
    }

    return battlerID;
}

static void InitBattleMsgData(BattleContext *ctx, BattleMessageData *msgData) {
    int params = 0;
    msgData->id = BattleScriptReadWord(ctx);
    msgData->tag = BattleScriptReadWord(ctx);
    switch (msgData->tag) {
    case TAG_NONE:
        params = 0;
        break;
    case TAG_NONE_SIDE:
    case TAG_NICKNAME:
    case TAG_MOVE:
    case TAG_STAT:
    case TAG_ITEM:
    case TAG_NUMBER:
    case TAG_NUMBERS:
    case TAG_TRNAME:
        params = 1;
        break;
    case TAG_NICKNAME_NICKNAME:
    case TAG_NICKNAME_MOVE:
    case TAG_NICKNAME_ABILITY:
    case TAG_NICKNAME_STAT:
    case TAG_NICKNAME_TYPE:
    case TAG_NICKNAME_POKE:
    case TAG_NICKNAME_ITEM:
    case TAG_NICKNAME_POFFIN:
    case TAG_NICKNAME_NUM:
    case TAG_NICKNAME_TRNAME:
    case TAG_NICKNAME_BOX:
    case TAG_MOVE_SIDE:
    case TAG_MOVE_NICKNAME:
    case TAG_MOVE_MOVE:
    case TAG_ABILITY_NICKNAME:
    case TAG_ITEM_MOVE:
    case TAG_NUMBER_NUMBER:
    case TAG_TRNAME_TRNAME:
    case TAG_TRNAME_NICKNAME:
    case TAG_TRNAME_ITEM:
    case TAG_TRNAME_NUM:
    case TAG_TRCLASS_TRNAME:
        params = 2;
        break;
    case TAG_NICKNAME_NICKNAME_MOVE:
    case TAG_NICKNAME_NICKNAME_ABILITY:
    case TAG_NICKNAME_NICKNAME_ITEM:
    case TAG_NICKNAME_MOVE_MOVE:
    case TAG_NICKNAME_MOVE_NUMBER:
    case TAG_NICKNAME_ABILITY_NICKNAME:
    case TAG_NICKNAME_ABILITY_MOVE:
    case TAG_NICKNAME_ABILITY_ITEM:
    case TAG_NICKNAME_ABILITY_STAT:
    case TAG_NICKNAME_ABILITY_TYPE:
    case TAG_NICKNAME_ABILITY_STATUS:
    case TAG_NICKNAME_ABILITY_NUMBER:
    case TAG_NICKNAME_ITEM_NICKNAME:
    case TAG_NICKNAME_ITEM_MOVE:
    case TAG_NICKNAME_ITEM_STAT:
    case TAG_NICKNAME_ITEM_STATUS:
    case TAG_NICKNAME_BOX_BOX:
    case TAG_ITEM_NICKNAME_FLAVOR:
    case TAG_TRNAME_NICKNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_ITEM:
        params = 3;
        break;
    case TAG_NICKNAME_ABILITY_NICKNAME_MOVE:
    case TAG_NICKNAME_ABILITY_NICKNAME_ABILITY:
    case TAG_NICKNAME_ABILITY_NICKNAME_STAT:
    case TAG_NICKNAME_ITEM_NICKNAME_ITEM:
    case TAG_TRNAME_NICKNAME_TRNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME:
    case TAG_TRCLASS_TRNAME_NICKNAME_TRNAME:
    case TAG_TRCLASS_TRNAME_TRCLASS_TRNAME:
        params = 4;
        break;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
        params = 6;
        break;
    }

    for (int i = 0; i < params; i++) {
        msgData->params[i] = BattleScriptReadWord(ctx);
    }
}

static void InitBattleMsg(BattleSystem *battleSystem, BattleContext *ctx, BattleMessageData *msgData, BattleMessage *msg) {
    msg->id = msgData->id;
    msg->tag = msgData->tag;
    switch (msg->tag) {
    case TAG_NONE_SIDE:
        msg->param[0] = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, msgData->params[0]);
        return;
    case TAG_NICKNAME:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        return;
    case TAG_MOVE:
        msg->param[0] = GetMoveMessageNo(ctx, msgData->params[0]);
        return;
    case TAG_STAT:
        msg->param[0] = ov12_022481D0(ctx, msgData->params[0]);
        return;
    case TAG_ITEM:
        msg->param[0] = ov12_0224810C(ctx, msgData->params[0]);
        return;
    case TAG_NUMBER:
    case TAG_NUMBERS:
        msg->param[0] = ov12_02248184(ctx, msgData->params[0]);
        return;
    case TAG_TRNAME:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        return;
    case TAG_NICKNAME_NICKNAME:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = GetMoveMessageNo(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_ABILITY:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_STAT:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022481D0(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_TYPE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248190(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_POKE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022481E8(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_ITEM:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_POFFIN:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248200(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_NUM:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248184(ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_TRNAME:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_BOX:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = msgData->params[1];
        return;
    case TAG_MOVE_SIDE:
        msg->param[0] = GetMoveMessageNo(ctx, msgData->params[0]);
        msg->param[1] = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_MOVE_NICKNAME:
        msg->param[0] = GetMoveMessageNo(ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_MOVE_MOVE:
        msg->param[0] = GetMoveMessageNo(ctx, msgData->params[0]);
        msg->param[1] = GetMoveMessageNo(ctx, msgData->params[1]);
        return;
    case TAG_ABILITY_NICKNAME:
        msg->param[0] = ov12_0224819C(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_ITEM_MOVE:
        msg->param[0] = ov12_0224810C(ctx, msgData->params[0]);
        msg->param[1] = GetMoveMessageNo(ctx, msgData->params[1]);
        return;
    case TAG_NUMBER_NUMBER:
        msg->param[0] = ov12_02248184(ctx, msgData->params[0]);
        msg->param[1] = ov12_02248184(ctx, msgData->params[1]);
        return;
    case TAG_TRNAME_TRNAME:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_TRNAME_NICKNAME:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_TRNAME_ITEM:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        return;
    case TAG_TRNAME_NUM:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248184(ctx, msgData->params[1]);
        return;
    case TAG_TRCLASS_TRNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        return;
    case TAG_NICKNAME_NICKNAME_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = GetMoveMessageNo(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_NICKNAME_ABILITY:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_0224819C(battleSystem, ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_NICKNAME_ITEM:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_0224810C(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_MOVE_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = GetMoveMessageNo(ctx, msgData->params[1]);
        msg->param[2] = GetMoveMessageNo(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_MOVE_NUMBER:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = GetMoveMessageNo(ctx, msgData->params[1]);
        msg->param[2] = ov12_02248184(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_NICKNAME:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = GetMoveMessageNo(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_ITEM:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_0224810C(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_STAT:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022481D0(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_TYPE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_02248190(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_STATUS:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022481DC(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_NUMBER:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_02248184(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ITEM_NICKNAME:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ITEM_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        msg->param[2] = GetMoveMessageNo(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ITEM_STAT:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        msg->param[2] = ov12_022481D0(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ITEM_STATUS:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        msg->param[2] = ov12_022481DC(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_BOX_BOX:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = msgData->params[1];
        msg->param[2] = msgData->params[2];
        return;
    case TAG_ITEM_NICKNAME_FLAVOR:
        msg->param[0] = ov12_0224810C(ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_0224820C(ctx, msgData->params[2]);
        return;
    case TAG_TRNAME_NICKNAME_NICKNAME:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        return;
    case TAG_TRCLASS_TRNAME_NICKNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        return;
    case TAG_TRCLASS_TRNAME_ITEM:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_0224810C(ctx, msgData->params[2]);
        return;
    case TAG_NICKNAME_ABILITY_NICKNAME_MOVE:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = GetMoveMessageNo(ctx, msgData->params[3]);
        return;
    case TAG_NICKNAME_ABILITY_NICKNAME_ABILITY:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_0224819C(battleSystem, ctx, msgData->params[3]);
        return;
    case TAG_NICKNAME_ABILITY_NICKNAME_STAT:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224819C(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_022481D0(ctx, msgData->params[3]);
        return;
    case TAG_NICKNAME_ITEM_NICKNAME_ITEM:
        msg->param[0] = ov12_022480C0(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_0224810C(ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_0224810C(ctx, msgData->params[3]);
        return;
    case TAG_TRNAME_NICKNAME_TRNAME_NICKNAME:
        msg->param[0] = ov12_02248220(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_022480C0(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_02248220(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_022480C0(battleSystem, ctx, msgData->params[3]);
        return;
    case TAG_TRCLASS_TRNAME_NICKNAME_NICKNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_022480C0(battleSystem, ctx, msgData->params[3]);
        return;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_02248220(battleSystem, ctx, msgData->params[3]);
        return;
    case TAG_TRCLASS_TRNAME_TRCLASS_TRNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_02248218(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_02248220(battleSystem, ctx, msgData->params[3]);
        return;
    case TAG_TRCLASS_TRNAME_NICKNAME_TRCLASS_TRNAME_NICKNAME:
        msg->param[0] = ov12_02248218(battleSystem, ctx, msgData->params[0]);
        msg->param[1] = ov12_02248220(battleSystem, ctx, msgData->params[1]);
        msg->param[2] = ov12_022480C0(battleSystem, ctx, msgData->params[2]);
        msg->param[3] = ov12_02248218(battleSystem, ctx, msgData->params[3]);
        msg->param[4] = ov12_02248220(battleSystem, ctx, msgData->params[4]);
        msg->param[5] = ov12_022480C0(battleSystem, ctx, msgData->params[5]);
        // fallthrough.
    }
}

static int ov12_022480C0(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    int battlerID = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    if (side == BATTLER_CATEGORY_SWITCHED_MON_AFTER) {
        return battlerID | (ctx->unk_21A0[battlerID] << 8);
    } else {
        return battlerID | (ctx->selectedMonIndex[battlerID] << 8);
    }
}

static int GetMoveMessageNo(BattleContext *ctx, int arg1) {
    switch (arg1) {
    case 1:
        return ctx->moveNoCur;
    case 255:
        return ctx->moveTemp;
    }
}

static int ov12_0224810C(BattleContext *ctx, int side) {
    int item;
    switch (side) {
    case BATTLER_CATEGORY_ATTACKER:
        item = ctx->battleMons[ctx->battlerIdAttacker].item;
        BattlerSetItem(ctx, ctx->battlerIdAttacker, item);
        break;
    case BATTLER_CATEGORY_DEFENDER:
        item = ctx->battleMons[ctx->battlerIdTarget].item;
        BattlerSetItem(ctx, ctx->battlerIdTarget, item);
        break;
    case BATTLER_CATEGORY_MSG_BATTLER_TEMP:
        item = ctx->battleMons[ctx->battlerIdTemp].item;
        BattlerSetItem(ctx, ctx->battlerIdTemp, item);
        break;
    case BATTLER_CATEGORY_MSG_TEMP:
        item = ctx->itemTemp;
        break;
    }
    return item;
}

static int ov12_02248184(BattleContext *ctx, int side) {
    if (side == 0xFF) {
        return ctx->msgTemp;
    }
}

static int ov12_02248190(BattleContext *ctx, int side) {
    if (side == 0xFF) {
        return ctx->msgTemp;
    }
}

static int ov12_0224819C(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    u32 ability;
    int battlerID;
    if (side == BATTLER_CATEGORY_MSG_TEMP) {
        ability = ctx->abilityTemp;
    } else {
        battlerID = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
        ability = ctx->battleMons[battlerID].ability;
        BattlerSetAbility(ctx, battlerID, ability);
    }
    return ability;
}

static int ov12_022481D0(BattleContext *ctx, int side) {
    if (side == BATTLER_CATEGORY_MSG_TEMP) {
        return ctx->msgTemp;
    }
}

static int ov12_022481DC(BattleContext *ctx, int side) {
    if (side == BATTLER_CATEGORY_MSG_TEMP) {
        return ctx->msgTemp;
    }
}

static int ov12_022481E8(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    u32 battlerID = BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
    return battlerID | ctx->selectedMonIndex[battlerID] << 8;
}

static int ov12_02248200(BattleContext *ctx, int side) {
    if (side == BATTLER_CATEGORY_MSG_TEMP) {
        return ctx->msgTemp;
    }
}

static int ov12_0224820C(BattleContext *ctx, int side) {
    if (side == BATTLER_CATEGORY_MSG_TEMP) {
        return ctx->msgTemp;
    }
}

static int ov12_02248218(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    return BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
}

static int ov12_02248220(BattleSystem *battleSystem, BattleContext *ctx, int side) {
    return BattleSystem_GetBattlerIDBySide(battleSystem, ctx, side);
}

extern ManagedSpriteTemplate sLevelUpNameplateTemplate;
extern ManagedSpriteTemplate sPokeIconTemplate;

enum {
    POINTER_LEVEL_UP_NAMEPLATE_FONT_SYSTEM = 0,
};

static void BattleSystem_LoadLevelUpNameplate(BattleSystem *battleSystem, GetterWork *data, Pokemon *mon) {
    Window window;
    UnkStruct_02021AC8 unkStruct;
    TextOBJTemplate textObjTemplate;
    MsgData *msgData;
    MessageFormat *messageFormat;
    String *messageBuffer;
    BgConfig *bgConfig;
    PaletteData *palData;
    SpriteManager *spriteManager;
    SpriteSystem *spriteSystem;
    String *string;

    msgData = BattleSystem_GetMessageLoader(battleSystem);
    messageBuffer = BattleSystem_GetMessageBuffer(battleSystem);
    messageFormat = BattleSystem_GetMessageFormat(battleSystem);
    bgConfig = BattleSystem_GetBgConfig(battleSystem);
    spriteSystem = BattleSystem_GetSpriteSystem(battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleSystem);
    palData = BattleSystem_GetPaletteData(battleSystem);
    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_a_0_0_8, 256, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20021);
    SpriteSystem_LoadPaletteBuffer(palData, PLTTBUF_MAIN_OBJ, spriteSystem, spriteManager, NARC_a_0_0_8, 82, 0, 2, NNS_G2D_VRAM_TYPE_2DMAIN, 20016);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_a_0_0_8, 257, 1, 20013);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_a_0_0_8, 258, 1, 20013);
    data->unkC[0] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sLevelUpNameplateTemplate);
    ManagedSprite_TickFrame(data->unkC[0]);
    SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(mon), 0, NNS_G2D_VRAM_TYPE_2DMAIN, 20022);
    SpriteSystem_LoadPaletteBuffer(palData, PLTTBUF_MAIN_OBJ, spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074490(), 0, 3, NNS_G2D_VRAM_TYPE_2DMAIN, 20017);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_0207449C(), 0, 20014);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_020744A8(), 0, 20014);
    data->unkC[1] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sPokeIconTemplate);
    Sprite_SetPalOffsetRespectVramOffset(data->unkC[1]->sprite, Pokemon_GetIconPalette(mon));
    ManagedSprite_TickFrame(data->unkC[1]);
    data->tempPointers[POINTER_LEVEL_UP_NAMEPLATE_FONT_SYSTEM] = FontSystem_NewInit(1, HEAP_ID_BATTLE);

    u32 gender;
    if (GetMonData(mon, MON_DATA_NO_PRINT_GENDER, NULL) == FALSE) { // Used for Nidoran.
        gender = MON_GENDERLESS;
    } else {
        gender = GetMonData(mon, MON_DATA_GENDER, NULL);
    }
    if (gender == MON_MALE) {
        string = NewString_ReadMsgData(msgData, msg_0197_00944); // {0} ♂ Lv. {1}
    } else if (gender == MON_FEMALE) {
        string = NewString_ReadMsgData(msgData, msg_0197_00945); // {0} ♀ Lv. {1}
    } else {
        string = NewString_ReadMsgData(msgData, msg_0197_00946); // {0} Lv. {1}
    }
    BufferBoxMonNickname(messageFormat, 0, Mon_GetBoxMon(mon));
    BufferIntegerAsString(messageFormat, 1, GetMonData(mon, MON_DATA_LEVEL, NULL), 3, PRINTING_MODE_LEFT_ALIGN, 1);
    StringExpandPlaceholders(messageFormat, messageBuffer, string);
    String_Delete(string);
    InitWindow(&window);
    AddTextWindowTopLeftCorner(bgConfig, &window, 12, 4, 0, 0);
    AddTextPrinterParameterizedWithColor(&window, 0, messageBuffer, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL); // Second param should be something like FONT_ID_0.
    sub_02021AC8(sub_02013688(&window, NNS_G2D_VRAM_TYPE_2DMAIN, 5), TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, &unkStruct);
    textObjTemplate.fontSystem = data->tempPointers[POINTER_LEVEL_UP_NAMEPLATE_FONT_SYSTEM];
    textObjTemplate.window = &window;
    textObjTemplate.spriteList = SpriteManager_GetSpriteList(spriteManager);
    textObjTemplate.plttResourceProxy = SpriteManager_FindPlttResourceProxy(spriteManager, 20016);
    textObjTemplate.offset = unkStruct.offset;
    textObjTemplate.sprite = NULL;
    textObjTemplate.x = 176;
    textObjTemplate.y = 8;
    textObjTemplate.unk_24 = 100;
    textObjTemplate.vram = 1;
    textObjTemplate.heapID = HEAP_ID_BATTLE;
    textObjTemplate.unk_20 = 0;
    data->unk14 = sub_020135D8(&textObjTemplate);
    data->unk18 = unkStruct;
    sub_020138E0(data->unk14, 1);
    RemoveWindow(&window);
}

static void BattleSystem_UnloadLevelUpNameplate(BattleSystem *battleSystem, GetterWork *data) {
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleSystem);
    Sprite_DeleteAndFreeResources(data->unkC[0]);
    Sprite_DeleteAndFreeResources(data->unkC[1]);
    FontOAM_Delete(data->unk14);
    sub_02021B5C(&data->unk18);
    SpriteManager_UnloadCharObjById(spriteManager, 0x4E35);
    SpriteManager_UnloadPlttObjById(spriteManager, 0x4E30);
    SpriteManager_UnloadCellObjById(spriteManager, 0x4E2D);
    SpriteManager_UnloadAnimObjById(spriteManager, 0x4E2D);
    SpriteManager_UnloadCharObjById(spriteManager, 0x4E36);
    SpriteManager_UnloadPlttObjById(spriteManager, 0x4E31);
    SpriteManager_UnloadCellObjById(spriteManager, 0x4E2E);
    SpriteManager_UnloadAnimObjById(spriteManager, 0x4E2E);
    sub_020135AC(data->tempPointers[POINTER_LEVEL_UP_NAMEPLATE_FONT_SYSTEM]);
}

static void UpdateFriendshipFainted(BattleSystem *battleSystem, BattleContext *ctx, int battlerID) {
    if (BattleSystem_GetFieldSide(battleSystem, battlerID) == 0) { // TODO: Side consts? Is this BATTLER_CATEGORY_ATTACKER?
        u8 enemyID;
        if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) {
            enemyID = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
            u8 enemyID_slot2 = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
            if (ctx->battleMons[enemyID_slot2].level > ctx->battleMons[enemyID].level) { // The penalty is incurred by the higher level opponent, regardless of which (if either) landed the finishing blow.
                enemyID = enemyID_slot2;
            }
        } else {
            enemyID = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_SOLO_ENEMY);
        }
        Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battlerID, ctx->selectedMonIndex[battlerID]);
        u8 playerLevel = ctx->battleMons[battlerID].level;
        u8 enemyLevel = ctx->battleMons[enemyID].level;
        if (enemyLevel > playerLevel) {
            if (enemyLevel - playerLevel >= 30) { // Incur a more severe friendship penalty if the enemy is 30+ levels higher.
                MonApplyFriendshipMod(mon, 8, BattleSystem_GetLocation(battleSystem));
                ApplyMonMoodModifier(mon, 6);
                return;
            }
            MonApplyFriendshipMod(mon, 6, BattleSystem_GetLocation(battleSystem));
            ApplyMonMoodModifier(mon, 4);
            return;
        }
        MonApplyFriendshipMod(mon, 6, BattleSystem_GetLocation(battleSystem));
        ApplyMonMoodModifier(mon, 4);
    }
}

static void BattlerSetAbility(BattleContext *ctx, u8 battlerID, u8 ability) {
    ctx->trainerAIData.abilities[battlerID] = ability;
    return;
}

static void BattlerSetItem(BattleContext *ctx, u8 battlerID, u16 item) {
    ctx->trainerAIData.heldItems[battlerID] = item;
}
