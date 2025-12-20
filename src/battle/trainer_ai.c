#include "battle/trainer_ai.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"

#include "system.h"

void ov10_0221BE20(BattleSystem *battleSystem, BattleContext *ctx, u8 battlerId, u8 a3) {
    int i;
    u8 struggleFlags;
    u8 *aiData = (u8 *)&ctx->trainerAIData;

    for (i = 0; i < OFFSET_OF(TrainerAIData *, unk1C); i++) {
        aiData[i] = 0;
    }

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (a3 & 1) {
            ctx->trainerAIData.movePoints[i] = 100;
        } else {
            ctx->trainerAIData.movePoints[i] = 0;
        }
        a3 >>= 1;
    }

    struggleFlags = StruggleCheck(battleSystem, ctx, battlerId, 0, -1);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (struggleFlags & MaskOfFlagNo(i)) {
            ctx->trainerAIData.movePoints[i] = 0;
        }
        ctx->trainerAIData.unk18[i] = 100 - (BattleSystem_Random(battleSystem) % 16);
    }

    ctx->trainerAIData.unk98 = 0;

    if (battleSystem->battleType & BATTLE_TYPE_ROAMER) {
        ctx->trainerAIData.aiFlags = AI_29;
    } else {
        ctx->trainerAIData.aiFlags = battleSystem->trainers[battlerId].data.aiFlags;
    }

    if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        ctx->trainerAIData.aiFlags |= AI_DOUBLES;
    }
}

u8 ov10_0221BEF4(BattleSystem *battleSystem, u8 battlerId) {
    u8 ret;
    BattleContext *ctx = battleSystem->ctx;

    if (!(ctx->trainerAIData.unk10 & 0x10)) {
        ctx->trainerAIData.battlerIdAttacker = battlerId;
        ctx->trainerAIData.battlerIdTarget = Battler_GetRandomOpposingBattlerId(battleSystem, ctx, battlerId);

        ov10_0221BE20(battleSystem, ctx, ctx->trainerAIData.battlerIdAttacker, 15);
    }

    if ((battleSystem->battleType & BATTLE_TYPE_DOUBLES) == 0) {
        ret = ov10_0221BF44(battleSystem, ctx);
    } else {
        ret = ov10_0221C038(battleSystem, ctx);
    }

    return ret;
}
