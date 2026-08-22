#include "battle/trainer_ai.h"

#include "battle/battle.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"

#include "constants/abilities.h"
#include "constants/battle_menu.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/battle/trainer_ai.h"

#include "system.h"

extern const u16 sNoDamageCalcMoveEffects[]; /*= {
    MOVE_EFFECT_HALVE_DEFENSE,
    MOVE_EFFECT_RECOVER_DAMAGE_SLEEP,
    MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT,
    MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT_FLINCH,
    MOVE_EFFECT_RECHARGE_AFTER,
    MOVE_EFFECT_CHARGE_TURN_DEF_UP,
    MOVE_EFFECT_SKIP_CHARGE_TURN_IN_SUN,
    MOVE_EFFECT_SPIT_UP,
    MOVE_EFFECT_HIT_LAST_WHIFF_IF_HIT,
    MOVE_EFFECT_LOWER_OWN_ATK_AND_DEF,
    MOVE_EFFECT_DECREASE_POWER_WITH_LESS_USER_HP,
    MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING,
    MOVE_EFFECT_RECOIL_HALF,
    0xFFFF
};*/

extern const u16 sAltPowerMoveEffects[]; /*= {
    MOVE_EFFECT_RANDOM_POWER_BASED_ON_IVS,
    MOVE_EFFECT_POWER_BASED_ON_LOW_SPEED,
    MOVE_EFFECT_NATURAL_GIFT,
    MOVE_EFFECT_JUDGEMENT,
    MOVE_EFFECT_40_DAMAGE_FLAT,
    MOVE_EFFECT_LEVEL_DAMAGE_FLAT,
    MOVE_EFFECT_RANDOM_DAMAGE_1_TO_150_LEVEL,
    MOVE_EFFECT_POWER_BASED_ON_FRIENDSHIP,
    MOVE_EFFECT_POWER_BASED_ON_LOW_FRIENDSHIP,
    MOVE_EFFECT_20_DAMAGE_FLAT,
    MOVE_EFFECT_INCREASE_POWER_WITH_WEIGHT,
    0xFFFF
};*/

typedef void (*AICommandFunc)(BattleSystem *, BattleContext *);

enum AIEvalStep {
    AI_EVAL_STEP_INIT,
    AI_EVAL_STEP_EVAL,
    AI_EVAL_STEP_END,
};

static u8 TrainerAI_MainSingles(BattleSystem *battleSystem, BattleContext *ctx);
static u8 TrainerAI_MainDoubles(BattleSystem *battleSystem, BattleContext *ctx);
static void TrainerAI_EvaluateMoves(BattleSystem *battleSystem, BattleContext *ctx);
static void AIScript_PushCursor(BattleSystem *battleSystem, BattleContext *ctx, int address);
static BOOL AIScript_PopCursor(BattleSystem *battleSystem, BattleContext *ctx);
static void TrainerAI_RecordLastMove(BattleSystem *battleSystem, BattleContext *ctx);
static int AIScript_Read(BattleContext *ctx);
static int AIScript_ReadOffset(BattleContext *ctx, int offset);
static void AIScript_IncrementCursor(BattleContext *ctx, int jump);
static void TrainerAI_GetStats(BattleContext *ctx, int battler, int *buf1, int *buf2, int stat);
static u8 AIScript_Battler(BattleContext *ctx, u8 inBattler);
static s32 TrainerAI_CalcAllDamage(BattleSystem *battleSystem, BattleContext *ctx, int attacker, u16 *moves, s32 *damageVals, u16 heldItem, u8 *ivs, int ability, BOOL embargo, BOOL varyDamage);
static s32 TrainerAI_CalcDamage(BattleSystem *battleSystem, BattleContext *ctx, u16 move, u16 heldItem, u8 *ivs, int attacker, int ability, BOOL embargo, u8 variance);
static int TrainerAI_MoveType(BattleSystem *battleSystem, BattleContext *ctx, int battler, int move);
static BOOL AI_HasSuperEffectiveMove(BattleSystem *battleSystem, BattleContext *ctx, int battler, BOOL alwaysSwitch);
static BOOL TrainerAI_ShouldUseItem(BattleSystem *battleSystem, int battler);

// AICommandFuncs. All of these prototypes should be deleted and their functions made static once this file's data is decomped.
void AICmd_IfRandomLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_AddToMoveScore(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHPPercentLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHPPercentGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHPPercentEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHPPercentNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatus(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfNotStatus(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatus2(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfNotStatus2(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfNotMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfSideCondition(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfNotSideCondition(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedMask(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedNotMask(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedInTable(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedNotInTable(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfAttackerHasDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfAttackerHasNoDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadTurnCount(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadTypeFrom(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_FlagBattlerIsType(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadMovePower(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_FlagMoveDamageScore(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattlerPreviousMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTempEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTempNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfSpeedCompareEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfSpeedCompareNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_CountAlivePartyBattlers(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_CheckBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_CalcMaxEffectiveness(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEffectivenessEquals(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfPartyMemberStatus(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfPartyMemberNotStatus(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentWeather(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveEffectEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveEffectNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatStageLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatStageGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatStageEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfStatStageNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveKOs(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveDoesNotKO(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveKnown(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveNotKnown(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEffectKnown(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEffectNotKnown(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerUnderEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveMatchesEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Escape(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Dummy3E(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Dummy3F(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadHeldItem(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadHeldItemEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHeldItemEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfFieldConditionActive(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadSpikesLayers(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfAnyPartyMemberMissingHP(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfAnyPartyMemberMissingPP(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadFlingPower(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMovePP(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCanUseLastResort(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMoveCategory(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadDefenderLastUsedMoveCategory(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattlerSpeedOrderPosition(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattlerTurnCount(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfPartyMemberDealsMoreDamage(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfHasSuperEffectiveMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerDealsMoreDamage(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_SumPositiveStatStages(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_DiffStatStages(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerHasHigherStat(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerHasLowerStat(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerHasEqualStat(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_CheckIfHighestDamageWithPartner(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerFainted(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfBattlerNotFainted(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadGender(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadIsFirstTurnInBattle(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadStockpileCount(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattleType(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadRecycleItem(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadTypeOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadPowerOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadEffectOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadProtectSuccessChain(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_PushAndGoTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_GoTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_PopOrEnd(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLevel(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTargetIsTaunted(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTargetIsNotTaunted(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTargetIsPartner(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfActivatedFlashFire(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadAbility(BattleSystem *battleSystem, BattleContext *ctx);

extern const AICommandFunc sAICommandTable[];

void TrainerAI_Init(BattleSystem *battleSystem, BattleContext *ctx, u8 battlerID, u8 initScore) {
    int i;
    u8 invalidMoves;
    
    u8 *aiData = (u8 *)&ctx->trainerAIData;
    for (i = 0; i < OFFSET_OF(TrainerAIData *, moves); i++) {
        aiData[i] = 0;
    }

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (initScore & 1) {
            ctx->trainerAIData.moveScore[i] = 100;
        } else {
            ctx->trainerAIData.moveScore[i] = 0;
        }
        initScore >>= 1;
    }

    // Pick damage rolls for moves and set the score for invalid moves to 0.
    invalidMoves = StruggleCheck(battleSystem, ctx, battlerID, 0, -1); // BattleSystem_CheckInvalidMoves
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (invalidMoves & MaskOfFlagNo(i)) {
            ctx->trainerAIData.moveScore[i] = 0;
        }
        ctx->trainerAIData.moveDamageRolls[i] = 100 - (BattleSystem_Random(battleSystem) % 16);
    }

    ctx->trainerAIData.scriptStackSize = 0; 

    if (battleSystem->battleType & BATTLE_TYPE_ROAMER) {
        ctx->trainerAIData.aiFlags = AI_FLAG_ROAMING_POKEMON;
    } else {
        ctx->trainerAIData.aiFlags = battleSystem->trainers[battlerID].data.aiFlags;
    }

    // Force double-battle strategies, if applicable.
    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        ctx->trainerAIData.aiFlags |= AI_FLAG_DOUBLES;
    }
}

u8 TrainerAI_Main(BattleSystem *battleSystem, u8 battlerID) {
    u8 ret;
    BattleContext *ctx = battleSystem->ctx;

    if (!(ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_CONTINUE)) {
        ctx->trainerAIData.attacker = battlerID;
        ctx->trainerAIData.defender = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, battlerID);

        TrainerAI_Init(battleSystem, ctx, ctx->trainerAIData.attacker, AI_INIT_SCORE_ALL_MOVES);
    }

    if ((battleSystem->battleType & BATTLE_TYPE_DOUBLES) == FALSE) {
        ret = TrainerAI_MainSingles(battleSystem, ctx);
    } else {
        ret = TrainerAI_MainDoubles(battleSystem, ctx);
    }

    return ret;
}

static u8 TrainerAI_MainSingles(BattleSystem *battleSystem, BattleContext *ctx) {
    u8 maxScoreMoves[MAX_MON_MOVES];
    u8 maxScoreMoveSlots[MAX_MON_MOVES];
    u8 numMaxScoreMoves;
    u8 action = 0; // AI_ENEMY_ATTACK_1

    TrainerAI_RecordLastMove(battleSystem, ctx);

    // Iterate through all active AI flags to get each move's aggregate score.
    while (ctx->trainerAIData.aiFlags) {
        if (ctx->trainerAIData.aiFlags & AI_FLAG_BASIC) {
            if ((ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_CONTINUE) == FALSE) {
                ctx->trainerAIData.evalStep = AI_EVAL_STEP_INIT;
            }

            TrainerAI_EvaluateMoves(battleSystem, ctx);
        }

        ctx->trainerAIData.aiFlags >>= 1;
        ctx->trainerAIData.aiBitShift++;
        ctx->trainerAIData.moveSlot = 0;
    }

    if (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_ESCAPE) {
        action = 4; // AI_ENEMY_ESCAPE
    } else if (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_SAFARI) {
        action = 5; // AI_ENEMY_SAFARI
    } else {
        // Get the move with the highest score; break ties randomly.
        numMaxScoreMoves = 1;
        maxScoreMoves[0] = ctx->trainerAIData.moveScore[0];
        maxScoreMoveSlots[0] = 0; // AI_ENEMY_ATTACK_1

        for (int moveSlot = 1; moveSlot < MAX_MON_MOVES; moveSlot++) {
            if (ctx->battleMons[ctx->trainerAIData.attacker].moves[moveSlot]) { // Attacker has a move in this slot.
                // Append to the list of max-score moves if it has an equal score to the current max.
                if (maxScoreMoves[0] == ctx->trainerAIData.moveScore[moveSlot]) {
                    maxScoreMoves[numMaxScoreMoves] = ctx->trainerAIData.moveScore[moveSlot];
                    maxScoreMoveSlots[numMaxScoreMoves++] = moveSlot;
                }

                // Set to be the maximum score if it has higher score than the current max.
                if (maxScoreMoves[0] < ctx->trainerAIData.moveScore[moveSlot]) {
                    numMaxScoreMoves = 1;
                    maxScoreMoves[0] = ctx->trainerAIData.moveScore[moveSlot];
                    maxScoreMoveSlots[0] = moveSlot;
                }
            }
        }

        action = maxScoreMoveSlots[BattleSystem_Random(battleSystem) % numMaxScoreMoves];
    }

    ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = ctx->trainerAIData.defender;
    return action;
}

static u8 TrainerAI_MainDoubles(BattleSystem *battleSystem, BattleContext *ctx) {
    int battlerID, battlerCount, aiFlags;
    s16 maxScoreForBattler[BATTLER_MAX];
    u8 battlerTemp[BATTLER_MAX];
    s8 actionForBattler[BATTLER_MAX];
    s16 maxScore;
    u16 move;
    s8 moveSlot;

    for (battlerID = 0; battlerID < BATTLER_MAX; battlerID++) {
        if (battlerID == ctx->trainerAIData.attacker || ctx->battleMons[battlerID].hp == 0) {
            actionForBattler[battlerID] = -1;
            maxScoreForBattler[battlerID] = -1;
            continue;
        }

        TrainerAI_Init(battleSystem, ctx, ctx->trainerAIData.attacker, AI_INIT_SCORE_ALL_MOVES);

        // Record the last moves of enemy battlers.
        ctx->trainerAIData.defender = battlerID;
        if ((battlerID & 1) != (ctx->trainerAIData.attacker & 1)) { // Side 1 has even-numbered IDs, side 2 has odd-numbered battle IDs.
            TrainerAI_RecordLastMove(battleSystem, ctx);
        }

        ctx->trainerAIData.aiBitShift = 0;
        ctx->trainerAIData.moveSlot = 0;
        aiFlags = ctx->trainerAIData.aiFlags;

        // Evaluate moves accordingly with the current battlerID as the target.
        while (aiFlags) {
            if (aiFlags & AI_FLAG_BASIC) {
                if ((ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_CONTINUE) == FALSE) {
                    ctx->trainerAIData.evalStep = AI_EVAL_STEP_INIT;
                }

                TrainerAI_EvaluateMoves(battleSystem, ctx);
            }

            aiFlags >>= 1;
            ctx->trainerAIData.aiBitShift++;
            ctx->trainerAIData.moveSlot = 0;
        }

        if (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_ESCAPE) {
            actionForBattler[battlerID] = 4; // AI_ENEMY_ESCAPE
        } else if (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_SAFARI) {
            actionForBattler[battlerID] = 5; // AI_ENEMY_SAFARI
        } else {
            u8 tmpMaxScores[MAX_MON_MOVES];
            u8 tmpMaxScoreMoveSlots[MAX_MON_MOVES];
            int numMaxScoreMoves, i;

            // Pick a random move from among the highest-scored moves on this target.
            tmpMaxScores[0] = ctx->trainerAIData.moveScore[0];
            tmpMaxScoreMoveSlots[0] = 0;
            numMaxScoreMoves = 1;

            for (i = 1; i < MAX_MON_MOVES; i++) {
                if (ctx->battleMons[ctx->trainerAIData.attacker].moves[i]) {
                    // Same score as max: append to list of possible max-score moves.
                    if (tmpMaxScores[0] == ctx->trainerAIData.moveScore[i]) {
                        tmpMaxScores[numMaxScoreMoves] = ctx->trainerAIData.moveScore[i];
                        tmpMaxScoreMoveSlots[numMaxScoreMoves] = i;
                        numMaxScoreMoves++;
                    }

                    // Higher score than max: set as new max score.
                    if (tmpMaxScores[0] < ctx->trainerAIData.moveScore[i]) {
                        tmpMaxScores[0] = ctx->trainerAIData.moveScore[i];
                        tmpMaxScoreMoveSlots[0] = i;
                        numMaxScoreMoves = 1;
                    }
                }
            }

            actionForBattler[battlerID] = tmpMaxScoreMoveSlots[BattleSystem_Random(battleSystem) % numMaxScoreMoves];
            maxScoreForBattler[battlerID] = tmpMaxScores[0];

            // Score moves on an ally below 100 to -1 (basically, never use them).
            if (battlerID == (ctx->trainerAIData.attacker ^ 2)) {
                if (maxScoreForBattler[battlerID] < 100) {
                    maxScoreForBattler[battlerID] = -1;
                }
            }
        }
    }

    // Get the highest overall score among all the possible targets.
    maxScore = maxScoreForBattler[0];
    battlerTemp[0] = 0;
    battlerCount = 1;
    for (battlerID = 1; battlerID < BATTLER_MAX; battlerID++) {
        if (maxScore == maxScoreForBattler[battlerID]) {
            battlerTemp[battlerCount++] = battlerID;
        }

        if (maxScore < maxScoreForBattler[battlerID]) {
            maxScore = maxScoreForBattler[battlerID];
            battlerTemp[0] = battlerID;
            battlerCount = 1;
        }
    }

    // Pick a random target from among the maximum-scored targets.
    ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = battlerTemp[(BattleSystem_Random(battleSystem) % battlerCount)];
    moveSlot = actionForBattler[ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker]];
    move = ctx->battleMons[ctx->trainerAIData.attacker].moves[moveSlot];

    // Override targets as needed.
    if (ctx->trainerAIData.moveData[move].range == RANGE_SINGLE_TARGET_USER_SIDE
        && BattleSystem_GetBattlerSide(battleSystem, ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker]) == 0) {
        ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = ctx->trainerAIData.attacker;
    }

    if (move == MOVE_CURSE && CurseUserIsGhost(ctx, move, ctx->trainerAIData.attacker) == FALSE) {
        ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = ctx->trainerAIData.attacker;
    }

    return moveSlot;
}

static void TrainerAI_EvaluateMoves(BattleSystem *battleSystem, BattleContext *ctx) {
    while (ctx->trainerAIData.evalStep != AI_EVAL_STEP_END) {
        switch (ctx->trainerAIData.evalStep) {
        case AI_EVAL_STEP_INIT:
            ctx->aiScriptCursor = ctx->aiScriptTemp[ctx->trainerAIData.aiBitShift];

            if (ctx->battleMons[ctx->trainerAIData.attacker].movePPCur[ctx->trainerAIData.moveSlot] == 0) {
                ctx->trainerAIData.move = MOVE_NONE;
            } else {
                ctx->trainerAIData.move = ctx->battleMons[ctx->trainerAIData.attacker].moves[ctx->trainerAIData.moveSlot];
            }

            ctx->trainerAIData.evalStep++;
            break;

        case AI_EVAL_STEP_EVAL:
            if (ctx->trainerAIData.move != MOVE_NONE) {
                sAICommandTable[ctx->aiScriptTemp[ctx->aiScriptCursor]](battleSystem, ctx);
            } else {
                ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] = 0;
                ctx->trainerAIData.stateFlags |= AI_STATUS_FLAG_DONE;
            }

            if (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_DONE) {
                // If we haven't gone through all the moves, loop back to INIT state and evaluate the next move.
                ctx->trainerAIData.moveSlot++;
                if (ctx->trainerAIData.moveSlot < MAX_MON_MOVES && (ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_BREAK) == FALSE) {
                    ctx->trainerAIData.evalStep = AI_EVAL_STEP_INIT;
                } else {
                    ctx->trainerAIData.evalStep++;
                }

                ctx->trainerAIData.stateFlags &= AI_STATUS_FLAG_DONE_OFF;
            }
            break;

        case AI_EVAL_STEP_END:
            break;
        }
    }
}

void AICmd_IfRandomLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 < val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfRandomGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 > val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfRandomEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfRandomNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_AddToMoveScore(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] += val;

    if (ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] < 0) {
        ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] = 0;
    }
}

void AICmd_IfHPPercentLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int targetPercent = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u32 hpPercent = ctx->battleMons[battler].hp * 100 / ctx->battleMons[battler].maxHp;

    if (hpPercent < targetPercent) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfHPPercentGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int targetPercent = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u32 hpPercent = ctx->battleMons[battler].hp * 100 / ctx->battleMons[battler].maxHp;

    if (hpPercent > targetPercent) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfHPPercentEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int targetPercent = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u32 hpPercent = ctx->battleMons[battler].hp * 100 / ctx->battleMons[battler].maxHp;

    if (hpPercent == targetPercent) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfHPPercentNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int targetPercent = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u32 hpPercent = ctx->battleMons[battler].hp * 100 / ctx->battleMons[battler].maxHp;

    if (hpPercent != targetPercent) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].status & mask) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfNotStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if ((ctx->battleMons[battler].status & mask) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatus2(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].status2 & mask) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfNotStatus2(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if ((ctx->battleMons[battler].status2 & mask) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfMoveEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 flag = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].moveEffectFlags & flag) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfNotMoveEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 flag = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if ((ctx->battleMons[battler].moveEffectFlags & flag) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfSideCondition(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 flag = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u8 side = BattleSystem_GetBattlerSide(battleSystem, battler);

    if (ctx->fieldSideConditionFlags[side] & flag) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfNotSideCondition(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 flag = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u8 side = BattleSystem_GetBattlerSide(battleSystem, battler);

    if ((ctx->fieldSideConditionFlags[side] & flag) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp < val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp > val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedMask(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp & mask) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedNotMask(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if ((ctx->trainerAIData.calcTemp & mask) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfMoveEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.move == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfMoveNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.move != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedInTable(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int offset = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    int val;

    while ((val = AIScript_ReadOffset(ctx, offset)) != 0xFFFFFFFF) {
        if (ctx->trainerAIData.calcTemp == val) {
            AIScript_IncrementCursor(ctx, jump);
            break;
        }
        offset++;
    }
}

void AICmd_IfLoadedNotInTable(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int offset = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    int val;

    while ((val = AIScript_ReadOffset(ctx, offset)) != 0xFFFFFFFF) {
        if (ctx->trainerAIData.calcTemp == val) {
            return;
        }
        offset++;
    }

    AIScript_IncrementCursor(ctx, jump);
}

void AICmd_IfAttackerHasDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);

    int i;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (ctx->battleMons[ctx->trainerAIData.attacker].moves[i] != MOVE_NONE
            && ctx->trainerAIData.moveData[ctx->battleMons[ctx->trainerAIData.attacker].moves[i]].power) {
            break;
        }
    }

    if (i < MAX_MON_MOVES) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfAttackerHasNoDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);

    int i;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (ctx->battleMons[ctx->trainerAIData.attacker].moves[i] != MOVE_NONE
            && ctx->trainerAIData.moveData[ctx->battleMons[ctx->trainerAIData.attacker].moves[i]].power) {
            break;
        }
    }

    if (i == MAX_MON_MOVES) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_LoadTurnCount(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->totalTurns;
}

void AICmd_LoadTypeFrom(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int param = AIScript_Read(ctx);
    int partner;

    switch (param) {
    case LOAD_ATTACKER_TYPE_1:
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_TYPE_1, NULL);
        break;

    case LOAD_DEFENDER_TYPE_1:
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, ctx->trainerAIData.defender, BMON_DATA_TYPE_1, NULL);
        break;

    case LOAD_ATTACKER_TYPE_2:
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_TYPE_2, NULL);
        break;

    case LOAD_DEFENDER_TYPE_2:
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, ctx->trainerAIData.defender, BMON_DATA_TYPE_2, NULL);
        break;

    case LOAD_MOVE_TYPE:
        ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].type;
        break;

    case LOAD_ATTACKER_PARTNER_TYPE_1:
        partner = BattleSystem_GetBattlerIdPartner(battleSystem, ctx->trainerAIData.attacker);
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, partner, BMON_DATA_TYPE_1, NULL);
        break;

    case LOAD_DEFENDER_PARTNER_TYPE_1:
        partner = BattleSystem_GetBattlerIdPartner(battleSystem, ctx->trainerAIData.defender);
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, partner, BMON_DATA_TYPE_1, NULL);
        break;

    case LOAD_ATTACKER_PARTNER_TYPE_2:
        partner = BattleSystem_GetBattlerIdPartner(battleSystem, ctx->trainerAIData.attacker);
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, partner, BMON_DATA_TYPE_2, NULL);
        break;

    case LOAD_DEFENDER_PARTNER_TYPE_2:
        partner = BattleSystem_GetBattlerIdPartner(battleSystem, ctx->trainerAIData.defender);
        ctx->trainerAIData.calcTemp = GetBattlerVar(ctx, partner, BMON_DATA_TYPE_1, NULL); // BUG: Checks type 1 again instead of type 2.
        break;

    default:
        GF_ASSERT(FALSE);
        break;
    }
}

void AICmd_FlagBattlerIsType(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int type = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (GetBattlerVar(ctx, battler, BMON_DATA_TYPE_1, NULL) == type || GetBattlerVar(ctx, battler, BMON_DATA_TYPE_2, NULL) == type) {
        ctx->trainerAIData.calcTemp = TRUE;
    } else {
        ctx->trainerAIData.calcTemp = FALSE;
    }
}

void AICmd_LoadMovePower(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].power;
}

void AICmd_FlagMoveDamageScore(BattleSystem *battleSystem, BattleContext *ctx) {
    s32 moveDamage[MAX_MON_MOVES];
    u8 ivs[NUM_STATS];

    AIScript_IncrementCursor(ctx, 1);

    BOOL varyDamage = AIScript_Read(ctx);

    // Do-whiles are required to match, despite not being the case in pokeplatinum.
    int noDamageCalcIndex = 0;
    do  {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sNoDamageCalcMoveEffects[noDamageCalcIndex]) {
            break;
        }
        noDamageCalcIndex++;
    } while (sNoDamageCalcMoveEffects[noDamageCalcIndex] != 0xFFFF);

    int altPowerIndex = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sAltPowerMoveEffects[altPowerIndex]) {
            break;
        }
        altPowerIndex++;
    } while (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF);

    if (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF
        || (ctx->trainerAIData.moveData[ctx->trainerAIData.move].power > 1 && sNoDamageCalcMoveEffects[noDamageCalcIndex] == 0xFFFF)) {
        int i;
        for (i = 0; i < NUM_STATS; i++) {
            ivs[i] = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_HP_IV + i, NULL);
        }

        TrainerAI_CalcAllDamage(battleSystem,
            ctx,
            ctx->trainerAIData.attacker,
            ctx->battleMons[ctx->trainerAIData.attacker].moves,
            moveDamage,
            ctx->battleMons[ctx->trainerAIData.attacker].item,
            ivs,
            GetBattlerAbility(ctx, ctx->trainerAIData.attacker),
            ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.embargoTurns,
            varyDamage);

        
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (moveDamage[i] > moveDamage[ctx->trainerAIData.moveSlot]) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            ctx->trainerAIData.calcTemp = AI_MOVE_IS_HIGHEST_DAMAGE;
        } else {
            ctx->trainerAIData.calcTemp = AI_NOT_HIGHEST_DAMAGE;
        }
    } else {
        ctx->trainerAIData.calcTemp = AI_NO_COMPARISON_MADE;
    }
}

void AICmd_LoadBattlerPreviousMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->moveNoBattlerPrev[battler];
}

void AICmd_IfTempEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (val == ctx->trainerAIData.calcTemp) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfTempNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (val != ctx->trainerAIData.calcTemp) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfSpeedCompareEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (CheckSortSpeed(battleSystem, ctx, ctx->trainerAIData.attacker, ctx->trainerAIData.defender, TRUE) == val) { // BattleSystem_CompareBattlerSpeed in pokeplatinum
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfSpeedCompareNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (CheckSortSpeed(battleSystem, ctx, ctx->trainerAIData.attacker, ctx->trainerAIData.defender, TRUE) != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_CountAlivePartyBattlers(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);

    ctx->trainerAIData.calcTemp = 0;

    u8 battler = AIScript_Battler(ctx, inBattler);
    Party *party = BattleSystem_GetParty(battleSystem, battler);
    u8 battlerSlot, partnerSlot;

    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        battlerSlot = ctx->selectedMonIndex[battler];
        partnerSlot = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, battler)]; // BattleSystem_GetPartner in pokeplatinum
    } else {
        battlerSlot = partnerSlot = ctx->selectedMonIndex[battler];
    }

    for (int i = 0; i < BattleSystem_GetPartySize(battleSystem, battler); i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);

        if (i != battlerSlot
            && i != partnerSlot
            && GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
            ctx->trainerAIData.calcTemp++;
        }
    }
}

void AICmd_LoadCurrentMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.move;
}

void AICmd_LoadCurrentMoveEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect;
}

void AICmd_LoadBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].moveEffectFlags & MOVE_EFFECT_FLAG_ABILITY_SUPPRESSED) {
        ctx->trainerAIData.calcTemp = ABILITY_NONE;
    } else if (ctx->trainerAIData.attacker != battler && inBattler != AI_BATTLER_ATTACKER_PARTNER) {
        // If we already know an opponent's ability, load that ability.
        if (ctx->trainerAIData.abilities[battler]) {
            ctx->trainerAIData.calcTemp = ctx->trainerAIData.abilities[battler];
        } else {
            // If the opponent has an ability that traps us, we should already know about it (because it self-announces).
            // Oddly, this does not apply to Mold Breaker, Anticipation, etc.
            if (ctx->battleMons[battler].ability == ABILITY_SHADOW_TAG
                || ctx->battleMons[battler].ability == ABILITY_MAGNET_PULL
                || ctx->battleMons[battler].ability == ABILITY_ARENA_TRAP) {
                ctx->trainerAIData.calcTemp = ctx->battleMons[battler].ability;
            } else {
                // Try to guess the opponent's ability (flip a coin).
                int ability1 = GetMonBaseStat(ctx->battleMons[battler].species, BASE_ABILITY_1); // SpeciesData_GetSpeciesValue in pokeplatinum
                int ability2 = GetMonBaseStat(ctx->battleMons[battler].species, BASE_ABILITY_2);

                if (ability1 && ability2) {
                    if (BattleSystem_Random(battleSystem) & 1) {
                        ctx->trainerAIData.calcTemp = ability1;
                    } else {
                        ctx->trainerAIData.calcTemp = ability2;
                    }
                } else if (ability1) {
                    ctx->trainerAIData.calcTemp = ability1;
                } else {
                    ctx->trainerAIData.calcTemp = ability2;
                }
            }
        }
    } else {
        ctx->trainerAIData.calcTemp = ctx->battleMons[battler].ability;
    }
}

void AICmd_CheckBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int expected = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int tempAbility;

    if (ctx->battleMons[battler].moveEffectFlags & MOVE_EFFECT_FLAG_ABILITY_SUPPRESSED) {
        tempAbility = ABILITY_NONE;
    } else if (inBattler == AI_BATTLER_DEFENDER || inBattler == AI_BATTLER_DEFENDER_PARTNER) {
        // If we already know an opponent's ability, load that ability
        if (ctx->trainerAIData.abilities[battler]) {
            tempAbility = ctx->trainerAIData.abilities[battler];
            ctx->trainerAIData.calcTemp = ctx->trainerAIData.abilities[battler];
        } else {
            // If the opponent has an ability that traps us, we should already know about it (because it self-announces).
            if (ctx->battleMons[battler].ability == ABILITY_SHADOW_TAG
                || ctx->battleMons[battler].ability == ABILITY_MAGNET_PULL
                || ctx->battleMons[battler].ability == ABILITY_ARENA_TRAP) {
                tempAbility = ctx->battleMons[battler].ability;
            } else {
                // Try to guess the opponent's ability (flip a coin).
                int ability1 = GetMonBaseStat(ctx->battleMons[battler].species, BASE_ABILITY_1);
                int ability2 = GetMonBaseStat(ctx->battleMons[battler].species, BASE_ABILITY_2);

                if (ability1 && ability2) {
                    // If the opponent has two abilities, but neither are the expected one,
                    // prefer ability 1 for the final check.
                    if (ability1 != expected && ability2 != expected) {
                        tempAbility = ability1;
                        // Otherwise, pretend that we don't know about it.
                    } else {
                        tempAbility = ABILITY_NONE;
                    }
                } else if (ability1) {
                    tempAbility = ability1;
                } else {
                    tempAbility = ability2;
                }
            }
        }
    } else {
        tempAbility = ctx->battleMons[battler].ability;
    }

    if (tempAbility == ABILITY_NONE) {
        ctx->trainerAIData.calcTemp = AI_UNKNOWN;
    } else if (tempAbility == expected) {
        ctx->trainerAIData.calcTemp = AI_HAVE;
    } else {
        ctx->trainerAIData.calcTemp = AI_NOT_HAVE;
    }
}

void AICmd_CalcMaxEffectiveness(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    ctx->trainerAIData.calcTemp = TYPE_MULTI_IMMUNE;

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        u32 damage = TYPE_MULTI_BASE_DAMAGE;
        u32 effectiveness = 0;
        u16 move = ctx->battleMons[ctx->trainerAIData.attacker].moves[i];
        int moveType = TrainerAI_MoveType(battleSystem, ctx, ctx->trainerAIData.attacker, move);

        if (move) {
            damage = BattleSystem_ApplyTypeChart(battleSystem,
                ctx,
                move,
                moveType,
                ctx->trainerAIData.attacker,
                ctx->trainerAIData.defender,
                damage,
                &effectiveness);

            if (damage == TYPE_MULTI_STAB_DAMAGE * 2) {
                damage = TYPE_MULTI_DOUBLE_DAMAGE;
            } else if (damage == TYPE_MULTI_STAB_DAMAGE * 4) {
                damage = TYPE_MULTI_QUADRUPLE_DAMAGE;
            } else if (damage == TYPE_MULTI_STAB_DAMAGE / 2) {
                damage = TYPE_MULTI_HALF_DAMAGE;
            } else if (damage == TYPE_MULTI_STAB_DAMAGE / 4) {
                damage = TYPE_MULTI_QUARTER_DAMAGE;
            }

            if (effectiveness & MOVE_STATUS_IMMUNE) {
                damage = TYPE_MULTI_IMMUNE;
            }

            if (ctx->trainerAIData.calcTemp < damage) {
                ctx->trainerAIData.calcTemp = damage;
            }
        }
    }
}

void AICmd_IfMoveEffectivenessEquals(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u32 damage = TYPE_MULTI_BASE_DAMAGE;
    u32 effectiveness = 0;

    damage = BattleSystem_ApplyTypeChart(battleSystem,
        ctx,
        ctx->trainerAIData.move,
        TrainerAI_MoveType(battleSystem, ctx, ctx->trainerAIData.attacker, ctx->trainerAIData.move),
        ctx->trainerAIData.attacker,
        ctx->trainerAIData.defender,
        damage,
        &effectiveness);

    if (damage == TYPE_MULTI_STAB_DAMAGE * 2) {
        damage = TYPE_MULTI_DOUBLE_DAMAGE;
    } else if (damage == TYPE_MULTI_STAB_DAMAGE * 4) {
        damage = TYPE_MULTI_QUADRUPLE_DAMAGE;
    } else if (damage == TYPE_MULTI_STAB_DAMAGE / 2) {
        damage = TYPE_MULTI_HALF_DAMAGE;
    } else if (damage == TYPE_MULTI_STAB_DAMAGE / 4) {
        damage = TYPE_MULTI_QUARTER_DAMAGE;
    }

    if (effectiveness & MOVE_STATUS_IMMUNE) {
        damage = TYPE_MULTI_IMMUNE;
    }

    if (damage == expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfPartyMemberStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    Party *party; // this must be declared first to match
    int inBattler = AIScript_Read(ctx);
    u32 statusMask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    u8 slot1, slot2;
    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        slot1 = ctx->selectedMonIndex[battler];
        slot2 = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, battler)];
    } else {
        slot1 = slot2 = ctx->selectedMonIndex[battler];
    }

    party = BattleSystem_GetParty(battleSystem, battler);
    for (int i = 0; i < BattleSystem_GetPartySize(battleSystem, battler); i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);

        if (i != slot1 && i != slot2
            && GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && (GetMonData(mon, MON_DATA_STATUS, NULL) & statusMask)) {
            AIScript_IncrementCursor(ctx, jump);
            return;
        }
    }
}

void AICmd_IfPartyMemberNotStatus(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    Party *party; // this must be declared first to match
    int inBattler = AIScript_Read(ctx);
    u32 statusMask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    u8 slot1, slot2;
    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        slot1 = ctx->selectedMonIndex[battler];
        slot2 = ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, battler)];
    } else {
        slot1 = slot2 = ctx->selectedMonIndex[battler];
    }

    party = BattleSystem_GetParty(battleSystem, battler);
    for (int i = 0; i < BattleSystem_GetPartySize(battleSystem, battler); i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);

        if (i != slot1 && i != slot2
            && GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && (GetMonData(mon, MON_DATA_STATUS, NULL) & statusMask) == FALSE) {
            AIScript_IncrementCursor(ctx, jump);
            return;
        }
    }
}

void AICmd_LoadCurrentWeather(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    ctx->trainerAIData.calcTemp = AI_WEATHER_CLEAR;

    if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
        ctx->trainerAIData.calcTemp = AI_WEATHER_RAINING;
    }

    if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
        ctx->trainerAIData.calcTemp = AI_WEATHER_SANDSTORM;
    }

    if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
        ctx->trainerAIData.calcTemp = AI_WEATHER_SUNNY;
    }

    if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
        ctx->trainerAIData.calcTemp = AI_WEATHER_HAILING;
    }

    if (ctx->fieldCondition & FIELD_CONDITION_FOG) {
        ctx->trainerAIData.calcTemp = AI_WEATHER_DEEP_FOG;
    }
}

void AICmd_IfCurrentMoveEffectEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfCurrentMoveEffectNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect != expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatStageLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].statChanges[stat] < val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatStageGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].statChanges[stat] > val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatStageEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].statChanges[stat] == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatStageNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].statChanges[stat] != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfCurrentMoveKOs(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    BOOL useDamageRoll = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    int roll;
    if (useDamageRoll == TRUE) {
        roll = ctx->trainerAIData.moveDamageRolls[ctx->trainerAIData.moveSlot];
    } else {
        roll = 100;
    }

    int noDamageCalcIndex = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sNoDamageCalcMoveEffects[noDamageCalcIndex]) {
            break;
        }
        noDamageCalcIndex++;
    } while (sNoDamageCalcMoveEffects[noDamageCalcIndex] != 0xFFFF);

    int altPowerIndex = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sAltPowerMoveEffects[altPowerIndex]) {
            break;
        }
        altPowerIndex++;
    } while (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF);

    if (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF
        || (ctx->trainerAIData.moveData[ctx->trainerAIData.move].power > 1 && sNoDamageCalcMoveEffects[noDamageCalcIndex] == 0xFFFF)) {
        u8 ivs[NUM_STATS];
        for (int stat = STAT_HP; stat < NUM_STATS; stat++) {
            ivs[stat] = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_HP_IV + stat, NULL);
        }

        u32 damage = TrainerAI_CalcDamage(battleSystem,
            ctx,
            ctx->trainerAIData.move,
            ctx->battleMons[ctx->trainerAIData.attacker].item,
            ivs,
            ctx->trainerAIData.attacker,
            GetBattlerAbility(ctx, ctx->trainerAIData.attacker),
            ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.embargoTurns,
            roll);

        if (ctx->battleMons[ctx->trainerAIData.defender].hp <= damage) {
            AIScript_IncrementCursor(ctx, jump);
        }
    }
}

void AICmd_IfCurrentMoveDoesNotKO(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    BOOL useDamageRoll = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    int roll;
    if (useDamageRoll == TRUE) {
        roll = ctx->trainerAIData.moveDamageRolls[ctx->trainerAIData.moveSlot];
    } else {
        roll = 100;
    }

    int noDamageCalcIndex = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sNoDamageCalcMoveEffects[noDamageCalcIndex]) {
            break;
        }
        noDamageCalcIndex++;
    } while (sNoDamageCalcMoveEffects[noDamageCalcIndex] != 0xFFFF);

    int altPowerIndex = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sAltPowerMoveEffects[altPowerIndex]) {
            break;
        }
        altPowerIndex++;
    } while (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF);

    if (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF
        || (ctx->trainerAIData.moveData[ctx->trainerAIData.move].power > 1 && sNoDamageCalcMoveEffects[noDamageCalcIndex] == 0xFFFF)) {
        u8 ivs[NUM_STATS];
        for (int stat = STAT_HP; stat < NUM_STATS; stat++) {
            ivs[stat] = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_HP_IV + stat, NULL);
        }

        u32 damage = TrainerAI_CalcDamage(battleSystem,
            ctx,
            ctx->trainerAIData.move,
            ctx->battleMons[ctx->trainerAIData.attacker].item,
            ivs,
            ctx->trainerAIData.attacker,
            GetBattlerAbility(ctx, ctx->trainerAIData.attacker),
            ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.embargoTurns,
            roll);

        if (ctx->battleMons[ctx->trainerAIData.defender].hp > damage) {
            AIScript_IncrementCursor(ctx, jump);
        }
    }
}

void AICmd_IfMoveKnown(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int move = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int i;

    switch (inBattler) {
    case AI_BATTLER_ATTACKER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i] == move) {
                break;
            }
        }

        if (i < MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_ATTACKER_PARTNER:
        if (ctx->battleMons[battler].hp == 0) {
            break;
        }

        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i] == move) {
                break;
            }
        }

        if (i < MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_DEFENDER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->trainerAIData.moves[battler][i] == move) {
                break;
            }
        }

        if (i < MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

void AICmd_IfMoveNotKnown(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int move = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int i;

    switch (inBattler) {
    case AI_BATTLER_ATTACKER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i] == move) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_ATTACKER_PARTNER:
        if (ctx->battleMons[battler].hp == 0) {
            break;
        }

        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i] == move) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_DEFENDER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->trainerAIData.moves[battler][i] == move) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

void AICmd_IfMoveEffectKnown(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int effect = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int i;

    switch (inBattler) {
    case AI_BATTLER_ATTACKER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i]
                && ctx->trainerAIData.moveData[ctx->battleMons[battler].moves[i]].effect == effect) {
                break;
            }
        }

        if (i < MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_DEFENDER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->trainerAIData.moves[battler][i]
                && ctx->trainerAIData.moveData[ctx->trainerAIData.moves[battler][i]].effect == effect) {
                break;
            }
        }

        if (i < MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

void AICmd_IfMoveEffectNotKnown(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int effect = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int i;

    switch (inBattler) {
    case AI_BATTLER_ATTACKER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->battleMons[battler].moves[i]
                && ctx->trainerAIData.moveData[ctx->battleMons[battler].moves[i]].effect == effect) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case AI_BATTLER_DEFENDER:
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (ctx->trainerAIData.moves[battler][i]
                && ctx->trainerAIData.moveData[ctx->trainerAIData.moves[battler][i]].effect == effect) {
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

// TODO: Consider rename. IfBattlerMoveLockedByEffect? IfBattlerDisabledOrEncored?
void AICmd_IfBattlerUnderEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int check = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    switch (check) {
    case CHECK_DISABLE:
        if (ctx->battleMons[battler].moveEffectData.disabledTurns) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case CHECK_ENCORE:
        if (ctx->battleMons[battler].moveEffectData.encoredTurns) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

// AICmd_IfCurrentMoveIsDisabledOrEncored?
void AICmd_IfCurrentMoveMatchesEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int check = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    switch (check) {
    case CHECK_DISABLE:
        if (ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.disabledMove == ctx->trainerAIData.move) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case CHECK_ENCORE:
        if (ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.encoredMove == ctx->trainerAIData.move) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

void AICmd_Escape(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.stateFlags |= (AI_STATUS_FLAG_DONE | AI_STATUS_FLAG_ESCAPE | AI_STATUS_FLAG_BREAK);
}

void AICmd_Dummy3E(BattleSystem *battleSystem, BattleContext *ctx) {
    return;
}

void AICmd_Dummy3F(BattleSystem *battleSystem, BattleContext *ctx) {
    return;
}

void AICmd_LoadHeldItem(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->battleMons[battler].item;
}

void AICmd_LoadHeldItemEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->trainerAIData.attacker != battler) {
        ctx->trainerAIData.calcTemp = GetItemVar(ctx, ctx->trainerAIData.heldItems[battler], ITEMATTR_HOLD_EFFECT); // GetItemVar in pokeplatinum
    } else {
        ctx->trainerAIData.calcTemp = GetItemVar(ctx, ctx->battleMons[battler].item, ITEMATTR_HOLD_EFFECT);
    }
}

void AICmd_IfHeldItemEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u16 heldItem;

    if ((battler & 1) == (ctx->trainerAIData.attacker & 1)) {
        heldItem = ctx->battleMons[battler].item;
    } else {
        heldItem = ctx->trainerAIData.heldItems[battler];
    }

    if (heldItem == expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfFieldConditionActive(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    u32 mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->fieldCondition & mask) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_LoadSpikesLayers(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u32 sideCondition = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    u8 side = BattleSystem_GetBattlerSide(battleSystem, battler);

    switch (sideCondition) {
    case SIDE_CONDITION_SPIKES:
        ctx->trainerAIData.calcTemp = ctx->fieldSideConditionData[side].spikesLayers;
        break;

    case SIDE_CONDITION_TOXIC_SPIKES:
        ctx->trainerAIData.calcTemp = ctx->fieldSideConditionData[side].toxicSpikesLayers;
        break;
    }
}

void AICmd_IfAnyPartyMemberMissingHP(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    for (int partySlot = 0; partySlot < BattleSystem_GetPartySize(battleSystem, battler); partySlot++) {
        Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battler, partySlot);

        if (partySlot != ctx->selectedMonIndex[battler]
            && GetMonData(mon, MON_DATA_HP, NULL) != GetMonData(mon, MON_DATA_MAX_HP, NULL)) {
            AIScript_IncrementCursor(ctx, jump);
            break;
        }
    }
}

void AICmd_IfAnyPartyMemberMissingPP(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int moveSlot; // must be declared outside of the loop to match

    for (int partySlot = 0; partySlot < BattleSystem_GetPartySize(battleSystem, battler); partySlot++) {
        Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battler, partySlot);

        if (partySlot != ctx->selectedMonIndex[battler]) {
            for (moveSlot = 0; moveSlot < MAX_MON_MOVES; moveSlot++) {
                if (GetMonData(mon, MON_DATA_MOVE1_PP + moveSlot, NULL) != GetMonData(mon, MON_DATA_MOVE1_MAX_PP + moveSlot, NULL)) {
                    AIScript_IncrementCursor(ctx, jump);
                    break;
                }
            }

            if (moveSlot != MAX_MON_MOVES) {
                break;
            }
        }
    }
}

void AICmd_LoadFlingPower(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = GetHeldItemFlingPower(ctx, battler);
}

void AICmd_LoadCurrentMovePP(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->battleMons[ctx->trainerAIData.attacker].movePPCur[ctx->trainerAIData.moveSlot];
}

void AICmd_IfCanUseLastResort(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);
    int numKnownMoves = GetBattlerLearnedMoveCount(battleSystem, ctx, battler);

    if (ctx->battleMons[battler].moveEffectData.lastResortCount >= (numKnownMoves - 1) && numKnownMoves > 1) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_LoadCurrentMoveCategory(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].category;
}

void AICmd_LoadDefenderLastUsedMoveCategory(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->moveNoBattlerPrev[ctx->trainerAIData.defender]].category;
}

void AICmd_LoadBattlerSpeedOrderPosition(BattleSystem *battleSystem, BattleContext *ctx) {
    // Must declare C89-style to match
    int i, j;
    int speedOrder[4];
    int cmp1, cmp2;
    int maxBattlers;
    int battler;
    int inBattler;

    AIScript_IncrementCursor(ctx, 1);

    inBattler = AIScript_Read(ctx);
    battler = AIScript_Battler(ctx, inBattler);
    maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);

    for (i = 0; i < maxBattlers; i++) {
        speedOrder[i] = i;
    }

    for (i = 0; i < maxBattlers - 1; i++) {
        for (j = i + 1; j < maxBattlers; j++) {
            cmp1 = speedOrder[i];
            cmp2 = speedOrder[j];

            if (CheckSortSpeed(battleSystem, ctx, cmp1, cmp2, TRUE)) {
                speedOrder[i] = cmp2;
                speedOrder[j] = cmp1;
            }
        }
    }

    for (i = 0; i < maxBattlers; i++) {
        if (speedOrder[i] == battler) {
            ctx->trainerAIData.calcTemp = i;
            break;
        }
    }
}

void AICmd_LoadBattlerTurnCount(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->totalTurns - ctx->battleMons[battler].moveEffectData.fakeOutCount;
}

void AICmd_IfPartyMemberDealsMoreDamage(BattleSystem *battleSystem, BattleContext *ctx) {
    // Declare C89-style to match
    int i, j;
    BOOL varyDamage;
    int jump;
    int battler;
    s32 activeMonDamage;
    s32 partyMonDamage;
    s32 allDamageVals[MAX_MON_MOVES];
    u16 partyMonMoves[MAX_MON_MOVES];
    u8 ivs[NUM_STATS];
    Pokemon *partyMon;

    AIScript_IncrementCursor(ctx, 1);

    varyDamage = AIScript_Read(ctx);
    jump = AIScript_Read(ctx);
    battler = ctx->trainerAIData.attacker;

    for (i = 0; i < NUM_STATS; i++) {
        ivs[i] = GetBattlerVar(ctx, battler, BMON_DATA_HP_IV + i, NULL);
    }

    activeMonDamage = TrainerAI_CalcAllDamage(battleSystem,
        ctx,
        ctx->trainerAIData.attacker,
        ctx->battleMons[battler].moves,
        allDamageVals,
        ctx->battleMons[battler].item,
        ivs,
        GetBattlerAbility(ctx, battler),
        ctx->battleMons[battler].moveEffectData.embargoTurns,
        varyDamage);

    for (i = 0; i < BattleSystem_GetPartySize(battleSystem, battler); i++) {
        if (i != ctx->selectedMonIndex[battler]) {
            partyMon = BattleSystem_GetPartyMon(battleSystem, battler, i);

            if (GetMonData(partyMon, MON_DATA_HP, NULL) != 0
                && GetMonData(partyMon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
                && GetMonData(partyMon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    partyMonMoves[j] = GetMonData(partyMon, MON_DATA_MOVE1 + j, NULL);
                }

                for (j = 0; j < NUM_STATS; j++) {
                    ivs[j] = GetMonData(partyMon, MON_DATA_HP_IV + j, NULL);
                }

                partyMonDamage = TrainerAI_CalcAllDamage(battleSystem,
                    ctx,
                    ctx->trainerAIData.attacker,
                    partyMonMoves,
                    allDamageVals,
                    GetMonData(partyMon, MON_DATA_HELD_ITEM, NULL),
                    ivs,
                    GetMonData(partyMon, MON_DATA_ABILITY, NULL),
                    FALSE,
                    varyDamage);

                if (partyMonDamage > activeMonDamage) {
                    AIScript_IncrementCursor(ctx, jump);
                    break;
                }
            }
        }
    }
}

void AICmd_IfHasSuperEffectiveMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int jump = AIScript_Read(ctx);

    if (AI_HasSuperEffectiveMove(battleSystem, ctx, ctx->trainerAIData.attacker, TRUE) == TRUE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfBattlerDealsMoreDamage(BattleSystem *battleSystem, BattleContext *ctx) {
    int i;
    int inBattler;
    BOOL varyDamage;
    int jump;
    int battler;
    int roll;
    s32 aiDamage;
    s32 battlerDamage;
    s32 damageVals[MAX_MON_MOVES];
    u8 ivs[NUM_STATS];

    AIScript_IncrementCursor(ctx, 1);

    inBattler = AIScript_Read(ctx);
    varyDamage = AIScript_Read(ctx);
    jump = AIScript_Read(ctx);

    for (i = 0; i < NUM_STATS; i++) {
        ivs[i] = GetBattlerVar(ctx, ctx->trainerAIData.attacker, BMON_DATA_HP_IV + i, NULL);
    }

    aiDamage = TrainerAI_CalcAllDamage(battleSystem,
        ctx,
        ctx->trainerAIData.attacker,
        ctx->battleMons[ctx->trainerAIData.attacker].moves,
        damageVals,
        ctx->battleMons[ctx->trainerAIData.attacker].item,
        ivs,
        GetBattlerAbility(ctx, ctx->trainerAIData.attacker),
        ctx->battleMons[ctx->trainerAIData.attacker].moveEffectData.embargoTurns,
        varyDamage);
    battler = AIScript_Battler(ctx, inBattler);

    if (varyDamage == TRUE) {
        roll = ctx->trainerAIData.moveDamageRolls[ctx->trainerAIData.moveSlot];
    } else {
        roll = 100;
    }

    battlerDamage = TrainerAI_CalcDamage(battleSystem,
        ctx,
        ctx->moveNoBattlerPrev[battler],
        ctx->battleMons[battler].item,
        ivs,
        battler,
        GetBattlerAbility(ctx, battler),
        ctx->battleMons[battler].moveEffectData.embargoTurns,
        roll);

    if (battlerDamage > aiDamage) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_SumPositiveStatStages(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = 0;

    for (int stat = STAT_HP; stat < NUM_BATTLE_STATS; stat++) {
        if (ctx->battleMons[battler].statChanges[stat] > 6) {
            ctx->trainerAIData.calcTemp += ctx->battleMons[battler].statChanges[stat] - 6;
        }
    }
}

void AICmd_DiffStatStages(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->battleMons[battler].statChanges[stat] - ctx->battleMons[ctx->trainerAIData.attacker].statChanges[stat];
}

void AICmd_IfBattlerHasHigherStat(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    int aiStat, battlerStat;
    TrainerAI_GetStats(ctx, battler, &aiStat, &battlerStat, stat);

    if (aiStat < battlerStat) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfBattlerHasLowerStat(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    int aiStat, battlerStat;
    TrainerAI_GetStats(ctx, battler, &aiStat, &battlerStat, stat);

    if (aiStat > battlerStat) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfBattlerHasEqualStat(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int stat = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    int battler = AIScript_Battler(ctx, inBattler);

    int aiStat, battlerStat;
    TrainerAI_GetStats(ctx, battler, &aiStat, &battlerStat, stat);

    if (aiStat == battlerStat) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

/**
 * @brief Get the values for a given stat for the AI battler and another given battler.
 *
 * @param ctx
 * @param battler   The other battler whose stats will be retrieved.
 * @param buf1      Buffer to hold the stat-value for the AI battler.
 * @param buf2      Buffer to hold the stat-value for the given other battler.
 * @param stat      Which stat value to load.
 */
static void TrainerAI_GetStats(BattleContext *ctx, int battler, int *buf1, int *buf2, int stat) {
    switch (stat) {
    case STAT_HP:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].hp;
        *buf2 = ctx->battleMons[battler].hp;
        break;

    case STAT_ATK:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].atk;
        *buf2 = ctx->battleMons[battler].atk;
        break;

    case STAT_DEF:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].def;
        *buf2 = ctx->battleMons[battler].def;
        break;

    case STAT_SPATK:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].spAtk;
        *buf2 = ctx->battleMons[battler].spAtk;
        break;

    case STAT_SPDEF:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].spDef;
        *buf2 = ctx->battleMons[battler].spDef;
        break;

    case STAT_SPEED:
        *buf1 = ctx->battleMons[ctx->trainerAIData.attacker].speed;
        *buf2 = ctx->battleMons[battler].speed;
        break;

    default:
        GF_ASSERT(FALSE);
        break;
    }
}

void AICmd_CheckIfHighestDamageWithPartner(BattleSystem *battleSystem, BattleContext *ctx) {
    int i = 0, j, k;
    s32 moveDamage;
    s32 damageVals[MAX_MON_MOVES];
    BOOL varyDamage;
    u8 ivs[NUM_STATS];
    int battler;

    AIScript_IncrementCursor(ctx, 1);
    varyDamage = AIScript_Read(ctx);

    j = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sNoDamageCalcMoveEffects[j]) {
            break;
        }
        j++;
    } while (sNoDamageCalcMoveEffects[j] != 0xFFFF);

    k = 0;
    do {
        if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == sAltPowerMoveEffects[k]) {
            break;
        }
        k++;
    } while (sAltPowerMoveEffects[k] != 0xFFFF);

    if (sAltPowerMoveEffects[k] != 0xFFFF
        || (ctx->trainerAIData.moveData[ctx->trainerAIData.move].power > 1 && sNoDamageCalcMoveEffects[j] == 0xFFFF)) {
        battler = ctx->trainerAIData.attacker;

        for (j = 0; j < MAX_BATTLERS_PER_SIDE; j++) {
            for (i = STAT_HP; i < NUM_STATS; i++) {
                ivs[i] = GetBattlerVar(ctx, battler, BMON_DATA_HP_IV + i, NULL);
            }

            TrainerAI_CalcAllDamage(battleSystem,
                ctx,
                battler,
                ctx->battleMons[battler].moves,
                damageVals,
                ctx->battleMons[battler].item,
                ivs,
                GetBattlerAbility(ctx, battler),
                ctx->battleMons[battler].moveEffectData.embargoTurns,
                varyDamage);

            // Update to the partner for the next iteration
            battler = BattleSystem_GetBattlerIdPartner(battleSystem, ctx->trainerAIData.attacker);

            if (j == 0) {
                moveDamage = damageVals[ctx->trainerAIData.moveSlot];
            }

            for (i = 0; i < MAX_MON_MOVES; i++) {
                if (damageVals[i] > moveDamage) {
                    break;
                }
            }

            if (i == MAX_MON_MOVES) {
                ctx->trainerAIData.calcTemp = AI_MOVE_IS_HIGHEST_DAMAGE;
            } else {
                ctx->trainerAIData.calcTemp = AI_NOT_HIGHEST_DAMAGE;
                break;
            }
        }
    } else {
        ctx->trainerAIData.calcTemp = AI_NO_COMPARISON_MADE;
    }
}

void AICmd_IfBattlerFainted(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    GF_ASSERT(inBattler != AI_BATTLER_ATTACKER);
    GF_ASSERT(inBattler != AI_BATTLER_DEFENDER);

    int battler = AIScript_Battler(ctx, inBattler);
    if (ctx->switchInFlag & MaskOfFlagNo(battler)) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfBattlerNotFainted(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    GF_ASSERT(inBattler != AI_BATTLER_ATTACKER);
    GF_ASSERT(inBattler != AI_BATTLER_DEFENDER);

    int battler = AIScript_Battler(ctx, inBattler);
    if ((ctx->switchInFlag & MaskOfFlagNo(battler)) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_LoadGender(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->battleMons[battler].gender;
}

void AICmd_LoadIsFirstTurnInBattle(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].moveEffectData.fakeOutCount < ctx->totalTurns) {
        ctx->trainerAIData.calcTemp = FALSE;
    } else {
        ctx->trainerAIData.calcTemp = TRUE;
    }
}

void AICmd_LoadStockpileCount(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->battleMons[battler].moveEffectData.stockpileCount;
}

void AICmd_LoadBattleType(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = battleSystem->battleType;
}

void AICmd_LoadRecycleItem(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->recycleItem[battler];
}

void AICmd_LoadTypeOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.calcTemp].type;
}

void AICmd_LoadPowerOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.calcTemp].power;
}

void AICmd_LoadEffectOfLoadedMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.calcTemp].effect;
}

void AICmd_LoadProtectSuccessChain(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->moveNoProtect[battler] != MOVE_PROTECT
        && ctx->moveNoProtect[battler] != MOVE_DETECT
        && ctx->moveNoProtect[battler] != MOVE_ENDURE) {
        ctx->trainerAIData.calcTemp = 0;
    } else {
        ctx->trainerAIData.calcTemp = ctx->battleMons[battler].moveEffectData.protectSuccessTurns;
    }
}

void AICmd_PushAndGoTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);
    AIScript_PushCursor(battleSystem, ctx, jump);
}

void AICmd_GoTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);
    AIScript_IncrementCursor(ctx, jump);
}

void AICmd_PopOrEnd(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    if (AIScript_PopCursor(battleSystem, ctx) == TRUE) {
        return;
    }

    ctx->trainerAIData.stateFlags |= AI_STATUS_FLAG_DONE;
}

void AICmd_IfLevel(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int op = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    switch (op) {
    case CHECK_LEVEL_HIGHER_THAN_TARGET:
        if (ctx->battleMons[ctx->trainerAIData.attacker].level > ctx->battleMons[ctx->trainerAIData.defender].level) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case CHECK_LEVEL_LOWER_THAN_TARGET:
        if (ctx->battleMons[ctx->trainerAIData.attacker].level < ctx->battleMons[ctx->trainerAIData.defender].level) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    case CHECK_LEVEL_EQUAL_TO_TARGET:
        if (ctx->battleMons[ctx->trainerAIData.attacker].level == ctx->battleMons[ctx->trainerAIData.defender].level) {
            AIScript_IncrementCursor(ctx, jump);
        }
        break;

    default:
        break;
    }
}

void AICmd_IfTargetIsTaunted(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);

    if (ctx->battleMons[ctx->trainerAIData.defender].moveEffectData.tauntTurns) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfTargetIsNotTaunted(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    int jump = AIScript_Read(ctx);

    if (ctx->battleMons[ctx->trainerAIData.defender].moveEffectData.tauntTurns == 0) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfTargetIsPartner(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int jump = AIScript_Read(ctx);

    if ((ctx->trainerAIData.attacker & 1) == (ctx->trainerAIData.defender & 1)) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfActivatedFlashFire(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->battleMons[battler].moveEffectData.flashFire) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_LoadAbility(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = GetBattlerAbility(ctx, battler);
}

/**
 * @brief Push an address for the AI script onto the cursor stack.
 *
 * @param battleSystem
 * @param ctx
 * @param offset    Distance to jump ahead after pushing the cursor.
 */
static void AIScript_PushCursor(BattleSystem *battleSystem, BattleContext *ctx, int offset) {
    ctx->trainerAIData.scriptStackPointer[ctx->trainerAIData.scriptStackSize++] = ctx->aiScriptCursor;
    AIScript_IncrementCursor(ctx, offset);

    GF_ASSERT(ctx->trainerAIData.scriptStackSize <= AI_MAX_STACK_SIZE);
}

/**
 * @brief Pop the top element of the cursor stack into the cursor.
 *
 * @param battleSystem
 * @param ctx
 * @return TRUE if the cursor stack had an element to be popped; FALSE
 * if it was empty.
 */
static BOOL AIScript_PopCursor(BattleSystem *battleSystem, BattleContext *ctx) {
    if (ctx->trainerAIData.scriptStackSize) {
        ctx->trainerAIData.scriptStackSize--;
        ctx->aiScriptCursor = ctx->trainerAIData.scriptStackPointer[ctx->trainerAIData.scriptStackSize];
        return TRUE;
    }

    return FALSE;
}

/**
 * @brief Record the last move used by an active battler, if it is not
 * already known.
 *
 * @param battleSystem
 * @param ctx
 */
static void TrainerAI_RecordLastMove(BattleSystem *battleSystem, BattleContext *ctx) {
    for (int i = 0; i < MAX_MON_MOVES; i++) {
        if (ctx->trainerAIData.moves[ctx->trainerAIData.defender][i] == ctx->moveNoBattlerPrev[ctx->trainerAIData.defender]) {
            break;
        }

        if (ctx->trainerAIData.moves[ctx->trainerAIData.defender][i] == MOVE_NONE) {
            ctx->trainerAIData.moves[ctx->trainerAIData.defender][i] = ctx->moveNoBattlerPrev[ctx->trainerAIData.defender];
            break;
        }
    }
}

/**
 * @brief Read a word from the AI script at the current cursor position,
 * then increment the cursor.
 *
 * @param ctx
 * @return Current word for the AI script under the cursor.
 */
static int AIScript_Read(BattleContext *ctx) {
    int word = ctx->aiScriptTemp[ctx->aiScriptCursor];
    ctx->aiScriptCursor++;

    return word;
}

/**
 * @brief Read a word from the AI script at the current cursor position
 * offset by a specified value, then increment the cursor.
 *
 * @param ctx
 * @return Current word for the AI script under the cursor + an offset.
 */
static int AIScript_ReadOffset(BattleContext *ctx, int offset) {
    return ctx->aiScriptTemp[ctx->aiScriptCursor + offset];
}

/**
 * @brief Increment the cursor for the AI script by a fixed amount.
 *
 * @param ctx
 * @param i         Amount by which to increment the script cursor.
 */
static void AIScript_IncrementCursor(BattleContext *ctx, int i) {
    ctx->aiScriptCursor += i;
}

/**
 * @brief Determine the true battler ID for an input battler value as
 * recognized by the AI script.
 *
 * @param ctx
 * @param inBattler The input battler value.
 * @return True battler ID for the input battler value.
 */
static u8 AIScript_Battler(BattleContext *ctx, u8 inBattler) {
    // The order of this switch statement must be maintained to match.
    switch (inBattler) {
    case AI_BATTLER_ATTACKER:
        return ctx->trainerAIData.attacker;

    case AI_BATTLER_DEFENDER:
    default:
        return ctx->trainerAIData.defender;

    case AI_BATTLER_ATTACKER_PARTNER:
        return ctx->trainerAIData.attacker ^ 2;

    case AI_BATTLER_DEFENDER_PARTNER:
        return ctx->trainerAIData.defender ^ 2;
    }
}

/**
 * @brief Calculate the damage that will be done by all of an attacker's moves.
 *
 * @param battleSystem
 * @param ctx
 * @param attacker      The attacker's battler ID.
 * @param moves         The attacker's moveset.
 * @param damageVals    Out-param for all damage values as computed by the routine.
 * @param heldItem      The attacker's held item.
 * @param ivs           The attacker's IVs. Used for calculating Hidden Power params.
 * @param ability       The attacker's ability.
 * @param embargoTurns  Number of turns that the attacker is still under Embargo.
 * @param varyDamage    If TRUE, apply random damage variance to each calculation.
 * @return              The highest damage value among all considered moves.
 */
static s32 TrainerAI_CalcAllDamage(BattleSystem *battleSystem, BattleContext *ctx, int attacker, u16 *moves, s32 *damageVals, u16 heldItem, u8 *ivs, int ability, int embargoTurns, BOOL varyDamage) {
    int i;
    s32 maxDamage;
    u8 damageRoll;

    maxDamage = 0;

    // Step 1: Compute the true damage of a given move.
    for (i = 0; i < MAX_MON_MOVES; i++) {
        int noDamageCalcIndex = 0;
        do {
            if (ctx->trainerAIData.moveData[moves[i]].effect == sNoDamageCalcMoveEffects[noDamageCalcIndex]) {
                break;
            }
            noDamageCalcIndex++;
        } while (sNoDamageCalcMoveEffects[noDamageCalcIndex] != 0xFFFF);

        int altPowerIndex = 0;
        do {
            if (ctx->trainerAIData.moveData[moves[i]].effect == sAltPowerMoveEffects[altPowerIndex]) {
                break;
            }
            altPowerIndex++;
        } while (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF);

        if (sAltPowerMoveEffects[altPowerIndex] != 0xFFFF
            || (moves[i] != MOVE_NONE && sNoDamageCalcMoveEffects[noDamageCalcIndex] == 0xFFFF && ctx->trainerAIData.moveData[moves[i]].power > 1)) {
            if (varyDamage == TRUE) {
                damageRoll = ctx->trainerAIData.moveDamageRolls[i];
            } else {
                damageRoll = 100;
            }

            damageVals[i] = TrainerAI_CalcDamage(battleSystem, ctx, moves[i], heldItem, ivs, attacker, ability, embargoTurns, damageRoll);
        } else {
            damageVals[i] = 0;
        }
    }

    // Step 2: Determine the maximum-damage of all moves.
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (maxDamage < damageVals[i]) {
            maxDamage = damageVals[i];
        }
    }

    return maxDamage;
}

enum WeightToPowerFields {
    WEIGHT_TO_POWER_WEIGHT,
    WEIGHT_TO_POWER_POWER,
    WEIGHT_TO_POWER_FIELDS
};

extern const u16 sWeightToPower[][WEIGHT_TO_POWER_FIELDS]; /*= {
    { 100, 20 },
    { 250, 40 },
    { 500, 60 },
    { 1000, 80 },
    { 2000, 100 },
    { 0xFFFF, 0xFFFF },
};*/

/**
 * @brief Damage calculation routine visible to the AI.
 *
 * @param battleSystem
 * @param ctx
 * @param move          The move being used
 * @param heldItem      The attacker's held item.
 * @param ivs           The attacker's IVs. Used for Hidden Power calculation.
 * @param attacker      The attacker's ID.
 * @param ability       The attacker's ability.
 * @param embargoTurns  Number of turns that the attacker is still under Embargo.
 * @param variance      Variance factor applied to the damage value. This is presumed
 *                      to be a value in the range [85..100].
 * @return Calculated damage value.
 */
static s32 TrainerAI_CalcDamage(BattleSystem *battleSystem, BattleContext *ctx, u16 move, u16 heldItem, u8 *ivs, int attacker, int ability, int embargoTurns, u8 variance)
{
    // must declare C89-style to match
    int defendingSide;
    int power;
    int type;
    u32 effectivenessFlags;
    s32 damage;

    defendingSide = BattleSystem_GetBattlerSide(battleSystem, ctx->trainerAIData.defender);
    damage = 0;
    power = 0;
    type = 0;
    effectivenessFlags = 0;

    switch (move) {
    case MOVE_NATURAL_GIFT:
        if (ability != ABILITY_KLUTZ && embargoTurns == 0) {
            power = GetItemVar(ctx, heldItem, ITEMATTR_NATURAL_GIFT_POWER);

            if (power) {
                type = GetItemVar(ctx, heldItem, ITEMATTR_NATURAL_GIFT_TYPE);
            } else {
                type = TYPE_NORMAL;
            }
        }
        break;

    case MOVE_JUDGMENT:
        if (ability != ABILITY_KLUTZ && embargoTurns == 0) {
            power = 0;

            switch (GetItemVar(ctx, heldItem, ITEMATTR_HOLD_EFFECT)) {
            case HOLD_EFFECT_ARCEUS_FIGHTING:
                type = TYPE_FIGHTING;
                break;

            case HOLD_EFFECT_ARCEUS_FLYING:
                type = TYPE_FLYING;
                break;

            case HOLD_EFFECT_ARCEUS_POISON:
                type = TYPE_POISON;
                break;

            case HOLD_EFFECT_ARCEUS_GROUND:
                type = TYPE_GROUND;
                break;

            case HOLD_EFFECT_ARCEUS_ROCK:
                type = TYPE_ROCK;
                break;

            case HOLD_EFFECT_ARCEUS_BUG:
                type = TYPE_BUG;
                break;

            case HOLD_EFFECT_ARCEUS_GHOST:
                type = TYPE_GHOST;
                break;

            case HOLD_EFFECT_ARCEUS_STEEL:
                type = TYPE_STEEL;
                break;

            case HOLD_EFFECT_ARCEUS_FIRE:
                type = TYPE_FIRE;
                break;

            case HOLD_EFFECT_ARCEUS_WATER:
                type = TYPE_WATER;
                break;

            case HOLD_EFFECT_ARCEUS_GRASS:
                type = TYPE_GRASS;
                break;

            case HOLD_EFFECT_ARCEUS_ELECTRIC:
                type = TYPE_ELECTRIC;
                break;

            case HOLD_EFFECT_ARCEUS_PSYCHIC:
                type = TYPE_PSYCHIC;
                break;

            case HOLD_EFFECT_ARCEUS_ICE:
                type = TYPE_ICE;
                break;

            case HOLD_EFFECT_ARCEUS_DRAGON:
                type = TYPE_DRAGON;
                break;

            case HOLD_EFFECT_ARCEUS_DARK:
                type = TYPE_DARK;
                break;

            default:
                type = TYPE_NORMAL;
                break;
            }
        }
        break;

    case MOVE_HIDDEN_POWER:
        power = ((ivs[STAT_HP] & 2) >> 1)
            | ((ivs[STAT_ATK] & 2) >> 0)
            | ((ivs[STAT_DEF] & 2) << 1)
            | ((ivs[STAT_SPEED] & 2) << 2)
            | ((ivs[STAT_SPATK] & 2) << 3)
            | ((ivs[STAT_SPDEF] & 2) << 4);
        type = ((ivs[STAT_HP] & 1) >> 0)
            | ((ivs[STAT_ATK] & 1) << 1)
            | ((ivs[STAT_DEF] & 1) << 2)
            | ((ivs[STAT_SPEED] & 1) << 3)
            | ((ivs[STAT_SPATK] & 1) << 4)
            | ((ivs[STAT_SPDEF] & 1) << 5);

        power = power * 40 / 63 + 30;
        type = (type * 15 / 63) + 1;

        if (type >= TYPE_MYSTERY) {
            type++;
        }
        break;

    case MOVE_GYRO_BALL:
        power = 1 + 25 * ctx->effectiveSpeed[ctx->trainerAIData.defender] / ctx->effectiveSpeed[attacker];

        if (power > 150) {
            power = 150;
        }

        type = TYPE_NORMAL; // Default to the base move type.
        break;

    case MOVE_DRAGON_RAGE:
        damage = 40;
        break;

    case MOVE_SEISMIC_TOSS:
    case MOVE_NIGHT_SHADE:
        damage = ctx->battleMons[attacker].level;
        break;

    case MOVE_PSYWAVE:
        damage = ctx->battleMons[attacker].level * (BattleSystem_Random(battleSystem) % 11 + 5) / 10;
        break;

    case MOVE_RETURN:
        power = ctx->battleMons[attacker].friendship * 10 / 25;
        type = TYPE_NORMAL;
        break;

    case MOVE_FRUSTRATION:
        power = (255 - ctx->battleMons[attacker].friendship) * 10 / 25;
        type = TYPE_NORMAL;
        break;

    case MOVE_MAGNITUDE:
        // Simulate a Magnitude roll.
        power = BattleSystem_Random(battleSystem) % 100;

        if (power < 5) {
            power = 10;
        } else if (power < 15) {
            power = 30;
        } else if (power < 35) {
            power = 50;
        } else if (power < 65) {
            power = 70;
        } else if (power < 85) {
            power = 90;
        } else if (power < 95) {
            power = 110;
        } else {
            power = 150;
        }

        type = TYPE_NORMAL;
        break;

    case MOVE_SONIC_BOOM:
        damage = 20;
        break;

    case MOVE_LOW_KICK:
    case MOVE_GRASS_KNOT: {
        int i = 0;
        do {
            if (sWeightToPower[i][WEIGHT_TO_POWER_WEIGHT] >= ctx->battleMons[ctx->trainerAIData.defender].weight) {
                break;
            }
            i++;
        } while (sWeightToPower[i][WEIGHT_TO_POWER_WEIGHT] != 0xFFFF);

        if (sWeightToPower[i][WEIGHT_TO_POWER_WEIGHT] != 0xFFFF) {
            power = sWeightToPower[i][WEIGHT_TO_POWER_POWER];
        } else {
            power = 120;
        }

        break;
    }

    default:
        // Move has no special calculation logic; default to the basic calc.
        power = 0;
        type = TYPE_NORMAL;
        break;
    }

    if (damage == 0) {
        damage = CalcMoveDamage(battleSystem, // BattleSystem_CalcMoveDamage in pokeplatinum.
            ctx,
            move,
            ctx->fieldSideConditionFlags[defendingSide],
            ctx->fieldCondition,
            power,
            type,
            attacker,
            ctx->trainerAIData.defender,
            1);
    } else {
        ctx->battleStatus |= BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS;
    }

    damage = BattleSystem_ApplyTypeChart(battleSystem,
        ctx,
        move,
        type,
        attacker,
        ctx->trainerAIData.defender,
        damage,
        &effectivenessFlags);
    ctx->battleStatus &= ~BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS;

    if (effectivenessFlags & MOVE_STATUS_IMMUNE) {
        damage = 0;
    } else {
        damage = DamageDivide(damage * variance, 100); // BattleSystem_Divide in pokeplatinum.
    }

    return damage;
}

/**
 * @brief Compute the type of a move. Variable-type moves will have their type
 * computed according to the usual routines (i.e., Natural Gift, Judgment,
 * Hidden Power, and Weather Ball). Moves without a variable typing will be
 * returned as TYPE_NORMAL.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The battler using the move.
 * @param move      The move being used.
 * @return The type of the move.
 */
static int TrainerAI_MoveType(BattleSystem *battleSystem, BattleContext *ctx, int battler, int move) {
    int result;

    switch (move) {
    case MOVE_NATURAL_GIFT:
        result = GetNaturalGiftType(ctx, battler);
        break;

    case MOVE_JUDGMENT:
        switch (GetBattlerHeldItemEffect(ctx, battler)) {
        case HOLD_EFFECT_ARCEUS_FIGHTING:
            result = TYPE_FIGHTING;
            break;

        case HOLD_EFFECT_ARCEUS_FLYING:
            result = TYPE_FLYING;
            break;

        case HOLD_EFFECT_ARCEUS_POISON:
            result = TYPE_POISON;
            break;

        case HOLD_EFFECT_ARCEUS_GROUND:
            result = TYPE_GROUND;
            break;

        case HOLD_EFFECT_ARCEUS_ROCK:
            result = TYPE_ROCK;
            break;

        case HOLD_EFFECT_ARCEUS_BUG:
            result = TYPE_BUG;
            break;

        case HOLD_EFFECT_ARCEUS_GHOST:
            result = TYPE_GHOST;
            break;

        case HOLD_EFFECT_ARCEUS_STEEL:
            result = TYPE_STEEL;
            break;

        case HOLD_EFFECT_ARCEUS_FIRE:
            result = TYPE_FIRE;
            break;

        case HOLD_EFFECT_ARCEUS_WATER:
            result = TYPE_WATER;
            break;

        case HOLD_EFFECT_ARCEUS_GRASS:
            result = TYPE_GRASS;
            break;

        case HOLD_EFFECT_ARCEUS_ELECTRIC:
            result = TYPE_ELECTRIC;
            break;

        case HOLD_EFFECT_ARCEUS_PSYCHIC:
            result = TYPE_PSYCHIC;
            break;

        case HOLD_EFFECT_ARCEUS_ICE:
            result = TYPE_ICE;
            break;

        case HOLD_EFFECT_ARCEUS_DRAGON:
            result = TYPE_DRAGON;
            break;

        case HOLD_EFFECT_ARCEUS_DARK:
            result = TYPE_DARK;
            break;

        default:
            result = TYPE_NORMAL;
            break;
        }
        break;

    case MOVE_HIDDEN_POWER:
        result = ((ctx->battleMons[battler].hpIV & 1) >> 0)
            | ((ctx->battleMons[battler].atkIV & 1) << 1)
            | ((ctx->battleMons[battler].defIV & 1) << 2)
            | ((ctx->battleMons[battler].speedIV & 1) << 3)
            | ((ctx->battleMons[battler].spAtkIV & 1) << 4)
            | ((ctx->battleMons[battler].spDefIV & 1) << 5);
        result = (result * 15 / 63) + 1;

        if (result >= TYPE_MYSTERY) {
            result++;
        }
        break;

    case MOVE_WEATHER_BALL:
        if (CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == FALSE
        && CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == FALSE
        && (ctx->fieldCondition & FIELD_CONDITION_WEATHER)) {
            if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
                result = TYPE_WATER;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
                result = TYPE_ROCK;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
                result = TYPE_FIRE;
            }

            if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
                result = TYPE_ICE;
            }
        }
        break;

    default:
        result = TYPE_NORMAL;
        break;
    }

    return result;
}

/**
 * @brief Check if Perish Song is active on a battler and the battler should
 * faint at the end of the turn. If so, treat the next switch as post-KO switch
 * AI.
 *
 * This routine is bugged; it functionally does nothing. The Perish Song turn
 * count decrements at the end of the turn, so the AI never sees that it WILL
 * die to Perish Song.
 *
 * @param ctx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
static BOOL AI_PerishSongKO(BattleContext *ctx, int battler) {
    if ((ctx->battleMons[battler].moveEffectFlags & MOVE_EFFECT_FLAG_PERISH_SONG)
        && ctx->battleMons[battler].moveEffectData.perishSongTurns == 0) {
        ctx->aiSwitchedPartySlot[battler] = 6;
        return TRUE;
    }

    return FALSE;
}

/**
 * @brief Check if an AI's battler cannot damage the opponent's Pokemon due to
 * Wonder Guard. If so, check for any living party member that can deal damage
 * to that Pokemon, and switch to that mon 66% of the time.
 *
 * This routine does NOT apply to double-battles.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
static BOOL AI_CannotDamageWonderGuard(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i, j;
    u16 move;
    int moveType;
    u32 effectiveness;
    Pokemon *mon;

    if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) {
        return FALSE;
    }

    if (ctx->battleMons[battler ^ 1].ability == ABILITY_WONDER_GUARD) { // battler ^ 1 is BATTLER_OPP(battler) in pokeplatinum.
        // Check if we have a super-effective move against the opponent.
        for (i = 0; i < MAX_MON_MOVES; i++) {
            move = ctx->battleMons[battler].moves[i];
            moveType = TrainerAI_MoveType(battleSystem, ctx, battler, move);

            if (move) {
                effectiveness = 0;
                BattleSystem_ApplyTypeChart(battleSystem, ctx, move, moveType, battler, battler ^ 1, 0, &effectiveness);

                if (effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) {
                    return FALSE;
                }
            }
        }

        // If we don't, check if any of our party members have a super-effective move
        for (i = 0; i < BattleSystem_GetPartySize(battleSystem, battler); i++) {
            mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

            if (GetMonData(mon, MON_DATA_HP, NULL) != 0
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
                && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
                && i != ctx->selectedMonIndex[battler]) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL);
                    moveType = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                    if (move) {
                        effectiveness = 0;
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            moveType,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, battler ^ 1),
                            GetBattlerHeldItemEffect(ctx, battler ^ 1),
                            GetBattlerVar(ctx, battler ^ 1, BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, battler ^ 1, BMON_DATA_TYPE_2, NULL),
                            &effectiveness);

                        // If this party member has a super-effective move, switch 2/3 of the time.
                        if ((effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) && BattleSystem_Random(battleSystem) % 3 < 2) {
                            ctx->aiSwitchedPartySlot[battler] = i;
                            return TRUE;
                        }
                    }
                }
            }
        }
    }

    return FALSE;
}

/**
 * @brief Check if an AI's battler only has moves which do not deal damage to either
 * of the opponent's Pokemon.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
static BOOL AI_OnlyIneffectiveMoves(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i, j;
    u8 defender1, defender2;
    u8 aiSlot1, aiSlot2;
    u16 move;
    int type;
    u32 effectiveness;
    int start, end;
    int numMoves;
    Pokemon *mon;

    // "Player" consts here refer to the AI's perspective.
    if (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) {
        defender1 = BATTLER_PLAYER;
        defender2 = BATTLER_PLAYER2;
    } else {
        defender1 = BATTLER_PLAYER;
        defender2 = BATTLER_PLAYER;
    }

    // Check all of this mon's attacking moves for immunities. If any of our moves can deal damage to
    // either of the opponents' battlers, do not switch.
    numMoves = 0;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        move = ctx->battleMons[battler].moves[i];
        type = TrainerAI_MoveType(battleSystem, ctx, battler, move);

        if (move && ctx->trainerAIData.moveData[move].power) {
            numMoves++;

            effectiveness = 0;
            if (ctx->battleMons[defender1].hp) {
                BattleSystem_ApplyTypeChart(battleSystem, ctx, move, type, battler, defender1, 0, &effectiveness);
            }

            if ((effectiveness & MOVE_STATUS_NO_EFFECT) == FALSE) {
                return FALSE;
            }

            effectiveness = 0;
            if (ctx->battleMons[defender2].hp) {
                BattleSystem_ApplyTypeChart(battleSystem, ctx, move, type, battler, defender2, 0, &effectiveness);
            }

            if ((effectiveness & MOVE_STATUS_NO_EFFECT) == FALSE) {
                return FALSE;
            }
        }
    }

    // If we have more than 1 attacking move, do not switch.
    if (numMoves < 2) {
        return FALSE;
    }

    aiSlot1 = battler;
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) || (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI)) {
        aiSlot2 = aiSlot1;
    } else {
        aiSlot2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
    }

    start = 0;
    end = BattleSystem_GetPartySize(battleSystem, battler);

    // For each of the AI's active party Pokemon on the bench, check if any of them have a
    // damaging move which is super-effective against either of the player's active Pokemon
    // on the battlefield. If any such Pokemon on the bench exists, switch to it 66% of
    // the time.
    for (i = start; i < end; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && i != ctx->selectedMonIndex[aiSlot1]
            && i != ctx->selectedMonIndex[aiSlot2]
            && i != ctx->aiSwitchedPartySlot[aiSlot1]
            && i != ctx->aiSwitchedPartySlot[aiSlot2]) {
            for (j = 0; j < MAX_MON_MOVES; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL);
                type = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                if (move && ctx->trainerAIData.moveData[move].power) {
                    effectiveness = 0;
                    if (ctx->battleMons[defender1].hp) {
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            type,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, defender1),
                            GetBattlerHeldItemEffect(ctx, defender1),
                            GetBattlerVar(ctx, defender1, BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, defender1, BMON_DATA_TYPE_2, NULL),
                            &effectiveness);
                    }

                    if ((effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) && BattleSystem_Random(battleSystem) % 3 < 2) {
                        ctx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }

                    effectiveness = 0;
                    if (ctx->battleMons[defender2].hp) {
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            type,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, defender2),
                            GetBattlerHeldItemEffect(ctx, defender2),
                            GetBattlerVar(ctx, defender2, BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, defender2, BMON_DATA_TYPE_2, NULL),
                            &effectiveness);
                    }

                    if ((effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) && BattleSystem_Random(battleSystem) % 3 < 2) {
                        ctx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }
                }
            }
        }
    }

    // For each of the AI's active party Pokemon on the bench, check if any of them have a
    // damaging move which is normally-effective against either of the player's active
    // Pokemon on the battlefield. If any such Pokemon on the bench exists, switch to it
    // 50% of the time.
    for (i = start; i < end; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && i != ctx->selectedMonIndex[aiSlot1]
            && i != ctx->selectedMonIndex[aiSlot2]
            && i != ctx->aiSwitchedPartySlot[aiSlot1]
            && i != ctx->aiSwitchedPartySlot[aiSlot2]) {
            for (j = 0; j < MAX_MON_MOVES; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL);
                type = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                if (move && ctx->trainerAIData.moveData[move].power) {
                    effectiveness = 0;
                    if (ctx->battleMons[defender1].hp) {
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            type,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, defender1),
                            GetBattlerHeldItemEffect(ctx, defender1),
                            GetBattlerVar(ctx, defender1, BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, defender1, BMON_DATA_TYPE_2, NULL),
                            &effectiveness);
                    }

                    if (effectiveness == 0 && BattleSystem_Random(battleSystem) % 2 == 0) {
                        ctx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }

                    effectiveness = 0;
                    if (ctx->battleMons[defender2].hp) {
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            type,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, defender2),
                            GetBattlerHeldItemEffect(ctx, defender2),
                            GetBattlerVar(ctx, defender2, BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, defender2, BMON_DATA_TYPE_2, NULL),
                            &effectiveness);
                    }

                    if (effectiveness == 0 && BattleSystem_Random(battleSystem) % 2 == 0) {
                        ctx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }
                }
            }
        }
    }

    return FALSE;
}

/**
 * @brief Check if an AI's battler has a super-effective move against either of the
 * opponent's Pokemon.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's battler.
 * @param flag      If TRUE, will always return TRUE if the AI's battler has a super-
 *                  effective move. If FALSE, returns TRUE 90% of the time for either
 *                  target against which the battler has a super-effective move.
 * @return TRUE if the AI's battler has a super-effective move.
 */
static BOOL AI_HasSuperEffectiveMove(BattleSystem *battleSystem, BattleContext *ctx, int battler, BOOL flag) {
    int i;
    u32 effectiveness;
    u8 defender;
    u8 oppositeSlot;
    u16 move;
    int type;

    // Look at the slot directly across from us on the opposite side. i.e.,
    // AI slot 1 looks at player slot 1, AI slot 2 looks at player slot 2.
    oppositeSlot = BattleSystem_GetBattlerType(battleSystem, battler) ^ 1;
    defender = BattleSystem_GetBattlerFromBattlerType(battleSystem, oppositeSlot);

    if ((ctx->switchInFlag & MaskOfFlagNo(defender)) == FALSE) {
        // Check if the player's battler is weak to any of our moves.
        for (i = 0; i < MAX_MON_MOVES; i++) {
            move = ctx->battleMons[battler].moves[i];
            type = TrainerAI_MoveType(battleSystem, ctx, battler, move);

            if (move) {
                effectiveness = 0;
                BattleSystem_ApplyTypeChart(battleSystem, ctx, move, type, battler, defender, 0, &effectiveness);

                // If the defending mon is weak to our move, return TRUE 90-100% of the time.
                if (effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) {
                    if (flag) {
                        return TRUE;
                    } else if (BattleSystem_Random(battleSystem) % 10 != 0) {
                        return TRUE;
                    }
                }
            }
        }
    }

    // Check the defender's partner the same way as above.
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_DOUBLES) == FALSE) {
        return FALSE;
    }
    defender = BattleSystem_GetBattlerIdPartner(battleSystem, defender);

    if ((ctx->switchInFlag & MaskOfFlagNo(defender)) == FALSE) {
        for (i = 0; i < MAX_MON_MOVES; i++) {
            move = ctx->battleMons[battler].moves[i];
            type = TrainerAI_MoveType(battleSystem, ctx, battler, move);

            if (move) {
                effectiveness = 0;
                BattleSystem_ApplyTypeChart(battleSystem, ctx, move, type, battler, defender, 0, &effectiveness);

                // If the defending mon is weak to our move, return TRUE 90-100% of the time.
                if (effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) {
                    if (flag) {
                        return TRUE;
                    } else if (BattleSystem_Random(battleSystem) % 10 != 0) {
                        return TRUE;
                    }
                }
            }
        }
    }

    return FALSE;
}

/**
 * @brief Check if the AI's party has a Pokemon on the bench which has an "absorbing"
 * ability for the move which was last used on it (specifically, Volt Absorb, Water
 * Absorb, and Flash Fire).
 *
 * This routine will skip its checks roughly 33% of the time if the AI's battler has
 * a super-effective move. It will also skip its checks if the AI's active battler
 * is the one with the absorbing ability.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's battler.
 * @return BOOL
 */
static BOOL AI_HasAbsorbAbilityInParty(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i;
    u8 aiSlot1, aiSlot2;
    u8 moveType;
    u8 ability;
    u8 checkAbility;
    int start, end;
    Pokemon *mon;

    // If we have a super-effective move against either opponent, do not switch ~33% of the time.
    if (AI_HasSuperEffectiveMove(battleSystem, ctx, battler, TRUE) && BattleSystem_Random(battleSystem) % 3 != 0) {
        return FALSE;
    }

    // If we have not been hit by a move by this battler, do not switch.
    if (ctx->moveNoHit[battler] == MOVE_NONE) {
        return FALSE;
    }

    // If the last move that hit us does not deal damage, do not switch.
    if (ctx->trainerAIData.moveData[ctx->moveNoHit[battler]].power == 0) {
        return FALSE;
    }

    moveType = ctx->trainerAIData.moveData[ctx->moveNoHit[battler]].type;
    // Oversight: Dry Skin and Motor Drive are not checked.
    if (moveType == TYPE_FIRE) {
        checkAbility = ABILITY_FLASH_FIRE;
    } else if (moveType == TYPE_WATER) {
        checkAbility = ABILITY_WATER_ABSORB;
    } else if (moveType == TYPE_ELECTRIC) {
        checkAbility = ABILITY_VOLT_ABSORB;
    } else {
        return ABILITY_NONE;
    }

    // If our ability absorbs the type of the last move that hit us, do not switch.
    if (GetBattlerAbility(ctx, battler) == checkAbility) {
        return FALSE;
    }

    aiSlot1 = battler;
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) || (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI)) {
        aiSlot2 = aiSlot1;
    } else {
        aiSlot2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
    }

    start = 0;
    end = BattleSystem_GetPartySize(battleSystem, battler);

    // Check each Pokemon on the bench for one which has an ability that absorbs
    // the last move that was used.
    for (i = start; i < end; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && i != ctx->selectedMonIndex[aiSlot1]
            && i != ctx->selectedMonIndex[aiSlot2]
            && i != ctx->aiSwitchedPartySlot[aiSlot1]
            && i != ctx->aiSwitchedPartySlot[aiSlot2]) {
            ability = GetMonData(mon, MON_DATA_ABILITY, NULL);

            // Switch to a matching Pokemon 50% of the time.
            if (checkAbility == ability && (BattleSystem_Random(battleSystem) & 1)) {
                ctx->aiSwitchedPartySlot[battler] = i;
                return TRUE;
            }
        }
    }

    return FALSE;
}

/**
 * @brief Check if the AI has a party member with a super-effective move, constrained
 * to mons with a certain effectiveness matchup against the move that last hit us.
 *
 * @param battleSystem
 * @param ctx
 * @param battler               The AI's battler.
 * @param checkEffectiveness    The desired effectiveness mask against the last move.
 * @param rand                  Random odds to switch, if conditions are met.
 * @return TRUE if the AI should switch, FALSE if not.
 */
static BOOL AI_HasPartyMemberWithSuperEffectiveMove(BattleSystem *battleSystem, BattleContext *ctx, int battler, u32 checkEffectiveness, u8 rand) {
    int i, j;
    u8 aiSlot1, aiSlot2;
    u16 move;
    int moveType;
    u32 effectiveness;
    int start, end;
    Pokemon *mon;

    if (ctx->moveNoHit[battler] == MOVE_NONE || ctx->moveNoHitBattler[battler] == BATTLER_NONE) {
        return FALSE;
    }

    // If the last move that hit us is a status move, do not switch.
    if (ctx->trainerAIData.moveData[ctx->moveNoHit[battler]].power == 0) {
        return FALSE;
    }

    aiSlot1 = battler;
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) || (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI)) {
        aiSlot2 = aiSlot1;
    } else {
        aiSlot2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
    }

    start = 0;
    end = BattleSystem_GetPartySize(battleSystem, battler);

    for (i = start; i < end; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && i != ctx->selectedMonIndex[aiSlot1]
            && i != ctx->selectedMonIndex[aiSlot2]
            && i != ctx->aiSwitchedPartySlot[aiSlot1]
            && i != ctx->aiSwitchedPartySlot[aiSlot2]) {
            effectiveness = 0;
            moveType = TrainerAI_MoveType(battleSystem, ctx, ctx->moveNoHitBattler[battler], ctx->moveNoHit[battler]);

            BattleSystem_CalcEffectiveness(ctx,
                ctx->moveNoHit[battler],
                moveType,
                GetBattlerAbility(ctx, ctx->moveNoHitBattler[battler]),
                GetMonData(mon, MON_DATA_ABILITY, NULL),
                GetItemVar(ctx, GetMonData(mon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_HOLD_EFFECT),
                GetMonData(mon, MON_DATA_TYPE_1, NULL),
                GetMonData(mon, MON_DATA_TYPE_2, NULL),
                &effectiveness);

            if (effectiveness & checkEffectiveness) {
                for (j = 0; j < MAX_MON_MOVES; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL);
                    moveType = Move_CalcVariableDamageType(battleSystem, ctx, mon, move);

                    if (move) {
                        effectiveness = 0;
                        BattleSystem_CalcEffectiveness(ctx,
                            move,
                            moveType,
                            GetMonData(mon, MON_DATA_ABILITY, NULL),
                            GetBattlerAbility(ctx, ctx->moveNoHitBattler[battler]),
                            GetBattlerHeldItemEffect(ctx, ctx->moveNoHitBattler[battler]),
                            GetBattlerVar(ctx, ctx->moveNoHitBattler[battler], BMON_DATA_TYPE_1, NULL),
                            GetBattlerVar(ctx, ctx->moveNoHitBattler[battler], BMON_DATA_TYPE_2, NULL),
                            &effectiveness);

                        if ((effectiveness & MOVE_STATUS_SUPER_EFFECTIVE) && BattleSystem_Random(battleSystem) % rand == 0) {
                            ctx->aiSwitchedPartySlot[battler] = i;
                            return TRUE;
                        }
                    }
                }
            }
        }
    }

    return FALSE;
}

/**
 * @brief Check if the AI's battler is asleep and has Natural Cure + an eligible switch.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's battler.
 * @return TRUE if the AI should switch, FALSE otherwise.
 */
static BOOL AI_IsAsleepWithNaturalCure(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    // Don't switch if we aren't asleep, don't have Natural Cure, or are below 50% HP.
    if ((ctx->battleMons[battler].status & STATUS_SLEEP) == FALSE
        || GetBattlerAbility(ctx, battler) != ABILITY_NATURAL_CURE
        || ctx->battleMons[battler].hp < (ctx->battleMons[battler].maxHp / 2)) {
        return FALSE;
    }

    // Check for the move that last hit you; i.e., don't switch on your first turn.
    // Switch 50% of the time, and use post-KO switch logic.
    if (ctx->moveNoHit[battler] == MOVE_NONE && (BattleSystem_Random(battleSystem) & 1)) {
        ctx->aiSwitchedPartySlot[battler] = 6;
        return TRUE;
    }

    // If the last move that hit you is a status move, switch 50% of the time, following
    // post-KO switch logic.
    if (ctx->trainerAIData.moveData[ctx->moveNoHit[battler]].power == 0 && (BattleSystem_Random(battleSystem) & 1)) {
        ctx->aiSwitchedPartySlot[battler] = 6;
        return TRUE;
    }

    // If we have a party member with an immunity to the last move that also has a super-effective
    // move, switch 50% of the time.
    if (AI_HasPartyMemberWithSuperEffectiveMove(battleSystem, ctx, battler, MOVE_STATUS_NO_EFFECT, 1)) {
        return TRUE;
    }

    // If we have a party member with a resistance to the last move that also has a super-effective
    // move, switch 50% of the time.
    if (AI_HasPartyMemberWithSuperEffectiveMove(battleSystem, ctx, battler, MOVE_STATUS_NOT_VERY_EFFECTIVE, 1)) {
        return TRUE;
    }

    // Randomly switch 50% of the time, following post-KO switch logic.
    if (BattleSystem_Random(battleSystem) & 1) {
        ctx->aiSwitchedPartySlot[battler] = 6;
        return TRUE;
    }

    return FALSE;
}

/**
 * @brief Check if the AI's current battler is heavily stat-boosted (that is,
 * if the sum of its total positive stat stage changes is greater than or
 * equal to 4.)
 *
 * @param battleSystem
 * @param ctx
 * @param battler   The AI's current battler.
 * @return          TRUE if the AI has a high number of positive stat stages;
 *                  FALSE otherwise.
 */
static BOOL AI_IsHeavilyStatBoosted(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int stat;
    u8 numBoosts = 0;

    for (stat = STAT_HP; stat < NUM_BATTLE_STATS; stat++) {
        if (ctx->battleMons[battler].statChanges[stat] > 6) {
            numBoosts += ctx->battleMons[battler].statChanges[stat] - 6;
        }
    }

    return numBoosts >= 4;
}

/**
 * @brief Check if the AI should switch for turn.
 *
 * @param battleSystem
 * @param ctx
 * @param battler   TRUE if the battler
 * @return BOOL
 */
static BOOL TrainerAI_ShouldSwitch(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i;
    int alivePartyMons;
    u8 aiSlot1, aiSlot2;
    int start, end;
    Pokemon *mon;

    // Don't try to make illegal switches.
    // This definition is naiive: the AI does not consider itself immune to Magnet Pull from an ally,
    // Shadow Tag if it also has Shadow Tag, Arena Trap if it is a Flying-type, or always able to switch
    // if it is holding a Shed Shell.
    if ((ctx->battleMons[battler].status2 & STATUS2_TRAPPED)
        || (ctx->battleMons[battler].moveEffectFlags & MOVE_EFFECT_FLAG_INGRAIN)
        || CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_OPPOSING_SIDE, battler, ABILITY_SHADOW_TAG)
        || CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_OPPOSING_SIDE, battler, ABILITY_ARENA_TRAP)
        || (CheckAbilityActive(battleSystem, ctx, CHECK_ABILITY_ALL_NOT_USER, battler, ABILITY_MAGNET_PULL)
        && (GetBattlerVar(ctx, battler, BMON_DATA_TYPE_1, NULL) == TYPE_STEEL || GetBattlerVar(ctx, battler, BMON_DATA_TYPE_2, NULL) == TYPE_STEEL))) {
        return FALSE;
    }

    alivePartyMons = 0;
    aiSlot1 = battler;
    if ((BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_TAG) || (BattleSystem_GetBattleType(battleSystem) & BATTLE_TYPE_MULTI)) {
        aiSlot2 = aiSlot1;
    } else {
        aiSlot2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
    }

    // Check for living party members (obviously, do not try to switch if there are none).
    start = 0;
    end = BattleSystem_GetPartySize(battleSystem, battler);
    for (i = start; i < end; i++) {
        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG
            && i != ctx->selectedMonIndex[aiSlot1]
            && i != ctx->selectedMonIndex[aiSlot2]
            && i != ctx->aiSwitchedPartySlot[aiSlot1]
            && i != ctx->aiSwitchedPartySlot[aiSlot2]) {
            alivePartyMons++;
        }
    }

    if (alivePartyMons) {
        if (AI_PerishSongKO(ctx, battler)) {
            return TRUE;
        }

        if (AI_CannotDamageWonderGuard(battleSystem, ctx, battler)) {
            return TRUE;
        }

        if (AI_OnlyIneffectiveMoves(battleSystem, ctx, battler)) {
            return TRUE;
        }

        if (AI_HasAbsorbAbilityInParty(battleSystem, ctx, battler)) {
            return TRUE;
        }

        if (AI_IsAsleepWithNaturalCure(battleSystem, ctx, battler)) {
            return TRUE;
        }

        // Do not switch if we have a super-effective move.
        // Note that this has a 10% chance of returning FALSE for each of our
        // moves that are super-effective against either opponent.
        if (AI_HasSuperEffectiveMove(battleSystem, ctx, battler, FALSE)) {
            return FALSE;
        }

        // Never switch if the active battler has 4+ positive stat stages.
        if (AI_IsHeavilyStatBoosted(battleSystem, ctx, battler)) {
            return FALSE;
        }

        // 33% of the time, switch to a party member with an immunity to the last move that hit
        // this battler which also has a super-effective move against an opposing Pokemon.
        if (AI_HasPartyMemberWithSuperEffectiveMove(battleSystem, ctx, battler, 0x8, 2)) {
            return TRUE;
        }

        // 25% of the time, switch to a party member with an immunity to the last move that hit
        // this battler which also has a super-effective move against an opposing Pokemon.
        if (AI_HasPartyMemberWithSuperEffectiveMove(battleSystem, ctx, battler, 0x4, 3)) {
            return TRUE;
        }
    }

    return FALSE;
}

int TrainerAI_PickCommand(BattleSystem *battleSystem, int battler) {
    // must declare C89-style to match
    int i;
    u8 battler1, battler2;
    u32 battleType;
    int end;
    Pokemon *mon;
    BattleContext *ctx = battleSystem->ctx;
    battleType = BattleSystem_GetBattleType(battleSystem);

    if ((battleType & BATTLE_TYPE_TRAINER) || BattleSystem_GetBattlerSide(battleSystem, battler) == BATTLER_SIDE_PLAYER) {
        if (TrainerAI_ShouldSwitch(battleSystem, ctx, battler)) {
            // If this is a switch which should use the post-KO switch logic, then do so.
            // If there is no valid battler, pick the first one in party order.
            if (ctx->aiSwitchedPartySlot[battler] == 6) {
                if ((i = BattleAI_PostKOSwitchIn(battleSystem, battler)) == 6) {
                    battler1 = battler;
                    if ((battleType & BATTLE_TYPE_TAG) || (battleType & BATTLE_TYPE_MULTI)) {
                        battler2 = battler1;
                    } else {
                        battler2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
                    }

                    end = BattleSystem_GetPartySize(battleSystem, battler);
                    for (i = 0; i < end; i++) {
                        mon = BattleSystem_GetPartyMon(battleSystem, battler, i);

                        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
                            && i != ctx->selectedMonIndex[battler1]
                            && i != ctx->selectedMonIndex[battler2]
                            && i != ctx->aiSwitchedPartySlot[battler1]
                            && i != ctx->aiSwitchedPartySlot[battler2]) {
                            break;
                        }
                    }
                }

                ctx->aiSwitchedPartySlot[battler] = i;
            }

            return BATTLE_INPUT_POKEMON;
        }

        // Check if the AI determines that it should use an item
        if (TrainerAI_ShouldUseItem(battleSystem, battler)) {
            return BATTLE_INPUT_BAG;
        }
    }

    return BATTLE_INPUT_FIGHT;
}

/**
 * @brief Determine if the AI should use an item on its active battler.
 *
 * Several buffers will be filled, if an item should be used:
 * 1. The item type (e.g., Full Restore, Potion, etc.)
 * 2. Any parameters for the item, e.g. what status condition it heals
 * 3. What item number is used
 *
 * The trainer's pocket of items will also be updated appropriately.
 *
 * @param battleSystem
 * @param battler   The AI's battler.
 * @return          TRUE if an item should be used, FALSE if not.
 */
static BOOL TrainerAI_ShouldUseItem(BattleSystem *battleSystem, int battler) {
    int i;
    u8 aliveMons = 0;
    BattleContext *ctx = battleSystem->ctx;
    ctx->trainerAIData.usedItemCondition[battler >> 1] = 0;
    BOOL result = FALSE;

    // Don't let the AI partners ever use items in battle against trainers.
    if ((battleSystem->battleType & BATTLE_TYPE_TRAINER_WITH_AI_PARTNER) == BATTLE_TYPE_TRAINER_WITH_AI_PARTNER
        && BattleSystem_GetBattlerType(battleSystem, battler) == BATTLER_TYPE_PLAYER_SIDE_SLOT_2) {
        return result;
    }

    // Don't try to use items if it's illegal to do so.
    if (ctx->battleMons[battler].moveEffectFlags & MOVE_EFFECT_FLAG_EMBARGO) {
        return result;
    }

    Party *party = BattleSystem_GetParty(battleSystem, battler);
    for (i = 0; i < Party_GetCount(party); i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);

        if (GetMonData(mon, MON_DATA_HP, NULL) != 0
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE
            && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
            aliveMons++;
        }
    }

    for (i = 0; i < MAX_TRAINER_ITEMS; i++) {
        if (i == 0 || aliveMons <= ctx->trainerAIData.trainerItemCounts[battler >> 1] - i) {
            u16 item = ctx->trainerAIData.trainerItems[battler >> 1][i];

            if (item == ITEM_NONE) {
                continue;
            }

            if (item == ITEM_FULL_RESTORE) {
                if (ctx->battleMons[battler].hp < (ctx->battleMons[battler].maxHp / 4)
                    && ctx->battleMons[battler].hp) {
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_FULL_RESTORE;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_HP_RESTORE)) {
                u8 hpRestore = GetItemVar(ctx, item, ITEMATTR_HP_RESTORE_PARAM);

                // Use an HP restore item if the battler is at less than 1/4 HP or if the full HP restore
                // value of the item would be used.
                if (hpRestore) {
                    if (ctx->battleMons[battler].hp
                        && (ctx->battleMons[battler].hp < (ctx->battleMons[battler].maxHp / 4)
                            || (ctx->battleMons[battler].maxHp - ctx->battleMons[battler].hp) > hpRestore)) {
                        ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_HP;
                        result = TRUE;
                    }
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_SLP_HEAL)) {
                if (ctx->battleMons[battler].status & STATUS_SLEEP) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(5);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_PSN_HEAL)) {
                if ((ctx->battleMons[battler].status & STATUS_POISON)
                    || (ctx->battleMons[battler].status & STATUS_BAD_POISON)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(4);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_BRN_HEAL)) {
                if (ctx->battleMons[battler].status & STATUS_BURN) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(3);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_FRZ_HEAL)) {
                if (ctx->battleMons[battler].status & STATUS_FREEZE) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(2);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_PRZ_HEAL)) {
                if (ctx->battleMons[battler].status & STATUS_PARALYSIS) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(1);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
            } else if (GetItemVar(ctx, item, ITEMATTR_CFS_HEAL)) {
                if (ctx->battleMons[battler].status2 & STATUS2_CONFUSION) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] |= MaskOfFlagNo(0);
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                    result = TRUE;
                }
                // Don't try to use any of these until after the first turn that a mon is in play.
            } else if ((ctx->battleMons[battler].moveEffectData.fakeOutCount - ctx->totalTurns) >= 0) {
                if (GetItemVar(ctx, item, ITEMATTR_ATK_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_ATK;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_DEF_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_DEF;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_SPATK_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_SPATK;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_SPDEF_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_SPDEF;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_SPEED_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_SPEED;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_ACCURACY_STAGES)) {
                    ctx->trainerAIData.usedItemCondition[battler >> 1] = STAT_ACC;
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                    result = TRUE;
                } else if (GetItemVar(ctx, item, ITEMATTR_GUARD_SPEC)
                    && (ctx->fieldSideConditionFlags[1] & SIDE_CONDITION_MIST) == FALSE) {
                    ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_GUARD_SPEC;
                    result = TRUE;
                }
            } else {
                // Unrecognized item type
                ctx->trainerAIData.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_MAX;
            }

            if (result == TRUE) {
                ctx->trainerAIData.usedItem[battler >> 1] = item;
                ctx->trainerAIData.trainerItems[battler >> 1][i] = 0;
                break;
            }
        }
    }

    return result;
}
