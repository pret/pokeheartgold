#include "battle.h"
#include "pokemon.h"
#include "constants/pokemon.h"
#include "constants/abilities.h"

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret;
    
    do {
        ret = sBattleScriptCommandTable[ctx->unk_2700[ctx->unk_B4]](bsys, ctx);
    } while(ctx->unk_3154 == 0 && (ov12_0223A7E0(bsys)&4) == 0);

    ctx->unk_3154 = 0;

    return ret;
}

BOOL ov12_0223CFB8(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    ov12_022622C8(bsys, FALSE);
    return FALSE;
}

BOOL ov12_0223CFD0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    switch (BattleScriptReadWord(ctx)) {
    default:
    case 0:
        for (i = 0; i < unkA; i++) {
            ov12_022622F0(bsys, i);
            ov12_0223C288(bsys, i);
        }
        break;
    case 3:
        break;
    case 4:
        OpponentData *opponentData;
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_022622F0(bsys, i);
                ov12_0223C288(bsys, i);  
            }
        }
        break;
    }

    return FALSE;
}
