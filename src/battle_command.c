#include "battle.h"
#include "item.h"
#include "pokemon.h"
#include "system.h"
#include "unk_0200E320.h"
#include "overlay_12_022378C0.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/moves.h"
#include "constants/pokemon.h"


static u8 GetBattlerIDBySide(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2);

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
        opponentData = ov12_0223A7E8(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->battlerIdAttacker);
            ov12_02250370(bsys, ctx, ctx->battlerIdAttacker);
        }
        ov12_0223C288(bsys, ctx->battlerIdAttacker);
        ov12_022623F0(bsys, ctx->battlerIdAttacker);
        break;
    case 2:
        opponentData = ov12_0223A7E8(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->battlerIdTarget);
            ov12_02250370(bsys, ctx, ctx->battlerIdTarget);
        }
        ov12_0223C288(bsys, ctx->battlerIdTarget);
        ov12_022623F0(bsys, ctx->battlerIdTarget);
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
        opponentData = ov12_0223A7E8(bsys, ctx->battlerIdAttacker);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->battlerIdAttacker);
            ov12_02250370(bsys, ctx, ctx->battlerIdAttacker);
        }
        ov12_0223C288(bsys, ctx->battlerIdAttacker);
        ov12_02262524(bsys, ctx->battlerIdAttacker, 0, 0);
        break;
    case 2:
        opponentData = ov12_0223A7E8(bsys, ctx->battlerIdTarget);
        if (!(opponentData->unk195 & 1)) {
            ov12_02250370(bsys, ctx, 1);
            ov12_02250370(bsys, ctx, 3);
        } else {
            ov12_02250360(ctx, ctx->battlerIdTarget);
            ov12_02250370(bsys, ctx, ctx->battlerIdTarget);
        }
        ov12_0223C288(bsys, ctx->battlerIdTarget);
        ov12_02262524(bsys, ctx->battlerIdTarget, 0, 0);
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
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (i = 0; i < unkA; i++) {
            ov12_02262734(bsys, ctx, i);
        }
        break;
    case B_SIDE_PLAYER:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262734(bsys, ctx, i);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1 && !(ctx->unk_3108 & MaskOfFlagNo(i))) {
                ov12_02262734(bsys, ctx, i);
            }
        }
        break;
    default:
        ov12_02262734(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side));
        break;
    }

    return FALSE;
}

BOOL BtlCmd_5(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));
    ov12_02262958(bsys, battlerId);

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
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (i = 0; i < unkA; i++) {
            ov12_02262A2C(bsys, ctx, i, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262A2C(bsys, ctx, i, 0);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262A2C(bsys, ctx, i, 0);
            }
        }
        break;
    default:
        ov12_02262A2C(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
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
    int side = BattleScriptReadWord(ctx);

    delay = 0;

    switch (side) {
    case B_SIDE_ALL:
        for (i = 0; i < unkA; i++) {
            ov12_02262A2C(bsys, ctx, i, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262A2C(bsys, ctx, i, delay);
                delay += 4;
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262A2C(bsys, ctx, i, delay);
                delay += 4;
            }
        }
        break;
    default:
        ov12_02262A2C(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
        break;
    }
    
    return FALSE;
}

BOOL BtlCmd_13(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (i = 0; i < unkA; i++) {
            ov12_02262B64(bsys, i);
        }
        break;
    case B_SIDE_PLAYER:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if ((opponentData->unk195 & 1) == 0 && (ctx->unk_3108 & MaskOfFlagNo(i)) == 0) {
                ov12_02262B64(bsys, i);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (i = 0; i < unkA; i++) {
            opponentData = ov12_0223A7E8(bsys, i);
            if (opponentData->unk195 & 1) {
                ov12_02262B64(bsys, i);
            }
        }
        break;
    default:
        ov12_02262B64(bsys, GetBattlerIDBySide(bsys, ctx, side));
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

static void DamageCalcDefault(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int type;

    if (ov12_022527CC(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->unk_334.unkA8[ctx->field115_0xdcc].moveType;
    }

    ctx->damage = ov12_02256FF8(bsys, ctx, ctx->field115_0xdcc, ctx->field71_0x168[ov12_0223AB1C(bsys, ctx->battlerIdTarget)], ctx->unk_180, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

    ctx->damage *= ctx->criticalMultiplier;

    if (ov12_02255830(ctx, ctx->battlerIdAttacker) == 0x62) {
        ctx->damage = ctx->damage * (100 + ov12_02255844(ctx, ctx->battlerIdAttacker, 0))/100;
    }

    if (ov12_02255830(ctx, ctx->battlerIdAttacker) == 0x69) {
        ctx->damage = ctx->damage * (10 + ctx->battleMons[ctx->battlerIdAttacker].unk88.unk4_17)/10;
    }

    //Me First
    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.me_first_flag) {
        if (ctx->unk_174 == ctx->battleMons[ctx->battlerIdAttacker].unk88.unk10) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.unk10--;
        }
        if ((ctx->unk_174 - ctx->battleMons[ctx->battlerIdAttacker].unk88.unk10) < 2) {
            ctx->damage = ctx->damage*15/10;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.me_first_flag = 0;
        }
    }
}

BOOL BtlCmd_DamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    DamageCalcDefault(bsys, ctx);
    //TODO: Declare in header
    ctx->damage = ov12_02257C30(bsys, ctx, ctx->damage);
    ctx->damage *= -1;

    return FALSE;
}

BOOL BtlCmd_16(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    DamageCalcDefault(bsys, ctx);
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
    
    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);
    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintMessage2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.unk1 |= 128;

    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    //TODO: Define in header
    ov12_022633F0(bsys, ctx, &ctx->buffMsg);
    return FALSE;
}

BOOL BtlCmd_BufferMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    
    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &ctx->buffMsg);

    return FALSE;
}

BOOL BtlCmd_22(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.unk1 |= 64;
    msg.battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ov12_022633F0(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;
    
    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);

    if (battler == 255) {
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
    u32 battler = BattleScriptReadWord(ctx);
    u32 attackerSide = BattleScriptReadWord(ctx);
    u32 defenderSide = BattleScriptReadWord(ctx);

    if (battler == 255) {
        move = ctx->unk_124;
    } else {
        move = ctx->field115_0xdcc;
    }

    u32 attacker = GetBattlerIDBySide(bsys, ctx, attackerSide);
    u32 defender = GetBattlerIDBySide(bsys, ctx, defenderSide);

    if ((!(ctx->unk_213C & (1 << 14)) && ov12_0223B6D4(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->unk_213C |= (1 << 14);
        ov12_0226343C(bsys, ctx, move, attacker, defender);
    }

    if (!ov12_0223B6D4(bsys)) {
        ov12_02245520(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_MonFlicker(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u32 side = BattleScriptReadWord(ctx);

    ov12_0226346C(bsys, GetBattlerIDBySide(bsys, ctx, side), ctx->unk_216C);

    return FALSE;
}

BOOL BtlCmd_HealthbarDataUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u8 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if ((ctx->battleMons[battlerId].hp + ctx->unk_215C) <= 0) {
        ctx->unk_2148 = ctx->battleMons[battlerId].hp * -1;
    } else {
        ctx->unk_2148 = ctx->unk_215C;
    }

    if (ctx->unk_2148 < 0) {
        ctx->unk_164[battlerId] += (-1*ctx->unk_2148);
    }

    ctx->battleMons[battlerId].hp += ctx->unk_215C;

    if (ctx->battleMons[battlerId].hp < 0) {
        ctx->battleMons[battlerId].hp = 0;
    } else if (ctx->battleMons[battlerId].hp > ctx->battleMons[battlerId].maxHp) {
        ctx->battleMons[battlerId].hp = ctx->battleMons[battlerId].maxHp;
    }

    ov12_02250C40(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_HealthbarUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_02263488(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TryFaintMon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if (ctx->battleMons[battlerId].hp == 0) {
        ctx->battlerIdFainted = battlerId;
        ctx->unk_213C |= MaskOfFlagNo(battlerId) << 24;
        ctx->unk_154[battlerId]++;
        ov12_02248558(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_PlayFaintAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_022635E8(bsys, ctx, ctx->battlerIdFainted);

    ctx->unk_213C &= (MaskOfFlagNo(ctx->battlerIdFainted) << 24) ^ -1;
    ctx->unk_2140 |= MaskOfFlagNo(ctx->battlerIdFainted) << 28;
    ctx->unk_21A8[ctx->battlerIdFainted][0] = 40;

    ov12_022514C4(bsys, ctx, ctx->battlerIdFainted);

    return FALSE;
}

BOOL BtlCmd_Wait(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int waitFrames = BattleScriptReadWord(ctx);
    int waitIncrement;

    if (!(ov12_0223A7E0(bsys) & 4)) {
        if (gSystem.newKeys & 0xC03 || System_GetTouchNew()) {
            //TODO: Rename variable in struct
            ctx->unk_F0 = waitFrames;
        }
    }
    
    //TODO: unk2C are the battle type flags
    if (bsys->unk2C & 4 && !(bsys->unk240C & 16)) {
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

    ctx->unk_3154 = 1;

    return FALSE;
}

BOOL BtlCmd_PlaySE(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 side = BattleScriptReadWord(ctx);
    u32 sound = BattleScriptReadWord(ctx);

    ov12_022636FC(bsys, ctx, sound, GetBattlerIDBySide(bsys, ctx, side));

    return FALSE;
}

BOOL BtlCmd_If(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 operator = BattleScriptReadWord(ctx);
    u32 unkA = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    //TODO: Define this function as BattleScriptGetVarPointer
    int *var = ov12_02245528(bsys, ctx, unkA);

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
    u32 unkA = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int var = ov12_0224EDE0(ctx, GetBattlerIDBySide(bsys, ctx, side), unkA, 0);

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

    ov12_0226371C(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_JumpToSubSeq(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_02245518(ctx, 1, BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_JumpToCurMoveEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_02245518(ctx, 30, ctx->unk_334.unkA8[ctx->field115_0xdcc].unk0);

    return FALSE;
}

BOOL BtlCmd_JumpToEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->unk_213C &= ~1;
    ctx->unk_213C &= 0xffffbfff;

    ctx->field115_0xdcc = ctx->unk_124;

    if (unkA == 0) {
        //TODO: Define these functions in a header or leave them until you reach them here
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->unk_124, 1, 0);
        ov12_02250A18(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->unk_124);
        ctx->unk_21A8[ctx->battlerIdAttacker][1] = ctx->battlerIdTarget;
    }

    if (ctx->battlerIdTarget == 255) {
        ctx->unk_C = 39;
        ov12_02245518(ctx, 1, 281);
    } else {
        ov12_02245518(ctx, 0, ctx->field115_0xdcc);
    }

    return FALSE;
}

BOOL BtlCmd_CritCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((ov12_0223A7E0(bsys) & (1 << 10)) || (ov12_0223B514(bsys) & 1)) {
        ctx->criticalMultiplier = 1;
    } else {
        ctx->criticalMultiplier = ov12_02257C5C(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->unk_214C, ov12_022581D4(bsys, ctx, 0, ctx->battlerIdTarget));
    }

    return FALSE;
}

BOOL BtlCmd_ShouldGetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int adrs;
    u32 unkA = ov12_0223A7E0(bsys);
    OpponentData *opponentData = ov12_0223A7E8(bsys, ctx->battlerIdFainted);

    BattleScriptIncrementPointer(ctx, 1);

    adrs = BattleScriptReadWord(ctx);

    if ((opponentData->unk195 & 1) && !(unkA & 0x2A4)) {
        int expMonsCnt = 0;
        int expShareMonsCnt = 0;
        u16 totalExp;
        u16 itemNo;
        POKEMON *mon;
        for (int i = 0; i < GetPartyCount(ov12_0223A7F4(bsys, 0)); i++) {
            mon = ov12_0223A880(bsys, 0, i);
            if (GetMonData(mon, MON_DATA_SPECIES, 0) && GetMonData(mon, MON_DATA_HP, 0)) {
                if (ctx->unk_A4[(ctx->battlerIdFainted >> 1) & 1] & MaskOfFlagNo(i)) {
                    expMonsCnt++;
                }
                itemNo = GetMonData(mon, 6, 0);
                if (ov12_02257E74(ctx, itemNo, 1) == 51) {
                    expShareMonsCnt++;
                }
            }
        }
        totalExp = GetMonBaseStat(ctx->battleMons[ctx->battlerIdFainted].species, 9);
        totalExp = (totalExp * ctx->battleMons[ctx->battlerIdFainted].level) / 7;
        if (expShareMonsCnt) {
            ctx->unk_9C = (totalExp / 2) / expMonsCnt;
            if (ctx->unk_9C == 0) {
                ctx->unk_9C = 1;
            }
            ctx->unk_A0 = (totalExp / 2) / expShareMonsCnt;
            if (ctx->unk_A0 == 0) {
                ctx->unk_A0 = 1;
            }
        } else {
            ctx->unk_9C = totalExp / expMonsCnt;
            if (ctx->unk_9C == 0) {
                ctx->unk_9C = 1;
            }
            ctx->unk_A0 = 0;
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

//TODO: Declare as a system task in appropriate header
void ov12_02245898();

BOOL BtlCmd_InitGetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->unk_178 = AllocFromHeap(5, sizeof(UnkBtlCtxSub_67));

    ctx->unk_178->bsys = bsys;
    ctx->unk_178->ctx = ctx;
    ctx->unk_178->unk28 = 0;
    ctx->unk_178->unk30[6] = 0;

    CreateSysTask(ov12_02245898, ctx->unk_178, 0);

    return FALSE;
}

BOOL BtlCmd_GetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ctx->unk_178 == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->unk_3154 = 1;

    return FALSE;
}

BOOL BtlCmd_GetExpLoop(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    BattleScriptReadWord(ctx);
    
    return FALSE;
}

BOOL BtlCmd_ShowParty(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, unkA, unkB;
    int unkC = ov12_0223A7F0(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    unkB = 0;

    for (i = 0; i < unkC; i++) {
        if (ctx->unk_13C[i] & 1) {
            unkB |= MaskOfFlagNo(i);
            ov12_022632DC(bsys, ctx, i, 1, 0, 6);
        }
    }

    for (i = 0; i < unkC; i++) {
        if (ov12_0223A7E0(bsys) == 7) {
            unkA = ov12_0223AB6C(bsys, i);
            if (!(unkB & MaskOfFlagNo(i)) && !(unkB & MaskOfFlagNo(unkA))) {
                unkB |= MaskOfFlagNo(i);
                ov12_02263F30(bsys, i);
            }
        } else {
            if (!(unkB & MaskOfFlagNo(i))) {
                ov12_02263F30(bsys, i);
            }
        }
    }

    for (i = 0; i < unkC; i++) {
        if (ctx->unk_13C[i] & 1) {
            ctx->unk_78 = i;
            break;
        }
    }

    return FALSE;
}

BOOL BtlCmd_WaitForMonSelection(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;

    int unkA = ov12_0223A7F0(bsys);
    int unkB = 0;

    for (i = 0; i < unkA; i++) {
        if (ctx->unk_13C[i] & 1) {
            unkB++;
        }
    }

    for (i = 0; i < unkA; i++) {
        if ((ctx->unk_13C[i] & 1) && ov12_0225682C(ctx, i)) {
            ctx->unk_21A0[i] = ctx->field111_0x378[i][0] - 1;
            unkB--;
            if (!(ctx->unk_2140 & (MaskOfFlagNo(i) << 24))) {
                ctx->unk_2140 |= (MaskOfFlagNo(i) << 24);
                ov12_02263F30(bsys, i);
            }
        }
    }

    if (unkB == 0) {
        for (i = 0; i < unkA; i++) {
            if ((ctx->unk_13C[i] & 1) && ov12_0225682C(ctx, i)) {
                ov12_0223BDDC(bsys, i, ctx->field111_0x378[i][0]);
            }
        }
        ctx->unk_2140 &= 0xf0ffffff;
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->unk_3154 = 1;

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
        battlerId = ctx->unk_78;
        break;
    case B_SIDE_18:
        battlerId = ctx->battlerIdTarget;
        break;
    }

    ctx->unk_13C[battlerId] &= ~1;
    ctx->unk_3108 &= (MaskOfFlagNo(battlerId)^~0);
    ctx->unk_219C[battlerId] = ctx->unk_21A0[battlerId]; 
    ctx->unk_21A0[battlerId] = 6;

    ov12_0224E4FC(bsys, ctx, battlerId, ctx->unk_219C[battlerId]);
    ov12_02256F78(bsys, ctx, battlerId, ctx->unk_219C[battlerId]);

    ctx->unk_3122 = ctx->battleMons[1].hp;

    ov12_022510BC(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_JumpIfCantSwitch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA = ov12_0223A7F0(bsys);
    
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    for (i = 0; i < unkA; i++) {
        if (ctx->unk_13C[i] & 1) {
            ctx->unk_78 = i;
            BattleScriptIncrementPointer(ctx, unkB);
            break;
        }
    }

    return FALSE;
}

void ov12_022465A8(SysTask *task, void *data);

BOOL BtlCmd_47(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);

    ctx->unk_178 = (UnkBtlCtxSub_67*) AllocFromHeap(5, sizeof(UnkBtlCtxSub_67));
    ctx->unk_178->bsys = bsys;
    ctx->unk_178->ctx = ctx;
    ctx->unk_178->unk28 = 0;
    ctx->unk_178->unk24 = unkA;
    ctx->unk_178->unk2C = ItemToBallId(ctx->unk_128);

    CreateSysTask(ov12_022465A8, ctx->unk_178, 0);

    return FALSE;
}

BOOL BtlCmd_48(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (ctx->unk_178 == NULL) {
        BattleScriptIncrementPointer(ctx, 1);
    }

    ctx->unk_3154 = 1;
    
    return FALSE;
}

BOOL BtlCmd_SetMultiHit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);

    if (ctx->unk_217D == 0) {
        if (unkA == 0) {
            if (ov12_022527CC(ctx, ctx->battlerIdAttacker) == 92) {
                unkA = 5;
            } else if ((unkA = ov12_0223BD98(bsys) & 3) < 2) {
                unkA += 2;
            } else {
                unkA = (ov12_0223BD98(bsys) & 3) + 2;
            }
        }
        ctx->unk_217C = unkA;
        ctx->unk_217D = unkA;
        ctx->unk_2188 = unkB;
    }
    
    return FALSE;
}
