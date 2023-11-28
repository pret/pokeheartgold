#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/trainer_ai.h"
#include "battle/overlay_12_0224E4FC.h"

void ov10_0221BE20(BattleSystem *bsys, BattleContext *ctx, u8 battlerId, u8 a3) {
    int i;
    u8 struggleFlags;
    u8 *aiData = (u8 *) &ctx->unk_334;
    
    for (i = 0; i < (u32) 28; i++) {
        aiData[i] = 0;
    }
    
    for (i = 0; i < 4; i++) {
        if (a3 & 1) {
            ctx->unk_334.unk4[i] = 100;
        } else {
            ctx->unk_334.unk4[i] = 0;
        }
        a3 >>= 1;
    }
    
    struggleFlags = StruggleCheck(bsys, ctx, battlerId, 0, -1);
    
    for (i = 0; i < 4; i++) {
        if (struggleFlags & MaskOfFlagNo(i)) {
            ctx->unk_334.unk4[i] = 0;
        }
        ctx->unk_334.unk18[i] = 100 - (BattleSystem_Random(bsys) % 16);
    }

    ctx->unk_334.unk98 = 0;

    if (bsys->battleType & BATTLE_TYPE_8) {
        ctx->unk_334.unkC = 1 << 0x1d;
    } else {
        ctx->unk_334.unkC = bsys->trainers[battlerId].data.aiFlags;
    }

    if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        ctx->unk_334.unkC |= 0x80;
    }
}
