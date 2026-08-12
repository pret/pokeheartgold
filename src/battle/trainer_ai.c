#include "battle/trainer_ai.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"

#include "constants/abilities.h"
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

int TrainerAI_MoveType(BattleSystem *battleSystem, BattleContext *ctx, int battler, int move);
void TrainerAI_RecordLastMove(BattleSystem *battleSystem, BattleContext *ctx);
int AIScript_Read(BattleContext *ctx);
int AIScript_ReadOffset(BattleContext *ctx, int offset);
void AIScript_IncrementCursor(BattleContext *ctx, int jump);
u8 AIScript_Battler(BattleContext *ctx, u8 inBattler);
s32 TrainerAI_CalcAllDamage(BattleSystem *battleSystem, BattleContext *ctx, int attacker, u16 *moves, s32 *damageVals, u16 heldItem, u8 *ivs, int ability, BOOL embargo, BOOL varyDamage);
s32 TrainerAI_CalcDamage(BattleSystem *battleSystem, BattleContext *ctx, u16 move, u16 heldItem, u8 *ivs, int attacker, int ability, BOOL embargo, u8 variance);

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

// Make static
void AICmd_IfRandomLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 < val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

// Make static
void AICmd_IfRandomGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 > val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

// Make static
void AICmd_IfRandomEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

// Make static
void AICmd_IfRandomNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfRandomNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (BattleSystem_Random(battleSystem) % 256 != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

// Make static
void AICmd_AddToMoveScore(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_AddToMoveScore(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] += val;

    if (ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] < 0) {
        ctx->trainerAIData.moveScore[ctx->trainerAIData.moveSlot] = 0;
    }
}

void AICmd_IfHPPercentLessThan(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfHPPercentGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfHPPercentEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfHPPercentNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfStatus(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfNotStatus(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfStatus2(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfNotStatus2(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfNotMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfSideCondition(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfNotSideCondition(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfLoadedLessThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedLessThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp < val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedGreaterThan(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp > val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedMask(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedMask(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.calcTemp & mask) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedNotMask(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfLoadedNotMask(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int mask = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if ((ctx->trainerAIData.calcTemp & mask) == FALSE) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfMoveEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.move == val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfMoveNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfMoveNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.move != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfLoadedInTable(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfLoadedNotInTable(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfAttackerHasDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfAttackerHasNoDamagingMoves(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_LoadTurnCount(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadTurnCount(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->totalTurns;
}

void AICmd_LoadTypeFrom(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_FlagBattlerIsType(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_LoadMovePower(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadMovePower(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].power;
}

void AICmd_FlagMoveDamageScore(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_LoadBattlerPreviousMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadBattlerPreviousMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->moveNoBattlerPrev[battler];
}

void AICmd_IfTempEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTempEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (val == ctx->trainerAIData.calcTemp) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfTempNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfTempNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (val != ctx->trainerAIData.calcTemp) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfSpeedCompareEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfSpeedCompareEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (CheckSortSpeed(battleSystem, ctx, ctx->trainerAIData.attacker, ctx->trainerAIData.defender, TRUE) == val) { // BattleSystem_CompareBattlerSpeed in pokeplatinum
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfSpeedCompareNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfSpeedCompareNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int val = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (CheckSortSpeed(battleSystem, ctx, ctx->trainerAIData.attacker, ctx->trainerAIData.defender, TRUE) != val) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_CountAlivePartyBattlers(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_LoadCurrentMove(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMove(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.move;
}

void AICmd_LoadCurrentMoveEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadCurrentMoveEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.calcTemp = ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect;
}

void AICmd_LoadBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_CheckBattlerAbility(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_CalcMaxEffectiveness(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveEffectivenessEquals(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfPartyMemberStatus(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfPartyMemberNotStatus(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_LoadCurrentWeather(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfCurrentMoveEffectEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveEffectEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect == expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfCurrentMoveEffectNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_IfCurrentMoveEffectNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int expected = AIScript_Read(ctx);
    int jump = AIScript_Read(ctx);

    if (ctx->trainerAIData.moveData[ctx->trainerAIData.move].effect != expected) {
        AIScript_IncrementCursor(ctx, jump);
    }
}

void AICmd_IfStatStageLessThan(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfStatStageGreaterThan(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfStatStageEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfStatStageNotEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfCurrentMoveKOs(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfCurrentMoveDoesNotKO(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveKnown(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveNotKnown(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveEffectKnown(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_IfMoveEffectNotKnown(BattleSystem *battleSystem, BattleContext *ctx);
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
void AICmd_IfBattlerUnderEffect(BattleSystem *battleSystem, BattleContext *ctx);
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
void AICmd_IfCurrentMoveMatchesEffect(BattleSystem *battleSystem, BattleContext *ctx);
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

void AICmd_Escape(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Escape(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);
    ctx->trainerAIData.stateFlags |= (AI_STATUS_FLAG_DONE | AI_STATUS_FLAG_ESCAPE | AI_STATUS_FLAG_BREAK);
}

void AICmd_Dummy3E(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Dummy3E(BattleSystem *battleSystem, BattleContext *ctx) {
    return;
}

void AICmd_Dummy3F(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_Dummy3F(BattleSystem *battleSystem, BattleContext *ctx) {
    return;
}

void AICmd_LoadHeldItem(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadHeldItem(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    ctx->trainerAIData.calcTemp = ctx->battleMons[battler].item;
}

void AICmd_LoadHeldItemEffect(BattleSystem *battleSystem, BattleContext *ctx);
void AICmd_LoadHeldItemEffect(BattleSystem *battleSystem, BattleContext *ctx) {
    AIScript_IncrementCursor(ctx, 1);

    int inBattler = AIScript_Read(ctx);
    u8 battler = AIScript_Battler(ctx, inBattler);

    if (ctx->trainerAIData.attacker != battler) {
        ctx->trainerAIData.calcTemp = GetItemVar(ctx, ctx->trainerAIData.heldItems[battler], ITEMATTR_HOLD_EFFECT); // BattleSystem_GetItemData in pokeplatinum
    } else {
        ctx->trainerAIData.calcTemp = GetItemVar(ctx, ctx->battleMons[battler].item, ITEMATTR_HOLD_EFFECT);
    }
}

void AICmd_IfHeldItemEqualTo(BattleSystem *battleSystem, BattleContext *ctx);
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
