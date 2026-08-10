#include "battle/trainer_ai.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"

#include "constants/moves.h"
#include "constants/battle/trainer_ai.h"

#include "system.h"

static u8 TrainerAI_MainSingles(BattleSystem *battleSystem, BattleContext *ctx);
static u8 TrainerAI_MainDoubles(BattleSystem *battleSystem, BattleContext *ctx);

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

static u8 TrainerAI_MainSingles(BattleSystem *battleSystem, BattleContext *ctx)
{
    u8 maxScoreMoves[MAX_MON_MOVES];
    u8 maxScoreMoveSlots[MAX_MON_MOVES];
    u8 numMaxScoreMoves;
    u8 action = 0; // AI_ENEMY_ATTACK_1

    TrainerAI_RecordLastMove(battleSystem, ctx);

    // Iterate through all active AI flags to get each move's aggregate score.
    while (ctx->trainerAIData.aiFlags) {
        if (ctx->trainerAIData.aiFlags & AI_FLAG_BASIC) {
            if ((ctx->trainerAIData.stateFlags & AI_STATUS_FLAG_CONTINUE) == FALSE) {
                ctx->trainerAIData.evalStep = 0; // 0 = AI_EVAL_STEP_INIT
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

static u8 TrainerAI_MainDoubles(BattleSystem *battleSystem, BattleContext *ctx)
{
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

        TrainerAI_Init(battleSystem, ctx, ctx->trainerAIData.attacker, 0xF);

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
                    ctx->trainerAIData.evalStep = 0; // AI_EVAL_STEP_INIT
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
        && BattleSystem_GetFieldSide(battleSystem, ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker]) == 0) {
        ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = ctx->trainerAIData.attacker;
    }

    if (move == MOVE_CURSE && CurseUserIsGhost(ctx, move, ctx->trainerAIData.attacker) == FALSE) {
        ctx->trainerAIData.selectedTarget[ctx->trainerAIData.attacker] = ctx->trainerAIData.attacker;
    }

    return moveSlot;
}
