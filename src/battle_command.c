#include "battle.h"
#include "pokemon.h"
#include "overlay_12_022378C0.h"
#include "constants/abilities.h"
#include "constants/moves.h"
#include "constants/pokemon.h"


static u8 ov12_0224768C(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2);

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

BOOL BtlCmd_0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    ov12_022622C8(bsys, FALSE);
    return FALSE;
}

BOOL BtlCmd_1(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_PokemonSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_3(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_4(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_5(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = ov12_0224768C(bsys, ctx, BattleScriptReadWord(ctx));
    ov12_02262958(bsys, unkA);

    return FALSE;
}

BOOL BtlCmd_6(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_ThrowPokeball(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_8(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_9(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_10(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    BattleScriptIncrementPointer(ctx, 1);

    for (i = 0; i < unkA; i++) {
        //TODO: Declare
        ov12_02263CB0(bsys, i);
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_12(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_13(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

BOOL BtlCmd_WaitForMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ov12_0224ED48(ctx)) {
        BattleScriptIncrementPointer(ctx, 1);
    } else {
        ov12_0224ED9C(ctx);
    }

    ctx->unk_3154 = 1;

    return FALSE;
}

//TODO: Put in appropriate header:
int ov12_02256FF8(BattleSystem *bsys, BATTLECONTEXT *ctx, u32, u32, u32, u16, u8, u8, u8, u8);

static void ov12_0223DCE0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int type;

    if (ov12_022527CC(ctx, ctx->attackerBattlerId) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->unk_334.unkA8[ctx->field115_0xdcc].moveType;
    }

    ctx->damage = ov12_02256FF8(bsys, ctx, ctx->field115_0xdcc, ctx->field71_0x168[ov12_0223AB1C(bsys, ctx->targetBattlerId)], ctx->unk_180, ctx->movePower, type, ctx->attackerBattlerId, ctx->targetBattlerId, ctx->criticalMultiplier);

    ctx->damage *= ctx->criticalMultiplier;

    if (ov12_02255830(ctx, ctx->attackerBattlerId) == 0x62) {
        ctx->damage = ctx->damage * (100 + ov12_02255844(ctx, ctx->attackerBattlerId, 0))/100;
    }

    if (ov12_02255830(ctx, ctx->attackerBattlerId) == 0x69) {
        ctx->damage = ctx->damage * (10 + ctx->battleMons[ctx->attackerBattlerId].unk88.unk4_17)/10;
    }

    //Me First
    if (ctx->battleMons[ctx->attackerBattlerId].unk88.me_first_flag) {
        if (ctx->unk_174 == ctx->battleMons[ctx->attackerBattlerId].unk88.unk10) {
            ctx->battleMons[ctx->attackerBattlerId].unk88.unk10--;
        }
        if ((ctx->unk_174 - ctx->battleMons[ctx->attackerBattlerId].unk88.unk10) < 2) {
            ctx->damage = ctx->damage*15/10;
        } else {
            ctx->battleMons[ctx->attackerBattlerId].unk88.me_first_flag = 0;
        }
    }
}

BOOL BtlCmd_DamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_0223DCE0(bsys, ctx);
    //TODO: Declare in header
    ctx->damage = ov12_02257C30(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_16(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_0223DCE0(bsys, ctx);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_PrintAttackMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ctx->unk_213C & 1) == FALSE) {
        ov12_022633B8(bsys, ctx);
    }
    
    ctx->unk_213C |= 1; 
    ctx->unk_2140 |= 4;

    return FALSE;
}

BOOL BtlCmd_PrintMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;
    
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_022478F4(ctx, &msgdata);
    ov12_022479C0(bsys, ctx, &msgdata, &msg);
    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintMessage2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    ov12_022478F4(ctx, &msgdata);
    ov12_022479C0(bsys, ctx, &msgdata, &msg);

    msg.unk1 |= 128;

    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    //TODO: Define in header
    ov12_022633F0(bsys, ctx, &ctx->unk_F4);
    return FALSE;
}

BOOL BtlCmd_BufferMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    
    BattleScriptIncrementPointer(ctx, 1);

    ov12_022478F4(ctx, &msgdata);
    ov12_022479C0(bsys, ctx, &msgdata, &ctx->unk_F4);

    return FALSE;
}

BOOL BtlCmd_22(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ov12_022478F4(ctx, &msgdata);
    ov12_022479C0(bsys, ctx, &msgdata, &msg);

    msg.unk1 |= 64;
    msg.unk20 = ov12_0224768C(bsys, ctx, unkA);

    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;
    
    BattleScriptIncrementPointer(ctx, 1);
    u32 unkB = BattleScriptReadWord(ctx);

    if (unkB == 255) {
        move = ctx->unk_124;
    } else {
        move = ctx->field115_0xdcc;
    }

    if ((!(ctx->unk_213C & (1 << 14)) && ov12_0223B6D4(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->unk_213C |= (1 << 14);
        ov12_0226340C(bsys, ctx, move);
    }

    if (!ov12_0223B6D4(bsys)) {
        ov12_02245520(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;
    
    BattleScriptIncrementPointer(ctx, 1);
    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);
    u32 unkD = BattleScriptReadWord(ctx);

    if (unkB == 255) {
        move = ctx->unk_124;
    } else {
        move = ctx->field115_0xdcc;
    }

    u32 unkE = ov12_0224768C(bsys, ctx, unkC);
    u32 unkF = ov12_0224768C(bsys, ctx, unkD);

    if ((!(ctx->unk_213C & (1 << 14)) && ov12_0223B6D4(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->unk_213C |= (1 << 14);
        ov12_0226343C(bsys, ctx, move, unkE, unkF);
    }

    if (!ov12_0223B6D4(bsys)) {
        ov12_02245520(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_MonFlicker(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u32 unkA = BattleScriptReadWord(ctx);

    ov12_0226346C(bsys, ov12_0224768C(bsys, ctx, unkA), ctx->unk_216C);

    return FALSE;
}

BOOL BtlCmd_HealthbarDataUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u8 unkA = ov12_0224768C(bsys, ctx, BattleScriptReadWord(ctx));

    if ((ctx->battleMons[unkA].hp + ctx->unk_215C) <= 0) {
        ctx->unk_2148 = ctx->battleMons[unkA].hp * -1;
    } else {
        ctx->unk_2148 = ctx->unk_215C;
    }

    if (ctx->unk_2148 < 0) {
        ctx->unk_164[unkA] += (-1*ctx->unk_2148);
    }

    ctx->battleMons[unkA].hp += ctx->unk_215C;

    if (ctx->battleMons[unkA].hp < 0) {
        ctx->battleMons[unkA].hp = 0;
    } else if (ctx->battleMons[unkA].hp > ctx->battleMons[unkA].maxHp) {
        ctx->battleMons[unkA].hp = ctx->battleMons[unkA].maxHp;
    }

    ov12_02250C40(bsys, ctx, unkA);

    return FALSE;
}

BOOL BtlCmd_HealthbarUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_02263488(bsys, ctx, ov12_0224768C(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TryFaintMon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = ov12_0224768C(bsys, ctx, BattleScriptReadWord(ctx));

    if (ctx->battleMons[unkA].hp == 0) {
        ctx->unk_74 = unkA;
        ctx->unk_213C |= MaskOfFlagNo(unkA) << 24;
        ctx->unk_154[unkA]++;
        ov12_02248558(bsys, ctx, unkA);
    }

    return FALSE;
}
