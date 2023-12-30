#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/trainer_ai.h"
#include "battle/overlay_12_0224E4FC.h"
#include "system.h"

void ov10_0221BE20(BattleSystem *bsys, BattleContext *ctx, u8 battlerId, u8 a3) {
    int i;
    u8 struggleFlags;
    u8 *aiData = (u8 *) &ctx->trainerAIData;
    
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
    
    struggleFlags = StruggleCheck(bsys, ctx, battlerId, 0, -1);
    
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (struggleFlags & MaskOfFlagNo(i)) {
            ctx->trainerAIData.movePoints[i] = 0;
        }
        ctx->trainerAIData.unk18[i] = 100 - (BattleSystem_Random(bsys) % 16);
    }

    ctx->trainerAIData.unk98 = 0;

    if (bsys->battleType & BATTLE_TYPE_8) {
        ctx->trainerAIData.aiFlags = AI_29;
    } else {
        ctx->trainerAIData.aiFlags = bsys->trainers[battlerId].data.aiFlags;
    }

    if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        ctx->trainerAIData.aiFlags |= AI_DOUBLES;
    }
}

u8 ov10_0221BEF4(BattleSystem *bsys, u8 battlerId) {
    u8 ret;
    BattleContext *ctx = bsys->ctx;
    
    if (!(ctx->trainerAIData.unk10 & 0x10)) {
        ctx->trainerAIData.battlerIdAttacker = battlerId;
        ctx->trainerAIData.battlerIdTarget = ov12_02253DA0(bsys, ctx, battlerId);
        
        ov10_0221BE20(bsys, ctx, ctx->trainerAIData.battlerIdAttacker, 15);
    }
    
    if ((bsys->battleType & BATTLE_TYPE_DOUBLES) == 0) {
        ret = ov10_0221BF44(bsys, ctx);
    } else {
        ret = ov10_0221C038(bsys, ctx);
    }
    
    return ret;
}
