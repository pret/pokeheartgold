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

#include "battle/battle_controller.h"
#include "battle/battle_controller_player.h"
#include "battle/overlay_12_0224E4FC.h"
#include "msgdata/msg/msg_0197.h"

#include "assert.h"
#include "item.h"
#include "palette.h"
#include "party.h"
#include "pokemon.h"
#include "pokemon_mood.h"
#include "render_window.h"
#include "sound.h"
#include "sound_chatot.h"
#include "sys_task_api.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0208805C.h"

int BattleScriptReadWord(BattleContext *ctx);
static void BattleScriptIncrementPointer(BattleContext *ctx, int adrs);
static void BattleScriptJump(BattleContext *ctx, NarcId narcId, int adrs);
static void BattleScriptGotoSubscript(BattleContext *ctx, NarcId narcId, int adrs);
static void *BattleScriptGetVarPointer(BattleSystem *bsys, BattleContext *ctx, int var);

u8 GetBattlerIDBySide(BattleSystem *bsys, BattleContext *ctx, u32 a2);

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret;

    do {
        ret = sBattleScriptCommandTable[ctx->battleScriptBuffer[ctx->scriptSeqNo]](bsys, ctx);
    } while (ctx->battleContinueFlag == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_LINK) == 0);

    ctx->battleContinueFlag = 0;

    return ret;
}

BOOL BtlCmd_PlayEncounterAnimation(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPlayEncounterAnimation(bsys, FALSE);
    return FALSE;
}

BOOL BtlCmd_SetPokemonEncounter(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    switch (BattleScriptReadWord(ctx)) {
    default:
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonEncounter(bsys, battlerId);
            BattleSystem_SetPokedexSeen(bsys, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        break;
    case BATTLER_CATEGORY_ENEMY: {
        OpponentData *opponentData;
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitPokemonEncounter(bsys, battlerId);
                BattleSystem_SetPokedexSeen(bsys, battlerId);
            }
        }
        break;
    }
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSlideIn(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSlideIn(bsys, battlerId);
            BattleSystem_SetPokedexSeen(bsys, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitPokemonSlideIn(bsys, battlerId);
                BattleSystem_SetPokedexSeen(bsys, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(bsys, ctx, battlerId);
                BattleController_EmitPokemonSlideIn(bsys, battlerId);
                BattleSystem_SetPokedexSeen(bsys, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ATTACKER:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdAttacker);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdAttacker);
        break;
    case BATTLER_CATEGORY_DEFENDER:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdTarget);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdTarget);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdTarget);
        break;
    case BATTLER_CATEGORY_SWITCHED_MON:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdSwitch);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdSwitch);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdSwitch);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSendOut(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
            BattleSystem_SetPokedexSeen(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
                BattleSystem_SetPokedexSeen(bsys, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(bsys, ctx, battlerId);
                BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
                BattleSystem_SetPokedexSeen(bsys, battlerId);
            }
        }
        break;
    case 1:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdAttacker);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdAttacker, 0, 0);
        break;
    case 2:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdTarget);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdTarget);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdTarget, 0, 0);
        break;
    case 6:
        opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdSwitch);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdSwitch);
        }
        BattleSystem_SetPokedexSeen(bsys, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdSwitch, 0, 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_RecallPokemon(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitRecallPokemon(bsys, ctx, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitRecallPokemon(bsys, ctx, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1 && !(ctx->switchInFlag & MaskOfFlagNo(battlerId))) {
                BattleController_EmitRecallPokemon(bsys, ctx, battlerId);
            }
        }
        break;
    default:
        BattleController_EmitRecallPokemon(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side));
        break;
    }

    return FALSE;
}

BOOL BtlCmd_DeletePokemon(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));
    BattleController_EmitDeletePokemon(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_SetTrainerEncounter(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    case 0:
    default:
        if (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TAG) {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
                if (opponentData->unk195 != 4) {
                    BattleController_EmitTrainerEncounter(bsys, battlerId);
                }
            }
        } else {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                    break;
                }
                BattleController_EmitTrainerEncounter(bsys, battlerId);
            }
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitTrainerEncounter(bsys, battlerId);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerEncounter(bsys, battlerId);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ThrowPokeball(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_TrainerSlideOut(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideOut(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TAG) == 0 && (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_TrainerSlideIn(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 index = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                if (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) {
                    break;
                }
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                if (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) {
                    break;
                }
            }
        }
        break;
    case BATTLER_CATEGORY_PLAYER_SLOT_1:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY_SLOT_1:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_PLAYER_SLOT_2:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY_SLOT_2:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_BackgroundSlideIn(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        BattleController_EmitBackgroundSlideIn(bsys, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideIn(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideInDelay(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;
    u8 delay;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    delay = 0;

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideOut(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax = BattleSystem_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case BATTLER_CATEGORY_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideOut(bsys, battlerId);
        }
        break;
    case BATTLER_CATEGORY_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0 && (ctx->switchInFlag & MaskOfFlagNo(battlerId)) == 0) {
                BattleController_EmitHealthbarSlideOut(bsys, battlerId);
            }
        }
        break;
    case BATTLER_CATEGORY_ENEMY:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitHealthbarSlideOut(bsys, battlerId);
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideOut(bsys, GetBattlerIDBySide(bsys, ctx, side));
        break;
    }

    return FALSE;
}

BOOL BtlCmd_Wait(BattleSystem *bsys, BattleContext *ctx) {
    if (Link_QueueNotEmpty(ctx)) {
        BattleScriptIncrementPointer(ctx, 1);
    } else {
        Link_CheckTimeout(ctx);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

static void DamageCalcDefault(BattleSystem *bsys, BattleContext *ctx) {
    int type;

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->trainerAIData.moveData[ctx->moveNoCur].type;
    }

    ctx->damage = CalcMoveDamage(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget)], ctx->fieldCondition, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

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

BOOL BtlCmd_CalcDamage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(bsys, ctx);
    ctx->damage = ApplyDamageRange(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_CalcDamageRaw(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(bsys, ctx);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_PrintAttackMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!(ctx->battleStatus & BATTLE_STATUS_NO_ATTACK_MESSAGE)) {
        BattleController_EmitPrintAttackMessage(bsys, ctx);
    }

    ctx->battleStatus |= BATTLE_STATUS_NO_ATTACK_MESSAGE;
    ctx->battleStatus2 |= BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE;

    return FALSE;
}

BOOL BtlCmd_PrintMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);
    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintGlobalMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.tag |= 128;

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPrintMessage(bsys, ctx, &ctx->buffMsg);
    return FALSE;
}

BOOL BtlCmd_BufferMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleMessageData msgdata;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &ctx->buffMsg);

    return FALSE;
}

BOOL BtlCmd_BufferLocalMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleMessageData msgdata;
    BattleMessage msg;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.tag |= 64;
    msg.battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BattleContext *ctx) {
    u16 move;

    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);

    if (battler == BATTLER_NONE) {
        move = ctx->moveTemp;
    } else {
        move = ctx->moveNoCur;
    }

    if ((!(ctx->battleStatus & BATTLE_STATUS_MOVE_ANIMATIONS_OFF) && BattleSystem_AreBattleAnimationsOn(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->battleStatus |= BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        BattleController_SetMoveAnimation(bsys, ctx, move);
    }

    if (!BattleSystem_AreBattleAnimationsOn(bsys)) {
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAIT_MOVE_ANIMATION);
    }

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimationOnMons(BattleSystem *bsys, BattleContext *ctx) {
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

    u32 attacker = GetBattlerIDBySide(bsys, ctx, attackerSide);
    u32 defender = GetBattlerIDBySide(bsys, ctx, defenderSide);

    if ((!(ctx->battleStatus & BATTLE_STATUS_MOVE_ANIMATIONS_OFF) && BattleSystem_AreBattleAnimationsOn(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->battleStatus |= BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        ov12_0226343C(bsys, ctx, move, attacker, defender);
    }

    if (!BattleSystem_AreBattleAnimationsOn(bsys)) {
        BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAIT_MOVE_ANIMATION);
    }

    return FALSE;
}

BOOL BtlCmd_FlickerMon(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    BattleController_EmitMonFlicker(bsys, GetBattlerIDBySide(bsys, ctx, side), ctx->moveStatusFlag);

    return FALSE;
}

BOOL BtlCmd_UpdateHealthbarValue(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u8 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

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

    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_UpdateHealthbar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitHealthbarUpdate(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TryFaintMon(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if (ctx->battleMons[battlerId].hp == 0) {
        ctx->battlerIdFainted = battlerId;
        ctx->battleStatus |= MaskOfFlagNo(battlerId) << BATTLE_STATUS_FAINTED_SHIFT;
        ctx->totalTimesFainted[battlerId]++;
        UpdateFrienshipFainted(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_PlayFaintAnimation(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPlayFaintAnimation(bsys, ctx, ctx->battlerIdFainted);

    ctx->battleStatus &= (MaskOfFlagNo(ctx->battlerIdFainted) << BATTLE_STATUS_FAINTED_SHIFT) ^ -1;
    ctx->battleStatus2 |= MaskOfFlagNo(ctx->battlerIdFainted) << BATTLE_STATUS2_EXP_GAIN_SHIFT;
    ctx->playerActions[ctx->battlerIdFainted].command = CONTROLLER_COMMAND_40;

    InitFaintedWork(bsys, ctx, ctx->battlerIdFainted);

    return FALSE;
}

BOOL BtlCmd_WaitButtonABTime(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int waitFrames = BattleScriptReadWord(ctx);
    int waitIncrement;

    if (!(BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_LINK)) {
        if (gSystem.newKeys & 0xC03 || System_GetTouchNew()) {
            // TODO: Rename variable in struct
            ctx->unk_F0 = waitFrames;
        }
    }

    if (bsys->battleType & BATTLE_TYPE_LINK && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
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

BOOL BtlCmd_PlaySound(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 sound = BattleScriptReadWord(ctx);

    BattleController_EmitPlaySE(bsys, ctx, sound, GetBattlerIDBySide(bsys, ctx, side));

    return FALSE;
}

BOOL BtlCmd_CompareVarToValue(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 opcode = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);

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

BOOL BtlCmd_CompareMonDataToValue(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 opcode = BattleScriptReadWord(ctx);
    u32 side = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), varId, NULL);

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

BOOL BtlCmd_FadeOutBattle(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitFadeOutBattle(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_GoToSubscript(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_0_1, BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_GoToEffectScript(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_3_0, ctx->trainerAIData.moveData[ctx->moveNoCur].effect);

    return FALSE;
}

BOOL BtlCmd_GoToMoveScript(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->battleStatus &= ~BATTLE_STATUS_NO_ATTACK_MESSAGE;
    ctx->battleStatus &= ~BATTLE_STATUS_MOVE_ANIMATIONS_OFF;

    ctx->moveNoCur = ctx->moveTemp;

    if (unkA == 0) {
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->moveTemp, 1, 0);
        ov12_02250A18(bsys, ctx, ctx->battlerIdAttacker, ctx->moveTemp);
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

BOOL BtlCmd_CalcCrit(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TUTORIAL) || (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_FIRST_RIVAL)) {
        ctx->criticalMultiplier = 1;
    } else {
        ctx->criticalMultiplier = TryCriticalHit(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalCnt, ov12_022581D4(bsys, ctx, 0, ctx->battlerIdTarget));
    }

    return FALSE;
}

BOOL BtlCmd_CalcExpGain(BattleSystem *bsys, BattleContext *ctx) {
    int adrs;
    u32 battleType = BattleSystem_GetBattleType(bsys);
    OpponentData *opponentData = BattleSystem_GetOpponentData(bsys, ctx->battlerIdFainted);

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    if ((opponentData->unk195 & 1) && !(battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK))) {
        int expMonsCnt = 0;
        int expShareMonsCnt = 0;
        u16 totalExp;
        u16 itemNo;
        Pokemon *mon;
        for (int i = 0; i < Party_GetCount(BattleSystem_GetParty(bsys, 0)); i++) {
            mon = BattleSystem_GetPartyMon(bsys, 0, i);
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

BOOL BtlCmd_StartGetExpTask(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->getterWork = Heap_Alloc(HEAP_ID_BATTLE, sizeof(GetterWork));

    ctx->getterWork->bsys = bsys;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->state = 0;
    ctx->getterWork->unk30[6] = 0;

    SysTask_CreateOnMainQueue(Task_GetExp, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_WaitGetExpTask(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_WaitGetExpTaskLoop(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptReadWord(ctx);

    return FALSE;
}

BOOL BtlCmd_ShowParty(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId, unkA, unkB;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    unkB = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            unkB |= MaskOfFlagNo(battlerId);
            BattleController_EmitShowMonList(bsys, ctx, battlerId, 1, 0, 6);
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (BattleSystem_GetBattleType(bsys) == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) {
            unkA = BattleSystem_GetBattlerIdPartner(bsys, battlerId);
            if (!(unkB & MaskOfFlagNo(battlerId)) && !(unkB & MaskOfFlagNo(unkA))) {
                unkB |= MaskOfFlagNo(battlerId);
                BattleController_EmitShowWaitMessage(bsys, battlerId);
            }
        } else {
            if (!(unkB & MaskOfFlagNo(battlerId))) {
                BattleController_EmitShowWaitMessage(bsys, battlerId);
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

BOOL BtlCmd_WaitMonSelection(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;

    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
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
                BattleController_EmitShowWaitMessage(bsys, battlerId);
            }
        }
    }

    if (switchCnt == 0) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if ((ctx->unk_13C[battlerId] & 1) && BattleBuffer_GetNext(ctx, battlerId)) {
                ov12_0223BDDC(bsys, battlerId, ctx->battleBuffer[battlerId][0]);
            }
        }
        ctx->battleStatus2 &= 0xf0ffffff;
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SwitchAndUpdateMon(BattleSystem *bsys, BattleContext *ctx) {
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

    BattleSystem_GetBattleMon(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    ov12_02256F78(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    ctx->hpTemp = ctx->battleMons[1].hp;

    InitSwitchWork(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_GoToIfAnySwitches(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

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

void Task_GetPokemon(SysTask *task, void *data);

BOOL BtlCmd_StartCatchMonTask(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);

    ctx->getterWork = (GetterWork *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(GetterWork));
    ctx->getterWork->bsys = bsys;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->state = 0;
    ctx->getterWork->unk24 = unkA;
    ctx->getterWork->unk2C = ItemToBallId(ctx->itemTemp);

    SysTask_CreateOnMainQueue(Task_GetPokemon, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_WaitCatchMonTask(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SetMultiHit(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int cnt = BattleScriptReadWord(ctx);
    int checkMultiHit = BattleScriptReadWord(ctx);

    if (ctx->multiHitCountTemp == 0) {
        if (cnt == 0) {
            if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SKILL_LINK) {
                cnt = 5;
            } else if ((cnt = BattleSystem_Random(bsys) & 3) < 2) {
                cnt += 2;
            } else {
                cnt = (BattleSystem_Random(bsys) & 3) + 2;
            }
        }
        ctx->multiHitCount = cnt;
        ctx->multiHitCountTemp = cnt;
        ctx->checkMultiHit = checkMultiHit;
    }

    return FALSE;
}

BOOL BtlCmd_UpdateVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);

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

BOOL BtlCmd_ChangeStatStage(BattleSystem *bsys, BattleContext *ctx) {
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
                ctx->buffMsg.id = msg_0197_00142; //{0}'s {1} won't go any higher!
                ctx->buffMsg.tag = TAG_NICKNAME_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = stat + 1;
                BattleScriptIncrementPointer(ctx, unkA);
            }
        } else {
            if (ctx->statChangeType == 3) {
                ctx->buffMsg.id = msg_0197_00622; //{0}'s {1} raised its {2}
                ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                ctx->buffMsg.param[2] = stat + 1;
            } else if (ctx->statChangeType == 5) {
                ctx->buffMsg.id = msg_0197_00756; // The {1} raised {0}'s {2}
                ctx->buffMsg.tag = TAG_NICKNAME_ITEM_STAT;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->itemTemp;
                ctx->buffMsg.param[2] = stat + 1;
            } else {
                ctx->buffMsg.id = (change == 1) ? msg_0197_00750 : msg_0197_00753; //{0}'s {1} (sharply) rose!
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
                if (ctx->fieldSideConditionData[BattleSystem_GetFieldSide(bsys, ctx->battlerIdStatChange)].mistTurns) {
                    ctx->buffMsg.id = msg_0197_00273; // {0} is protected by Mist!
                    ctx->buffMsg.tag = TAG_NICKNAME;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    unkD = 1;
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_CLEAR_BODY) == TRUE || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_WHITE_SMOKE) == TRUE) {
                    if (ctx->statChangeType == 3) {
                        ctx->buffMsg.id = msg_0197_00727; //{0}'s {1} suppressed {2}'s {3}
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                        ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                        ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                    } else {
                        ctx->buffMsg.id = msg_0197_00669; //{0}'s {1} prevents stat loss!
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                    }
                    unkD = TRUE;
                } else if ((CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_KEEN_EYE) == TRUE && (1 + stat) == 6) || (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_HYPER_CUTTER) == TRUE && (1 + stat) == 1)) {
                    if (ctx->statChangeType == 3) {
                        ctx->buffMsg.id = msg_0197_00727; //{0}'s {1} suppressed {2}'s {3}
                        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_ABILITY;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                        ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                        ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                    } else {
                        ctx->buffMsg.id = msg_0197_00704; //{0}'s {1} prvents {2} loss!
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
                        ctx->buffMsg.id = msg_0197_00145; //{0}'s {1} won't go lower!
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
                    ctx->buffMsg.id = msg_0197_00145; //{0}'s {1} won't go lower!
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
            ctx->buffMsg.id = msg_0197_00662; //{0}'s {1} cuts {2}'s {3}
            ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_NICKNAME_STAT;
            ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
            ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdAttacker].ability;
            ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.param[3] = stat + 1;
        } else {
            ctx->buffMsg.id = (change == -1) ? msg_0197_00762 : msg_0197_00765; //{0}'s {1} (harsly) fell!
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

// TODO: Move to above of file once defined as static
void BattlerSetAbility(BattleContext *ctx, u8 a1, u8 a2);

BOOL BtlCmd_UpdateMonData(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
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
    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_ClearVolatileStatus(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int var = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->unk_218C[battlerId] |= var;

    return FALSE;
}

BOOL BtlCmd_ToggleVanish(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkA = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitToggleVanish(bsys, battlerId, unkA);

    return FALSE;
}

BOOL BtlCmd_CheckAbility(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == BATTLER_CATEGORY_ALL) {
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

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
        battlerId = GetBattlerIDBySide(bsys, ctx, side);

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

BOOL BtlCmd_Random(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int modulo = BattleScriptReadWord(ctx);
    modulo += 1;

    int x0 = BattleScriptReadWord(ctx);

    ctx->calcTemp = BattleSystem_Random(bsys) % modulo + x0;

    return FALSE;
}

BOOL BtlCmd_UpdateVar2(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int valId = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);
    int *val = BattleScriptGetVarPointer(bsys, ctx, valId);

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

BOOL BtlCmd_UpdateMonDataFromVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int valId = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    int var = GetBattlerVar(ctx, battlerId, varId, NULL);
    int *val = BattleScriptGetVarPointer(bsys, ctx, valId);

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
        CopyBattleMonToPartyMon(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_Goto(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptIncrementPointer(ctx, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_Call(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_CallFromVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int *var = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));
    BattleScriptGotoSubscript(ctx, NARC_a_0_0_1, *var);
    return FALSE;
}

BOOL BtlCmd_SetMirrorMove(BattleSystem *bsys, BattleContext *ctx) {
    int move = 0;
    int battleType = BattleSystem_GetBattleType(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->moveNoCopied[ctx->battlerIdAttacker]) {
        move = ctx->moveNoCopied[ctx->battlerIdAttacker];
    } else if (battleType & BATTLE_TYPE_DOUBLES) {
        move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][0] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][1] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][2] + ctx->moveNoCopiedHit[ctx->battlerIdAttacker][3];
        if (move) {
            do {
                move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][BattleSystem_Random(bsys) % 4];
            } while (!move);
        }
    }
    if (move && IsMoveEncored(ctx, move) == TRUE) {
        ctx->battleStatus &= ~BATTLE_STATUS_NO_ATTACK_MESSAGE;
        ctx->battleStatus &= ~BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
        ctx->moveNoCur = move;
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, move, 1, 0);
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

BOOL BtlCmd_ResetAllStatChanges(BattleSystem *bsys, BattleContext *ctx) {
    int stat, battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int battlersMax = BattleSystem_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        for (stat = 0; stat < 8; stat++) {
            ctx->battleMons[battlerId].statChanges[stat] = 6;
        }
        ctx->battleMons[battlerId].status2 &= ~STATUS2_FOCUS_ENERGY;
    }

    return FALSE;
}

BOOL BtlCmd_LockMoveChoice(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    LockBattlerIntoCurrentMove(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_UnlockMoveChoice(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    UnlockBattlerOutOfCurrentMove(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_SetHealthbarStatus(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    BattleController_EmitHealthbarStatus(bsys, GetBattlerIDBySide(bsys, ctx, side), status);

    return FALSE;
}

BOOL BtlCmd_PrintTrainerMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msg = BattleScriptReadWord(ctx);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, side), msg);

    return FALSE;
}

extern u16 sPrizeMoneyTbl[0x81][2];

u32 CalcPrizeMoney(BattleSystem *bsys, BattleContext *ctx, int trainerIndex) {
    int i;
    TRPOKE *trPoke;
    u32 prizeMoney;
    u8 level = 0;
    u8 trainerClass;
    Trainer trainer;

    trPoke = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TRPOKE) * 6);

    TrainerData_ReadTrData(bsys->trainerId[trainerIndex], &trainer);
    TrainerData_ReadTrPoke(bsys->trainerId[trainerIndex], trPoke);

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
        if (bsys->battleType & BATTLE_TYPE_TAG || bsys->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
            prizeMoney = level * 4 * ctx->prizeMoneyValue * sPrizeMoneyTbl[i][1];
            break;
        } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
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

BOOL BtlCmd_PayPrizeMoney(BattleSystem *bsys, BattleContext *ctx) {
    u32 prizeMoney;

    BattleScriptIncrementPointer(ctx, 1);

    if (bsys->battleOutcomeFlag == 1) {
        prizeMoney = CalcPrizeMoney(bsys, ctx, 1);
        if (bsys->battleType & BATTLE_TYPE_TAG || bsys->battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
            prizeMoney += CalcPrizeMoney(bsys, ctx, 3);
        }
        PlayerProfile_AddMoney(BattleSystem_GetPlayerProfile(bsys, 0), prizeMoney);
    } else {
        prizeMoney = CalcMoneyLoss(bsys->trainerParty[0], bsys->playerProfile[0]);
        PlayerProfile_SubMoney(BattleSystem_GetPlayerProfile(bsys, 0), prizeMoney);
    }

    if (prizeMoney) {
        ctx->msgTemp = prizeMoney;
    } else {
        ctx->msgTemp = 0;
    }

    ctx->tempData = bsys->unk2474_1;

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimation(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSystem_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || status == 25 || status == 26) {
        int battlerId = GetBattlerIDBySide(bsys, ctx, side);
        if (CheckStatusEffectsSubstitute(ctx, battlerId, status) == TRUE) {
            BattleController_EmitSetStatus2Effect(bsys, ctx, battlerId, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimationOnMons(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSystem_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || status == 26 || status == 25) {
        int battlerIdA = GetBattlerIDBySide(bsys, ctx, sideA);
        int battlerIdB = GetBattlerIDBySide(bsys, ctx, sideB);
        if (CheckStatusEffectsSubstitute(ctx, battlerIdA, status) == TRUE && CheckStatusEffectsSubstitute(ctx, battlerIdB, status) == TRUE) {
            BattleController_EmitCopyStatus2Effect(bsys, ctx, battlerIdA, battlerIdB, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PlayBattleAnimationFromVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int *data = BattleScriptGetVarPointer(bsys, ctx, status);

    if (BattleSystem_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || *data == 25 || *data == 26) {
        if (CheckStatusEffectsSubstitute(ctx, battlerId, *data) == TRUE) {
            BattleController_EmitSetStatus2Effect(bsys, ctx, battlerId, *data);
        }
    }

    return FALSE;
}

BOOL BtlCmd_PrintRecallMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintReturnMessage(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_PrintSendOutMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintSendOutMessage(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_PrintEncounterMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintEncounterMessage(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_PrintFirstSendOutMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintFirstSendOutMessage(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_PrintBufferedTrainerMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)), ctx->msgTemp);

    return FALSE;
}

BOOL BtlCmd_TryConversion(BattleSystem *bsys, BattleContext *ctx) {
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
                i = BattleSystem_Random(bsys) % cnt;
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

BOOL BtlCmd_CompareVarToVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 *var = BattleScriptGetVarPointer(bsys, ctx, varNo);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

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

BOOL BtlCmd_CompareMonDataToVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int opcode = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), varNo, NULL);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

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

BOOL BtlCmd_AddPayDayMoney(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->msgTemp = ctx->unk_14C * ctx->prizeMoneyValue;

    if (ctx->msgTemp > 0xFFFF) {
        ctx->msgTemp = 0xFFFF;
    }

    PlayerProfile_AddMoney(BattleSystem_GetPlayerProfile(bsys, 0), ctx->msgTemp);

    return FALSE;
}

BOOL BtlCmd_TryLightScreen(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

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
        if (GetMonsHitCount(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.id = msg_0197_00192; //{0} raised your team's special defence slightly!
        } else {
            ctx->buffMsg.id = msg_0197_00190; //{0} raised your team's special defence!
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryReflect(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

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
        if (GetMonsHitCount(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.id = msg_0197_00196;
        } else {
            ctx->buffMsg.id = msg_0197_00194;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryMist(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

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

BOOL BtlCmd_TryOHKOMove(BattleSystem *bsys, BattleContext *ctx) {
    u16 hitChance;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->battleStatus |= BATTLE_STATUS_FLAT_HIT_RATE;

    if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STURDY) == TRUE) {
        ctx->moveStatusFlag |= MOVE_STATUS_STURDY;
    } else {
        if (!(ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON) && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_NO_GUARD && GetBattlerAbility(ctx, ctx->battlerIdTarget) != ABILITY_NO_GUARD) {
            hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->trainerAIData.moveData[ctx->moveNoCur].accuracy;
            if ((BattleSystem_Random(bsys) % 100) < hitChance && (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level)) {
                hitChance = 1;
            } else {
                hitChance = 0;
            }
        } else {
            if ((((ctx->battleMons[ctx->battlerIdTarget].unk88.battlerIdLockOn == ctx->battlerIdAttacker) && (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON)) || GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NO_GUARD || GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_NO_GUARD) && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                hitChance = 1;
            } else {
                hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->trainerAIData.moveData[ctx->moveNoCur].accuracy;
                if ((BattleSystem_Random(bsys) % 100) < hitChance && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
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

BOOL BtlCmd_DivideVarByValue(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denom = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(bsys, ctx, varNo);

    *data = DamageDivide(*data, denom);

    return FALSE;
}

BOOL BtlCmd_DivideVarByVar(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denomNo = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(bsys, ctx, varNo);
    int *denom = BattleScriptGetVarPointer(bsys, ctx, denomNo);

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

BOOL BtlCmd_TryMimic(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_Metronome(BattleSystem *bsys, BattleContext *ctx) {
    int metronomeIndex;
    u16 moveNo;

    BattleScriptIncrementPointer(ctx, 1);

    while (TRUE) {
        moveNo = (BattleSystem_Random(bsys) % 0x1d3) + 1;

        for (metronomeIndex = 0; metronomeIndex < MAX_MON_MOVES; metronomeIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[metronomeIndex] == moveNo) {
                break;
            }
        }

        if (metronomeIndex != MAX_MON_MOVES) {
            continue;
        }

        if (CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, moveNo) == FALSE) {
            continue;
        }

        ctx->moveTemp = moveNo;

        break;
    }

    return FALSE;
}

BOOL BtlCmd_TryDisable(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int disabledMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);

    if ((ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove == 0) && disabledMoveIndex != 4 && ctx->battleMons[ctx->battlerIdTarget].movePPCur[disabledMoveIndex] && ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        ctx->moveTemp = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove = ctx->moveTemp;
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledTurns = BattleSystem_Random(bsys) % 4 + 3;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Counter(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdPhysicalDamage;

    int sideA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
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

BOOL BtlCmd_MirrorCoat(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdSpecialDamage;

    int sideA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
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

BOOL BtlCmd_TryEncore(BattleSystem *bsys, BattleContext *ctx) {
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
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredTurns = BattleSystem_Random(bsys) % 5 + 3;
    } else {
        ctx->moveStatusFlag |= 64;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryConversion2(BattleSystem *bsys, BattleContext *ctx) {
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
                GetTypeEffectivnessData(bsys, 0xffff, &typeMove, &typeMon, &val);
                if (typeMove == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_1, NULL) != typeMon && GetBattlerVar(ctx, ctx->battlerIdAttacker, BMON_DATA_TYPE_2, NULL) != typeMon) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeMon;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeMon;
                    ctx->msgTemp = typeMon;
                    return FALSE;
                }
            }

            i = 0;
            while (GetTypeEffectivnessData(bsys, i, &typeMove, &typeMon, &val) == TRUE) {
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

BOOL BtlCmd_TrySketch(BattleSystem *bsys, BattleContext *ctx) {
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
            BattleController_EmitBattleMonToPartyMonCopy(bsys, ctx, ctx->battlerIdAttacker);
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

BOOL BtlCmd_TrySleepTalk(BattleSystem *bsys, BattleContext *ctx) {
    int moveIndex, nonSelectableMoves;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    nonSelectableMoves = 0;

    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++) {
        if (CheckMoveCallsOtherMove(ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex]) || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_FOCUS_PUNCH || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_UPROAR || ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_CHATTER || BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex])) {
            nonSelectableMoves |= MaskOfFlagNo(moveIndex);
        }
    }

    nonSelectableMoves = StruggleCheck(bsys, ctx, ctx->battlerIdAttacker, nonSelectableMoves, ~2);

    if (nonSelectableMoves == 15) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            moveIndex = BattleSystem_Random(bsys) % 4;
        } while (MaskOfFlagNo(moveIndex) & nonSelectableMoves);
        ctx->moveTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex];
    }

    return FALSE;
}

extern u8 sFlailDamageTable[6][2];

BOOL BtlCmd_CalcFlailPower(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TrySpite(BattleSystem *bsys, BattleContext *ctx) {
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
            CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdTarget);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPartyStatusRefresh(BattleSystem *bsys, BattleContext *ctx) {
    u32 battleType = BattleSystem_GetBattleType(bsys);
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
            battlerId = GetBattlerIDBySide(bsys, ctx, BATTLER_CATEGORY_ATTACKER_PARTNER);
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
            battlerId = GetBattlerIDBySide(bsys, ctx, BATTLER_CATEGORY_ATTACKER_PARTNER);
            if (!(ctx->switchInFlag & MaskOfFlagNo(battlerId))) {
                ctx->battleMons[battlerId].status = STATUS_NONE;
                ctx->battleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
            }
        } else {
            ctx->calcTemp |= 8;
        }
    }

    BattleControl_EmitPartyStatusHeal(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur);

    return FALSE;
}

BOOL BtlCmd_TryStealItem(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(bsys);
    int fieldSide = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) && !(battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER))) {
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
        } else if (ctx->battleMons[ctx->battlerIdAttacker].item || CanStealHeldItem(bsys, ctx, ctx->battlerIdTarget) == FALSE) {
            BattleScriptIncrementPointer(ctx, adrs1);
        }
    }

    return FALSE;
}

extern u16 sProtectSuccessChance[4];

BOOL BtlCmd_TryProtection(BattleSystem *bsys, BattleContext *ctx) {
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

    if (sProtectSuccessChance[ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns] >= (u32)BattleSystem_Random(bsys) && flag) {
        if (ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_PROTECT) {
            ctx->turnData[ctx->battlerIdAttacker].protectFlag = TRUE;
            ctx->buffMsg.id = msg_0197_00282;
        }
        if (ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_SURVIVE_WITH_1_HP) {
            ctx->turnData[ctx->battlerIdAttacker].endureFlag = TRUE;
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

BOOL BtlCmd_TrySubstitute(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TryWhirlwind(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (battleType & BATTLE_TYPE_TRAINER) {
        Party *party;
        Pokemon *mon;
        int partySize;
        int cnt = 0;
        int cntMax;
        int index0, indexEnd, monIndex, maxRand;
        int monIndexA, monIndexB;

        party = BattleSystem_GetParty(bsys, ctx->battlerIdTarget);
        partySize = BattleSystem_GetPartySize(bsys, ctx->battlerIdTarget);

        if (battleType & BATTLE_TYPE_MULTI || battleType & BATTLE_TYPE_TAG && BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget)) {
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
            monIndexB = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(bsys, ctx->battlerIdTarget)];
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
        } else if (WhirlwindCheck(bsys, ctx)) {
            do {
                do {
                    monIndex = (BattleSystem_Random(bsys) % maxRand);
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

    } else if (WhirlwindCheck(bsys, ctx) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Transform(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TrySpikes(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) ^ 1;

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers == 3) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SPIKES;
        ctx->fieldSideConditionData[fieldSide].spikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckSpikes(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(bsys, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers && ctx->battleMons[battlerId].hp) {
        ctx->hpCalc = (5 - ctx->fieldSideConditionData[fieldSide].spikesLayers) * 2;
        ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalc);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPerishSong(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

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

BOOL BtlCmd_GetTurnOrderBySpeed(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 *unkPtr = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));

    *unkPtr = ctx->turnOrder[ctx->unk_3104];

    return FALSE;
}

BOOL BtlCmd_GoToIfValidMon(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 varId = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);
    u32 *battlerId = BattleScriptGetVarPointer(bsys, ctx, varId);

    if (*battlerId < BattleSystem_GetMaxBattlers(bsys)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_EndOfTurnWeatherEffect(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    ctx->tempData = 0;
    ctx->hpCalc = 0;

    u32 type1 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_1, NULL);
    u32 type2 = GetBattlerVar(ctx, battlerId, BMON_DATA_TYPE_2, NULL);

    if (CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == 0 && CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == 0) {
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

BOOL BtlCmd_CalcRolloutPower(BattleSystem *bsys, BattleContext *ctx) {
    int i, j;
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].rolloutCount = ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    if (!(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_LOCKED_INTO_MOVE)) {
        LockBattlerIntoCurrentMove(bsys, ctx, ctx->battlerIdAttacker);
        ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount = 5;
    }

    if (--ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount == 0) {
        UnlockBattlerOutOfCurrentMove(bsys, ctx, ctx->battlerIdAttacker);
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

BOOL BtlCmd_CalcFuryCutterPower(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TryAttract(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTemp].gender == ctx->battleMons[ctx->battlerIdStatChange].gender || ctx->battleMons[ctx->battlerIdStatChange].status2 & STATUS2_ATTRACT || ctx->battleMons[ctx->battlerIdTemp].gender == 2 || ctx->battleMons[ctx->battlerIdStatChange].gender == 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdStatChange].status2 |= MaskOfFlagNo(ctx->battlerIdTemp) << 16;
    }

    return FALSE;
}

BOOL BtlCmd_TrySafeguard(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int fieldSide = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[fieldSide] & SIDE_CONDITION_SAFEGUARD) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SAFEGUARD;
        ctx->fieldSideConditionData[fieldSide].safeguardTurns = 5;
        ctx->fieldSideConditionData[fieldSide].safeguardBattler = ctx->battlerIdAttacker;
        ctx->buffMsg.tag = TAG_NONE_SIDE;
        ctx->buffMsg.param[0] = ctx->battlerIdAttacker;
        ctx->buffMsg.id = msg_0197_00198;
    }

    return FALSE;
}

BOOL BtlCmd_Present(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int adrs = BattleScriptReadWord(ctx);
    int rand = (u8)BattleSystem_Random(bsys);

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

BOOL BtlCmd_CalcMagnitudePower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->magnitude == 0) {
        ctx->magnitude = BattleSystem_Random(bsys) % 100;
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

BOOL BtlCmd_TryReplaceFaintedMon(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (!CanSwitchMon(bsys, ctx, battlerId)) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else if (flag == 1) {
        ctx->unk_13C[battlerId] |= 1;
    }

    return FALSE;
}

BOOL BtlCmd_RapidSpin(BattleSystem *bsys, BattleContext *ctx) {
    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);

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

BOOL BtlCmd_WeatherHPRecovery(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!(ctx->fieldCondition & FIELD_CONDITION_WEATHER) || CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) || CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        ctx->hpCalc = ctx->battleMons[ctx->battlerIdAttacker].maxHp / 2;
    } else if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
        ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp * 20, 30);
    } else {
        ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);
    }

    return FALSE;
}

BOOL BtlCmd_CalcHiddenPowerParams(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_CopyStatStages(BattleSystem *bsys, BattleContext *ctx) {
    int stat;

    BattleScriptIncrementPointer(ctx, 1);

    for (stat = 0; stat < 8; stat++) {
        ctx->battleMons[ctx->battlerIdAttacker].statChanges[stat] = ctx->battleMons[ctx->battlerIdTarget].statChanges[stat];
    }

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_FOCUS_ENERGY);

    return FALSE;
}

BOOL BtlCmd_TryFutureSight(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] == 0) {
        int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget);
        ctx->fieldSideConditionFlags[side] |= SIDE_CONDITION_FUTURE_SIGHT;
        ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] = 3;
        ctx->fieldConditionData.futureSightMoveNo[ctx->battlerIdTarget] = ctx->moveNoCur;
        ctx->fieldConditionData.battlerIdFutureSight[ctx->battlerIdTarget] = ctx->battlerIdAttacker;
        int damage = CalcMoveDamage(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[side], ctx->fieldCondition, 0, 0, ctx->battlerIdAttacker, ctx->battlerIdTarget, 1) * -1;
        ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ApplyDamageRange(bsys, ctx, damage);
        if (ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag) {
            ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] * 15 / 10;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckMoveHit(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideAttacker = BattleScriptReadWord(ctx);
    int sideTarget = BattleScriptReadWord(ctx);
    int move = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerIdAttacker = GetBattlerIDBySide(bsys, ctx, sideAttacker);
    int battlerIdTarget = GetBattlerIDBySide(bsys, ctx, sideTarget);
    int moveMsgNo = GetMoveMessageNo(ctx, move);

    BattleSystem_CheckMoveHitEffect(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveMsgNo);

    if (ctx->moveStatusFlag & 0x1fd849) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryTeleport(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 adrs = BattleScriptReadWord(ctx);

    if (CantEscape(bsys, ctx, ctx->battlerIdAttacker, NULL)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_BeatUp(BattleSystem *bsys, BattleContext *ctx) {
    int species;
    int form;
    int level;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int monCnt = BattleSystem_GetPartySize(bsys, ctx->battlerIdAttacker);

    if (ctx->multiHitCountTemp == 0) {
        ctx->multiHitCountTemp = 2;
        ctx->checkMultiHit = 253;
        ctx->beatUpCount = 0;

        while (TRUE) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
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

    mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
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
    ctx->damage = ApplyDamageRange(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    ctx->buffMsg.id = msg_0197_00481;
    ctx->buffMsg.tag = TAG_NICKNAME;
    ctx->buffMsg.param[0] = (ctx->battlerIdAttacker | (ctx->beatUpCount << 8));

    ctx->beatUpCount++;
    ctx->multiHitCount = 2;

    if (ctx->beatUpCount < monCnt) {
        while (TRUE) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
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

BOOL BtlCmd_FollowMe(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    ctx->fieldSideConditionData[side].followMeFlag = TRUE;
    ctx->fieldSideConditionData[side].battlerIdFollowMe = ctx->battlerIdAttacker;

    return FALSE;
}

BOOL BtlCmd_TryHelpingHand(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (battleType & BATTLE_TYPE_DOUBLES) {
        battlerId = GetBattlerIDBySide(bsys, ctx, 16);
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

BOOL BtlCmd_TrySwapItems(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrsA = BattleScriptReadWord(ctx);
    int adrsB = BattleScriptReadWord(ctx);

    u32 battleType = BattleSystem_GetBattleType(bsys);
    int sideAttacker = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideTarget = BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) && (battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) == 0) {
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

BOOL BtlCmd_TryWish(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TryAssist(BattleSystem *bsys, BattleContext *ctx) {
    u32 unkA;
    u16 avaliableMoves[6 * 4];
    u16 move;
    int i, j, monCnt, moveCnt;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    unkA = BattleScriptReadWord(ctx);

    moveCnt = 0;
    monCnt = BattleSystem_GetPartySize(bsys, ctx->battlerIdAttacker);

    for (i = 0; i < monCnt; i++) {
        if (i != ctx->selectedMonIndex[ctx->battlerIdAttacker]) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, i);
            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, 0);
                    if (CheckMoveCallsOtherMove(move) == FALSE && CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, move) == TRUE) {
                        avaliableMoves[moveCnt] = move;
                        moveCnt++;
                    }
                }
            }
        }
    }

    if (moveCnt) {
        ctx->moveTemp = avaliableMoves[BattleSystem_Random(bsys) % moveCnt];
    } else {
        BattleScriptIncrementPointer(ctx, unkA);
    }

    return FALSE;
}

BOOL BtlCmd_TrySetMagicCoat(BattleSystem *bsys, BattleContext *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);
    u32 unkA = BattleScriptReadWord(ctx);

    for (i = 0; i < BattleSystem_GetMaxBattlers(bsys); i++) {}

    if (ctx->battlersOnField == 1) {
        BattleScriptIncrementPointer(ctx, unkA);
    } else {
        ctx->turnData[ctx->battlerIdAttacker].magicCoatFlag = 1;
    }

    return FALSE;
}

BOOL BtlCmd_MagicCoat(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int battlerId = ctx->battlerIdAttacker;
    ctx->battlerIdMagicCoat = battlerId;
    ctx->battlerIdAttacker = ctx->battlerIdTarget;

    if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
        ctx->battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
    } else if (ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ADJACENT_OPPONENTS || ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ALL_ADJACENT) {
        ctx->battlerIdTarget = battlerId;
    } else {
        side = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->moveNoCur, 1, 0);
        if (ctx->selfTurnData[side].lightningRodFlag || ctx->selfTurnData[side].stormDrainFlag) {
            ctx->battlerIdTarget = side;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
    }

    ctx->battleStatus2 |= BATTLE_STATUS2_MAGIC_COAT;

    return FALSE;
}

BOOL BtlCmd_CalcRevengeDamageMul(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ctx->turnData[ctx->battlerIdAttacker].physicalDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitPhysicalDamage & MaskOfFlagNo(ctx->battlerIdTarget)) || (ctx->turnData[ctx->battlerIdAttacker].specialDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitSpecialDamage & MaskOfFlagNo(ctx->battlerIdTarget))) {
        ctx->unk_2158 = 20;
    } else {
        ctx->unk_2158 = 10;
    }

    return FALSE;
}

BOOL BtlCmd_TryBreakScreens(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget);

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

BOOL BtlCmd_TryYawn(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    u32 adrs = BattleScriptReadWord(ctx);
    if (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_YAWN) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags |= (2 << MOVE_EFFECT_FLAG_YAWN_SHIFT);
    }

    return FALSE;
}

BOOL BtlCmd_TryKnockOff(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        ctx->buffMsg.id = msg_0197_00714;
        ctx->buffMsg.tag = TAG_NICKNAME_ABILITY_MOVE;
        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdTarget);
        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdTarget].ability;
        ctx->buffMsg.param[2] = ctx->moveNoCur;
    } else if (ctx->battleMons[ctx->battlerIdTarget].item) {
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

BOOL BtlCmd_CalcHPFalloffPower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->movePower == 0) {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power * ctx->battleMons[ctx->battlerIdAttacker].hp / ctx->battleMons[ctx->battlerIdAttacker].maxHp;
        if (ctx->movePower == 0) {
            ctx->movePower = 1;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryImprison(BattleSystem *bsys, BattleContext *ctx) {
    int adrs, side, i, j, battlerId, maxBattlers, battlerIdA, battlerIdB;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    battlerIdA = ov12_0223ABB8(bsys, ctx->battlerIdAttacker, 0);
    battlerIdB = ov12_0223ABB8(bsys, ctx->battlerIdAttacker, 2);

    ctx->battleMons[battlerIdA].moveEffectFlags |= MOVE_EFFECT_FLAG_IMPRISON;
    ctx->battleMons[battlerIdB].moveEffectFlags |= MOVE_EFFECT_FLAG_IMPRISON;

    if (ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags & MOVE_EFFECT_FLAG_IMPRISON_USER) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
        maxBattlers = BattleSystem_GetMaxBattlers(bsys);
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if (side != BattleSystem_GetFieldSide(bsys, battlerId)) {
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

BOOL BtlCmd_TryGrudge(BattleSystem *bsys, BattleContext *ctx) {
    int pos;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdFainted].moveEffectFlags & MOVE_EFFECT_FLAG_GRUDGE && BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) != BattleSystem_GetFieldSide(bsys, ctx->battlerIdFainted) && ctx->battleMons[ctx->battlerIdAttacker].hp && ctx->moveNoTemp != MOVE_STRUGGLE) {
        pos = ctx->movePos[ctx->battlerIdAttacker];
        ctx->battleMons[ctx->battlerIdAttacker].movePPCur[pos] = 0;
        ctx->moveTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[pos];
        CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdAttacker);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySnatch(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    u32 maxBattlers;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    maxBattlers = 0;
    for (battlerId = 0; battlerId < BattleSystem_GetMaxBattlers(bsys); battlerId++) {
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

BOOL BtlCmd_CalcWeightBasedPower(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_CalcWeatherBallParams(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
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

BOOL BtlCmd_TryPursuit(BattleSystem *bsys, BattleContext *ctx) {
    int adrs, battlerId, maxBattlers, moveNo, moveIndex;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->playerActions[battlerId].command != CONTROLLER_COMMAND_40 && ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].status & 39) && !CheckTruant(ctx, battlerId) && BattleSystem_GetFieldSide(bsys, battlerId) != BattleSystem_GetFieldSide(bsys, ctx->battlerIdSwitch)) {
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
                    ov12_02252D14(bsys, ctx);
                    ctx->battlerIdAttacker = battlerId;
                    ctx->battlerIdTarget = ctx->battlerIdSwitch;
                    ctx->unk_2158 = 20;
                    ctx->moveNoCur = moveNo;
                    ctx->moveNoBattlerPrev[battlerId] = moveNo;
                    ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_40;
                    CopyBattleMonToPartyMon(bsys, ctx, battlerId);
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

BOOL BtlCmd_ApplyTypeEffectiveness(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->damage = ov12_02251D28(bsys, ctx, ctx->moveNoCur, ctx->moveType, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->damage, &ctx->moveStatusFlag);

    return FALSE;
}

BOOL BtlCmd_IfTurnFlag(BattleSystem *bsys, BattleContext *ctx) {
    int ret = FALSE;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

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

BOOL BtlCmd_SetTurnFlag(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

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

BOOL BtlCmd_CalcGyroBallPower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + 25 * ctx->effectiveSpeed[ctx->battlerIdTarget] / ctx->effectiveSpeed[ctx->battlerIdAttacker];

    if (ctx->movePower > 150) {
        ctx->movePower = 150;
    }

    return FALSE;
}

BOOL BtlCmd_TryMetalBurst(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int sideA = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSystem_GetFieldSide(bsys, ctx->turnData[ctx->battlerIdAttacker].unk38);

    if (ctx->turnData[ctx->battlerIdAttacker].unk34 && sideA != sideB && ctx->battleMons[ctx->turnData[ctx->battlerIdAttacker].unk38].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].unk34 * 15 / 10;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = ctx->turnData[ctx->battlerIdAttacker].unk38;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
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

BOOL BtlCmd_CalcPaybackPower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->playerActions[ctx->battlerIdTarget].command == CONTROLLER_COMMAND_40) {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power * 2;
    } else {
        ctx->movePower = ctx->trainerAIData.moveData[ctx->moveNoCur].power;
    }

    return FALSE;
}

extern u8 sTrumpCardPowerTable[];

BOOL BtlCmd_CalcTrumpCardPower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u8 pp = ctx->battleMons[ctx->battlerIdAttacker].movePPCur[ctx->movePos[ctx->battlerIdAttacker]];

    if (pp > 4) {
        pp = 4;
    }

    ctx->movePower = sTrumpCardPowerTable[pp];

    return FALSE;
}

BOOL BtlCmd_CalcWringOutPower(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + (120 * ctx->battleMons[ctx->battlerIdTarget].hp) / ctx->battleMons[ctx->battlerIdTarget].maxHp;

    return FALSE;
}

BOOL BtlCmd_TryMeFirst(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TryCopycat(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (CheckMoveCallsOtherMove(ctx->moveNoPrev) == FALSE && ctx->moveNoPrev && CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoPrev) == TRUE) {
        ctx->moveTemp = ctx->moveNoPrev;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CalcPunishmentPower(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TrySuckerPunch(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_CheckSideCondition(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSystem_GetFieldSide(bsys, GetBattlerIDBySide(bsys, ctx, side));

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

BOOL BtlCmd_TryFeint(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!ctx->turnData[ctx->battlerIdTarget].protectFlag) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPyschoShift(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].status || ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_SUBSTITUTE || !ctx->battleMons[ctx->battlerIdAttacker].status) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryLastResort(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int cnt = GetBattlerLearnedMoveCount(bsys, ctx, ctx->battlerIdAttacker);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount < cnt - 1 || cnt < 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryToxicSpikes(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int side = BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) ^ 1;

    if (ctx->fieldSideConditionData[side].toxicSpikesLayers == 2) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = TRUE;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[side] |= (1 << 10);
        ctx->fieldSideConditionData[side].toxicSpikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckToxicSpikes(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(bsys, battlerId);

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

BOOL BtlCmd_CheckIgnorableAbility(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int flag = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == 0) {
        int index;
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

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
        battlerId = GetBattlerIDBySide(bsys, ctx, side);
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

BOOL BtlCmd_IfSameSide(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerIdA = GetBattlerIDBySide(bsys, ctx, sideA);
    int battlerIdB = GetBattlerIDBySide(bsys, ctx, sideB);

    if (BattleSystem_GetFieldSide(bsys, battlerIdA) == BattleSystem_GetFieldSide(bsys, battlerIdB)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

extern const u16 sPickupTable1[18];
extern const u16 sPickupTable2[11];
extern const u8 sPickupWeightTable[9];
extern const u8 sHoneyGatherChanceTable[10];

BOOL BtlCmd_GenerateEndOfBattleItem(BattleSystem *bsys, BattleContext *ctx) {
    int rnd, i, j, k;
    u16 species, item;
    u8 ability, lvl;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    for (i = 0; i < BattleSystem_GetPartySize(bsys, 0); i++) {
        mon = BattleSystem_GetPartyMon(bsys, 0, i);
        species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
        ability = GetMonData(mon, MON_DATA_ABILITY, 0);
        if (ability == ABILITY_PICKUP
            && species != SPECIES_NONE
            && species != SPECIES_EGG
            && item == ITEM_NONE
            && !(BattleSystem_Random(bsys) % 10)) {
            rnd = BattleSystem_Random(bsys) % 100;
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

            if ((BattleSystem_Random(bsys) % 100) < sHoneyGatherChanceTable[j]) {
                j = ITEM_HONEY;
                SetMonData(mon, MON_DATA_HELD_ITEM, &j);
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrickRoom(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].trickRoomFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_IfMovedThisTurn(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (ov12_0225561C(ctx, battlerId) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckItemHoldEffect(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int flag = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int itemEffect = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (flag == 0) {
        if (GetBattlerHeldItemEffect(ctx, battlerId) == itemEffect) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else if (GetBattlerHeldItemEffect(ctx, battlerId) != itemEffect) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetItemHoldEffect(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *holdEffect = BattleScriptGetVarPointer(bsys, ctx, varId);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    u16 item = GetBattlerHeldItem(ctx, battlerId);
    *holdEffect = GetItemVar(ctx, item, ITEM_VAR_HOLD_EFFECT);

    return FALSE;
}

BOOL BtlCmd_GetItemEffectParam(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);
    u16 item = GetBattlerHeldItem(ctx, GetBattlerIDBySide(bsys, ctx, side));
    *var = GetItemVar(ctx, item, ITEM_VAR_MODIFIER);

    return FALSE;
}

extern const u8 sCamouflageTypeTable[13];

BOOL BtlCmd_TryCamouflage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    Terrain terrain = BattleSystem_GetTerrainId(bsys);
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

BOOL BtlCmd_GetTerrainMove(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSystem_GetTerrainId(bsys);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->moveTemp = sNaturePowerMoveTable[terrain];

    return FALSE;
}

extern u32 sSecretPowerEffectTable[];

BOOL BtlCmd_GetTerrainSecondaryEffect(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSystem_GetTerrainId(bsys);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->unk_2174 = sSecretPowerEffectTable[terrain];

    return FALSE;
}

BOOL BtlCmd_CalcNaturalGiftParams(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_TryPluck(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if ((ctx->battleMons[ctx->battlerIdTarget].item && ctx->battleMons[ctx->battlerIdTarget].unk88.custapBerryFlag) || TryEatOpponentBerry(bsys, ctx, ctx->battlerIdTarget) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs2);
    }

    return FALSE;
}

BOOL BtlCmd_TryFling(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (TryFling(bsys, ctx, ctx->battlerIdAttacker) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_YesNoMenu(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDrawYesNoBox(bsys, ctx, 0, 0, BattleScriptReadWord(ctx), 0, 0);

    return FALSE;
}

BOOL BtlCmd_WaitYesNoResult(BattleSystem *bsys, BattleContext *ctx) {
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

        ov12_0223BDDC(bsys, 0, selection);
    }

    ctx->battleContinueFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_ChoosePokemonMenu(BattleSystem *bsys, BattleContext *ctx) {
    BattleSystem_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitShowMonList(bsys, ctx, 0, 0, 0, 6);
    ctx->battlerIdSwitch = 0;

    return FALSE;
}

BOOL BtlCmd_WaitPokemonMenuResult(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_SetLinkBattleResult(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (BattleSystem_GetBattleType(bsys) & 4) {
        BattleController_EmitSetBattleResults(bsys);
    }

    return FALSE;
}

BOOL BtlCmd_CheckStealthRock(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSystem_GetFieldSide(bsys, battlerId);
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

BOOL BtlCmd_CheckEffectActivation(BattleSystem *bsys, BattleContext *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SERENE_GRACE) {
        effectChance = ctx->trainerAIData.moveData[ctx->moveNoCur].effectChance * 2;
    } else {
        effectChance = ctx->trainerAIData.moveData[ctx->moveNoCur].effectChance;
    }

    GF_ASSERT(effectChance != 0);

    if ((BattleSystem_Random(bsys) % 100) < effectChance && ctx->battleMons[ctx->battlerIdStatChange].hp) {
        return FALSE;
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_CheckChatterActivation(BattleSystem *bsys, BattleContext *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int param;

    if (ctx->battleMons[ctx->battlerIdAttacker].species == SPECIES_CHATOT && ctx->battleMons[ctx->battlerIdTarget].hp && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 21))) {
        if ((BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) == FALSE) {
            param = sub_02006EFC(BattleSystem_GetChatotVoice(bsys, ctx->battlerIdAttacker));
        } else {
            param = BattleSystem_GetChatotVoiceParam(bsys, ctx->battlerIdAttacker);
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
        if ((BattleSystem_Random(bsys) % 100) > effectChance) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetCurrentMoveData(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcTemp = GetMoveTblAttr(&ctx->trainerAIData.moveData[ctx->moveNoCur], (MoveAttr)BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_SetMosaic(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int param = BattleScriptReadWord(ctx);
    int delay = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlayMosaicAnimation(bsys, battlerId, param, delay);

    return FALSE;
}

BOOL BtlCmd_ChangeForm(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    BattleController_EmitChangeForm(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_SetBattleBackground(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitSetBattleBackground(bsys, 0);
    return FALSE;
}

BOOL BtlCmd_UseBagItem(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleSystem_RecoverStatus(bsys, battlerId, ctx->selectedMonIndex[battlerId], 0, ctx->itemTemp);

    return FALSE;
}

BOOL BtlCmd_TryEscape(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (BattleTryRun(bsys, ctx, battlerId)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_ShowBattleStartPartyGauge(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitInitStartBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_HideBattleStartPartyGauge(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitDeleteStartBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_ShowPartyGauge(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitInitBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_HidePartyGauge(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitDeleteBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_LoadPartyGaugeGraphics(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitLoadBallGfx(bsys);

    return FALSE;
}

BOOL BtlCmd_FreePartyGaugeGraphics(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDeleteBallGfx(bsys);

    return FALSE;
}

BOOL BtlCmd_IncrementGameStat(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int id = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitIncrementGameStat(bsys, battlerId, flag, id);

    return FALSE;
}

BOOL BtlCmd_RestoreSprite(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    ov12_02263F8C(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_TriggerAbilityOnHit(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (CheckAbilityEffectOnHit(bsys, ctx, &ctx->tempData) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SpriteToOAM(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_02264038(bsys, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02264038(bsys, battlerId);
            }
        }
        break;
    default:
        battlerId = GetBattlerIDBySide(bsys, ctx, side);
        ov12_02264038(bsys, battlerId);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_OAMToSprite(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_02264054(bsys, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSystem_GetOpponentData(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02264054(bsys, battlerId);
            }
        }
        break;
    default:
        battlerId = GetBattlerIDBySide(bsys, ctx, side);
        ov12_02264054(bsys, battlerId);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_CheckWhiteout(BattleSystem *bsys, BattleContext *ctx) {
    int i;
    int adrs;
    int battlerId;
    int partyHp = 0;

    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    adrs = BattleScriptReadWord(ctx);

    int battleType = BattleSystem_GetBattleType(bsys);
    battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (battleType & BATTLE_TYPE_MULTI || (battleType & BATTLE_TYPE_TAG && BattleSystem_GetFieldSide(bsys, battlerId))) {
        Party *party1 = BattleSystem_GetParty(bsys, battlerId);
        Party *party2 = BattleSystem_GetParty(bsys, BattleSystem_GetBattlerIdPartner(bsys, battlerId));

        BattleSystem_GetOpponentData(bsys, battlerId);

        for (i = 0; i < Party_GetCount(party1); i++) {
            mon = Party_GetMonByIndex(party1, i);
            if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if ((battleType == 75 || battleType == 74) && BattleSystem_GetFieldSide(bsys, battlerId) == 0 && ov12_0223AB0C(bsys, battlerId) == 2) {

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
        Party *party = BattleSystem_GetParty(bsys, battlerId);

        BattleSystem_GetOpponentData(bsys, battlerId);

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

BOOL BtlCmd_BoostRandomStatBy2(BattleSystem *bsys, BattleContext *ctx) {
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
        ctx->unk_2170 = 39 + statChanges[BattleSystem_Random(bsys) % cnt];
        ctx->unk_2170 |= (1 << 31);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_RemoveItem(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->recycleItem[battlerId] = ctx->battleMons[battlerId].item;

    ctx->battleMons[battlerId].item = 0;

    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_TryRecycle(BattleSystem *bsys, BattleContext *ctx) {
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

BOOL BtlCmd_CheckItemHoldEffectOnHit(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (!CheckItemEffectOnHit(bsys, ctx, &ctx->tempData)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_PrintBattleResultMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintResultMessage(bsys);

    return FALSE;
}

BOOL BtlCmd_PrintEscapeMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitRunAwayMessage(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_PrintForfeitMessage(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitForefitMessage(bsys);

    return FALSE;
}

BOOL BtlCmd_CheckHoldOnWith1HP(BattleSystem *bsys, BattleContext *ctx) {
    BOOL flag = FALSE;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int itemEffect = GetBattlerHeldItemEffect(ctx, battlerId);
    int activationChance = GetHeldItemModifier(ctx, battlerId, 0);

    if (itemEffect == HOLD_EFFECT_MAYBE_ENDURE && (BattleSystem_Random(bsys) % 100) < activationChance) {
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

BOOL BtlCmd_TryRestoreStatusOnSwitch(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    if (ctx->battleMons[battlerId].hp && ctx->selectedMonIndex[battlerId] != 6) {
        Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, ctx->selectedMonIndex[battlerId]);
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

BOOL BtlCmd_CheckSubstitute(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (ctx->battleMons[battlerId].status2 & (1 << 24) || ctx->selfTurnData[battlerId].unk14 & 8) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckIgnoreWeather(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {

    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SetRandomTarget(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_CheckItemHoldEffectOnUTurn(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckItemEffectOnUTurn(bsys, ctx, &ctx->tempData)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_RefreshSprite(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitSwapToSubstituteSprite(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_PlayMoveHitSound(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlayMoveSE(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_PlayBGM(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int song = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlaySong(bsys, battlerId, song);

    return FALSE;
}

BOOL BtlCmd_CheckSafariGameDone(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!(BattleSystem_GetPartySize(bsys, 0) != 6 || PCStorage_FindFirstBoxWithEmptySlot(bsys->storage) != 18)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_WaitTime(BattleSystem *bsys, BattleContext *ctx) {
    int tSpeed;

    BattleScriptIncrementPointer(ctx, 1);

    int wait = BattleScriptReadWord(ctx);

    if ((bsys->battleType & BATTLE_TYPE_LINK) && !(bsys->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
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

BOOL BtlCmd_CheckCurMoveIsType(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int type = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (ctx->trainerAIData.moveData[ctx->moveNoCur].type == type) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_LoadArchivedMonData(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int species = BattleScriptReadWord(ctx);
    int form = BattleScriptReadWord(ctx);
    int stat = BattleScriptReadWord(ctx);

    int *formPtr = BattleScriptGetVarPointer(bsys, ctx, form);

    ctx->calcTemp = GetMonBaseStat_HandleAlternateForm(species, *formPtr, stat);

    return FALSE;
}

BOOL BtlCmd_RefreshMonData(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleSystem_ReloadMonData(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_222(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msgIndex = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (TrainerMessageWithIdPairExists(BattleSystem_GetTrainerIndex(bsys, battlerId), msgIndex, HEAP_ID_BATTLE)) {
        ctx->msgTemp = msgIndex;
    } else {
        ctx->msgTemp = 0;
    }

    return FALSE;
}

BOOL BtlCmd_223(BattleSystem *bsys, BattleContext *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int a2 = BattleScriptReadWord(ctx);

    ov12_022645C8(bsys, ctx, a2 & 1);

    return FALSE;
}

BOOL BtlCmd_EndScript(BattleSystem *bsys, BattleContext *ctx) {
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

static void *BattleScriptGetVarPointer(BattleSystem *bsys, BattleContext *ctx, int var) {
    switch (var) {
    case BSCRIPT_VAR_BATTLE_TYPE:
        return &bsys->battleType;
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
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker)];
    case BSCRIPT_VAR_SIDE_CONDITION_TARGET:
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget)];
    case BSCRIPT_VAR_SIDE_CONDITION_STAT_CHANGE:
        return &ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, ctx->battlerIdStatChange)];
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
        return &bsys->battleOutcomeFlag;
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
        return &bsys->battleSpecial;
    case BSCRIPT_VAR_ATTACKER_LOCKED_MOVE:
        return &ctx->moveNoLockedInto[ctx->battlerIdAttacker];
    case BSCRIPT_VAR_HIT_DAMAGE:
        return &ctx->hitDamage;
    case BSCRIPT_VAR_SAFARI_BALL_CNT:
        return &bsys->safariBallCnt;
    case BSCRIPT_VAR_SWITCHED_MON_TEMP:
        return &ctx->battlerIdSwitchTemp;
    case BSCRIPT_VAR_MOVE_TYPE:
        return &ctx->moveType;
    case BSCRIPT_VAR_MOVE_EFFECT_CHANCE:
        return &ctx->unk_2164;
    case BSCRIPT_VAR_REGULATION_FLAG:
        return &bsys->unk241C;
    case BSCRIPT_VAR_BATTLE_STATUS_2:
        return &ctx->battleStatus2;
    case BSCRIPT_VAR_TURN_ORDER_COUNTER:
        return &ctx->executionIndex;
    case BSCRIPT_VAR_MAX_BATTLERS:
        return &bsys->maxBattlers;
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
        return &bsys->unk2478;
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

    msgLoader = BattleSystem_GetMessageData(data->bsys);
    battleType = BattleSystem_GetBattleType(data->bsys);
    side = (data->ctx->battlerIdFainted >> 1) & 1; // Get side of fainted mon (left or right)
    expBattler = 0;

    // Figure out which mon we're working on
    for (slot = data->unk30[6]; slot < BattleSystem_GetPartySize(data->bsys, expBattler); slot++) {
        mon = BattleSystem_GetPartyMon(data->bsys, expBattler, slot);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        itemEffect = GetItemAttr(item, ITEM_VAR_HOLD_EFFECT, HEAP_ID_BATTLE);

        if (itemEffect == HOLD_EFFECT_EXP_SHARE || (data->ctx->unk_A4[side] & MaskOfFlagNo(slot))) {
            break;
        }
    }

    if (slot == BattleSystem_GetPartySize(data->bsys, expBattler)) {
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
            BattleSystem_SetCriticalHpMusicFlag(data->bsys, CRITICAL_MUSIC_OFF);
        }

        u32 totalExp = 0;
        msg.id = msg_0197_00001; // "{0} gained {1} Exp. Points!"

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

            if (!ov12_022568B0(data->bsys, mon)) {
                if (GetMonData(mon, MON_DATA_LANGUAGE, NULL) != gGameLanguage) {
                    totalExp = totalExp * 170 / 100;
                } else {
                    totalExp = totalExp * 150 / 100;
                }

                msg.id = msg_0197_00002; // "{0} gained a boosted {1} Exp. Points!"
            }

            u32 newExp = GetMonData(mon, MON_DATA_EXPERIENCE, NULL);
            data->unk30[3] = newExp - GetMonBaseExperienceAtCurrentLevel(mon);
            newExp += totalExp;

            if (slot == data->ctx->selectedMonIndex[expBattler]) {
                data->ctx->battleMons[expBattler].exp = newExp;
            }

            SetMonData(mon, MON_DATA_EXPERIENCE, &newExp);
            BattleScript_CalcEffortValues(BattleSystem_GetParty(data->bsys, expBattler),
                slot,
                data->ctx->battleMons[data->ctx->battlerIdFainted].species,
                data->ctx->battleMons[data->ctx->battlerIdFainted].form);
        }

        if (totalExp) {
            msg.tag = TAG_NICKNAME_NUM;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = totalExp;
            data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
            data->unk30[1] = 7;
            data->state++;
        } else {
            data->state = STATE_GET_EXP_CHECK_DONE;
        }

        break;

    case STATE_GET_EXP_WAIT_MESSAGE_PRINT:
        if (!TextPrinterCheckActive(data->unk30[0])) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_WAIT_MESSAGE_DELAY:
        if (--data->unk30[1] == 0) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_GAUGE:
        // Only animate the gauge for an active battler
        if (slot == data->ctx->selectedMonIndex[expBattler]) {
            ov12_02263564(data->bsys, data->ctx, expBattler, data->unk30[3]);
            data->unk30[3] = 0;
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
            // Only play the special level-up animation for an active battler
            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleController_EmitSetStatus2Effect(data->bsys, data->ctx, expBattler, 8);
                ov12_0226399C(data->bsys, expBattler);
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
            // Cache the stats from the previous level for later
            data->ctx->prevLevelStats = Heap_Alloc(HEAP_ID_BATTLE, sizeof(PokemonStats));
            PokemonStats *oldStats = data->ctx->prevLevelStats;
            for (i = 0; i < NUM_STATS; i++) {
                oldStats->stats[i] = GetMonData(mon, stats.stats[i], NULL);
            }

            MonApplyFriendshipMod(mon, MON_MOOD_MODIFIER_LEVEL_UP_IN_BATTLE, BattleSystem_GetLocation(data->bsys));
            ApplyMonMoodModifier(mon, 0);
            CalcMonStats(mon);

            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleSystem_ReloadMonData(data->bsys, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
            }

            data->ctx->levelUpMons |= MaskOfFlagNo(slot);
            ov12_02263A1C(data->bsys, data->ctx, expBattler);

            msg.id = msg_0197_00003; // "{0} grew to Lv. {1}!"
            msg.tag = TAG_NICKNAME_NUM;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = level;
            data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
            data->state = STATE_GET_EXP_WAIT_LEVEL_UP_MESSAGE_PRINT;
        }
        break;

    case STATE_GET_EXP_WAIT_LEVEL_UP_MESSAGE_PRINT:
        if (TextPrinterCheckActive(data->unk30[0]) == 0) {
            data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_LOAD_ICON;
            data->unk30[2] = 0;
        }
        break;

    case STATE_GET_EXP_LEVEL_UP_SUMMARY_LOAD_ICON:
        // Load the Pokemon's Party icon if they are not the active battler
        if (data->ctx->selectedMonIndex[expBattler] != slot) {
            ov12_02248228(data->bsys, data, mon);
        }

        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_INIT;
        break;

    case STATE_GET_EXP_LEVEL_UP_SUMMARY_INIT: {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(data->bsys);
        Window *window = BattleSystem_GetWindow(data->bsys, 1);
        PaletteData *palette = BattleSystem_GetPaletteData(data->bsys);

        G2_SetBG0Priority(2);
        SetBgPriority(GF_BG_LYR_MAIN_1, 1);
        SetBgPriority(GF_BG_LYR_MAIN_2, 0);

        ov12_0223C224(data->bsys, 1);

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

        Window *window = BattleSystem_GetWindow(data->bsys, 1);
        PokemonStats *oldStats = data->ctx->prevLevelStats;

        for (i = 0; i < NUM_STATS; i++) {
            msg.id = msg_0197_00947; // stat name
            msg.tag = TAG_STAT;
            msg.param[0] = stats.stats[i];

            ov12_0223C4E8(data->bsys, window, msgLoader, &msg, 0, 16 * i, 0, 0, 0);

            msg.id = msg_0197_00948; // "+{0}"
            msg.tag = TAG_NUMBERS;
            msg.param[0] = GetMonData(mon, monData.stats[i], NULL) - oldStats->stats[i];
            msg.numDigits = 2;

            ov12_0223C4E8(data->bsys, window, msgLoader, &msg, 80, 16 * i, 0, 0, 0);
        }

        data->state = STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_DIFF_WAIT;
        break;
    }
    case STATE_GET_EXP_LEVEL_UP_SUMMARY_PRINT_TRUE: {
        TempStatsStruct monData = ov12_0226C33C;
        Window *window = BattleSystem_GetWindow(data->bsys, 1);

        FillWindowPixelRect(window, 0xF, 80, 0, 36, 96); // clear out the diff section (keep the printed stat names)

        for (i = 0; i < NUM_STATS; i++) {
            msg.id = msg_0197_00949; // just a number
            msg.tag = TAG_NUMBERS;
            msg.param[0] = GetMonData(mon, monData.stats[i], NULL);
            msg.numDigits = 3;

            ov12_0223C4E8(data->bsys, window, msgLoader, &msg, 72, 16 * i, 0x2, 36, 0);
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
        Window *window = BattleSystem_GetWindow(data->bsys, 1);

        sub_0200E5D4(window, 0);
        RemoveWindow(window);

        G2_SetBG0Priority(1);
        SetBgPriority(GF_BG_LYR_MAIN_1, 0);
        SetBgPriority(GF_BG_LYR_MAIN_2, 1);

        ov12_0223C224(data->bsys, 0);

        if (data->ctx->selectedMonIndex[expBattler] != slot) {
            ov12_022484D4(data->bsys, data);
        }

        Heap_Free(data->ctx->prevLevelStats);
        data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        break;
    }

    case STATE_GET_EXP_CHECK_LEARN_MOVE: {
        u16 move;
        BgConfig *bgConfig = BattleSystem_GetBgConfig(data->bsys); // unused, but must be kept to match

        switch (MonTryLearnMoveOnLevelUp(mon, &data->unk30[2], &move)) {
        case 0:
            data->state = STATE_GET_EXP_GAUGE;
            break;
        case 0xFFFE:
            break;
        case 0xFFFF:
            data->unk30[4] = move;
            data->state = STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT;
            break;
        default:
            if (data->ctx->selectedMonIndex[expBattler] == slot) {
                BattleSystem_ReloadMonData(data->bsys, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
            }

            msg.id = msg_0197_00004; // "{0} learned {1}!"
            msg.tag = TAG_NICKNAME_MOVE;
            msg.param[0] = expBattler | (slot << 8);
            msg.param[1] = move;
            data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
            data->state = STATE_GET_EXP_LEARNED_MOVE_WAIT;
            break;
        }
        break;
    }

    case STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT:
        msg.id = msg_0197_01178; // "{0} wants to learn the move {1}."
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = data->unk30[4];
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT:
        msg.id = msg_0197_01179; // "But {0} can't learn more than four moves."
        msg.tag = TAG_NICKNAME;
        msg.param[0] = expBattler | (slot << 8);
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT_WAIT:
    case STATE_GET_EXP_CANT_LEARN_MORE_MOVES_PRINT_WAIT:
    case STATE_GET_EXP_ONE_TWO_POOF_WAIT:
    case STATE_GET_EXP_FORGOT_HOW_TO_USE_WAIT:
    case STATE_GET_EXP_AND_DOTDOTDOT_WAIT:
    case STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED_WAIT:
        if (!TextPrinterCheckActive(data->unk30[0])) {
            data->state++;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_PROMPT:
        // "Make it forget another move?"
        BattleController_EmitDrawYesNoBox(data->bsys, data->ctx, expBattler, msg_0197_01180, 1, 0, 0);
        data->state++;
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_ANSWER:
        if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) { // TODO: could use a const
                data->state = STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED;
            } else {
                msg.id = msg_0197_01183; // "Which move should be forgotten?"
                msg.tag = TAG_NONE;
                data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
                data->state = STATE_GET_EXP_MAKE_IT_FORGET_WAIT;
            }
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_WAIT:
        if (!TextPrinterCheckActive(data->unk30[0])) {
            ov12_02263D14(data->bsys, expBattler, data->unk30[4], slot);
            data->state++;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_INPUT_TAKEN:
        if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) {
            data->state = STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED;
        } else if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            data->unk30[5] = data->ctx->battleBuffer[expBattler][0] - 1;
            data->state = STATE_GET_EXP_ONE_TWO_POOF;
        }
        break;

    case STATE_GET_EXP_MAKE_IT_FORGET_CANCELLED:
        msg.id = msg_0197_01184; // "Well, then..."
        msg.tag = TAG_NONE;
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_PROMPT:
        // "Should this Pokémon give up on learning this new move?"
        BattleController_EmitDrawYesNoBox(data->bsys, data->ctx, expBattler, msg_0197_01185, 2, data->unk30[4], 0);
        data->state++;
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_ANSWER:
        if (BattleBuffer_GetNext(data->ctx, expBattler)) {
            if (BattleBuffer_GetNext(data->ctx, expBattler) == 0xFF) {
                data->state = STATE_GET_EXP_WANTS_TO_LEARN_MOVE_PRINT;
            } else {
                msg.id = msg_0197_01188; // "{0} did not learn {1}."
                msg.tag = TAG_NICKNAME_MOVE;
                msg.param[0] = expBattler | (slot << 8);
                msg.param[1] = data->unk30[4];
                data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
                data->state = 35;
            }
        }
        break;

    case STATE_GET_EXP_GIVE_UP_LEARNING_WAIT:
        if (!TextPrinterCheckActive(data->unk30[0])) {
            // Check for another move to learn
            data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        }
        break;

    case STATE_GET_EXP_ONE_TWO_POOF:
        msg.id = msg_0197_01189; // "1, 2, and... ... Poof!"
        msg.tag = 0;
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_FORGOT_HOW_TO_USE:
        msg.id = msg_0197_01190; // "{0} forgot how to use {1}."
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = GetMonData(mon, MON_DATA_MOVE1 + data->unk30[5], NULL);
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_AND_DOTDOTDOT:
        msg.id = msg_0197_01191; // "And..."
        msg.tag = TAG_NONE;
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));
        data->state++;
        break;

    case STATE_GET_EXP_LEARNED_MOVE:
        msg.id = msg_0197_01192; // "{0} learned {1}!"
        msg.tag = TAG_NICKNAME_MOVE;
        msg.param[0] = expBattler | (slot << 8);
        msg.param[1] = data->unk30[4];
        data->unk30[0] = BattleSystem_PrintBattleMessage(data->bsys, msgLoader, &msg, BattleSystem_GetTextFrameDelay(data->bsys));

        i = 0;
        SetMonData(mon, MON_DATA_MOVE1_PP_UPS + data->unk30[5], &i);
        MonSetMoveInSlot(mon, data->unk30[4], data->unk30[5]);

        if (data->ctx->selectedMonIndex[expBattler] == slot) {
            BattleSystem_ReloadMonData(data->bsys, data->ctx, expBattler, data->ctx->selectedMonIndex[expBattler]);
        }

        data->state = STATE_GET_EXP_LEARNED_MOVE_WAIT;
        break;

    case STATE_GET_EXP_LEARNED_MOVE_WAIT:
        if (!TextPrinterCheckActive(data->unk30[0])) {
            // Check for another move to learn
            data->state = STATE_GET_EXP_CHECK_LEARN_MOVE;
        }
        break;

    case STATE_GET_EXP_CHECK_DONE:
        data->ctx->unk_A4[side] &= (MaskOfFlagNo(slot) ^ 0xFFFFFFFF); // this mon is done
        data->unk30[6] = slot + 1;
        data->state = STATE_GET_EXP_START; // go back to the top and get the next mon
        break;

    case STATE_GET_EXP_DONE:
        data->ctx->getterWork = NULL;
        Heap_Free(inData);
        SysTask_Destroy(task);
        break;
    }
}
