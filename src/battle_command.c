#include "assert.h"
#include "battle_controller.h"
#include "battle_controller_player.h"
#include "battle_command.h"
#include "item.h"
#include "party.h"
#include "pokemon.h"
#include "system.h"
#include "unk_0200E320.h"
#include "unk_0208805C.h"
#include "unk_02025154.h"
#include "sound_chatot.h"
#include "overlay_12_0224E4FC.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"

int BattleScriptReadWord(BATTLECONTEXT *ctx);
static void BattleScriptIncrementPointer(BATTLECONTEXT *ctx, int adrs);
static void BattleScriptJump(BATTLECONTEXT *ctx, NarcId narcId, int adrs);
static void BattleScriptGotoSubscript(BATTLECONTEXT *ctx, int a1, int adrs);
static void *BattleScriptGetVarPointer(BattleSystem *bsys, BATTLECONTEXT *ctx, int var);

u8 GetBattlerIDBySide(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2);

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret;

    do {
        ret = sBattleScriptCommandTable[ctx->battleScriptWork[ctx->scriptSeqNo]](bsys, ctx);
    } while(ctx->battleContinueFlag == 0 && (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_2) == 0);

    ctx->battleContinueFlag = 0;

    return ret;
}

BOOL BtlCmd_PlayEncounterAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPlayEncounterAnimation(bsys, FALSE);
    return FALSE;
}

BOOL BtlCmd_PokemonEncounter(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    switch (BattleScriptReadWord(ctx)) {
    default:
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonEncounter(bsys, battlerId);
            PokedexSetBattlerSeen(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        break;
    case B_SIDE_OPPONENT:
        OpponentData *opponentData;
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitPokemonEncounter(bsys, battlerId);
                PokedexSetBattlerSeen(bsys, battlerId);
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSlideIn(bsys, battlerId);
            PokedexSetBattlerSeen(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitPokemonSlideIn(bsys, battlerId);
                PokedexSetBattlerSeen(bsys, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(bsys, ctx, battlerId);
                BattleController_EmitPokemonSlideIn(bsys, battlerId);
                PokedexSetBattlerSeen(bsys, battlerId);
            }
        }
        break;
    case B_SIDE_1:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdAttacker);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdAttacker);
        break;
    case B_SIDE_2:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdTarget);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdTarget);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdTarget);
        break;
    case B_SIDE_6:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdSwitch);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdSwitch);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSlideIn(bsys, ctx->battlerIdSwitch);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSendOut(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
            PokedexSetBattlerSeen(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
                PokedexSetBattlerSeen(bsys, battlerId);
            }
        }
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
        BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleSystem_ClearExperienceEarnFlags(ctx, battlerId);
                BattleSystem_SetExperienceEarnFlags(bsys, ctx, battlerId);
                BattleController_EmitPokemonSendOut(bsys, battlerId, 0, 0);
                PokedexSetBattlerSeen(bsys, battlerId);
            }
        }
        break;
    case 1:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdAttacker);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdAttacker);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdAttacker);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdAttacker, 0, 0);
        break;
    case 2:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdTarget);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdTarget);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdTarget);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdTarget, 0, 0);
        break;
    case 6:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdSwitch);
        if (!(opponentData->unk195 & 1)) {
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, BATTLER_ENEMY2);
        } else {
            BattleSystem_ClearExperienceEarnFlags(ctx, ctx->battlerIdSwitch);
            BattleSystem_SetExperienceEarnFlags(bsys, ctx, ctx->battlerIdSwitch);
        }
        PokedexSetBattlerSeen(bsys, ctx->battlerIdSwitch);
        BattleController_EmitPokemonSendOut(bsys, ctx->battlerIdSwitch, 0, 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_RecallPokemon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitRecallPokemon(bsys, ctx, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitRecallPokemon(bsys, ctx, battlerId);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1 && !(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
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

BOOL BtlCmd_DeletePokemon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));
    BattleController_EmitDeletePokemon(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_TrainerEncounter(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    case 0:
    default:
        if (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
                if (opponentData->unk195 != 4) {
                    BattleController_EmitTrainerEncounter(bsys, battlerId);
                }
            }
        } else {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) &&
                    (battlerId > 1)) {
                    break;
                }
                BattleController_EmitTrainerEncounter(bsys, battlerId);
            }
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                BattleController_EmitTrainerEncounter(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerEncounter(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ThrowPokeball(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) &&
                (battlerId > 1)) {
                break;
            }
            BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_TrainerSlideOut(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) &&
                (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideOut(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_MULTI) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    case 12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                BattleController_EmitTrainerSlideOut(bsys, battlerId);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_TrainerSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 index = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES) && (battlerId > 1)) {
                break;
            }
            BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DOUBLES)) {
                    break;
                }
            }
        }
        break;
    case B_SIDE_9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case B_SIDE_10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case B_SIDE_11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    case B_SIDE_12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                BattleController_EmitTrainerSlideIn(bsys, battlerId, index);
                break;
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_BackgroundSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        BattleController_EmitBackgroundSlideIn(bsys, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
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

BOOL BtlCmd_HealthbarSlideInDelay(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;
    u8 delay;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    delay = 0;

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
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

BOOL BtlCmd_HealthbarSlideOut(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideOut(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0 && (ctx->unk_3108 & MaskOfFlagNo(battlerId)) == 0) {
                BattleController_EmitHealthbarSlideOut(bsys, battlerId);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
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

BOOL BtlCmd_WaitForMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (Link_QueueNotEmpty(ctx)) {
        BattleScriptIncrementPointer(ctx, 1);
    } else {
        Link_CheckTimeout(ctx);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

static void DamageCalcDefault(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int type;

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->unk_334.moveData[ctx->moveNoCur].type;
    }

    ctx->damage = CalcMoveDamage(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget)], ctx->fieldCondition, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

    ctx->damage *= ctx->criticalMultiplier;

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_HP_DRAIN_ON_ATK) {
        ctx->damage = ctx->damage * (100 + BattleSystem_GetHeldItemDamageBoost(ctx, ctx->battlerIdAttacker, 0))/100;
    }

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_BOOST_REPEATED) {
        ctx->damage = ctx->damage * (10 + ctx->battleMons[ctx->battlerIdAttacker].unk88.unk4_17)/10;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag) {
        if (ctx->meFirstTotal == ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount--;
        }
        if ((ctx->meFirstTotal - ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount) < 2) {
            ctx->damage = ctx->damage*15/10;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag = 0;
        }
    }
}

BOOL BtlCmd_DamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(bsys, ctx);
    ctx->damage = ov12_02257C30(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_DamageCalcRaw(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    DamageCalcDefault(bsys, ctx);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_PrintAttackMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ctx->linkStatus & 1) == FALSE) {
        BattleController_EmitPrintAttackMessage(bsys, ctx);
    }

    ctx->linkStatus |= 1;
    ctx->linkStatus2 |= 4;

    return FALSE;
}

BOOL BtlCmd_PrintMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);
    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintMessage2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.tag |= 128;

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPrintMessage(bsys, ctx, &ctx->buffMsg);
    return FALSE;
}

BOOL BtlCmd_BufferMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &ctx->buffMsg);

    return FALSE;
}

BOOL BtlCmd_BufferMessageSide(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.tag |= 64;
    msg.battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;

    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);

    if (battler == 255) {
        move = ctx->moveWork;
    } else {
        move = ctx->moveNoCur;
    }

    if ((!(ctx->linkStatus & (1 << 14)) && BattleSys_AreBattleAnimationsOn(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->linkStatus |= (1 << 14);
        BattleController_SetMoveEffect(bsys, ctx, move);
    }

    if (!BattleSys_AreBattleAnimationsOn(bsys)) {
        BattleScriptGotoSubscript(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;

    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);
    u32 attackerSide = BattleScriptReadWord(ctx);
    u32 defenderSide = BattleScriptReadWord(ctx);

    if (battler == 255) {
        move = ctx->moveWork;
    } else {
        move = ctx->moveNoCur;
    }

    u32 attacker = GetBattlerIDBySide(bsys, ctx, attackerSide);
    u32 defender = GetBattlerIDBySide(bsys, ctx, defenderSide);

    if ((!(ctx->linkStatus & (1 << 14)) && BattleSys_AreBattleAnimationsOn(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->linkStatus |= (1 << 14);
        ov12_0226343C(bsys, ctx, move, attacker, defender);
    }

    if (!BattleSys_AreBattleAnimationsOn(bsys)) {
        BattleScriptGotoSubscript(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_MonFlicker(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    BattleController_EmitMonFlicker(bsys, GetBattlerIDBySide(bsys, ctx, side), ctx->moveStatusFlag);

    return FALSE;
}

BOOL BtlCmd_HealthbarDataUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u8 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if ((ctx->battleMons[battlerId].hp + ctx->hpCalcWork) <= 0) {
        ctx->hitDamage = ctx->battleMons[battlerId].hp * -1;
    } else {
        ctx->hitDamage = ctx->hpCalcWork;
    }

    if (ctx->hitDamage < 0) {
        ctx->totalDamage[battlerId] += (-1*ctx->hitDamage);
    }

    ctx->battleMons[battlerId].hp += ctx->hpCalcWork;

    if (ctx->battleMons[battlerId].hp < 0) {
        ctx->battleMons[battlerId].hp = 0;
    } else if (ctx->battleMons[battlerId].hp > ctx->battleMons[battlerId].maxHp) {
        ctx->battleMons[battlerId].hp = ctx->battleMons[battlerId].maxHp;
    }

    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_HealthbarUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitHealthbarUpdate(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TryFaintMon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if (ctx->battleMons[battlerId].hp == 0) {
        ctx->battlerIdFainted = battlerId;
        ctx->linkStatus |= MaskOfFlagNo(battlerId) << 24;
        ctx->totalTimesFainted[battlerId]++;
        UpdateFrienshipFainted(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_PlayFaintAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPlayFaintAnimation(bsys, ctx, ctx->battlerIdFainted);

    ctx->linkStatus &= (MaskOfFlagNo(ctx->battlerIdFainted) << 24) ^ -1;
    ctx->linkStatus2 |= MaskOfFlagNo(ctx->battlerIdFainted) << 28;
    ctx->unk_21A8[ctx->battlerIdFainted][0] = 40;

    InitFaintedWork(bsys, ctx, ctx->battlerIdFainted);

    return FALSE;
}

BOOL BtlCmd_Wait(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int waitFrames = BattleScriptReadWord(ctx);
    int waitIncrement;

    if (!(BattleSys_GetBattleType(bsys) & BATTLE_TYPE_2)) {
        if (gSystem.newKeys & 0xC03 || System_GetTouchNew()) {
            //TODO: Rename variable in struct
            ctx->unk_F0 = waitFrames;
        }
    }

    if (bsys->battleTypeFlags & BATTLE_TYPE_2 && !(bsys->unk240C & 16)) {
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

BOOL BtlCmd_PlaySE(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 sound = BattleScriptReadWord(ctx);

    BattleController_EmitPlaySE(bsys, ctx, sound, GetBattlerIDBySide(bsys, ctx, side));

    return FALSE;
}

BOOL BtlCmd_If(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 operator = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);

    switch (operator) {
    case 0:
        if (*var != cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (*var == cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (*var <= cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (*var > cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if (!(*var & cmp)) {
            adrs = 0;
        }
        break;
    case 5:
        if (*var & cmp) {
            adrs = 0;
        }
        break;
    case 6:
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

BOOL BtlCmd_IfMonStat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 operator = BattleScriptReadWord(ctx);
    u32 side = BattleScriptReadWord(ctx);
    u32 varId = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), varId, 0);

    switch (operator) {
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

BOOL BtlCmd_FadeOutBattle(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitFadeOutBattle(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_JumpToSubSeq(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_0_1, BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_JumpToCurMoveEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptJump(ctx, NARC_a_0_3_0, ctx->unk_334.moveData[ctx->moveNoCur].effect);

    return FALSE;
}

BOOL BtlCmd_JumpToEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->linkStatus &= ~1;
    ctx->linkStatus &= 0xffffbfff;

    ctx->moveNoCur = ctx->moveWork;

    if (unkA == 0) {
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->moveWork, 1, 0);
        ov12_02250A18(bsys, ctx, ctx->battlerIdAttacker, ctx->moveWork);
        ctx->unk_21A8[ctx->battlerIdAttacker][1] = ctx->battlerIdTarget;
    }

    if (ctx->battlerIdTarget == 255) {
        ctx->unk_C = 39;
        BattleScriptJump(ctx, NARC_a_0_0_1, 281);
    } else {
        BattleScriptJump(ctx, NARC_a_0_0_0, ctx->moveNoCur);
    }

    return FALSE;
}

BOOL BtlCmd_CritCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_DEMO) || (BattleSys_GetBattleFlags(bsys) & 1)) {
        ctx->criticalMultiplier = 1;
    } else {
        ctx->criticalMultiplier = ov12_02257C5C(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalCnt, ov12_022581D4(bsys, ctx, 0, ctx->battlerIdTarget));
    }

    return FALSE;
}

BOOL BtlCmd_ShouldGetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int adrs;
    u32 battleType = BattleSys_GetBattleType(bsys);
    OpponentData *opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdFainted);

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    if ((opponentData->unk195 & 1) && !(battleType & (BATTLE_TYPE_2 | BATTLE_TYPE_5 | BATTLE_TYPE_7 | BATTLE_TYPE_9))) {
        int expMonsCnt = 0;
        int expShareMonsCnt = 0;
        u16 totalExp;
        u16 itemNo;
        Pokemon *mon;
        for (int i = 0; i < GetPartyCount(BattleSys_GetParty(bsys, 0)); i++) {
            mon = BattleSystem_GetPartyMon(bsys, 0, i);
            if (GetMonData(mon, MON_DATA_SPECIES, 0) && GetMonData(mon, MON_DATA_HP, 0)) {
                if (ctx->unk_A4[(ctx->battlerIdFainted >> 1) & 1] & MaskOfFlagNo(i)) {
                    expMonsCnt++;
                }
                itemNo = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
                if (GetItemHoldEffect(ctx, itemNo, 1) == HOLD_EFFECT_EXP_SHARE) {
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

void Task_GetExp(SysTask *task, void *data);

BOOL BtlCmd_InitGetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->getterWork = AllocFromHeap(HEAP_ID_BATTLE, sizeof(GetterWork));

    ctx->getterWork->bsys = bsys;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->unk28 = 0;
    ctx->getterWork->unk30[6] = 0;

    CreateSysTask(Task_GetExp, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_GetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_GetExpLoop(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleScriptReadWord(ctx);

    return FALSE;
}

BOOL BtlCmd_ShowParty(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId, unkA, unkB;
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    unkB = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            unkB |= MaskOfFlagNo(battlerId);
            BattleController_EmitShowMonList(bsys, ctx, battlerId, 1, 0, 6);
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (BattleSys_GetBattleType(bsys) == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_2)) {
            unkA = BattleSys_GetBattlerIdPartner(bsys, battlerId);
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

BOOL BtlCmd_WaitForMonSelection(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;

    int maxBattlers = BattleSys_GetMaxBattlers(bsys);
    int switchCnt = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            switchCnt++;
        }
    }

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if ((ctx->unk_13C[battlerId] & 1) && ov12_0225682C(ctx, battlerId)) {
            ctx->unk_21A0[battlerId] = ctx->unk_2300[battlerId][0] - 1;
            switchCnt--;
            if (!(ctx->linkStatus2 & (MaskOfFlagNo(battlerId) << 24))) {
                ctx->linkStatus2 |= (MaskOfFlagNo(battlerId) << 24);
                BattleController_EmitShowWaitMessage(bsys, battlerId);
            }
        }
    }

    if (switchCnt == 0) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if ((ctx->unk_13C[battlerId] & 1) && ov12_0225682C(ctx, battlerId)) {
                ov12_0223BDDC(bsys, battlerId, ctx->unk_2300[battlerId][0]);
            }
        }
        ctx->linkStatus2 &= 0xf0ffffff;
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SwitchInDataUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    int battlerId;

    switch (side) {
    case B_SIDE_1:
        battlerId = ctx->battlerIdAttacker;
        break;
    case B_SIDE_6:
        battlerId = ctx->battlerIdSwitch;
        break;
    case B_SIDE_18:
        battlerId = ctx->battlerIdTarget;
        break;
    }

    ctx->unk_13C[battlerId] &= ~1;
    ctx->unk_3108 &= (MaskOfFlagNo(battlerId)^~0);
    ctx->selectedMonIndex[battlerId] = ctx->unk_21A0[battlerId];
    ctx->unk_21A0[battlerId] = 6;

    BattleSystem_GetBattleMon(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    ov12_02256F78(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    ctx->hpTemp = ctx->battleMons[1].hp;

    InitSwitchWork(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_JumpIfCantSwitch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);

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

BOOL BtlCmd_InitGetPokemon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);

    ctx->getterWork = (GetterWork*) AllocFromHeap(HEAP_ID_BATTLE, sizeof(GetterWork));
    ctx->getterWork->bsys = bsys;
    ctx->getterWork->ctx = ctx;
    ctx->getterWork->unk28 = 0;
    ctx->getterWork->unk24 = unkA;
    ctx->getterWork->unk2C = ItemToBallId(ctx->itemWork);

    CreateSysTask(Task_GetPokemon, ctx->getterWork, 0);

    return FALSE;
}

BOOL BtlCmd_GetPokemon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ctx->getterWork == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->battleContinueFlag = 1;

    return FALSE;
}

BOOL BtlCmd_SetMultiHit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int cnt = BattleScriptReadWord(ctx);
    int checkMultiHit = BattleScriptReadWord(ctx);

    if (ctx->multiHitCountTemp == 0) {
        if (cnt == 0) {
            if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SKILL_LINK) {
                cnt = 5;
            } else if ((cnt = BattleSys_Random(bsys) & 3) < 2) {
                cnt += 2;
            } else {
                cnt = (BattleSys_Random(bsys) & 3) + 2;
            }
        }
        ctx->multiHitCount = cnt;
        ctx->multiHitCountTemp = cnt;
        ctx->checkMultiHit = checkMultiHit;
    }

    return FALSE;
}

BOOL BtlCmd_ChangeVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, unkB);

    switch (operator) {
    case 7:
        *var = val;
        break;
    case 8:
        *var += val;
        break;
    case 9:
        *var -= val;
        break;
    case 10:
        *var |= val;
        break;
    case 11:
        *var &= (val ^ ~0);
        break;
    case 12:
        *var *= val;
        break;
    case 13:
        *var /= val;
        break;
    case 14:
        *var <<= val;
        break;
    case 15:
        u32 uvar = *var;
        *var = uvar >> val;
        break;
    case 16:
        *var = MaskOfFlagNo(val);
        break;
    case 17:
        GF_ASSERT(FALSE);
        break;
    case 18:
        *var -= val;
        if (*var < 0) {
            *var = 0;
        }
        break;
    case 19:
        *var ^= val;
        break;
    case 20:
        *var &= val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_BufferStatChangeMsg(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int change, stat;
    BATTLEMON *mon = &ctx->battleMons[ctx->battlerIdStatChange];

    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int unkD = 0;

    ctx->linkStatus &= 0xFFFDFFFF;

    if (ctx->statChangeParam >= 46) {
        stat = ctx->statChangeParam - 46;
        change = -2;
        ctx->tempWork = 13;
    } else if (ctx->statChangeParam >= 39) {
        stat = ctx->statChangeParam - 39;
        change = 2;
        ctx->tempWork = 12;
    } else if (ctx->statChangeParam >= 22) {
        stat = ctx->statChangeParam - 22;
        change = -1;
        ctx->tempWork = 13;
    } else {
        stat = ctx->statChangeParam - 15;
        change = 1;
        ctx->tempWork = 12;
    }

    if (change > 0) { //Stat Increase
        if (mon->statChanges[stat + 1] == 12) {
            ctx->linkStatus |= (1 << 17);
            if (ctx->unk_88 == 3 || ctx->unk_88 == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
            } else {
                ctx->buffMsg.id = 142;
                ctx->buffMsg.tag = 12;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = stat + 1;
                BattleScriptIncrementPointer(ctx, unkA);
            }
        } else {
            if (ctx->unk_88 == 3) {
                ctx->buffMsg.id = 0x26E;
                ctx->buffMsg.tag = 39;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                ctx->buffMsg.param[2] = stat + 1;
            } else if (ctx->unk_88 == 5) {
                ctx->buffMsg.id = 0x2F4;
                ctx->buffMsg.tag = 45;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = ctx->itemWork;
                ctx->buffMsg.param[2] = stat + 1;
            } else {
                ctx->buffMsg.id = (change == 1) ? 0x2EE:0x2F1;
                ctx->buffMsg.tag = 12;
                ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.param[1] = stat + 1;
            }
            mon->statChanges[stat + 1] += change;
            if (mon->statChanges[stat + 1] > 12) {
                mon->statChanges[stat + 1] = 12;
            }
        }
    } else { //Stat Decrease
        if (!(ctx->unk_90 & (1 << 27))) {
            if (ctx->battlerIdAttacker != ctx->battlerIdStatChange) {
                //Mist
                if(ctx->fieldSideConditionData[BattleSys_GetFieldSide(bsys, ctx->battlerIdStatChange)].mistTurns) {
                    ctx->buffMsg.id = 273;
                    ctx->buffMsg.tag = 2;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    unkD = 1;
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_CLEAR_BODY) == TRUE || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_WHITE_SMOKE) == TRUE) {
                if (ctx->unk_88 == 3) {
                    ctx->buffMsg.id = 0x2D7;
                    ctx->buffMsg.tag = 53;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                    ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                    ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                } else {
                    ctx->buffMsg.id = 0x29D;
                    ctx->buffMsg.tag = 11;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                }
                unkD = TRUE;
            } else if ((CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_KEEN_EYE) == TRUE && (1 + stat) == 6) ||
                       (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_HYPER_CUTTER) == TRUE && (1 + stat) == 1)) {
                if (ctx->unk_88 == 3) {
                    ctx->buffMsg.id = 0x2D7;
                    ctx->buffMsg.tag = 53;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                    ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
                    ctx->buffMsg.param[3] = ctx->battleMons[ctx->battlerIdAttacker].ability;
                } else {
                    ctx->buffMsg.id = 704;
                    ctx->buffMsg.tag = 39;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdStatChange].ability;
                    ctx->buffMsg.param[2] = stat + 1;
                }
                unkD = TRUE;
                }
                else if (mon->statChanges[1 + stat] == 0) {
                    ctx->linkStatus |= (1 << 17);
                    if (ctx->unk_88 == 2 || ctx->unk_88 == 3) {
                        BattleScriptIncrementPointer(ctx, unkB);
                        return FALSE;
                    } else {
                        ctx->buffMsg.id = 145;
                        ctx->buffMsg.tag = 12;
                        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.param[1] = stat + 1;
                        BattleScriptIncrementPointer(ctx, unkA);
                        return FALSE;
                    }
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_SHIELD_DUST) == TRUE && ctx->unk_88 == 2) {
                    unkD = 1;
                } else if (ctx->battleMons[ctx->battlerIdStatChange].status2 &  STATUS2_24){
                    unkD = 2;
                }
            } else if (mon->statChanges[1 + stat] == 0) {
                ctx->linkStatus |= (1 << 17);
                if (ctx->unk_88 == 2 || ctx->unk_88 == 3) {
                    BattleScriptIncrementPointer(ctx, unkB);
                    return FALSE;
                } else {
                    ctx->buffMsg.id = 145;
                    ctx->buffMsg.tag = 12;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.param[1] = stat + 1;
                    BattleScriptIncrementPointer(ctx, unkA);
                    return FALSE;
                }
            }
            if (unkD == 2 && ctx->unk_88 == 1) {
                BattleScriptIncrementPointer(ctx, unkC);
                return FALSE;
            } else if (unkD && ctx->unk_88 == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
                return FALSE;
            } else if (unkD) {
                BattleScriptIncrementPointer(ctx, unkA);
                return FALSE;
            }
        }
        if (ctx->unk_88 == 3) {
            ctx->buffMsg.id = 0x296;
            ctx->buffMsg.tag = 54;
            ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdAttacker);
            ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdAttacker].ability;
            ctx->buffMsg.param[2] = CreateNicknameTag(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.param[3] = stat + 1;
        } else {
            ctx->buffMsg.id = (change == -1) ? 0x2FA:0x2FD;
            ctx->buffMsg.tag = 12;
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

//TODO: Move to above of file once defined as static
void BattlerSetAbility(BATTLECONTEXT *ctx, u8 a1, u8 a2);

BOOL BtlCmd_ChangeMonDataVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int var = GetBattlerVar(ctx, battlerId, unkB, 0);

    switch (operator) {
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
    case 15:
        u32 uvar = var;
        var = uvar >> val;
        break;
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

    if (unkB == 26) {
        BattlerSetAbility(ctx, battlerId, var);
    }

    SetBattlerVar(ctx, battlerId, unkB, &var);
    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_53(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int var = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->unk_218C[battlerId] |= var;

    return FALSE;
}

BOOL BtlCmd_ToggleVanish(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkA = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitToggleVanish(bsys, battlerId, unkA);

    return FALSE;
}

BOOL BtlCmd_CheckAbility(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == B_SIDE_ALL) {
        int maxBattlers = BattleSys_GetMaxBattlers(bsys);

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

BOOL BtlCmd_Random(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int modulo = BattleScriptReadWord(ctx);
    modulo += 1;

    int x0 = BattleScriptReadWord(ctx);

    ctx->calcWork = BattleSys_Random(bsys) % modulo + x0;

    return FALSE;
}

BOOL BtlCmd_ChangeVar2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, unkB);
    int *val = BattleScriptGetVarPointer(bsys, ctx, unkC);

    switch (operator) {
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
    case 15:
        u32 uvar = *var;
        *var = uvar >> *val;
        break;
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

BOOL BtlCmd_ChangeMonDataByVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    int var = GetBattlerVar(ctx, battlerId, unkB, 0);
    int *val = BattleScriptGetVarPointer(bsys, ctx, unkC);

    switch (operator) {
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
    case 15:
        u32 uvar = var;
        var = uvar >> *val;
        break;
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

    if (operator != 17) {
        if (unkB == 26) {
            BattlerSetAbility(ctx, battlerId, var);
        }
        SetBattlerVar(ctx, battlerId, unkB, &var);
        CopyBattleMonToPartyMon(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_Goto(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptIncrementPointer(ctx, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_GotoSubscript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptGotoSubscript(ctx, 1, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_GotoSubscriptVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int *var = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));
    BattleScriptGotoSubscript(ctx, 1, *var);
    return FALSE;
}

BOOL BtlCmd_SetMoveToMirrorMove(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int move = 0;
    int battleType = BattleSys_GetBattleType(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->moveNoCopied[ctx->battlerIdAttacker]) {
        move = ctx->moveNoCopied[ctx->battlerIdAttacker];
    } else if (battleType & BATTLE_TYPE_DOUBLES) {
        move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][0] +
               ctx->moveNoCopiedHit[ctx->battlerIdAttacker][1] +
               ctx->moveNoCopiedHit[ctx->battlerIdAttacker][2] +
               ctx->moveNoCopiedHit[ctx->battlerIdAttacker][3];
        if (move) {
            do {
                move = ctx->moveNoCopiedHit[ctx->battlerIdAttacker][BattleSys_Random(bsys) % 4];
            } while (!move);
        }
    }
    if (move && IsMoveEncored(ctx, move) == TRUE) {
        ctx->linkStatus &= ~1;
        ctx->linkStatus &= 0xFFFFBFFF;
        ctx->moveNoCur = move;
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, move, 1, 0);
        if (ctx->battlerIdTarget == 255) {
            ctx->unk_C = 39;
            BattleScriptJump(ctx, NARC_a_0_0_1, 281);
        } else {
            ctx->unk_21A8[ctx->battlerIdAttacker][1] = ctx->battlerIdTarget;
            BattleScriptJump(ctx, NARC_a_0_0_0, move);
        }
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
    }

    return FALSE;
}

BOOL BtlCmd_ResetAllStatChanges(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int stat, battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        for (stat = 0; stat < 8; stat++) {
            ctx->battleMons[battlerId].statChanges[stat] = 6;
        }
        ctx->battleMons[battlerId].status2 &= ~STATUS2_FOCUS_ENERGY;
    }

    return FALSE;
}

BOOL BtlCmd_64(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    LockBattlerIntoCurrentMove(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_65(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    UnlockBattlerOutOfCurrentMove(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_SetHealthbarStatus(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    BattleController_EmitHealthbarStatus(bsys, GetBattlerIDBySide(bsys, ctx, side), status);

    return FALSE;
}

BOOL BtlCmd_PrintTrainerMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msg = BattleScriptReadWord(ctx);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, side), msg);

    return FALSE;
}

extern u16 sPrizeMoneyTbl[0x81][2];

u32 CalcPrizeMoney(BattleSystem *bsys, BATTLECONTEXT *ctx, int trainerIndex) {
    int i;
    TRPOKE *trPoke;
    u32 prizeMoney;
    u8 level = 0;
    u8 trainerClass;
    TRAINER trainer;

    trPoke = AllocFromHeap(HEAP_ID_BATTLE, sizeof(TRPOKE)*6);

    TrainerData_ReadTrData(bsys->trainerId[trainerIndex], &trainer);
    TrainerData_ReadTrPoke(bsys->trainerId[trainerIndex], trPoke);

    switch (trainer.trainerType) {
    default:
    case 0:
        TRPOKE_NOITEM_DFLTMOVES *pokeDef = (TRPOKE_NOITEM_DFLTMOVES *)trPoke;
        level = pokeDef[trainer.npoke-1].level;
        break;
    case 1:
        TRPOKE_NOITEM_CUSTMOVES *pokeCust = (TRPOKE_NOITEM_CUSTMOVES *)trPoke;
        level = pokeCust[trainer.npoke-1].level;
        break;
    case 2:
        TRPOKE_ITEM_DFLTMOVES *pokeItem = (TRPOKE_ITEM_DFLTMOVES *)trPoke;
        level = pokeItem[trainer.npoke-1].level;
        break;
    case 3:
        TRPOKE_ITEM_CUSTMOVES *pokeCustItem = (TRPOKE_ITEM_CUSTMOVES *)trPoke;
        level = pokeCustItem[trainer.npoke-1].level;
        break;
    }

    i = 0;
    trainerClass = trainer.trainerClass;

    do {
        if (trainerClass != sPrizeMoneyTbl[i][0]) {
            i++;
            if (i < (int)NELEMS(sPrizeMoneyTbl)) continue;
        }

        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            GF_ASSERT(FALSE);
        }
        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            i = 2;
        }
        if (bsys->battleTypeFlags & BATTLE_TYPE_INGAME_PARTNER || bsys->battleTypeFlags == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_6)) {
            prizeMoney = level*4*ctx->prizeMoneyValue*sPrizeMoneyTbl[i][1];
            break;
        } else if (bsys->battleTypeFlags & BATTLE_TYPE_DOUBLES) {
            prizeMoney = level*4*ctx->prizeMoneyValue*2*sPrizeMoneyTbl[i][1];
            break;
        } else {
            prizeMoney = level*4*ctx->prizeMoneyValue*sPrizeMoneyTbl[i][1];
            break;
        }

    } while (TRUE);

    FreeToHeap(trPoke);

    return prizeMoney;
}

BOOL BtlCmd_CalcPrizeMoney(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 prizeMoney;

    BattleScriptIncrementPointer(ctx, 1);

    if (bsys->battleOutcomeFlag == 1) {
        prizeMoney = CalcPrizeMoney(bsys, ctx, 1);
        if (bsys->battleTypeFlags & 16 || bsys->battleTypeFlags == 0x4b) {
            prizeMoney += CalcPrizeMoney(bsys, ctx, 3);
        }
        PlayerProfile_AddMoney(BattleSys_GetPlayerProfile(bsys, 0), prizeMoney);
    } else {
        prizeMoney = ov12_0223C24C(bsys->trainerParty[0], bsys->unk48[0]);
        PlayerProfile_SubMoney(BattleSys_GetPlayerProfile(bsys, 0), prizeMoney);
    }

    if (prizeMoney) {
        ctx->msgWork = prizeMoney;
    } else {
        ctx->msgWork = 0;
    }

    ctx->tempWork = bsys->unk2474_1;

    return FALSE;
}

BOOL BtlCmd_SetStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSys_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || status == 25 || status == 26) {
        int battlerId = GetBattlerIDBySide(bsys, ctx, side);
        if (CheckStatusEffectsSubstitute(ctx, battlerId, status) == TRUE) {
            BattleController_EmitSetStatus2Effect(bsys, ctx, battlerId, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_CopyStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (BattleSys_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || status == 26 || status == 25) {
        int battlerIdA = GetBattlerIDBySide(bsys, ctx, sideA);
        int battlerIdB = GetBattlerIDBySide(bsys, ctx, sideB);
        if (CheckStatusEffectsSubstitute(ctx, battlerIdA, status) == TRUE && CheckStatusEffectsSubstitute(ctx, battlerIdB, status) == TRUE) {
            BattleController_EmitCopyStatus2Effect(bsys, ctx, battlerIdA, battlerIdB, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_SetStatus2EffectVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int *data = BattleScriptGetVarPointer(bsys, ctx, status);

    if (BattleSys_AreBattleAnimationsOn(bsys) == TRUE || status == 15 || status == 16 || *data == 25 || *data == 26) {
        if (CheckStatusEffectsSubstitute(ctx, battlerId, *data) == TRUE) {
            BattleController_EmitSetStatus2Effect(bsys, ctx, battlerId, *data);
        }
    }

    return FALSE;
}

BOOL BtlCmd_ReturnMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintReturnMessage(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_SendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintSendOutMessage(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_EncounterMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintEncounterMessage(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_FirstSendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintFirstSendOutMessage(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TrainerMessageVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)), ctx->msgWork);

    return FALSE;
}

BOOL BtlCmd_TryConversion(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, cnt, moveType;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    for (cnt = 0; cnt < 4; cnt++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[cnt] == 0) {
            break;
        }
    }

    for (i = 0; i < cnt; i++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[i] != MOVE_CONVERSION) {
            moveType = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
            if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != moveType && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != moveType) {
                break;
            }
        }
    }

    if (i == cnt) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            do {
                i = BattleSys_Random(bsys) % cnt;
            } while(ctx->battleMons[ctx->battlerIdAttacker].moves[i] == MOVE_CONVERSION);
            moveType = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
        } while(GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == moveType || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == moveType);
        ctx->battleMons[ctx->battlerIdAttacker].type1 = moveType;
        ctx->battleMons[ctx->battlerIdAttacker].type2 = moveType;
        ctx->msgWork = moveType;
    }

    return FALSE;
}

BOOL BtlCmd_Compare(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 *var = BattleScriptGetVarPointer(bsys, ctx, varNo);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

    switch (operator) {
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

BOOL BtlCmd_IfMonStatVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), varNo, 0);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

    switch (operator) {
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

BOOL BtlCmd_PayDay(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->msgWork = ctx->unk_14C * ctx->prizeMoneyValue;

    if (ctx->msgWork > 0xFFFF) {
        ctx->msgWork = 0xFFFF;
    }

    PlayerProfile_AddMoney(BattleSys_GetPlayerProfile(bsys, 0), ctx->msgWork);

    return FALSE;
}

BOOL BtlCmd_TryLightScreen(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_LIGHT_SCREEN) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_LIGHT_SCREEN;
        ctx->fieldSideConditionData[unkA].lightScreenTurns = 5;
        ctx->fieldSideConditionData[unkA].lightScreenBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].lightScreenTurns += BattleSystem_GetHeldItemDamageBoost(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.tag = 20;
        ctx->buffMsg.param[0] = ctx->moveNoCur;
        ctx->buffMsg.param[1] = ctx->battlerIdAttacker;
        if (GetMonsHitCount(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.id = 192;
        } else {
            ctx->buffMsg.id = 190;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryReflect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_REFLECT) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_REFLECT;
        ctx->fieldSideConditionData[unkA].reflectTurns = 5;
        ctx->fieldSideConditionData[unkA].reflectBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].reflectTurns += BattleSystem_GetHeldItemDamageBoost(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.tag = 20;
        ctx->buffMsg.param[0] = ctx->moveNoCur;
        ctx->buffMsg.param[1] = ctx->battlerIdAttacker;
        if (GetMonsHitCount(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.id = 196;
        } else {
            ctx->buffMsg.id = 194;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryMist(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

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

BOOL BtlCmd_TryOHKO(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 hitChance;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->linkStatus |= (1 << 10);

    if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STURDY) == TRUE) {
        ctx->moveStatusFlag |= 1 << 19;
    } else {
        if ((ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & (MOVE_EFFECT_3 | MOVE_EFFECT_4)) == FALSE &&
            GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_NO_GUARD &&
            GetBattlerAbility(ctx, ctx->battlerIdTarget) != ABILITY_NO_GUARD) {
            hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->unk_334.moveData[ctx->moveNoCur].accuracy;
            if ((BattleSys_Random(bsys) % 100) < hitChance && (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level)) {
                hitChance = 1;
            } else {
                hitChance = 0;
            }
        } else {
            if ((((ctx->battleMons[ctx->battlerIdTarget].unk88.battlerIdLockOn == ctx->battlerIdAttacker) && (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & (MOVE_EFFECT_3 | MOVE_EFFECT_4))) ||
                        GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NO_GUARD ||
                        GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_NO_GUARD) &&
                        ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                    hitChance = 1;
            } else {
                hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->unk_334.moveData[ctx->moveNoCur].accuracy;
                if ((BattleSys_Random(bsys) % 100) < hitChance && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
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

BOOL BtlCmd_SetDamageDivide(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denom = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(bsys, ctx, varNo);

    *data = DamageDivide(*data, denom);

    return FALSE;
}

BOOL BtlCmd_SetDamageDivideVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_TryMimic(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if ((CheckLegalMimicMove(ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) == FALSE) ||
        (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_TRANSFORMED) ||
        (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_24) ||
        ctx->moveNoBattlerPrev[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        int moveIndex = 0;
        int mimicIndex = -1;

        for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
                break;
            }
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_MIMIC && mimicIndex == -1) {
                mimicIndex = moveIndex;
            }
        }

        if (moveIndex == LEARNED_MOVES_MAX) {
            ctx->moveWork = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].moves[mimicIndex] = ctx->moveWork;
            if (ctx->unk_334.moveData[ctx->moveWork].pp < 5) {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = ctx->unk_334.moveData[ctx->moveWork].pp;
            } else {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = 5;
            }
            ctx->battleMons[ctx->battlerIdAttacker].unk88.mimicedMoveIndex |= MaskOfFlagNo(mimicIndex);

            if (ctx->moveWork == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_Metronome(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int metronomeIndex;
    u16 moveNo;

    BattleScriptIncrementPointer(ctx, 1);

    while (TRUE) {
        moveNo = (BattleSys_Random(bsys) % 0x1d3) + 1;

        for (metronomeIndex = 0; metronomeIndex < 4; metronomeIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[metronomeIndex] == moveNo) {
                break;
            }
        }

        if (metronomeIndex != 4) {
            continue;
        }

        if (CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, moveNo) == FALSE) {
            continue;
        }

        ctx->moveWork = moveNo;

        break;
    }

    return FALSE;
}

BOOL BtlCmd_TryDisable(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int disabledMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);

    if ((ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove == 0) && disabledMoveIndex != 4 &&
        ctx->battleMons[ctx->battlerIdTarget].movePPCur[disabledMoveIndex] && ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        ctx->moveWork = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove = ctx->moveWork;
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledTurns = BattleSys_Random(bsys) % 4 + 3;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Counter(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdPhysicalDamage;

    int sideA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->unk_C = 39;
                BattleScriptJump(ctx, NARC_a_0_0_1, 281);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        ctx->moveStatusFlag |= 64;
    }

    return FALSE;
}

BOOL BtlCmd_MirrorCoat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].battlerIdSpecialDamage;

    int sideA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->unk_C = 39;
                BattleScriptJump(ctx, NARC_a_0_0_1, 281);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        ctx->moveStatusFlag |= 64;
    }

    return FALSE;
}

BOOL BtlCmd_TryEncore(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int encoredMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);

    if (IsMoveEncored(ctx, ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) == FALSE) {
        encoredMoveIndex = LEARNED_MOVES_MAX;
    }

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == 0 && encoredMoveIndex != LEARNED_MOVES_MAX &&
        ctx->battleMons[ctx->battlerIdTarget].movePPCur[encoredMoveIndex] && ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        ctx->moveWork = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove = ctx->moveWork;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex = encoredMoveIndex;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredTurns = BattleSys_Random(bsys) % 5 + 3;
    } else {
        ctx->moveStatusFlag |= 64;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryConversion2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, moveType;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    if (ctx->conversion2Move[ctx->battlerIdAttacker] && (ctx->conversion2BattlerId[ctx->battlerIdAttacker] != 255)) {
        if (BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->conversion2Move[ctx->battlerIdAttacker]) && (ctx->battleMons[ctx->conversion2BattlerId[ctx->battlerIdAttacker]].status2 & STATUS2_12)) {
            BattleScriptIncrementPointer(ctx, adrs);
            return FALSE;
        } else {
            u8 typeA, typeB, val;
            moveType = ctx->conversion2Type[ctx->battlerIdAttacker];

            for (i = 0; i < 1000; i++) {
                ov12_0225260C(bsys, 0xffff, &typeA, &typeB, &val);
                if (typeA == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != typeB && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != typeB) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeB;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeB;
                    ctx->msgWork = typeB;
                    return FALSE;
                }
            }

            i = 0;
            while (ov12_0225260C(bsys, i, &typeA, &typeB, &val) == TRUE) {
                if (typeA == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != typeB && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != typeB) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeB;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeB;
                    ctx->msgWork = typeB;
                    return FALSE;
                }
                i++;
            }
        }
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_TrySketch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex;
    int sketchIndex = -1;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_TRANSFORMED || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_STRUGGLE || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_SKETCH || ctx->moveNoSketch[ctx->battlerIdTarget] == MOVE_CHATTER || ctx->moveNoSketch[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] != MOVE_SKETCH && ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->moveNoSketch[ctx->battlerIdTarget]) {
                break;
            }
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_SKETCH && sketchIndex == -1) {
                sketchIndex = moveIndex;
            }
        }
        if (moveIndex == LEARNED_MOVES_MAX) {
            ctx->battleMons[ctx->battlerIdAttacker].moves[sketchIndex] = ctx->moveNoSketch[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[sketchIndex] = ctx->unk_334.moveData[ctx->moveNoSketch[ctx->battlerIdTarget]].pp;
            BattleController_EmitBattleMonToPartyMonCopy(bsys, ctx, ctx->battlerIdAttacker);
            ctx->moveWork = ctx->moveNoSketch[ctx->battlerIdTarget];
            if (ctx->moveWork == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrySleepTalk(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex, nonSelectableMoves;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    nonSelectableMoves = 0;

    for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
        if (ov12_02252698(ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex]) ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_FOCUS_PUNCH ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_UPROAR ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_CHATTER ||
            BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex])) {
            nonSelectableMoves |= MaskOfFlagNo(moveIndex);
        }
    }

    nonSelectableMoves = StruggleCheck(bsys, ctx, ctx->battlerIdAttacker, nonSelectableMoves, ~2);

    if (nonSelectableMoves == 15) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            moveIndex = BattleSys_Random(bsys) % 4;
        } while (MaskOfFlagNo(moveIndex) & nonSelectableMoves);
        ctx->moveWork = ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex];
    }


    return FALSE;
}

extern u8 sFlailDamageTable[6][2];

BOOL BtlCmd_FlailDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA;

    BattleScriptIncrementPointer(ctx, 1);

    unkA = RatioToInt(ctx->battleMons[ctx->battlerIdAttacker].hp, ctx->battleMons[ctx->battlerIdAttacker].maxHp, 64);
    for (i = 0; i < sizeof(sFlailDamageTable) / sizeof(sFlailDamageTable[0]); i++) {
        if (unkA <= sFlailDamageTable[i][0]) {
            break;
        }
    }

    ctx->movePower = sFlailDamageTable[i][1];

    return FALSE;
}

BOOL BtlCmd_TrySpite(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex, ppLoss;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->moveNoBattlerPrev[ctx->battlerIdTarget]) {
        moveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->moveNoBattlerPrev[ctx->battlerIdTarget]);
        if (moveIndex == LEARNED_MOVES_MAX || ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ppLoss = 4;
            if (ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] < ppLoss) {
                ppLoss = ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex];
            }
            ctx->moveWork = ctx->moveNoBattlerPrev[ctx->battlerIdTarget];
            ctx->msgWork = ppLoss;
            ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] -= ppLoss;
            CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdTarget);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_HealBell(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 battleType = BattleSys_GetBattleType(bsys);
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcWork = 0;

    if (ctx->moveNoCur == MOVE_HEAL_BELL) {
        ctx->moveWork = ctx->moveNoCur;
        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_SOUNDPROOF) {
            ctx->battleMons[ctx->battlerIdAttacker].status = 0;
            ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_27;
        } else {
            ctx->calcWork |= 5;
        }

        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerId = GetBattlerIDBySide(bsys, ctx, B_SIDE_16);
            if (!(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
                if (!CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF)) {
                    ctx->battleMons[battlerId].status = 0;
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_27;
                } else {
                    ctx->battlerIdWork = battlerId;
                    ctx->calcWork |= 10;
                }
            }
        } else {
            ctx->calcWork |= 8;
        }
    } else { //aromatherapy
        ctx->battleMons[ctx->battlerIdAttacker].status = 0;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_27;
        if (battleType & BATTLE_TYPE_DOUBLES) {
            battlerId = GetBattlerIDBySide(bsys, ctx, B_SIDE_16);
            if (!(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
                ctx->battleMons[battlerId].status = 0;
                ctx->battleMons[battlerId].status2 &= ~STATUS2_27;
            }
        } else {
            ctx->calcWork |= 8;
        }
    }

    BattleControl_EmitPartyStatusHeal(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur);

    return FALSE;
}

BOOL BtlCmd_TryThief(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    u32 battleType = BattleSys_GetBattleType(bsys);
    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker) && !(battleType & (BATTLE_TYPE_2 | BATTLE_TYPE_7))) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->fieldSideConditionData[fieldSide].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdAttacker])) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE || GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].item == ITEM_GRISEOUS_ORB) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].unk88.unk4_2C || ctx->battleMons[ctx->battlerIdTarget].unk88.unk4_2D) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else {
        if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
            BattleScriptIncrementPointer(ctx, adrs2);
        } else if (ctx->battleMons[ctx->battlerIdAttacker].item || ov12_02252700(bsys, ctx, ctx->battlerIdTarget) == FALSE) {
            BattleScriptIncrementPointer(ctx, adrs1);
        }
    }

    return FALSE;
}

extern u16 sProtectSuccessChance[4];

BOOL BtlCmd_TryProtect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

    if (sProtectSuccessChance[ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns] >= (u32) BattleSys_Random(bsys) && flag) {
        if (ctx->unk_334.moveData[ctx->moveNoCur].effect == 111) {
            ctx->turnData[ctx->battlerIdAttacker].protectFlag = TRUE;
            ctx->buffMsg.id = 282;
        }
        if (ctx->unk_334.moveData[ctx->moveNoCur].effect == 116) {
            ctx->turnData[ctx->battlerIdAttacker].unk0_9 = TRUE;
            ctx->buffMsg.id = 442;

        }
        ctx->buffMsg.tag = 2;
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

BOOL BtlCmd_TrySubstitute(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int subHp = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);

    if (ctx->battleMons[ctx->battlerIdAttacker].hp <= subHp) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->hpCalcWork = -subHp;
        ctx->battleMons[ctx->battlerIdAttacker].unk88.substituteHp = subHp;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_BINDING_ALL;
    }

    return FALSE;
}

BOOL BtlCmd_TryWhirlwind(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    u32 battleType = BattleSys_GetBattleType(bsys);

    if (battleType & BATTLE_TYPE_TRAINER) {
        PARTY *party;
        Pokemon *mon;
        int partySize;
        int cnt = 0;
        int cntMax;
        int index0, indexEnd, monIndex, maxRand;
        int monIndexA, monIndexB;

        party = BattleSys_GetParty(bsys, ctx->battlerIdTarget);
        partySize = BattleSys_GetPartySize(bsys, ctx->battlerIdTarget);

        if (battleType & BATTLE_TYPE_MULTI || battleType & BATTLE_TYPE_INGAME_PARTNER && BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget)) {
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
            monIndexB = ctx->selectedMonIndex[BattleSys_GetBattlerIdPartner(bsys, ctx->battlerIdTarget)];
        } else {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 1;
            monIndexA = ctx->selectedMonIndex[ctx->battlerIdTarget];
            monIndexB = ctx->selectedMonIndex[ctx->battlerIdTarget];
        }

        for (monIndex = index0; monIndex < indexEnd; monIndex++) {
            mon = GetPartyMonByIndex(party, monIndex);
            if (GetMonData(mon, MON_DATA_SPECIES, 0) && !GetMonData(mon, MON_DATA_IS_EGG, 0) && GetMonData(mon, MON_DATA_HP, 0)) {
                cnt++;
            }
        }

        if (cnt <= cntMax) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else if (WhirlwindCheck(bsys, ctx)) {
            do {
                do {
                    monIndex = (BattleSys_Random(bsys) % maxRand);
                    monIndex += index0;
                } while (monIndex == monIndexA || monIndex == monIndexB);
                mon = GetPartyMonByIndex(party, monIndex);
            } while (!GetMonData(mon, MON_DATA_SPECIES, 0) || GetMonData(mon, MON_DATA_IS_EGG, 0) == 1 || !GetMonData(mon, MON_DATA_HP, 0));
            ctx->unk_21A0[ctx->battlerIdTarget] = monIndex;
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }

    } else if (WhirlwindCheck(bsys, ctx) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Transform(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 i;
    u8 *src, *dest;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= STATUS2_TRANSFORMED;
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

    ctx->battleMons[ctx->battlerIdAttacker].unk28_0 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].intimidateFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].traceFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].downloadFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].anticipationFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].forewarnFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].friskFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].moldBreakerFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].pressureFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.trauntFlag = ctx->totalTurns & 1;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.slowStartTurns = ctx->totalTurns + 1;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartEnded = 0;

    for (i = 0; (int) i < LEARNED_MOVES_MAX; i++) {
        if (ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp < 5) {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = 5;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrySpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker)^1;

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers == 3) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = 1;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SPIKES;
        ctx->fieldSideConditionData[fieldSide].spikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckSpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers && ctx->battleMons[battlerId].hp) {
        ctx->hpCalcWork = (5 - ctx->fieldSideConditionData[fieldSide].spikesLayers) * 2;
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalcWork);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPerishSong(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);

    ctx->calcWork = maxBattlers;

    int cnt = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_PERISH_SONG || ctx->battleMons[battlerId].hp == 0 || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF) == TRUE) {
            cnt++;
        } else {
            ctx->battleMons[battlerId].moveEffectFlags |= MOVE_EFFECT_PERISH_SONG;
            ctx->battleMons[battlerId].unk88.perishSongTurns = 3;
        }
    }
    if (cnt == maxBattlers) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SetTurnOrderBySpeed(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 *unkPtr = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));

    *unkPtr = ctx->unk_21EC[ctx->unk_3104];

    return FALSE;
}

BOOL BtlCmd_JumpIfValidBattlerVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 varId = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);
    u32 *battlerId = BattleScriptGetVarPointer(bsys, ctx, varId);

    if (*battlerId < BattleSys_GetMaxBattlers(bsys)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_WeatherDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    ctx->tempWork = 0;
    ctx->hpCalcWork = 0;

    u32 type1 = GetBattlerVar(ctx, battlerId, 27, 0);
    u32 type2 = GetBattlerVar(ctx, battlerId, 28, 0);

    if (CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) == 0 && CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_AIR_LOCK) == 0) {
        if (ctx->fieldCondition & 12) {
            if (type1 != TYPE_ROCK && type2 != TYPE_ROCK &&
                type1 != TYPE_STEEL && type2 != TYPE_STEEL &&
                type1 != TYPE_GROUND && type2 != TYPE_GROUND &&
                ctx->battleMons[battlerId].hp && GetBattlerAbility(ctx, battlerId) != ABILITY_SAND_VEIL &&
                !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                    ctx->moveWork = MOVE_SANDSTORM;
                    ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);
            }
        }
        if (ctx->fieldCondition & 48) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN || GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                }
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->tempWork = 2;
                }
            }
        }
        if (ctx->fieldCondition & 192) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].moveEffectFlags & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_ICE_BODY) {
                    if (ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp) {
                        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                    }
                } else if (type1 != TYPE_ICE && type2 != TYPE_ICE &&
                           GetBattlerAbility(ctx, battlerId) != ABILITY_SNOW_CLOAK) {
                    ctx->moveWork = MOVE_HAIL;
                    ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);

                }
            }
        }
        if (ctx->fieldCondition & 3) {
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp &&
                GetBattlerAbility(ctx, battlerId) == ABILITY_RAIN_DISH) {
                ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
            }
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp &&
                GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN) {
                ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp, 8);
            }
            if (ctx->battleMons[battlerId].hp && (u8)ctx->battleMons[battlerId].status &&
                GetBattlerAbility(ctx, battlerId) == ABILITY_HYDRATION) {
                if (ctx->battleMons[battlerId].status & 7) { //sleep
                    ctx->msgWork = 0;
                } else if (ctx->battleMons[battlerId].status & 0xf88) { //poison and toxic
                    ctx->msgWork = 1;
                } else if (ctx->battleMons[battlerId].status & 16) { //burn
                    ctx->msgWork = 2;
                } else if (ctx->battleMons[battlerId].status & (1 << 6)) { //para
                    ctx->msgWork = 3;
                } else {
                    ctx->msgWork = 4;
                }
                ctx->tempWork = 1;
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_RolloutDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, j;
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].rolloutCount = ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    if (!(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_12)) {
        LockBattlerIntoCurrentMove(bsys, ctx, ctx->battlerIdAttacker);
        ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount = 5;
    }

    if (--ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount == 0) {
        UnlockBattlerOutOfCurrentMove(bsys, ctx, ctx->battlerIdAttacker);
    }

    ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;

    j = 5 - ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    for (i = 1; i < j; i++) {
        ctx->movePower *= 2;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_DEFENCE_CURL) {
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_FuryCutterDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount < 5) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount++;
    }

    ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;

    for (i = 1; i < ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount; i++) {
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_TryAttract(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdWork].gender == ctx->battleMons[ctx->battlerIdStatChange].gender ||
        ctx->battleMons[ctx->battlerIdStatChange].status2 & STATUS2_ATTRACT_ALL ||
        ctx->battleMons[ctx->battlerIdWork].gender == 2 || ctx->battleMons[ctx->battlerIdStatChange].gender == 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdStatChange].status2 |= MaskOfFlagNo(ctx->battlerIdWork) << 16;
    }

    return FALSE;
}

BOOL BtlCmd_TrySafeguard(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[fieldSide] & SIDE_CONDITION_SAFEGUARD) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->moveStatusFlag |= 64;
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= SIDE_CONDITION_SAFEGUARD;
        ctx->fieldSideConditionData[fieldSide].safeguardTurns = 5;
        ctx->fieldSideConditionData[fieldSide].safeguardBattler = ctx->battlerIdAttacker;
        ctx->buffMsg.tag = 1;
        ctx->buffMsg.param[0] = ctx->battlerIdAttacker;
        ctx->buffMsg.id = 198;
    }

    return FALSE;
}

BOOL BtlCmd_Present(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int adrs = BattleScriptReadWord(ctx);
    int rand = (u8)BattleSys_Random(bsys);

    if (rand < 102) {
        ctx->movePower = 40;
    } else if (rand < 178) {
        ctx->movePower = 80;
    } else if (rand < 204) {
        ctx->movePower = 120;
    } else {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[ctx->battlerIdTarget].maxHp, 4);
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_MagnitudeDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->magnitude == 0) {
        ctx->magnitude = BattleSys_Random(bsys) % 100;
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

    ctx->msgWork = ctx->magnitude;

    return FALSE;
}

BOOL BtlCmd_TrySwitchMon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_RapidSpin(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    //Binding Moves
    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_BINDING_ALL) {
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_BINDING_ALL;
        ctx->battlerIdWork = ctx->battleMons[ctx->battlerIdAttacker].unk88.battlerIdBinding;
        ctx->moveWork = ctx->battleMons[ctx->battlerIdAttacker].unk88.bindingMove;
        BattleScriptGotoSubscript(ctx, 1, 116);
        return FALSE;
    }

    //Leech Seed
    if (ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags & MOVE_EFFECT_LEECH_SEED) {
        ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags &= ~MOVE_EFFECT_LEECH_SEED;
        ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags &= ~3;
        ctx->moveWork = 73;
        BattleScriptGotoSubscript(ctx, 1, 117);
        return FALSE;
    }

    //Spikes
    if(ctx->fieldSideConditionData[side].spikesLayers) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_SPIKES;
        ctx->fieldSideConditionData[side].spikesLayers = 0;
        ctx->moveWork = MOVE_SPIKES;
        BattleScriptGotoSubscript(ctx, 1, 117);
        return FALSE;
    }

    //Toxic Spikes
    if(ctx->fieldSideConditionData[side].toxicSpikesLayers) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_TOXIC_SPIKES;
        ctx->fieldSideConditionData[side].toxicSpikesLayers = 0;
        ctx->moveWork = MOVE_TOXIC_SPIKES;
        BattleScriptGotoSubscript(ctx, 1, 117);
        return FALSE;
    }

    //Stealth Rocks
    if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_STEALTH_ROCKS) {
        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_STEALTH_ROCKS;
        ctx->moveWork = MOVE_STEALTH_ROCK;
        BattleScriptGotoSubscript(ctx, 1, 117);
        return FALSE;
    }

    BattleScriptIncrementPointer(ctx, 1);

    return FALSE;
}

BOOL BtlCmd_ChangeWeatherBasedHPRecovery(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!(ctx->fieldCondition & 0x80FF) || CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) || CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_AIR_LOCK)) {
        ctx->hpCalcWork = ctx->battleMons[ctx->battlerIdAttacker].maxHp / 2;
    } else if (ctx->fieldCondition & 48) {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp*20, 30);
    } else {
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);
    }

    return FALSE;
}

BOOL BtlCmd_HiddenPowerDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = ((ctx->battleMons[ctx->battlerIdAttacker].hpIV & 2) >> 1) |
                     (ctx->battleMons[ctx->battlerIdAttacker].atkIV & 2) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].defIV & 2) << 1) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].speedIV & 2) << 2) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].spAtkIV & 2) << 3) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].spDefIV & 2) << 4);
    ctx->moveType =  (ctx->battleMons[ctx->battlerIdAttacker].hpIV & 1) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].atkIV & 1) << 1)|
                     ((ctx->battleMons[ctx->battlerIdAttacker].defIV & 1) << 2) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].speedIV & 1) << 3) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].spAtkIV & 1) << 4) |
                     ((ctx->battleMons[ctx->battlerIdAttacker].spDefIV & 1) << 5);

    ctx->movePower = ctx->movePower * 40/63 + 30;
    ctx->moveType = ctx->moveType * 15/63 + 1;

    if (ctx->moveType >= TYPE_MYSTERY) {
        ctx->moveType++;
    }

    return FALSE;
}

BOOL BtlCmd_PsychUp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int stat;

    BattleScriptIncrementPointer(ctx, 1);

    for (stat = 0; stat < 8; stat++) {
        ctx->battleMons[ctx->battlerIdAttacker].statChanges[stat] = ctx->battleMons[ctx->battlerIdTarget].statChanges[stat];
    }

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_FOCUS_ENERGY);

    return FALSE;
}

BOOL BtlCmd_TryFutureSight(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] == 0) {
        int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget);
        ctx->fieldSideConditionFlags[side] |= SIDE_CONDITION_FUTURE_SIGHT;
        ctx->fieldConditionData.futureSightTurns[ctx->battlerIdTarget] = 3;
        ctx->fieldConditionData.futureSightMoveNo[ctx->battlerIdTarget] = ctx->moveNoCur;
        ctx->fieldConditionData.battlerIdFutureSight[ctx->battlerIdTarget] = ctx->battlerIdAttacker;
        int damage = CalcMoveDamage(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[side], ctx->fieldCondition, 0, 0, ctx->battlerIdAttacker, ctx->battlerIdTarget, 1) * -1;
        ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ov12_02257C30(bsys, ctx, damage);
        if (ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag) {
            ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget] = ctx->fieldConditionData.futureSightDamage[ctx->battlerIdTarget]*15/10;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckHitRate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_TryTeleport(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 adrs = BattleScriptReadWord(ctx);

    if (CanEscape(bsys, ctx, ctx->battlerIdAttacker, 0)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_BeatUpDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int species;
    int forme;
    int level;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int monCnt = BattleSys_GetPartySize(bsys, ctx->battlerIdAttacker);

    if (ctx->multiHitCountTemp == 0) {
        ctx->multiHitCountTemp = 2;
        ctx->checkMultiHit = 253;
        ctx->beatUpCount = 0;

        while (TRUE) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
            if (ctx->beatUpCount == ctx->selectedMonIndex[ctx->battlerIdAttacker] ||
                (GetMonData(mon, MON_DATA_HP, 0) && GetMonData(mon, MON_DATA_SPECIES2, 0) && GetMonData(mon, MON_DATA_SPECIES2, 0) != 0x1ee && GetMonData(mon, MON_DATA_STATUS, 0) == 0)) {
                break;
            }
            ctx->beatUpCount++;
        }
    }

    mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
    species = GetMonData(mon, MON_DATA_SPECIES, 0);
    forme = GetMonData(mon, MON_DATA_FORME, 0);
    level = GetMonData(mon, MON_DATA_LEVEL, 0);

    ctx->damage = GetMonBaseStat_HandleAlternateForme(species, forme, BASE_ATK);
    ctx->damage *= ctx->unk_334.moveData[ctx->moveNoCur].power;
    ctx->damage *= (level * 2 / 5 + 2);
    ctx->damage /= (u32) GetMonBaseStat_HandleAlternateForme(ctx->battleMons[ctx->battlerIdTarget].species, ctx->battleMons[ctx->battlerIdTarget].forme, BASE_DEF);
    ctx->damage /= 50;
    ctx->damage += 2;
    ctx->damage *= ctx->criticalMultiplier;
    if (ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag) {
        ctx->damage = ctx->damage * 15/10;
    }
    ctx->damage = ov12_02257C30(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    ctx->buffMsg.id = 0x1e1;
    ctx->buffMsg.tag = 2;
    ctx->buffMsg.param[0] = (ctx->battlerIdAttacker | (ctx->beatUpCount << 8));

    ctx->beatUpCount++;
    ctx->multiHitCount = 2;

    if (ctx->beatUpCount < monCnt) {
        while (TRUE) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, ctx->beatUpCount);
            if (ctx->beatUpCount == ctx->selectedMonIndex[ctx->battlerIdAttacker] ||
                (GetMonData(mon, MON_DATA_HP, 0) && GetMonData(mon, MON_DATA_SPECIES2, 0) && GetMonData(mon, MON_DATA_SPECIES2, 0) != 0x1ee && GetMonData(mon, MON_DATA_STATUS, 0) == 0)) {
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

BOOL BtlCmd_FollowMe(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    ctx->fieldSideConditionData[side].followMeFlag = TRUE;
    ctx->fieldSideConditionData[side].battlerIdFollowMe = ctx->battlerIdAttacker;

    return FALSE;
}

BOOL BtlCmd_TryHelpingHand(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    u32 battleType = BattleSys_GetBattleType(bsys);

    if (battleType & BATTLE_TYPE_DOUBLES) {
        battlerId = GetBattlerIDBySide(bsys, ctx, 16);
        if ((ctx->unk_3108 & MaskOfFlagNo(battlerId)) == 0 && ctx->unk_21A8[battlerId][0] != 40 &&
            ctx->battleMons[battlerId].hp && !ctx->turnData[ctx->battlerIdAttacker].helpingHandFlag && !ctx->turnData[battlerId].helpingHandFlag) {
            ctx->battlerIdWork = battlerId;
            ctx->turnData[battlerId].helpingHandFlag = TRUE;
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryTrick(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrsA = BattleScriptReadWord(ctx);
    int adrsB = BattleScriptReadWord(ctx);

    u32 battleType = BattleSys_GetBattleType(bsys);
    int sideAttacker = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideTarget = BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker) && (battleType & (BATTLE_TYPE_2 | BATTLE_TYPE_7)) == 0) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if ((ctx->fieldSideConditionData[sideAttacker].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdAttacker])) ||
              (ctx->fieldSideConditionData[sideTarget].battlerBitKnockedOffItem & MaskOfFlagNo(ctx->selectedMonIndex[ctx->battlerIdTarget]))) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if ((ctx->battleMons[ctx->battlerIdAttacker].item == 0 && ctx->battleMons[ctx->battlerIdTarget].item == 0) ||
                !ov12_0225275C(ctx, ctx->battlerIdAttacker) || !ov12_0225275C(ctx, ctx->battlerIdTarget)) {
        BattleScriptIncrementPointer(ctx, adrsA);
    } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrsB);
    }

    return FALSE;
}

BOOL BtlCmd_TryWish(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_TryAssist(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 unkA;
    u16 avaliableMoves[6*4];
    u16 move;
    int i, j, monCnt, moveCnt;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    unkA = BattleScriptReadWord(ctx);

    moveCnt = 0;
    monCnt = BattleSys_GetPartySize(bsys, ctx->battlerIdAttacker);

    for (i = 0; i < monCnt; i++) {
        if (i != ctx->selectedMonIndex[ctx->battlerIdAttacker]) {
            mon = BattleSystem_GetPartyMon(bsys, ctx->battlerIdAttacker, i);
            if (GetMonData(mon, MON_DATA_SPECIES2, 0) && GetMonData(mon, MON_DATA_SPECIES2, 0) != SPECIES_EGG) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, 0);
                    if (ov12_02252698(move) == FALSE && CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, move) == TRUE) {
                        avaliableMoves[moveCnt] = move;
                        moveCnt++;
                    }
                }
            }
        }
    }

    if (moveCnt) {
        ctx->moveWork = avaliableMoves[BattleSys_Random(bsys)%moveCnt];
    } else {
        BattleScriptIncrementPointer(ctx, unkA);
    }

    return FALSE;
}

BOOL BtlCmd_TrySetMagicCoat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);
    u32 unkA = BattleScriptReadWord(ctx);

    for (i = 0; i < BattleSys_GetMaxBattlers(bsys); i++) { }

    if (ctx->battlersOnField == 1) {
        BattleScriptIncrementPointer(ctx, unkA);
    } else {
        ctx->turnData[ctx->battlerIdAttacker].magicCoatFlag = 1;
    }

    return FALSE;
}

BOOL BtlCmd_MagicCoat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int battlerId = ctx->battlerIdAttacker;
    ctx->battlerIdMagicCoat = battlerId;
    ctx->battlerIdAttacker = ctx->battlerIdTarget;

    if (ctx->fieldSideConditionData[side].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[side].battlerIdFollowMe].hp) {
        ctx->battlerIdTarget = ctx->fieldSideConditionData[side].battlerIdFollowMe;
    } else if (ctx->unk_334.moveData[ctx->moveNoCur].unk8 == 4 || ctx->unk_334.moveData[ctx->moveNoCur].unk8 == 8) {
        ctx->battlerIdTarget = battlerId;
    } else {
        side = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16) ctx->moveNoCur, 1, 0);
        if (ctx->selfTurnData[side].unk0_1 || ctx->selfTurnData[side].unk0_2) {
            ctx->battlerIdTarget = side;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
    }

    ctx->linkStatus2 |= 8;

    return FALSE;
}

BOOL BtlCmd_RevengeDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ctx->turnData[ctx->battlerIdAttacker].physicalDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitPhysicalDamage & MaskOfFlagNo(ctx->battlerIdTarget)) ||
        (ctx->turnData[ctx->battlerIdAttacker].specialDamage[ctx->battlerIdTarget] && ctx->turnData[ctx->battlerIdAttacker].battlerBitSpecialDamage & MaskOfFlagNo(ctx->battlerIdTarget))) {
        ctx->unk_2158 = 20;
    } else {
        ctx->unk_2158 = 10;
    }

    return FALSE;
}

BOOL BtlCmd_TryBreakScreens(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget);

    //in order flags are: reflect, light screen
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

BOOL BtlCmd_TryYawn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    u32 adrs = BattleScriptReadWord(ctx);
    if (ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags & (192 << 5)) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdTarget].moveEffectFlags |= MOVE_EFFECT_YAWN;
    }

    return FALSE;
}

BOOL BtlCmd_TryKnockOff(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        ctx->buffMsg.id = 0x2ca;
        ctx->buffMsg.tag = 37;
        ctx->buffMsg.param[0] = CreateNicknameTag(ctx, ctx->battlerIdTarget);
        ctx->buffMsg.param[1] = ctx->battleMons[ctx->battlerIdTarget].ability;
        ctx->buffMsg.param[2] = ctx->moveNoCur;
    } else if (ctx->battleMons[ctx->battlerIdTarget].item) {
        ctx->buffMsg.id = 0x228;
        ctx->buffMsg.tag = 33;
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

BOOL BtlCmd_EruptionDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->movePower == 0) {
        ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power * ctx->battleMons[ctx->battlerIdAttacker].hp / ctx->battleMons[ctx->battlerIdAttacker].maxHp;
        if (ctx->movePower == 0) {
            ctx->movePower = 1;
        }
    }

    return FALSE;
}

//Matches in compiler explorer- here some of the variables get stored in the wrong place on the stack pointer
#ifdef NONMATCHING
BOOL BtlCmd_TryImprison(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int adrs, side, i, j, battlerId, maxBattlers, battlerIdA, battlerIdB;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    battlerIdA = ov12_0223ABB8(bsys, ctx->battlerIdAttacker, 0);
    battlerIdB = ov12_0223ABB8(bsys, ctx->battlerIdAttacker, 2);

    ctx->battleMons[battlerIdA].moveEffectFlags |= MOVE_EFFECT_IMPRISON;
    ctx->battleMons[battlerIdB].moveEffectFlags |= MOVE_EFFECT_IMPRISON;

    if (ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags & MOVE_EFFECT_IMPRISON_USER) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        side = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
        maxBattlers = BattleSys_GetMaxBattlers(bsys);
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            if (side != BattleSys_GetFieldSide(bsys, battlerId)) {
                for (i = 0; i < LEARNED_MOVES_MAX; i++) {
                    for (j = 0; j < LEARNED_MOVES_MAX; j++) {
                        if ((ctx->battleMons[ctx->battlerIdAttacker].moves[i] == ctx->battleMons[battlerId].moves[j]) && ctx->battleMons[ctx->battlerIdAttacker].moves[i] && ctx->battleMons[battlerId].moves[j]) {
                            break;
                        }
                    }
                    if (j != LEARNED_MOVES_MAX) {
                        break;
                    }
                }
                if (j != LEARNED_MOVES_MAX) {
                    break;
                }
            }
        }
        if (battlerId == maxBattlers) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags |= MOVE_EFFECT_IMPRISON_USER;
        }
    }

    return FALSE;
}
#else
asm BOOL BtlCmd_TryImprison(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	str r0, [sp]
	add r0, r7, #0
	mov r1, #1
	bl BattleScriptIncrementPointer
	add r0, r7, #0
	bl BattleScriptReadWord
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [r7, #0x64]
	mov r2, #0
	bl ov12_0223ABB8
	add r4, r0, #0
	ldr r0, [sp]
	ldr r1, [r7, #0x64]
	mov r2, #2
	bl ov12_0223ABB8
	mov r6, #0xb7
	add r3, r0, #0
	lsl r6, r6, #6
	add r1, r4, #0
	mov r0, #0xc0
	mov r4, #1
	add r2, r7, r6
	mul r1, r0
	ldr r5, [r2, r1]
	lsl r4, r4, #0x1e
	orr r5, r4
	str r5, [r2, r1]
	add r1, r3, #0
	mul r1, r0
	ldr r3, [r2, r1]
	orr r3, r4
	str r3, [r2, r1]
	ldr r1, [r7, #0x64]
	mul r0, r1
	add r0, r7, r0
	ldr r2, [r0, r6]
	lsr r0, r4, #0x11
	tst r0, r2
	beq _02243098
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl BattleScriptIncrementPointer
	b _0224313C
_02243098:
	ldr r0, [sp]
	bl BattleSys_GetFieldSide
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl BattleSys_GetMaxBattlers
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _02243112
	str r7, [sp, #4]
_022430B4:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl BattleSys_GetFieldSide
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _02243100
	mov r2, #0
	ldr r0, =0x2D4C
	add r4, r2, #0
_022430C8:
	ldr r1, [r7, #0x64]
	mov r6, #0xc0
	mul r6, r1
	add r1, r7, r6
	add r6, r1, r4
	ldr r1, =0x2D4C
	ldr r5, [sp, #4]
	ldrh r6, [r6, r1]
	mov r3, #0
_022430DA:
	ldrh r1, [r5, r0]
	cmp r6, r1
	bne _022430E8
	cmp r6, #0
	beq _022430E8
	cmp r1, #0
	bne _022430F0
_022430E8:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #4
	blt _022430DA
_022430F0:
	cmp r3, #4
	bne _022430FC
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #4
	blt _022430C8
_022430FC:
	cmp r3, #4
	bne _02243112
_02243100:
	ldr r0, [sp, #4]
	add r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _022430B4
_02243112:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _02243124
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl BattleScriptIncrementPointer
	b _0224313C
_02243124:
	mov r0, #0xb7
	ldr r1, [r7, #0x64]
	lsl r0, r0, #6
	add r3, r7, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	mov r0, #2
	ldr r1, [r3, r2]
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r3, r2]
_0224313C:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
}
#endif

BOOL BtlCmd_TryGrudge(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int pos;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget);

    if (ctx->battleMons[ctx->battlerIdFainted].moveEffectFlags & MOVE_EFFECT_14 &&
        BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker) != BattleSys_GetFieldSide(bsys, ctx->battlerIdFainted) &&
        ctx->battleMons[ctx->battlerIdAttacker].hp && ctx->moveNoTemp != 165) {
        pos = ctx->movePos[ctx->battlerIdAttacker];
        ctx->battleMons[ctx->battlerIdAttacker].movePPCur[pos] = 0;
        ctx->moveWork = ctx->battleMons[ctx->battlerIdAttacker].moves[pos];
        CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdAttacker);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySnatch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    u32 maxBattlers;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    maxBattlers = 0;
    for (battlerId = 0; battlerId < BattleSys_GetMaxBattlers(bsys); battlerId++) {
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

BOOL BtlCmd_LowKickDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_WeatherBallDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (!CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_AIR_LOCK)) {
        if (ctx->fieldCondition & 0x80ff) {
            ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power * 2;
            if (ctx->fieldCondition & 3) {
                ctx->moveType = TYPE_WATER;
            }
            if (ctx->fieldCondition & 12) {
                ctx->moveType = TYPE_ROCK;
            }
            if (ctx->fieldCondition & 48) {
                ctx->moveType = TYPE_FIRE;
            }
            if (ctx->fieldCondition & 192) {
                ctx->moveType = TYPE_ICE;
            }
        } else {
            ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryPursuit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int adrs, battlerId, maxBattlers, moveNo, moveIndex;

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);
    maxBattlers = BattleSys_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_21A8[battlerId][0] != 40 && ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].status & 39) &&
            !ov12_02252C40(ctx, battlerId) && BattleSys_GetFieldSide(bsys, battlerId) != BattleSys_GetFieldSide(bsys, ctx->battlerIdSwitch)) {
            if (ctx->battleMons[battlerId].unk88.encoredMove && ctx->battleMons[battlerId].unk88.encoredMove == ctx->battleMons[battlerId].moves[ctx->battleMons[battlerId].unk88.encoredMoveIndex]) {
                moveNo = ctx->battleMons[battlerId].unk88.encoredMove;
            } else {
                moveNo = GetBattlerSelectedMove(ctx, battlerId);
            }
            if (moveNo) {
                moveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[battlerId], (u16)moveNo);
                if (ctx->unk_334.moveData[moveNo].effect == 128 && ctx->battleMons[battlerId].movePPCur[moveIndex]) {
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
                    ctx->unk_21A8[battlerId][0] = 40;
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
        BattleSystem_GetHeldItemDamageBoost(ctx, ctx->battlerIdAttacker, 0);

        if (itemEffect == HOLD_EFFECT_CHOICE_ATK || itemEffect == HOLD_EFFECT_CHOICE_SPEED || itemEffect == HOLD_EFFECT_CHOICE_SPATK) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.moveNoChoice = moveNo;
        }
    }

    return FALSE;
}

BOOL BtlCmd_TypeEffectivenessCheck(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->damage = ov12_02251D28(bsys, ctx, ctx->moveNoCur, ctx->moveType, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->damage, &ctx->moveStatusFlag);

    return FALSE;
}

//TODO: Rename to BtlCmd_CheckTurnDataFlag
BOOL BtlCmd_PokemonEncounter44(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
        if (ctx->turnData[battlerId].unk0_6 == val) {
            ret = TRUE;
        }
        break;
    }

    if (ret) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

//Todo: Rename to BtlCmd_SetTurnDataFlag
BOOL BtlCmd_PokemonEncounter45(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
        ctx->turnData[battlerId].unk0_6 = val;
        break;
    }

    return FALSE;
}

BOOL BtlCmd_GyroBallDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + 25*ctx->unk_21F0[ctx->battlerIdTarget]/ctx->unk_21F0[ctx->battlerIdAttacker];

    if (ctx->movePower > 150) {
        ctx->movePower = 150;
    }

    return FALSE;
}

BOOL BtlCmd_MetalBurstDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int sideA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSys_GetFieldSide(bsys, ctx->turnData[ctx->battlerIdAttacker].unk38);

    if (ctx->turnData[ctx->battlerIdAttacker].unk34 && sideA != sideB && ctx->battleMons[ctx->turnData[ctx->battlerIdAttacker].unk38].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].unk34 * 15/10;
        if (ctx->fieldSideConditionData[sideB].followMeFlag && ctx->battleMons[ctx->fieldSideConditionData[sideB].battlerIdFollowMe].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].battlerIdFollowMe;
        } else {
            ctx->battlerIdTarget = ctx->turnData[ctx->battlerIdAttacker].unk38;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->unk_C = 39;
                BattleScriptJump(ctx, NARC_a_0_0_1, 281);
            }
        }
        CheckIgnorePressure(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_PaybackDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->unk_21A8[ctx->battlerIdTarget][0] == 40) {
        ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power*2;
    } else {
        ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;
    }

    return FALSE;
}

extern u8 sTrumpCardPowerTable[];

BOOL BtlCmd_TrumpCardDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u8 pp = ctx->battleMons[ctx->battlerIdAttacker].movePPCur[ctx->movePos[ctx->battlerIdAttacker]];

    if (pp > 4) {
        pp = 4;
    }

    ctx->movePower = sTrumpCardPowerTable[pp];

    return FALSE;
}

BOOL BtlCmd_WringOutDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->movePower = 1 + (120*ctx->battleMons[ctx->battlerIdTarget].hp)/ctx->battleMons[ctx->battlerIdTarget].maxHp;

    return FALSE;
}

BOOL BtlCmd_TryMeFirst(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u16 move;

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove &&
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == ctx->battleMons[ctx->battlerIdTarget].moves[ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex]) {
        move = ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove;
    } else {
        move = GetBattlerSelectedMove(ctx, ctx->battlerIdTarget);
    }

    if (ctx->unk_21A8[ctx->battlerIdTarget][0] != 40 && ctx->turnData[ctx->battlerIdTarget].struggleFlag == 0 &&
        CheckLegalMeFirstMove(ctx, move) == TRUE && ctx->unk_334.moveData[move].power) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstFlag = TRUE;
        ctx->battleMons[ctx->battlerIdAttacker].unk88.meFirstCount = ctx->meFirstTotal;
        ctx->moveWork = move;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryCopycat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ov12_02252698(ctx->moveNoPrev) == FALSE && ctx->moveNoPrev && CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoPrev) == TRUE) {
        ctx->moveWork = ctx->moveNoPrev;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_PunishmentDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int stat, cnt;

    BattleScriptIncrementPointer(ctx, 1);

    cnt = 0;
    for (stat = 0; stat < 8; stat++) {
        if (ctx->battleMons[ctx->battlerIdTarget].statChanges[stat] > 6) {
            cnt += ctx->battleMons[ctx->battlerIdTarget].statChanges[stat] - 6;
        }
    }

    ctx->movePower = 60 + 20*cnt;

    if (ctx->movePower > 200) {
        ctx->movePower = 200;
    }

    return FALSE;
}

BOOL BtlCmd_TrySuckerPunch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int move;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove &&
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == ctx->battleMons[ctx->battlerIdTarget].moves[ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex]) {
        move = ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove;
    } else {
        move = GetBattlerSelectedMove(ctx, ctx->battlerIdTarget);
    }

    if (ctx->unk_21A8[ctx->battlerIdTarget][0] == 40 ||
        (ctx->unk_334.moveData[move].power == 0 && !ctx->turnData[ctx->battlerIdTarget].struggleFlag)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckSideCondition(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSys_GetFieldSide(bsys, GetBattlerIDBySide(bsys, ctx, side));

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

BOOL BtlCmd_TryFeint(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!ctx->turnData[ctx->battlerIdTarget].protectFlag) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPyschoShift(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].status || ctx->battleMons[ctx->battlerIdTarget].status2 & (1 << 24) || !ctx->battleMons[ctx->battlerIdAttacker].status) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryLastResort(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int cnt = GetBattlerLearnedMoveCount(bsys, ctx, ctx->battlerIdAttacker);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount < cnt-1 || cnt < 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryToxicSpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int side = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker)^1;

    if (ctx->fieldSideConditionData[side].toxicSpikesLayers == 2) {
        ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure = TRUE;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[side] |= (1 << 10);
        ctx->fieldSideConditionData[side].toxicSpikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckToxicSpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers) {
        ctx->calcWork = ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers;
        ctx->unk_88 = 6;
        ctx->battlerIdStatChange = battlerId;
        if (GetBattlerVar(ctx, ctx->battlerIdSwitch, 27, 0) == TYPE_POISON || GetBattlerVar(ctx, ctx->battlerIdSwitch, 28, 0) == TYPE_POISON) {
            ctx->fieldSideConditionFlags[fieldSide] &= ~(1 << 10);
            ctx->fieldSideConditionData[fieldSide].toxicSpikesLayers = 0;
            ctx->calcWork = 0;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckMoldBreaker(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int flag = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == 0) {
        int index;
        int maxBattlers = BattleSys_GetMaxBattlers(bsys);

        for (index = 0; index < maxBattlers; index++) {
            battlerId = ctx->unk_21EC[index];
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

BOOL BtlCmd_CheckTeammates(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerIdA = GetBattlerIDBySide(bsys, ctx, sideA);
    int battlerIdB = GetBattlerIDBySide(bsys, ctx, sideB);

    if (BattleSys_GetFieldSide(bsys, battlerIdA) == BattleSys_GetFieldSide(bsys, battlerIdB)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

extern const u16 sPickupTable1[18];
extern const u16 sPickupTable2[11];
extern const u8 sPickupWeightTable[9];
extern const u8 sHoneyGatherChanceTable[10];

BOOL BtlCmd_Pickup(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int rnd, i, j, k;
    u16 species, item;
    u8 ability, lvl;
    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    for (i = 0; i < BattleSys_GetPartySize(bsys, 0); i++) {
        mon = BattleSystem_GetPartyMon(bsys, 0, i);
        species = GetMonData(mon, MON_DATA_SPECIES2, 0);
        item = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
        ability = GetMonData(mon, MON_DATA_ABILITY, 0);
        if (ability == ABILITY_PICKUP && species && species != SPECIES_EGG && !item && !(BattleSys_Random(bsys)%10)) {
            rnd = BattleSys_Random(bsys) % 100;
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
        if (ability == ABILITY_HONEY_GATHER && species && species != SPECIES_EGG && !item) {
            j = 0;
            k = 10;
            lvl = GetMonData(mon, MON_DATA_LEVEL, 0);
            while (lvl > k) {
                j++;
                k += 10;
            }

            GF_ASSERT(j < 10);

            if ((BattleSys_Random(bsys) % 100) < sHoneyGatherChanceTable[j]) {
                j = ITEM_HONEY;
                SetMonData(mon, MON_DATA_HELD_ITEM, &j);
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrickRoom(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].trickRoomFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_CheckMoveFinished(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (ov12_0225561C(ctx, battlerId) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckItemEffect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_GetItemEffect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    u16 item = GetBattlerHeldItem(ctx, battlerId);
    *var = GetItemHoldEffect(ctx, item, 1);

    return FALSE;
}

BOOL BtlCmd_GetItemHoldEffect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int varId = BattleScriptReadWord(ctx);
    int *var = BattleScriptGetVarPointer(bsys, ctx, varId);
    u16 item = GetBattlerHeldItem(ctx, GetBattlerIDBySide(bsys, ctx, side));
    *var = GetItemHoldEffect(ctx, item, 2);

    return FALSE;
}

extern const u8 sCamouflageTypeTable[13];

BOOL BtlCmd_TryCamouflage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    int terrain = BattleSys_GetTerrainId(bsys);
    if (terrain > TERRAIN_MAX-1) {
        terrain = TERRAIN_MAX-1;
    }
    int type = sCamouflageTypeTable[terrain];

    if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != type && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != type) {
        ctx->battleMons[ctx->battlerIdAttacker].type1 = type;
        ctx->battleMons[ctx->battlerIdAttacker].type2 = type;
        ctx->msgWork = type;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

extern u16 sNaturePowerMoveTable[];

BOOL BtlCmd_NaturePower(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSys_GetTerrainId(bsys);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->moveWork = sNaturePowerMoveTable[terrain];

    return FALSE;
}

extern u32 sSecretPowerEffectTable[];

BOOL BtlCmd_SecretPower(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int terrain = BattleSys_GetTerrainId(bsys);
    if (terrain > 12) {
        terrain = 12;
    }
    ctx->unk_2174 = sSecretPowerEffectTable[terrain];

    return FALSE;
}

BOOL BtlCmd_TryNaturalGift(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_TryPluck(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if ((ctx->battleMons[ctx->battlerIdTarget].item && ctx->battleMons[ctx->battlerIdTarget].unk88.unk4_2C) || CanEatOpponentBerry(bsys, ctx, ctx->battlerIdTarget) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs2);
    }

    return FALSE;
}

BOOL BtlCmd_TryFling(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (CanFling(bsys, ctx, ctx->battlerIdAttacker) != TRUE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_YesNoBox(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDrawYesNoBox(bsys, ctx, 0, 0, BattleScriptReadWord(ctx), 0, 0);

    return FALSE;
}

BOOL BtlCmd_YesNoBoxWait(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u8 selection = ov12_0225682C(ctx, 0);

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

BOOL BtlCmd_MonList(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleSys_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitShowMonList(bsys, ctx, 0, 0, 0, 6);
    ctx->battlerIdSwitch = 0;

    return FALSE;
}

BOOL BtlCmd_MonListWait(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u8 selection = ov12_0225682C(ctx, 0);

    if (selection) {
        BattleScriptIncrementPointer(ctx, 1);
        int adrs = BattleScriptReadWord(ctx);

        if (selection == 255) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ctx->unk_21A0[0] = selection-1;
        }
    }

    ctx->battleContinueFlag = TRUE;

    return FALSE;
}

BOOL BtlCmd_SetBattleResults(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (BattleSys_GetBattleType(bsys) & 4) {
        BattleController_EmitSetBattleResults(bsys);
    }

    return FALSE;
}

BOOL BtlCmd_CheckStealthRock(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSys_GetFieldSide(bsys, battlerId);
    int type1 = GetBattlerVar(ctx, battlerId, 27, 0);
    int type2 = GetBattlerVar(ctx, battlerId, 28, 0);

    if (ctx->fieldSideConditionFlags[fieldSide] & 128 && ctx->battleMons[battlerId].hp) {
        switch (CalculateTypeEffectiveness(TYPE_ROCK, type1, type2)) {
        case 160:
            ctx->hpCalcWork = 2;
            break;
        case 80:
            ctx->hpCalcWork = 4;
            break;
        case 40:
            ctx->hpCalcWork = 8;
            break;
        case 20:
            ctx->hpCalcWork = 16;
            break;
        case 10:
            ctx->hpCalcWork = 32;
            break;
        case 0:
            BattleScriptIncrementPointer(ctx, adrs);
            return FALSE;
        default:
            GF_ASSERT(FALSE);
            break;
        }
        ctx->hpCalcWork = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalcWork);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckEffectActivation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_SERENE_GRACE) {
        effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance*2;
    } else {
        effectChance = ctx->unk_334.moveData[ctx->moveNoCur].effectChance;
    }

    GF_ASSERT(effectChance != 0);

    if ((BattleSys_Random(bsys) % 100) < effectChance && ctx->battleMons[ctx->battlerIdStatChange].hp) {
        return FALSE;
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_CheckChatterActivation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 effectChance;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int param;

    if (ctx->battleMons[ctx->battlerIdAttacker].species == SPECIES_CHATOT && ctx->battleMons[ctx->battlerIdTarget].hp && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 21))) {
        if ((BattleSys_GetBattleFlags(bsys) & 16) == FALSE) {
            param = sub_02006EFC(BattleSys_GetChatotVoice(bsys, ctx->battlerIdAttacker));
        } else {
            param = BattleSys_GetChatotVoiceParam(bsys, ctx->battlerIdAttacker);
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
        if ((BattleSys_Random(bsys) % 100) > effectChance) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetMoveParam(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcWork = GetMoveTblAttr(&ctx->unk_334.moveData[ctx->moveNoCur], (MoveAttr) BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_Mosaic(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int param = BattleScriptReadWord(ctx);
    int delay = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlayMosaicAnimation(bsys, battlerId, param, delay);

    return FALSE;
}

BOOL BtlCmd_ChangeForme(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    BattleController_EmitChangeForme(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_SetBattleBackground(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitSetBattleBackground(bsys, 0);
    return FALSE;
}

BOOL BtlCmd_RecoverStatus(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleSys_RecoverStatus(bsys, battlerId, ctx->selectedMonIndex[battlerId], 0, ctx->itemWork);

    return FALSE;
}

BOOL BtlCmd_TryRun(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (BattleTryRun(bsys, ctx, battlerId)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_InitStartBallGauge(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitInitStartBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_DeleteStartBallGauge(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitDeleteStartBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_InitBallGauge(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitInitBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_DeleteBallGauge(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitDeleteBallGauge(bsys, battlerId);

    return FALSE;
}

BOOL BtlCmd_LoadBallGfx(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitLoadBallGfx(bsys);

    return FALSE;
}

BOOL BtlCmd_DeleteBallGfx(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitDeleteBallGfx(bsys);

    return FALSE;
}

BOOL BtlCmd_IncrementGameStat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int flag = BattleScriptReadWord(ctx);
    int id = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitIncrementGameStat(bsys, battlerId, flag, id);

    return FALSE;
}

BOOL BtlCmd_196(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    ov12_02263F8C(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_CheckAbilityEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (CheckAbilityEffectOnHit(bsys, ctx, &ctx->tempWork) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_198(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_02264038(bsys, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
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

BOOL BtlCmd_199(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    OpponentData *opponentData;
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case 3:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_02264054(bsys, battlerId);
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
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

BOOL BtlCmd_CheckWhiteout(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int adrs;
    int battlerId;
    int partyHp = 0;

    Pokemon *mon;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    adrs = BattleScriptReadWord(ctx);

    int battleType = BattleSys_GetBattleType(bsys);
    battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (battleType & BATTLE_TYPE_MULTI || (battleType & BATTLE_TYPE_INGAME_PARTNER && BattleSys_GetFieldSide(bsys, battlerId))) {
        PARTY *party1 = BattleSys_GetParty(bsys, battlerId);
        PARTY *party2 = BattleSys_GetParty(bsys, BattleSys_GetBattlerIdPartner(bsys, battlerId));

        BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);

        for (i = 0; i < GetPartyCount(party1); i++) {
            mon = GetPartyMonByIndex(party1, i);
            if (GetMonData(mon, MON_DATA_SPECIES2, 0) != 0 && GetMonData(mon, MON_DATA_SPECIES2, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if ((battleType == 75 || battleType == 74) && BattleSys_GetFieldSide(bsys, battlerId) == 0 && ov12_0223AB0C(bsys, battlerId) == 2) {

        } else for (i = 0; i < GetPartyCount(party2); i++) {
            mon = GetPartyMonByIndex(party2, i);
            if (GetMonData(mon, MON_DATA_SPECIES2, 0) != 0 && GetMonData(mon, MON_DATA_SPECIES2, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if (partyHp == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        PARTY *party = BattleSys_GetParty(bsys, battlerId);

        BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);

        for (i = 0; i < GetPartyCount(party); i++) {
            mon = GetPartyMonByIndex(party, i);
            if (GetMonData(mon, MON_DATA_SPECIES2, 0) != 0 && GetMonData(mon, MON_DATA_SPECIES2, 0) != SPECIES_EGG) {
                partyHp += GetMonData(mon, MON_DATA_HP, 0);
            }
        }

        if (partyHp == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_TryAcupressure(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, cnt;
    int statChanges[8];
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    cnt = 0;
    for (i = 1; i < 8; i++) {
        if (ctx->battleMons[ctx->battlerIdTarget].statChanges[i] < 12) {
            statChanges[cnt++] = i-1;
        }
    }

    if (cnt) {
        ctx->unk_2170 = 39 + statChanges[BattleSys_Random(bsys) % cnt];
        ctx->unk_2170 |= (1 << 31);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_RemoveItem(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->recycleItem[battlerId] = ctx->battleMons[battlerId].item;

    ctx->battleMons[battlerId].item = 0;

    CopyBattleMonToPartyMon(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_TryRecycle(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->recycleItem[ctx->battlerIdAttacker]) {
        ctx->itemWork = ctx->recycleItem[ctx->battlerIdAttacker];
        ctx->recycleItem[ctx->battlerIdAttacker] = 0;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckItemEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    if (CheckItemEffectOnHit(bsys, ctx, &ctx->tempWork) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_BattleResultMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintResultMessage(bsys);

    return FALSE;
}

BOOL BtlCmd_RunAwayMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitRunAwayMessage(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_ForefitMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitForefitMessage(bsys);

    return FALSE;
}

BOOL BtlCmd_CheckHoldOnWith1HP(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL flag = FALSE;

    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int itemEffect = GetBattlerHeldItemEffect(ctx, battlerId);
    int activationChance = BattleSystem_GetHeldItemDamageBoost(ctx, battlerId, 0);

    if (itemEffect == HOLD_EFFECT_MAYBE_ENDURE && (BattleSys_Random(bsys)%100) < activationChance) {
        flag = TRUE;
    }
    if (itemEffect == HOLD_EFFECT_ENDURE && ctx->battleMons[battlerId].hp == ctx->battleMons[battlerId].maxHp) {
        flag = TRUE;
    }

    if (flag && (ctx->battleMons[battlerId].hp + ctx->hpCalcWork) <= 0) {
        ctx->hpCalcWork = (ctx->battleMons[battlerId].hp - 1)*-1;
        ctx->moveStatusFlag |= 256;
    }

    return FALSE;
}

BOOL BtlCmd_TryNaturalCure(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    if (ctx->battleMons[battlerId].hp && ctx->selectedMonIndex[battlerId] != 6) {
        Pokemon *mon = BattleSystem_GetPartyMon(bsys, battlerId, ctx->selectedMonIndex[battlerId]);
        int ability = GetMonData(mon, MON_DATA_ABILITY, 0);
        int status = GetMonData(mon, MON_DATA_STATUS, 0);
        if (ctx->battleMons[battlerId].ability != ABILITY_NATURAL_CURE && !CheckNaturalCureOnSwitch(ctx, ability, status)) {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckSubstitute(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (ctx->battleMons[battlerId].status2 & (1 << 24) || ctx->selfTurnData[battlerId].unk14 & 8) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_CheckCloudNine(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, 8, 0, ABILITY_AIR_LOCK)) {

    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_211(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_CheckItemEffectOnUTurn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!CheckItemEffectOnUTurn(bsys, ctx, &ctx->tempWork)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SwapToSubstituteSprite(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitSwapToSubstituteSprite(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_PlayMoveSE(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlayMoveSE(bsys, ctx, battlerId);

    return FALSE;
}


BOOL BtlCmd_PlaySong(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int song = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleController_EmitPlaySong(bsys, battlerId, song);

    return FALSE;
}

BOOL BtlCmd_CheckSafariEncounterDone(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (!(BattleSys_GetPartySize(bsys, 0) != 6 || PCStorage_FindFirstBoxWithEmptySlot(bsys->storage) != 18)) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_WaitWithoutInterrupt(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int tSpeed;

    BattleScriptIncrementPointer(ctx, 1);

    int wait = BattleScriptReadWord(ctx);

    if ((bsys->battleTypeFlags & 4) && !(bsys->unk240C & 16)) {
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

BOOL BtlCmd_CheckCurMoveIsType(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int type = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (ctx->unk_334.moveData[ctx->moveNoCur].type == type) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_GetMonDataFromNarc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int species = BattleScriptReadWord(ctx);
    int forme = BattleScriptReadWord(ctx);
    BaseStat stat = (BaseStat) BattleScriptReadWord(ctx);

    int *formePtr = BattleScriptGetVarPointer(bsys, ctx, forme);

    ctx->calcWork = GetMonBaseStat_HandleAlternateForme(species, *formePtr, stat);

    return FALSE;
}

BOOL BtlCmd_RefreshMonData(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    BattleSystem_ReloadMonData(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);

    return FALSE;
}

BOOL BtlCmd_222(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msgIndex = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    if (TrainerMessageWithIdPairExists(BattleSys_GetTrainerIndex(bsys, battlerId), msgIndex, HEAP_ID_BATTLE)) {
        ctx->msgWork = msgIndex;
    } else {
        ctx->msgWork = 0;
    }

    return FALSE;
}

BOOL BtlCmd_223(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int a2 = BattleScriptReadWord(ctx);

    ov12_022645C8(bsys, ctx, a2 & 1);

    return FALSE;
}

BOOL BtlCmd_EndScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    ctx->battleContinueFlag = TRUE;

    return ov12_0224EC74(ctx);
}

int BattleScriptReadWord(BATTLECONTEXT *ctx) {
    int data = ctx->battleScriptWork[ctx->scriptSeqNo];

    ctx->scriptSeqNo++;

    return data;
}

static void BattleScriptIncrementPointer(BATTLECONTEXT *ctx, int adrs) {
    ctx->scriptSeqNo += adrs;
}

static void BattleScriptJump(BATTLECONTEXT *ctx, NarcId narcId, int adrs) {
    ReadBattleScriptFromNarc(ctx, narcId, adrs);
}

static void BattleScriptGotoSubscript(BATTLECONTEXT *ctx, int a1, int adrs) {
    ov12_0224EBDC(ctx, a1, adrs);
}

static void *BattleScriptGetVarPointer(BattleSystem *bsys, BATTLECONTEXT *ctx, int var) {
    switch (var) {
    case 0:
        return &bsys->battleTypeFlags;
    case 1:
        return &ctx->criticalCnt;
    case 2:
        return &ctx->unk_2170;
    case 3:
        return &ctx->unk_2174;
    case 4:
        return &ctx->unk_2178;
    case 5:
        return &ctx->unk_88;
    case 6:
        return &ctx->linkStatus;
    case 7:
        return &ctx->fieldCondition;
    case 8:
        return &ctx->unk_2158;
    case 9:
        return &ctx->calcWork;
    case 10:
        return &ctx->moveStatusFlag;
    case 11:
        return &ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker)];
    case 12:
        return &ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget)];
    case 13:
        return &ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, ctx->battlerIdStatChange)];
    case 14:
        return &ctx->damage;
    case 15:
        return &ctx->battlerIdAttacker;
    case 16:
        return &ctx->battlerIdTarget;
    case 17:
        return &ctx->battlerIdStatChange;
    case 18:
        return &ctx->battlerIdFainted;
    case 19:
        return &ctx->battlerIdSwitch;
    case 20:
        return &ctx->battlerIdWork;
    case 21:
        return &ctx->unk_30E4[ctx->battlerIdAttacker];
    case 22:
        return &ctx->msgWork;
    case 23:
        return &ctx->unk_14C;
    case 24:
        return &ctx->moveNoCur;
    case 25:
        return &ctx->totalTurns;
    case 26:
        return &ctx->unk_11C;
    case 27:
        return &ctx->unk_120;
    case 28:
        return &ctx->moveNoTemp;
    case 29:
        return &ctx->unk_98;
    case 30:
        return &ctx->movePower;
    case 31:
        return &ctx->unk_38;
    case 32:
        return &ctx->hpCalcWork;
    case 33:
        return &bsys->battleOutcomeFlag;
    case 34:
        return &ctx->statChangeParam;
    case 35:
        return &ctx->moveWork;
    case 36:
        return &ctx->itemWork;
    case 37:
        return &ctx->abilityWork;
    case 38:
        return &ctx->fieldConditionData.weatherTurns;
    case 39:
        return &ctx->unk_3104;
    case 40:
        return &ctx->unk_2180;
    case 41:
        return &ctx->turnData[ctx->battlerIdAttacker].battlerBitPhysicalDamage;
    case 42:
        return &ctx->turnData[ctx->battlerIdAttacker].battlerBitSpecialDamage;
    case 43:
        return &ctx->tempWork;
    case 44:
        return &ctx->criticalMultiplier;
    case 45:
        return &ctx->turnData[ctx->battlerIdAttacker].unk34;
    case 46:
        return &ctx->turnData[ctx->battlerIdTarget].unk34;
    case 47:
        return &ctx->selfTurnData[ctx->battlerIdAttacker].unk14;
    case 48:
        return &ctx->selfTurnData[ctx->battlerIdTarget].unk14;
    case 49:
        return &ctx->selfTurnData[ctx->battlerIdStatChange].unk14;
    case 50:
        return &ctx->unk_3114;
    case 51:
        return &ctx->unk_3118;
    case 52:
        return &bsys->unk240C;
    case 53:
        return &ctx->moveNoKeep[ctx->battlerIdAttacker];
    case 54:
        return &ctx->hitDamage;
    case 55:
        return &bsys->safariBallCnt;
    case 56:
        return &ctx->battlerIdSwitchTemp;
    case 57:
        return &ctx->moveType;
    case 58:
        return &ctx->unk_2164;
    case 59:
        return &bsys->unk241C;
    case 60:
        return &ctx->linkStatus2;
    case 61:
        return &ctx->unk_EC;
    case 62:
        return &bsys->unk44;
    case 63:
        return &ctx->battlerIdAttackerTemp;
    case 64:
        return &ctx->battlerIdTargetTemp;
    case 65:
        return &ctx->selfTurnData[ctx->battlerIdTarget].unk4;
    case 66:
        return &ctx->turnData[ctx->battlerIdWork].unk3C;
    case 67:
        return &ctx->turnData[ctx->battlerIdTarget].unk3C;
    case 68:
        return &ctx->selfTurnData[ctx->battlerIdAttacker].unk18;
    case 69:
        return &ctx->battlersOnField;
    case 70:
        return &bsys->unk2478;
    }

    return 0;
}
