#include "battle.h"
#include "pokemon.h"
#include "overlay_12_022378C0.h"
#include "constants/pokemon.h"
#include "constants/abilities.h"

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret;
    
    do {
        ret = sBattleScriptCommandTable[ctx->unk_2700[ctx->unk_B4]](bsys, ctx);
    } while(ctx->unk_3154 == 0 && (ov12_0223A7E0(bsys)&4) == 0);
    //TODO: Define ov12_0223A7E0 in header
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

BOOL ov12_0223D04C(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
    case 0:
    case 5:
        for (i = 0; i < unkA; i++) {
            ov12_022623F0(bsys, i);
            ov12_0223C288(bsys, i);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (!(opponentData->unk195 & 1)) {
                ov12_022623F0(bsys, i);
                ov12_0223C288(bsys, i);
            }
        }
        ov12_02250370(bsys, ctx, 1);
        ov12_02250370(bsys, ctx, 3);
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02250360(ctx, i);
                ov12_02250370(bsys, ctx, i);
                ov12_022623F0(bsys, i);
                ov12_0223C288(bsys, i);
            }
        }
        break;
    case 1:
        opponentData = ov12_0223A7E8(bsys, ctx->attackerBattlerId);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->attackerBattlerId);
            ov12_02250370(bsys, ctx, ctx->attackerBattlerId);
        }
        ov12_0223C288(bsys, ctx->attackerBattlerId);
        ov12_022623F0(bsys, ctx->attackerBattlerId);
        break;
    case 2:
        opponentData = ov12_0223A7E8(bsys, ctx->targetBattlerId);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->targetBattlerId);
            ov12_02250370(bsys, ctx, ctx->targetBattlerId);
        }
        ov12_0223C288(bsys, ctx->targetBattlerId);
        ov12_022623F0(bsys, ctx->targetBattlerId);
        break;
    case 6:
        opponentData = ov12_0223A7E8(bsys, ctx->unk_78);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->unk_78);
            ov12_02250370(bsys, ctx, ctx->unk_78);
        }
        ov12_0223C288(bsys, ctx->unk_78);
        ov12_022623F0(bsys, ctx->unk_78);
        break;
    }

    return FALSE;
}

BOOL ov12_0223D20C(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
    case 0:
    case 5:
        for (i = 0; i < unkA; i++) {
            ov12_02262524(bsys, i, 0, 0);
            ov12_0223C288(bsys, i);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (!(opponentData->unk195 & 1)) {
                ov12_02262524(bsys, i, 0, 0);
                ov12_0223C288(bsys, i);
            }
        }
        ov12_02250370(bsys, ctx, 1);
        ov12_02250370(bsys, ctx, 3);
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02250360(ctx, i);
                ov12_02250370(bsys, ctx, i);
                ov12_02262524(bsys, i, 0, 0);
                ov12_0223C288(bsys, i);
            }
        }
        break;
    case 1:
        opponentData = ov12_0223A7E8(bsys, ctx->attackerBattlerId);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->attackerBattlerId);
            ov12_02250370(bsys, ctx, ctx->attackerBattlerId);
        }
        ov12_0223C288(bsys, ctx->attackerBattlerId);
        ov12_02262524(bsys, ctx->attackerBattlerId, 0, 0);
        break;
    case 2:
        opponentData = ov12_0223A7E8(bsys, ctx->targetBattlerId);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->targetBattlerId);
            ov12_02250370(bsys, ctx, ctx->targetBattlerId);
        }
        ov12_0223C288(bsys, ctx->targetBattlerId);
        ov12_02262524(bsys, ctx->targetBattlerId, 0, 0);
        break;
    case 6:
        opponentData = ov12_0223A7E8(bsys, ctx->unk_78);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->unk_78);
            ov12_02250370(bsys, ctx, ctx->unk_78);
        }
        ov12_0223C288(bsys, ctx->unk_78);
        ov12_02262524(bsys, ctx->unk_78, 0, 0);
        break;
    }

    return FALSE;
}

BOOL ov12_0223D3E8(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
        for (i = 0; i < unkA; i++) {
            ov12_02262734(bsys, ctx, i);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262734(bsys, ctx, i);
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1 && !(ctx->unk_3108 & MaskOfFlagNo(i))) {
                ov12_02262734(bsys, ctx, i);
            }
        }
        break;
    default:
        ov12_02262734(bsys, ctx, ov12_0224768C(bsys, ctx, unkB));
        break;
    }

    return FALSE;
}

BOOL ov12_0223D4A8(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = ov12_0224768C(bsys, ctx, BattleScriptReadWord(ctx));
    ov12_02262958(bsys, unkA);

    return FALSE;
}

BOOL ov12_0223D4D4(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    case 0:
    default:
        if (ov12_0223A7E0(bsys) & 16) {
            for (i = 0; i < unkA; i++) {
                opponentData = ov12_0223A7E8(bsys, i);
                if (opponentData->unk195 != 4) {
                    ov12_02262974(bsys, i);
                }
            }
        } else {
            for (i = 0; i < unkA; i++) {
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2) &&
                    (i > 1)) {
                    break;
                }
                ov12_02262974(bsys, i);
            }
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_02262974(bsys, i);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262974(bsys, i);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 16) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    }

    return FALSE;
}

BOOL ov12_0223D5F0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (i = 0; i < unkA; i++) {
            if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                (ov12_0223A7E0(bsys) & 2) &&
                (i > 1)) {
                break;
            }
            ov12_022629A4(bsys, i, unkC);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_022629A4(bsys, i, unkC);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_022629A4(bsys, i, unkC);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 16) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    }

    ctx->unk_3154 = 1;

    return FALSE;
}

BOOL ov12_0223D700(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (i = 0; i < unkA; i++) {
            if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                (ov12_0223A7E0(bsys) & 2) &&
                (i > 1)) {
                break;
            }
            ov12_022629DC(bsys, i);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_022629DC(bsys, i);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_022629DC(bsys, i);
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 16) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                ov12_022629DC(bsys, i);
                break;
            }
        }
        break;
    case 10:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                ov12_022629DC(bsys, i);
                break;
            }
        }
        break;
    case 11:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 4) {
                ov12_022629DC(bsys, i);
                break;
            }
        }
        break;
    case 12:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 5) {
                ov12_022629DC(bsys, i);
                break;
            }
        }
        break;
    }
    
    return FALSE;
}

BOOL ov12_0223D8B0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (i = 0; i < unkA; i++) {
            if ((ov12_0223A7E0(bsys) & 2) && (i > 1)) {
                break;
            }
            ov12_022629F8(bsys, i, unkC);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_022629F8(bsys, i, unkC);
                if ((ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_022629F8(bsys, i, unkC);
                if ((ov12_0223A7E0(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                ov12_022629F8(bsys, i, unkC);
                break;
            }
        }
        break;
    case 10:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                ov12_022629F8(bsys, i, unkC);
                break;
            }
        }
        break;
    case 11:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 4) {
                ov12_022629F8(bsys, i, unkC);
                break;
            }
        }
        break;
    case 12:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 == 5) {
                ov12_022629F8(bsys, i, unkC);
                break;
            }
        }
        break;
    }
    
    return FALSE;
}

BOOL ov12_0223DA48(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    BattleScriptIncrementPointer(ctx, 1);

    for (i = 0; i < unkA; i++) {
        //TODO: Declare
        ov12_02263CB0(bsys, i);
    }

    return FALSE;
}

BOOL ov12_0223DA74(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
        for (i = 0; i < unkA; i++) {
            ov12_02262A2C(bsys, ctx, i, 0);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262A2C(bsys, ctx, i, 0);
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262A2C(bsys, ctx, i, 0);
            }
        }
        break;
    default:
        ov12_02262A2C(bsys, ctx, ov12_0224768C(bsys, ctx, unkB), 0);
        break;
    }

    return FALSE;
}

BOOL ov12_0223DB2C(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;
    u8 delay;

    BattleScriptIncrementPointer(ctx, 1);
    int unkB = BattleScriptReadWord(ctx);

    delay = 0;

    switch (unkB) {
    case 0:
        for (i = 0; i < unkA; i++) {
            ov12_02262A2C(bsys, ctx, i, 0);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262A2C(bsys, ctx, i, delay);
                delay += 4;
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262A2C(bsys, ctx, i, delay);
                delay += 4;
            }
        }
        break;
    default:
        ov12_02262A2C(bsys, ctx, ov12_0224768C(bsys, ctx, unkB), 0);
        break;
    }
    
    return FALSE;
}

BOOL ov12_0223DBF4(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
        for (i = 0; i < unkA; i++) {
            ov12_02262B64(bsys, i);
        }
        break;
    case 3:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0 && (ctx->unk_3108 & MaskOfFlagNo(i)) == 0) {
                ov12_02262B64(bsys, i);
            }
        }
        break;
    case 4:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262B64(bsys, i);
            }
        }
        break;
    default:
        ov12_02262B64(bsys, ov12_0224768C(bsys, ctx, unkB));
        break;
    }
    
    return FALSE;
}

BOOL ov12_0223DCAC(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ov12_0224ED48(ctx)) {
        BattleScriptIncrementPointer(ctx, 1);
    } else {
        ov12_0224ED9C(ctx);
    }

    ctx->unk_3154 = 1;

    return FALSE;
}
