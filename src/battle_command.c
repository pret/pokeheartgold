#include "assert.h"
#include "battle.h"
#include "battle_controller.h"
#include "battle_system.h"
#include "item.h"
#include "pokemon.h"
#include "system.h"
#include "unk_0200E320.h"
#include "unk_0208805C.h"
#include "overlay_12_0224E4FC.h"
#include "constants/abilities.h"
#include "constants/battle.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"

static u8 GetBattlerIDBySide(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2);

extern BtlCmdFunc sBattleScriptCommandTable[];

BOOL RunBattleScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BOOL ret;
    
    do {
        ret = sBattleScriptCommandTable[ctx->unk_2700[ctx->unk_B4]](bsys, ctx);
    } while(ctx->unk_3154 == 0 && (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_2) == 0);
    
    ctx->unk_3154 = 0;

    return ret;
}

BOOL BtlCmd_0(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    ov12_022622C8(bsys, FALSE);
    return FALSE;
}

BOOL BtlCmd_1(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);
    switch (BattleScriptReadWord(ctx)) {
    default:
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            ov12_022622F0(bsys, battlerId);
            ov12_0223C288(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        break;
    case B_SIDE_OPPONENT:
        OpponentData *opponentData;
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_022622F0(bsys, battlerId);
                ov12_0223C288(bsys, battlerId);  
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_PokemonSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            ov12_022623F0(bsys, battlerId);
            ov12_0223C288(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_022623F0(bsys, battlerId);
                ov12_0223C288(bsys, battlerId);
            }
        }
        ov12_02250370(bsys, ctx, 1);
        ov12_02250370(bsys, ctx, 3);
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02250360(ctx, battlerId);
                ov12_02250370(bsys, ctx, battlerId);
                ov12_022623F0(bsys, battlerId);
                ov12_0223C288(bsys, battlerId);
            }
        }
        break;
    case B_SIDE_1:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdAttacker);
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
    case B_SIDE_2:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdTarget);
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
    case B_SIDE_6:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->unk_78);
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
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            ov12_02262524(bsys, battlerId, 0, 0);
            ov12_0223C288(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (!(opponentData->unk195 & 1)) {
                ov12_02262524(bsys, battlerId, 0, 0);
                ov12_0223C288(bsys, battlerId);
            }
        }
        ov12_02250370(bsys, ctx, 1);
        ov12_02250370(bsys, ctx, 3);
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02250360(ctx, battlerId);
                ov12_02250370(bsys, ctx, battlerId);
                ov12_02262524(bsys, battlerId, 0, 0);
                ov12_0223C288(bsys, battlerId);
            }
        }
        break;
    case 1:
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdAttacker);
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
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdTarget);
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
        opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->unk_78);
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
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            ov12_02262734(bsys, ctx, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                ov12_02262734(bsys, ctx, battlerId);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1 && !(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
                ov12_02262734(bsys, ctx, battlerId);
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
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    switch (BattleScriptReadWord(ctx)) {
    case 0:
    default:
        if (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_4) {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
                if (opponentData->unk195 != 4) {
                    ov12_02262974(bsys, battlerId);
                }
            }
        } else {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                if ((BattleSys_GetBattleType(bsys) & BATTLE_TYPE_3) == 0 &&
                    (BattleSys_GetBattleType(bsys) & BATTLE_TYPE_1) &&
                    (battlerId > 1)) {
                    break;
                }
                ov12_02262974(bsys, battlerId);
            }
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_02262974(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02262974(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 16) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ThrowPokeball(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                (BattleSys_GetBattleType(bsys) & 2) &&
                (battlerId > 1)) {
                break;
            }
            BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitThrowPokeball(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 16) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
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
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                (BattleSys_GetBattleType(bsys) & 2) &&
                (battlerId > 1)) {
                break;
            }
            ov12_022629DC(bsys, battlerId);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_022629DC(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_022629DC(bsys, battlerId);
                if ((BattleSys_GetBattleType(bsys) & 8) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 16) == 0 &&
                    (BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                ov12_022629DC(bsys, battlerId);
                break;
            }
        }
        break;
    case 10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                ov12_022629DC(bsys, battlerId);
                break;
            }
        }
        break;
    case 11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                ov12_022629DC(bsys, battlerId);
                break;
            }
        }
        break;
    case 12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                ov12_022629DC(bsys, battlerId);
                break;
            }
        }
        break;
    }
    
    return FALSE;
}

BOOL BtlCmd_9(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);
    u32 unkC = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((BattleSys_GetBattleType(bsys) & 2) && (battlerId > 1)) {
                break;
            }
            ov12_022629F8(bsys, battlerId, unkC);
        }
        break;
    case 3:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == FALSE) {
                ov12_022629F8(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 4:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_022629F8(bsys, battlerId, unkC);
                if ((BattleSys_GetBattleType(bsys) & 2)) {
                    break;
                }
            }
        }
        break;
    case 9:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 0 || opponentData->unk195 == 2) {
                ov12_022629F8(bsys, battlerId, unkC);
                break;
            }
        }
        break;
    case 10:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 1 || opponentData->unk195 == 3) {
                ov12_022629F8(bsys, battlerId, unkC);
                break;
            }
        }
        break;
    case 11:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 4) {
                ov12_022629F8(bsys, battlerId, unkC);
                break;
            }
        }
        break;
    case 12:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 == 5) {
                ov12_022629F8(bsys, battlerId, unkC);
                break;
            }
        }
        break;
    }
    
    return FALSE;
}

BOOL BtlCmd_10(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    BattleScriptIncrementPointer(ctx, 1);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        ov12_02263CB0(bsys, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_HealthbarSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_12(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;
    u8 delay;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    delay = 0;

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, 0);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                BattleController_EmitHealthbarSlideIn(bsys, ctx, battlerId, delay);
                delay += 4;
            }
        }
        break;
    default:
        BattleController_EmitHealthbarSlideIn(bsys, ctx, GetBattlerIDBySide(bsys, ctx, side), 0);
        break;
    }
    
    return FALSE;
}

BOOL BtlCmd_13(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);
    int side = BattleScriptReadWord(ctx);

    switch (side) {
    case B_SIDE_ALL:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            ov12_02262B64(bsys, battlerId);
        }
        break;
    case B_SIDE_PLAYER:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if ((opponentData->unk195 & 1) == 0 && (ctx->unk_3108 & MaskOfFlagNo(battlerId)) == 0) {
                ov12_02262B64(bsys, battlerId);
            }
        }
        break;
    case B_SIDE_OPPONENT:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
            if (opponentData->unk195 & 1) {
                ov12_02262B64(bsys, battlerId);
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

static void DamageCalcDefault(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int type;

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        type = TYPE_NORMAL;
    } else if (ctx->moveType) {
        type = ctx->moveType;
    } else {
        type = ctx->unk_334.moveData[ctx->moveNoCur].type;
    }

    ctx->damage = ov12_02256FF8(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget)], ctx->unk_180, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

    ctx->damage *= ctx->criticalMultiplier;

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_HP_DRAIN_ON_ATK) {
        ctx->damage = ctx->damage * (100 + ov12_02255844(ctx, ctx->battlerIdAttacker, 0))/100;
    }

    if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_BOOST_REPEATED) {
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
        BattleController_EmitPrintAttackMessage(bsys, ctx);
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
    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintMessage2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BATTLEMSGDATA msgdata;
    BATTLEMSG msg;

    BattleScriptIncrementPointer(ctx, 1);

    InitBattleMsgData(ctx, &msgdata);
    InitBattleMsg(bsys, ctx, &msgdata, &msg);

    msg.unk1 |= 128;

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleController_EmitPrintMessage(bsys, ctx, &ctx->buffMsg);
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

    BattleController_EmitPrintMessage(bsys, ctx, &msg);

    return FALSE;
}

BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 move;
    
    BattleScriptIncrementPointer(ctx, 1);
    u32 battler = BattleScriptReadWord(ctx);

    if (battler == 255) {
        move = ctx->moveWork;
    } else {
        move = ctx->moveNoCur;
    }

    if ((!(ctx->unk_213C & (1 << 14)) && ov12_0223B6D4(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->unk_213C |= (1 << 14);
        ov12_0226340C(bsys, ctx, move);
    }

    if (!ov12_0223B6D4(bsys)) {
        BattleScriptGotoSubscript(ctx, 1, 0x123);
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
        move = ctx->moveWork;
    } else {
        move = ctx->moveNoCur;
    }

    u32 attacker = GetBattlerIDBySide(bsys, ctx, attackerSide);
    u32 defender = GetBattlerIDBySide(bsys, ctx, defenderSide);

    if ((!(ctx->unk_213C & (1 << 14)) && ov12_0223B6D4(bsys) == TRUE) || move == MOVE_TRANSFORM) {
        ctx->unk_213C |= (1 << 14);
        ov12_0226343C(bsys, ctx, move, attacker, defender);
    }

    if (!ov12_0223B6D4(bsys)) {
        BattleScriptGotoSubscript(ctx, 1, 0x123);
    }

    return FALSE;
}

BOOL BtlCmd_MonFlicker(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u32 side = BattleScriptReadWord(ctx);

    BattleController_EmitMonFlicker(bsys, GetBattlerIDBySide(bsys, ctx, side), ctx->unk_216C);

    return FALSE;
}

BOOL BtlCmd_HealthbarDataUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u8 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    if ((ctx->battleMons[battlerId].hp + ctx->hpCalcWork) <= 0) {
        ctx->unk_2148 = ctx->battleMons[battlerId].hp * -1;
    } else {
        ctx->unk_2148 = ctx->hpCalcWork;
    }

    if (ctx->unk_2148 < 0) {
        ctx->unk_164[battlerId] += (-1*ctx->unk_2148);
    }

    ctx->battleMons[battlerId].hp += ctx->hpCalcWork;

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
    
    BattleController_EmitHealthbarUpdate(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

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

    if (!(BattleSys_GetBattleType(bsys) & 4)) {
        if (gSystem.newKeys & 0xC03 || System_GetTouchNew()) {
            //TODO: Rename variable in struct
            ctx->unk_F0 = waitFrames;
        }
    }
    
    if (bsys->battleTypeFlags & 4 && !(bsys->unk240C & 16)) {
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

    BattleController_EmitPlaySE(bsys, ctx, sound, GetBattlerIDBySide(bsys, ctx, side));

    return FALSE;
}

BOOL BtlCmd_If(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 operator = BattleScriptReadWord(ctx);
    u32 unkA = BattleScriptReadWord(ctx);
    int cmp = BattleScriptReadWord(ctx);
    u32 adrs = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, unkA);

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

    int var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), unkA, 0);

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

    BattleController_EmitFadeOutBattle(bsys, ctx);

    return FALSE;
}

BOOL BtlCmd_JumpToSubSeq(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_02245518(ctx, 1, BattleScriptReadWord(ctx));

    return FALSE;
}

BOOL BtlCmd_JumpToCurMoveEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_02245518(ctx, 30, ctx->unk_334.moveData[ctx->moveNoCur].effect);

    return FALSE;
}

BOOL BtlCmd_JumpToEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->unk_213C &= ~1;
    ctx->unk_213C &= 0xffffbfff;

    ctx->moveNoCur = ctx->moveWork;

    if (unkA == 0) {
        //TODO: Define these functions in a header or leave them until you reach them here
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->moveWork, 1, 0);
        ov12_02250A18(bsys, ctx, ctx->battlerIdAttacker, (u16)ctx->moveWork);
        ctx->unk_21A8[ctx->battlerIdAttacker][1] = ctx->battlerIdTarget;
    }

    if (ctx->battlerIdTarget == 255) {
        ctx->unk_C = 39;
        ov12_02245518(ctx, 1, 281);
    } else {
        ov12_02245518(ctx, 0, ctx->moveNoCur);
    }

    return FALSE;
}

BOOL BtlCmd_CritCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if ((BattleSys_GetBattleType(bsys) & (1 << 10)) || (ov12_0223B514(bsys) & 1)) {
        ctx->criticalMultiplier = 1;
    } else {
        ctx->criticalMultiplier = ov12_02257C5C(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->unk_214C, ov12_022581D4(bsys, ctx, 0, ctx->battlerIdTarget));
    }

    return FALSE;
}

BOOL BtlCmd_ShouldGetExp(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int adrs;
    u32 unkA = BattleSys_GetBattleType(bsys);
    OpponentData *opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, ctx->battlerIdFainted);

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

static void ov12_02245898(SysTask *task, void *data);

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
    int battlerId, unkA, unkB;
    int unkC = BattleSys_GetMaxBattlers(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    unkB = 0;

    for (battlerId = 0; battlerId < unkC; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            unkB |= MaskOfFlagNo(battlerId);
            ov12_022632DC(bsys, ctx, battlerId, 1, 0, 6);
        }
    }

    for (battlerId = 0; battlerId < unkC; battlerId++) {
        if (BattleSys_GetBattleType(bsys) == 7) {
            unkA = ov12_0223AB6C(bsys, battlerId);
            if (!(unkB & MaskOfFlagNo(battlerId)) && !(unkB & MaskOfFlagNo(unkA))) {
                unkB |= MaskOfFlagNo(battlerId);
                ov12_02263F30(bsys, battlerId);
            }
        } else {
            if (!(unkB & MaskOfFlagNo(battlerId))) {
                ov12_02263F30(bsys, battlerId);
            }
        }
    }

    for (battlerId = 0; battlerId < unkC; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            ctx->unk_78 = battlerId;
            break;
        }
    }

    return FALSE;
}

BOOL BtlCmd_WaitForMonSelection(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;

    int unkA = BattleSys_GetMaxBattlers(bsys);
    int unkB = 0;

    for (battlerId = 0; battlerId < unkA; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            unkB++;
        }
    }

    for (battlerId = 0; battlerId < unkA; battlerId++) {
        if ((ctx->unk_13C[battlerId] & 1) && ov12_0225682C(ctx, battlerId)) {
            ctx->unk_21A0[battlerId] = ctx->field111_0x378[battlerId][0] - 1;
            unkB--;
            if (!(ctx->unk_2140 & (MaskOfFlagNo(battlerId) << 24))) {
                ctx->unk_2140 |= (MaskOfFlagNo(battlerId) << 24);
                ov12_02263F30(bsys, battlerId);
            }
        }
    }

    if (unkB == 0) {
        for (battlerId = 0; battlerId < unkA; battlerId++) {
            if ((ctx->unk_13C[battlerId] & 1) && ov12_0225682C(ctx, battlerId)) {
                ov12_0223BDDC(bsys, battlerId, ctx->field111_0x378[battlerId][0]);
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
    int battlerId;
    int unkA = BattleSys_GetMaxBattlers(bsys);
    
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    for (battlerId = 0; battlerId < unkA; battlerId++) {
        if (ctx->unk_13C[battlerId] & 1) {
            ctx->unk_78 = battlerId;
            BattleScriptIncrementPointer(ctx, unkB);
            break;
        }
    }

    return FALSE;
}

static void ov12_022465A8(SysTask *task, void *data);

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
            if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == 92) {
                unkA = 5;
            } else if ((unkA = BattleSys_Random(bsys) & 3) < 2) {
                unkA += 2;
            } else {
                unkA = (BattleSys_Random(bsys) & 3) + 2;
            }
        }
        ctx->unk_217C = unkA;
        ctx->unk_217D = unkA;
        ctx->unk_2188 = unkB;
    }
    
    return FALSE;
}

BOOL BtlCmd_ChangeVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, unkB);

    switch (operator) {
    case 7:
        *var = val;
        break;
    case 8:
        *var += val;
        break;
    case 9:
        *var -= val;
        break;
    case 10:
        *var |= val;
        break;
    case 11:
        *var &= (val ^ ~0);
        break;
    case 12:
        *var *= val;
        break;
    case 13:
        *var /= val;
        break;
    case 14:
        *var <<= val;
        break;
    case 15:
        u32 uvar = *var;
        *var = uvar >> val;
        break;
    case 16:
        *var = MaskOfFlagNo(val);
        break;
    case 17:
        GF_ASSERT(FALSE);
        break;
    case 18:
        *var -= val;
        if (*var < 0) {
            *var = 0;
        }
        break;
    case 19:
        *var ^= val;
        break;
    case 20:
        *var &= val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_BufferStatChangeMsg(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int change, stat;
    BATTLEMON *mon = &ctx->battleMons[ctx->battlerIdStatChange];
    
    BattleScriptIncrementPointer(ctx, 1);

    int unkA = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int unkD = 0;

    ctx->unk_213C &= 0xFFFDFFFF;

    if (ctx->unk_8C >= 46) {
        stat = ctx->unk_8C - 46;
        change = -2;
        ctx->tempWork = 13;
    } else if (ctx->unk_8C >= 39) {
        stat = ctx->unk_8C - 39;
        change = 2;
        ctx->tempWork = 12;
    } else if (ctx->unk_8C >= 22) {
        stat = ctx->unk_8C - 22;
        change = -1;
        ctx->tempWork = 13;
    } else {
        stat = ctx->unk_8C - 15;
        change = 1;
        ctx->tempWork = 12;
    }

    if (change > 0) { //Stat Increase
        if (mon->statChanges[stat + 1] == 12) {
            ctx->unk_213C |= (1 << 17);
            if (ctx->unk_88 == 3 || ctx->unk_88 == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
            } else {
                ctx->buffMsg.unk2 = 142;
                ctx->buffMsg.unk1 = 12;
                ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.unk4[1] = stat + 1;
                BattleScriptIncrementPointer(ctx, unkA);
            }
        } else {
            if (ctx->unk_88 == 3) {
                ctx->buffMsg.unk2 = 0x26E;
                ctx->buffMsg.unk1 = 39;
                ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdStatChange].unk27;
                ctx->buffMsg.unk4[2] = stat + 1;
            } else if (ctx->unk_88 == 5) {
                ctx->buffMsg.unk2 = 0x2F4;
                ctx->buffMsg.unk1 = 45;
                ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.unk4[1] = ctx->unk_128;
                ctx->buffMsg.unk4[2] = stat + 1;
            } else {
                ctx->buffMsg.unk2 = (change == 1) ? 0x2EE:0x2F1;
                ctx->buffMsg.unk1 = 12;
                ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                ctx->buffMsg.unk4[1] = stat + 1;
            }
            mon->statChanges[stat + 1] += change;
            if (mon->statChanges[stat + 1] > 12) {
                mon->statChanges[stat + 1] = 12;
            }
        }
    } else { //Stat Decrease
        if (!(ctx->unk_90 & (1 << 27))) {
            if (ctx->battlerIdAttacker != ctx->battlerIdStatChange) {
                //Mist
                if(ctx->fieldSideConditionData[BattleSys_GetFieldSide(bsys, ctx->battlerIdStatChange)].mistTurns) {
                    ctx->buffMsg.unk2 = 273;
                    ctx->buffMsg.unk1 = 2;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    unkD = 1;
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_CLEAR_BODY) == TRUE || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_WHITE_SMOKE) == TRUE) {
                if (ctx->unk_88 == 3) {
                    ctx->buffMsg.unk2 = 0x2D7;
                    ctx->buffMsg.unk1 = 53;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdStatChange].unk27;
                    ctx->buffMsg.unk4[2] = ov12_022522E0(ctx, ctx->battlerIdAttacker);
                    ctx->buffMsg.unk4[3] = ctx->battleMons[ctx->battlerIdAttacker].unk27;
                } else {
                    ctx->buffMsg.unk2 = 0x29D;
                    ctx->buffMsg.unk1 = 11;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdStatChange].unk27;
                }
                unkD = TRUE;
            } else if ((CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_KEEN_EYE) == TRUE && (1 + stat) == 6) ||
                       (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_HYPER_CUTTER) == TRUE && (1 + stat) == 1)) {
                if (ctx->unk_88 == 3) {
                    ctx->buffMsg.unk2 = 0x2D7;
                    ctx->buffMsg.unk1 = 53;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdStatChange].unk27;
                    ctx->buffMsg.unk4[2] = ov12_022522E0(ctx, ctx->battlerIdAttacker);
                    ctx->buffMsg.unk4[3] = ctx->battleMons[ctx->battlerIdAttacker].unk27;
                } else {
                    ctx->buffMsg.unk2 = 704;
                    ctx->buffMsg.unk1 = 39;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdStatChange].unk27;
                    ctx->buffMsg.unk4[2] = stat + 1;
                }
                unkD = TRUE;
                }
                else if (mon->statChanges[1 + stat] == 0) {
                    ctx->unk_213C |= (1 << 17);
                    if (ctx->unk_88 == 2 || ctx->unk_88 == 3) {
                        BattleScriptIncrementPointer(ctx, unkB);
                        return FALSE;
                    } else {
                        ctx->buffMsg.unk2 = 145;
                        ctx->buffMsg.unk1 = 12;
                        ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                        ctx->buffMsg.unk4[1] = stat + 1;
                        BattleScriptIncrementPointer(ctx, unkA);
                        return FALSE;
                    }
                } else if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdStatChange, ABILITY_SHIELD_DUST) == TRUE && ctx->unk_88 == 2) {
                    unkD = 1;
                } else if (ctx->battleMons[ctx->battlerIdStatChange].status2 &  (1 << 24)){
                    unkD = 2;
                } 
            } else if (mon->statChanges[1 + stat] == 0) {
                ctx->unk_213C |= (1 << 17);
                if (ctx->unk_88 == 2 || ctx->unk_88 == 3) {
                    BattleScriptIncrementPointer(ctx, unkB);
                    return FALSE;
                } else {
                    ctx->buffMsg.unk2 = 145;
                    ctx->buffMsg.unk1 = 12;
                    ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
                    ctx->buffMsg.unk4[1] = stat + 1;
                    BattleScriptIncrementPointer(ctx, unkA);
                    return FALSE;
                }
            }
            if (unkD == 2 && ctx->unk_88 == 1) {
                BattleScriptIncrementPointer(ctx, unkC);
                return FALSE;
            } else if (unkD && ctx->unk_88 == 2) {
                BattleScriptIncrementPointer(ctx, unkB);
                return FALSE;
            } else if (unkD) {
                BattleScriptIncrementPointer(ctx, unkA);
                return FALSE;
            }
        }
        if (ctx->unk_88 == 3) {
            ctx->buffMsg.unk2 = 0x296;
            ctx->buffMsg.unk1 = 54;
            ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdAttacker);
            ctx->buffMsg.unk4[1] = ctx->battleMons[ctx->battlerIdAttacker].unk27;
            ctx->buffMsg.unk4[2] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.unk4[3] = stat + 1;
        } else {
            ctx->buffMsg.unk2 = (change == -1) ? 0x2FA:0x2FD;
            ctx->buffMsg.unk1 = 12;
            ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdStatChange);
            ctx->buffMsg.unk4[1] = stat + 1;           
        }
        mon->statChanges[stat + 1] += change;
        if (mon->statChanges[stat + 1] < 0) {
            mon->statChanges[stat + 1] = 0;
        }
    }

    return FALSE;
}

//TODO: Move to above of file once defined as static
void ov12_02248648(BATTLECONTEXT *ctx, u8 a1, u8 a2);

BOOL BtlCmd_ChangeMonDataVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int val = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int var = GetBattlerVar(ctx, battlerId, unkB, 0);

    switch (operator) {
    case 7:
        var = val;
        break;
    case 8:
        var += val;
        break;
    case 9:
        var -= val;
        break;
    case 10:
        var |= val;
        break;
    case 11:
        var &= (val ^ ~0);
        break;
    case 12:
        var *= val;
        break;
    case 13:
        var /= val;
        break;
    case 14:
        var <<= val;
        break;
    case 15:
        u32 uvar = var;
        var = uvar >> val;
        break;
    case 16:
        var = MaskOfFlagNo(val);
        break;
    case 17:
        GF_ASSERT(FALSE);
        break;
    case 18:
        var -= val;
        if (var < 0) {
            var = 0;
        }
        break;
    case 19:
        var ^= val;
        break;
    case 20:
        var &= val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    if (unkB == 26) {
        ov12_02248648(ctx, battlerId, var);
    }

    SetBattlerVar(ctx, battlerId, unkB, &var);
    ov12_02250C40(bsys, ctx, battlerId);

    return FALSE;
}

BOOL BtlCmd_53(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int var = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ctx->unk_218C[battlerId] |= var;

    return FALSE;
}

BOOL BtlCmd_ToggleVanish(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int unkA = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    ov12_02263738(bsys, battlerId, unkA);

    return FALSE;
}

BOOL BtlCmd_CheckAbility(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    
    BattleScriptIncrementPointer(ctx, 1);
    
    int unkA = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int ability = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    if (side == B_SIDE_ALL) {
        int unkB = BattleSys_GetMaxBattlers(bsys);

        for (battlerId = 0; battlerId < unkB; battlerId++) {
            if (unkA == 0) {
                if (GetBattlerAbility(ctx, battlerId) == ability) {
                    BattleScriptIncrementPointer(ctx, adrs);
                    ctx->battlerIdAbility = battlerId;
                    break;
                }
            } else if (GetBattlerAbility(ctx, battlerId) == ability) {
                break;
            }
        }
    } else {
        battlerId = GetBattlerIDBySide(bsys, ctx, side);

        if (unkA == 0) {
            if (GetBattlerAbility(ctx, battlerId) == ability) {
                BattleScriptIncrementPointer(ctx, adrs);
                ctx->battlerIdAbility = battlerId;
            }
        } else if (GetBattlerAbility(ctx, battlerId) != ability) {
                BattleScriptIncrementPointer(ctx, adrs);
                ctx->battlerIdAbility = battlerId;
        }
    }

    return FALSE;
}

BOOL BtlCmd_Random(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int modulo = BattleScriptReadWord(ctx);
    modulo += 1;

    int x0 = BattleScriptReadWord(ctx);

    ctx->calcWork = BattleSys_Random(bsys) % modulo + x0;

    return FALSE;
}

BOOL BtlCmd_ChangeVar2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int *var = BattleScriptGetVarPointer(bsys, ctx, unkB);
    int *val = BattleScriptGetVarPointer(bsys, ctx, unkC);

    switch (operator) {
    case 7:
        *var = *val;
        break;
    case 8:
        *var += *val;
        break;
    case 9:
        *var -= *val;
        break;
    case 10:
        *var |= *val;
        break;
    case 11:
        *var &= (*val ^ ~0);
        break;
    case 12:
        *var *= *val;
        break;
    case 13:
        *var /= *val;
        break;
    case 14:
        *var <<= *val;
        break;
    case 15:
        u32 uvar = *var;
        *var = uvar >> *val;
        break;
    case 16:
        *var = MaskOfFlagNo(*val);
        break;
    case 17:
        *val = *var;
        break;
    case 18:
        *var -= *val;
        if (*var < 0) {
            *var = 0;
        }
        break;
    case 19:
        *var ^= *val;
        break;
    case 20:
        *var &= *val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

BOOL BtlCmd_ChangeMonDataByVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int unkB = BattleScriptReadWord(ctx);
    int unkC = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);

    int var = GetBattlerVar(ctx, battlerId, unkB, 0);
    int *val = BattleScriptGetVarPointer(bsys, ctx, unkC);

    switch (operator) {
    case 7:
        var = *val;
        break;
    case 8:
        var += *val;
        break;
    case 9:
        var -= *val;
        break;
    case 10:
        var |= *val;
        break;
    case 11:
        var &= (*val ^ ~0);
        break;
    case 12:
        var *= *val;
        break;
    case 13:
        var /= *val;
        break;
    case 14:
        var <<= *val;
        break;
    case 15:
        u32 uvar = var;
        var = uvar >> *val;
        break;
    case 16:
        var = MaskOfFlagNo(*val);
        break;
    case 17:
        *val = var;
        break;
    case 18:
        var -= *val;
        if (var < 0) {
            var = 0;
        }
        break;
    case 19:
        var ^= *val;
        break;
    case 20:
        var &= *val;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    if (operator != 17) {
        if (unkB == 26) {
            ov12_02248648(ctx, battlerId, var);
        }
        SetBattlerVar(ctx, battlerId, unkB, &var);
        ov12_02250C40(bsys, ctx, battlerId);
    }

    return FALSE;
}

BOOL BtlCmd_Goto(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptIncrementPointer(ctx, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_GotoSubscript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    BattleScriptGotoSubscript(ctx, 1, BattleScriptReadWord(ctx));
    return FALSE;
}

BOOL BtlCmd_GotoSubscriptVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int *var = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));
    BattleScriptGotoSubscript(ctx, 1, *var);
    return FALSE;
}

BOOL BtlCmd_SetMoveToMirrorMove(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int move = 0;
    int unkA = BattleSys_GetBattleType(bsys);

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->field123_0xe0c[ctx->battlerIdAttacker]) {
        move = ctx->field123_0xe0c[ctx->battlerIdAttacker];
    } else if (unkA & 2) {
        move = ctx->field124_0xe14[ctx->battlerIdAttacker][0] +
               ctx->field124_0xe14[ctx->battlerIdAttacker][1] +
               ctx->field124_0xe14[ctx->battlerIdAttacker][2] +
               ctx->field124_0xe14[ctx->battlerIdAttacker][3];
        if (move) {
            do {
                move = ctx->field124_0xe14[ctx->battlerIdAttacker][BattleSys_Random(bsys) % 4];
            } while (!move);
        }
    }
    if (move && ov12_02257DFC(ctx, move) == TRUE) {
        ctx->unk_213C &= ~1;
        ctx->unk_213C &= 0xFFFFBFFF;
        ctx->moveNoCur = move;
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, move, 1, 0);
        if (ctx->battlerIdTarget == 255) {
            ctx->unk_C = 39;
            ov12_02245518(ctx, 1, 281);
        } else {
            ctx->unk_21A8[ctx->battlerIdAttacker][1] = ctx->battlerIdTarget;
            ov12_02245518(ctx, 0, move);
        }
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].unk0_0 = 1;
    }

    return FALSE;
}

BOOL BtlCmd_ResetAllStatChanges(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int stat, battlerId;

    BattleScriptIncrementPointer(ctx, 1);
    
    int battlersMax = BattleSys_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        for (stat = 0; stat < 8; stat++) {
            ctx->battleMons[battlerId].statChanges[stat] = 6;
        }
        ctx->battleMons[battlerId].status2 &= 0xffefffff;
    }

    return FALSE;
}

BOOL BtlCmd_64(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_02250C70(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_65(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    ov12_02250CA0(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_SetHealthbarStatus(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    BattleController_EmitHealthbarStatus(bsys, GetBattlerIDBySide(bsys, ctx, side), status);

    return FALSE;
}

BOOL BtlCmd_PrintTrainerMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int msg = BattleScriptReadWord(ctx);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, side), msg);

    return FALSE;
}

extern u16 sPrizeMoneyTbl[0x81][2];

u32 ov12_0223FB34(BattleSystem *bsys, BATTLECONTEXT *ctx, int trainerIndex) {
    int i;
    TRPOKE *trPoke;
    u32 prizeMoney;
    u8 level = 0;
    u8 trainerClass;
    TRAINER trainer;

    trPoke = AllocFromHeap(5, sizeof(TRPOKE)*6);

    TrainerData_ReadTrData(bsys->trainerId[trainerIndex], &trainer);
    TrainerData_ReadTrPoke(bsys->trainerId[trainerIndex], trPoke);

    switch (trainer.trainerType) {
    default:
    case 0:
        TRPOKE_NOITEM_DFLTMOVES *pokeDef = (TRPOKE_NOITEM_DFLTMOVES *)trPoke;
        level = pokeDef[trainer.npoke-1].level;
        break;
    case 1:
        TRPOKE_NOITEM_CUSTMOVES *pokeCust = (TRPOKE_NOITEM_CUSTMOVES *)trPoke;
        level = pokeCust[trainer.npoke-1].level;
        break;
    case 2:
        TRPOKE_ITEM_DFLTMOVES *pokeItem = (TRPOKE_ITEM_DFLTMOVES *)trPoke;
        level = pokeItem[trainer.npoke-1].level;
        break;
    case 3:
        TRPOKE_ITEM_CUSTMOVES *pokeCustItem = (TRPOKE_ITEM_CUSTMOVES *)trPoke;
        level = pokeCustItem[trainer.npoke-1].level;
        break;
    }

    i = 0;
    trainerClass = trainer.trainerClass;

    do {
        if (trainerClass != sPrizeMoneyTbl[i][0]) {
            i++;
            if (i < (int)NELEMS(sPrizeMoneyTbl)) continue;
        }

        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            GF_ASSERT(FALSE);
        }
        if (i >= (int)NELEMS(sPrizeMoneyTbl)) {
            i = 2;
        }
        if (bsys->battleTypeFlags & 16 || bsys->battleTypeFlags == 75) {
            prizeMoney = level*4*ctx->unk_2168*sPrizeMoneyTbl[i][1];
            break;
        } else if (bsys->battleTypeFlags & 2) {
            prizeMoney = level*4*ctx->unk_2168*2*sPrizeMoneyTbl[i][1];
            break;
        } else {
            prizeMoney = level*4*ctx->unk_2168*sPrizeMoneyTbl[i][1];
            break;
        }
        
    } while (TRUE);

    FreeToHeap(trPoke);

    return prizeMoney;
}

BOOL BtlCmd_CalcPrizeMoney(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 prizeMoney;

    BattleScriptIncrementPointer(ctx, 1);

    if (bsys->battleOutcomeFlag == 1) {
        prizeMoney = ov12_0223FB34(bsys, ctx, 1);
        if (bsys->battleTypeFlags & 16 || bsys->battleTypeFlags == 0x4b) {
            prizeMoney += ov12_0223FB34(bsys, ctx, 3);
        }
        PlayerProfile_AddMoney(BattleSys_GetPlayerProfile(bsys, 0), prizeMoney);
    } else {
        prizeMoney = ov12_0223C24C(bsys->trainerParty[0], bsys->unk48[0]);
        PlayerProfile_SubMoney(BattleSys_GetPlayerProfile(bsys, 0), prizeMoney);
    }

    if (prizeMoney) {
        ctx->msgWork = prizeMoney;
    } else {
        ctx->msgWork = 0;
    }

    ctx->tempWork = bsys->unk2474_1;

    return FALSE;
}

BOOL BtlCmd_SetStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (ov12_0223B6D4(bsys) == TRUE || status == 15 || status == 16 || status == 25 || status == 26) {
        int battlerId = GetBattlerIDBySide(bsys, ctx, side);
        if (ov12_02257F54(ctx, battlerId, status) == TRUE) {
            ov12_02263848(bsys, ctx, battlerId, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_CopyStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int sideA = BattleScriptReadWord(ctx);
    int sideB = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    if (ov12_0223B6D4(bsys) == TRUE || status == 15 || status == 16 || status == 26 || status == 25) {
        int battlerIdA = GetBattlerIDBySide(bsys, ctx, sideA);
        int battlerIdB = GetBattlerIDBySide(bsys, ctx, sideB);      
        if (ov12_02257F54(ctx, battlerIdA, status) == TRUE && ov12_02257F54(ctx, battlerIdB, status) == TRUE) {
            ov12_02263878(bsys, ctx, battlerIdA, battlerIdB, status);
        }
    }

    return FALSE;
}

BOOL BtlCmd_SetStatus2EffectVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int status = BattleScriptReadWord(ctx);

    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int *data = BattleScriptGetVarPointer(bsys, ctx, status);

    if (ov12_0223B6D4(bsys) == TRUE || status == 15 || status == 16 || *data == 25 || *data == 26) {
        if (ov12_02257F54(ctx, battlerId, *data) == TRUE) {
            ov12_02263848(bsys, ctx, battlerId, *data);
        }
    }

    return FALSE;
}

BOOL BtlCmd_ReturnMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintReturnMessage(bsys, ctx, battlerId, ctx->unk_219C[battlerId]);

    return FALSE;
}

BOOL BtlCmd_SendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    BattleController_EmitPrintSendOutMessage(bsys, ctx, battlerId, ctx->unk_219C[battlerId]);

    return FALSE;
}

BOOL BtlCmd_EncounterMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintEncounterMessage(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_75(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ov12_02263950(bsys, ctx, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)));

    return FALSE;
}

BOOL BtlCmd_TrainerMessageVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)), ctx->msgWork);

    return FALSE;
}

BOOL BtlCmd_TryConversion(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, cnt, moveType;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    for (cnt = 0; cnt < 4; cnt++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[cnt] == 0) {
            break;
        }
    }

    for (i = 0; i < cnt; i++) {
        if (ctx->battleMons[ctx->battlerIdAttacker].moves[i] != MOVE_CONVERSION) {
            moveType = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
            if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != moveType && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != moveType) {
                break;
            }
        }
    }

    if (i == cnt) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            do {
                i = BattleSys_Random(bsys) % cnt;
            } while(ctx->battleMons[ctx->battlerIdAttacker].moves[i] == MOVE_CONVERSION);
            moveType = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].type;
            if (moveType == TYPE_MYSTERY) {
                if (GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == TYPE_GHOST || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == TYPE_GHOST) {
                    moveType = TYPE_GHOST;
                } else {
                    moveType = TYPE_NORMAL;
                }
            }
        } while(GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) == moveType || GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) == moveType);
        ctx->battleMons[ctx->battlerIdAttacker].type1 = moveType;
        ctx->battleMons[ctx->battlerIdAttacker].type2 = moveType;
        ctx->msgWork = moveType;
    }

    return FALSE;
}

BOOL BtlCmd_Compare(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 *var = BattleScriptGetVarPointer(bsys, ctx, varNo);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

    switch (operator) {
    case 0:
        if (*var != *cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (*var == *cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (*var <= *cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (*var > *cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if ((*var & *cmp) == 0) {
            adrs = 0;
        }
        break;
    case 5:
        if (*var & *cmp) {
            adrs = 0;
        }
        break;
    case 6:
        if ((*var & *cmp) != *cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_IfMonStatVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int operator = BattleScriptReadWord(ctx);
    int side = BattleScriptReadWord(ctx);
    int varNo = BattleScriptReadWord(ctx);
    int cmpNo = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);

    u32 var = GetBattlerVar(ctx, GetBattlerIDBySide(bsys, ctx, side), varNo, 0);
    u32 *cmp = BattleScriptGetVarPointer(bsys, ctx, cmpNo);

    switch (operator) {
    case 0:
        if (var != *cmp) {
            adrs = 0;
        }
        break;
    case 1:
        if (var == *cmp) {
            adrs = 0;
        }
        break;
    case 2:
        if (var <= *cmp) {
            adrs = 0;
        }
        break;
    case 3:
        if (var > *cmp) {
            adrs = 0;
        }
        break;
    case 4:
        if ((var & *cmp) == 0) {
            adrs = 0;
        }
        break;
    case 5:
        if (var & *cmp) {
            adrs = 0;
        }
        break;
    case 6:
        if ((var & *cmp) != *cmp) {
            adrs = 0;
        }
        break;
    }

    if (adrs) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_PayDay(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    ctx->msgWork = ctx->unk_14C * ctx->unk_2168;

    if (ctx->msgWork > 0xFFFF) {
        ctx->msgWork = 0xFFFF;
    }

    PlayerProfile_AddMoney(BattleSys_GetPlayerProfile(bsys, 0), ctx->msgWork);

    return FALSE;
}

BOOL BtlCmd_TryLightScreen(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_LIGHT_SCREEN) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->unk_216C |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_LIGHT_SCREEN;
        ctx->fieldSideConditionData[unkA].lightScreenTurns = 5;
        ctx->fieldSideConditionData[unkA].lightScreenBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].lightScreenTurns += ov12_02255844(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.unk1 = 20;
        ctx->buffMsg.unk4[0] = ctx->moveNoCur;
        ctx->buffMsg.unk4[1] = ctx->battlerIdAttacker;
        if (ov12_02252260(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.unk2 = 192;
        } else {
            ctx->buffMsg.unk2 = 190;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryReflect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_REFLECT) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->unk_216C |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_REFLECT;
        ctx->fieldSideConditionData[unkA].reflectTurns = 5;
        ctx->fieldSideConditionData[unkA].reflectBattler = ctx->battlerIdAttacker;
        if (GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) == HOLD_EFFECT_EXTEND_SCREENS) {
            ctx->fieldSideConditionData[unkA].reflectTurns += ov12_02255844(ctx, ctx->battlerIdAttacker, 0);
        }
        ctx->buffMsg.unk1 = 20;
        ctx->buffMsg.unk4[0] = ctx->moveNoCur;
        ctx->buffMsg.unk4[1] = ctx->battlerIdAttacker;
        if (ov12_02252260(bsys, ctx, 1, ctx->battlerIdAttacker) == 2) {
            ctx->buffMsg.unk2 = 196;
        } else {
            ctx->buffMsg.unk2 = 194;
        }
    }
    return FALSE;
}

BOOL BtlCmd_TryMist(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[unkA] & SIDE_CONDITION_MIST) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->unk_216C |= 64;
    } else {
        ctx->fieldSideConditionFlags[unkA] |= SIDE_CONDITION_MIST;
        ctx->fieldSideConditionData[unkA].mistTurns = 5;
        ctx->fieldSideConditionData[unkA].mistBattler = ctx->battlerIdAttacker;
    }
    return FALSE;
}

BOOL BtlCmd_TryOHKO(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u16 hitChance;
    
    BattleScriptIncrementPointer(ctx, 1);

    ctx->unk_213C |= (1 << 10);

    if (CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STURDY) == TRUE) {
        ctx->unk_216C |= 1 << 19;
    } else {
        if ((ctx->battleMons[ctx->battlerIdTarget].unk7C & 24) == FALSE &&
            GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_NO_GUARD &&
            GetBattlerAbility(ctx, ctx->battlerIdTarget) != ABILITY_NO_GUARD) {
            hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->unk_334.moveData[ctx->moveNoCur].accuracy;
            if ((BattleSys_Random(bsys) % 100) < hitChance && (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level)) {
                hitChance = 1;
            } else {
                hitChance = 0;
            }
        } else {
            if ((((ctx->battleMons[ctx->battlerIdTarget].unk88.battlerIdLockOn == ctx->battlerIdAttacker) && (ctx->battleMons[ctx->battlerIdTarget].unk7C & 24)) ||
                        GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NO_GUARD ||
                        GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_NO_GUARD) &&
                        ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                    hitChance = 1;
            } else {
                hitChance = ctx->battleMons[ctx->battlerIdAttacker].level - ctx->battleMons[ctx->battlerIdTarget].level + ctx->unk_334.moveData[ctx->moveNoCur].accuracy;
                if ((BattleSys_Random(bsys) % 100) < hitChance && ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
                    hitChance = 1;
                } else {
                    hitChance = 0;
                }
            }
            ctx->unk_216C |= 1 << 10;
        }
        
        if (hitChance) {
            ctx->damage = -ctx->battleMons[ctx->battlerIdTarget].hp;
            ctx->unk_216C |= 1 << 5;
        } else if (ctx->battleMons[ctx->battlerIdAttacker].level >= ctx->battleMons[ctx->battlerIdTarget].level) {
            ctx->unk_216C |= 1;
        } else {
            ctx->unk_216C |= 1 << 12;
        }
    }

    return FALSE;
}

BOOL BtlCmd_SetDamageDivide(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denom = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(bsys, ctx, varNo);

    *data = ov12_02253178(*data, denom);

    return FALSE;
}

BOOL BtlCmd_SetDamageDivideVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int varNo = BattleScriptReadWord(ctx);
    int denomNo = BattleScriptReadWord(ctx);

    int *data = BattleScriptGetVarPointer(bsys, ctx, varNo);
    int *denom = BattleScriptGetVarPointer(bsys, ctx, denomNo);

    int sign;

    if (*data < 0) {
        sign = -1;
    } else {
        sign = 1;
    }

    *data /= *denom;

    if (*data == 0) {
        *data = sign;
    }

    return FALSE;
}

BOOL BtlCmd_TryMimic(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if ((ov12_02257D6C(ctx->battlerMovePrev[ctx->battlerIdTarget]) == FALSE) ||
        (ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 21)) ||
        (ctx->battleMons[ctx->battlerIdTarget].status2 & (1 << 24)) ||
        ctx->battlerMovePrev[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        int moveIndex = 0;
        int mimicIndex = -1;

        for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->battlerMovePrev[ctx->battlerIdTarget]) {
                break;
            } 
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_MIMIC && mimicIndex == -1) {
                mimicIndex = moveIndex;
            }
        }

        if (moveIndex == LEARNED_MOVES_MAX) {
            ctx->moveWork = ctx->battlerMovePrev[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].moves[mimicIndex] = ctx->moveWork;
            if (ctx->unk_334.moveData[ctx->moveWork].pp < 5) {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = ctx->unk_334.moveData[ctx->moveWork].pp;
            } else {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[mimicIndex] = 5;
            }
            ctx->battleMons[ctx->battlerIdAttacker].unk88.mimicedMoveIndex |= MaskOfFlagNo(mimicIndex);

            if (ctx->moveWork == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_Metronome(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int metronomeIndex;
    u16 moveNo;

    BattleScriptIncrementPointer(ctx, 1);

    while (TRUE) {
        moveNo = (BattleSys_Random(bsys) % 0x1d3) + 1;

        for (metronomeIndex = 0; metronomeIndex < 4; metronomeIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[metronomeIndex] == moveNo) {
                break;
            }
        }

        if (metronomeIndex != 4) {
            continue;
        }

        if (CheckLegalMetronomeMove(bsys, ctx, ctx->battlerIdAttacker, moveNo) == FALSE) {
            continue;
        }

        ctx->moveWork = moveNo;

        break;
    }

    return FALSE;
}

BOOL BtlCmd_TryDisable(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int disabledMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->battlerMovePrev[ctx->battlerIdTarget]);

    if ((ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove == 0) && disabledMoveIndex != 4 &&
        ctx->battleMons[ctx->battlerIdTarget].movePPCur[disabledMoveIndex] && ctx->battlerMovePrev[ctx->battlerIdTarget]) {
        ctx->moveWork = ctx->battlerMovePrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledMove = ctx->moveWork;
        ctx->battleMons[ctx->battlerIdTarget].unk88.disabledTurns = BattleSys_Random(bsys) % 4 + 3;
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Counter(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].unk14;

    int sideA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].physicalDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].unk0_14 && ctx->battleMons[ctx->fieldSideConditionData[sideB].unk0_15].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].unk0_15;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->unk_C = 39;
                ov12_02245518(ctx, 1, 281);
            }
        }
        ov12_02258180(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].unk0_0 = 1;
        ctx->unk_216C |= 64;
    }

    return FALSE;
}

BOOL BtlCmd_MirrorCoat(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int battlerId = ctx->turnData[ctx->battlerIdAttacker].unk2C;

    int sideA = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);
    int sideB = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] && sideA != sideB && ctx->battleMons[battlerId].hp) {
        ctx->damage = ctx->turnData[ctx->battlerIdAttacker].specialDamage[battlerId] * 2;
        if (ctx->fieldSideConditionData[sideB].unk0_14 && ctx->battleMons[ctx->fieldSideConditionData[sideB].unk0_15].hp) {
            ctx->battlerIdTarget = ctx->fieldSideConditionData[sideB].unk0_15;
        } else {
            ctx->battlerIdTarget = battlerId;
        }
        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
            ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
            if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                ctx->unk_C = 39;
                ov12_02245518(ctx, 1, 281);
            }
        }
        ov12_02258180(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
    } else {
        ctx->selfTurnData[ctx->battlerIdAttacker].unk0_0 = 1;
        ctx->unk_216C |= 64;
    }

    return FALSE;
}

BOOL BtlCmd_TryEncore(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int encoredMoveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->battlerMovePrev[ctx->battlerIdTarget]);

    if (ov12_02257DFC(ctx, ctx->battlerMovePrev[ctx->battlerIdTarget]) == FALSE) {
        encoredMoveIndex = LEARNED_MOVES_MAX;
    }

    if (ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove == 0 && encoredMoveIndex != LEARNED_MOVES_MAX &&
        ctx->battleMons[ctx->battlerIdTarget].movePPCur[encoredMoveIndex] && ctx->battlerMovePrev[ctx->battlerIdTarget]) {
        ctx->moveWork = ctx->battlerMovePrev[ctx->battlerIdTarget];
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMove = ctx->moveWork;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredMoveIndex = encoredMoveIndex;
        ctx->battleMons[ctx->battlerIdTarget].unk88.encoredTurns = BattleSys_Random(bsys) % 5 + 3;
    } else {
        ctx->unk_216C |= 64;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryConversion2(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, moveType;
    
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs);
        return FALSE;
    }

    if (ctx->conversion2Move[ctx->battlerIdAttacker] && (ctx->conversion2BattlerId[ctx->battlerIdAttacker] != 255)) {
        if (ov12_022525AC(ctx, ctx->conversion2Move[ctx->battlerIdAttacker]) && (ctx->battleMons[ctx->conversion2BattlerId[ctx->battlerIdAttacker]].status2 & (1 << 12))) {
            BattleScriptIncrementPointer(ctx, adrs);
            return FALSE;
        } else {
            u8 typeA, typeB, val;
            moveType = ctx->conversion2Type[ctx->battlerIdAttacker];

            for (i = 0; i < 1000; i++) {
                ov12_0225260C(bsys, 0xffff, &typeA, &typeB, &val);
                if (typeA == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != typeB && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != typeB) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeB;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeB;
                    ctx->msgWork = typeB;
                    return FALSE;
                }
            }

            i = 0;
            while (ov12_0225260C(bsys, i, &typeA, &typeB, &val) == TRUE) {
                if (typeA == moveType && val <= 5 && GetBattlerVar(ctx, ctx->battlerIdAttacker, 27, 0) != typeB && GetBattlerVar(ctx, ctx->battlerIdAttacker, 28, 0) != typeB) {
                    ctx->battleMons[ctx->battlerIdAttacker].type1 = typeB;
                    ctx->battleMons[ctx->battlerIdAttacker].type2 = typeB;
                    ctx->msgWork = typeB;
                    return FALSE;
                }
                i++;
            }
        }
    }

    BattleScriptIncrementPointer(ctx, adrs);

    return FALSE;
}

BOOL BtlCmd_TrySketch(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex;
    int sketchIndex = -1;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 21) || ctx->sketchMove[ctx->battlerIdTarget] == MOVE_STRUGGLE || ctx->sketchMove[ctx->battlerIdTarget] == MOVE_SKETCH || ctx->sketchMove[ctx->battlerIdTarget] == MOVE_CHATTER || ctx->sketchMove[ctx->battlerIdTarget] == 0) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] != MOVE_SKETCH && ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == ctx->sketchMove[ctx->battlerIdTarget]) {
                break;
            }
            if (ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_SKETCH && sketchIndex == -1) {
                sketchIndex = moveIndex;
            }
        }
        if (moveIndex == LEARNED_MOVES_MAX) {
            ctx->battleMons[ctx->battlerIdAttacker].moves[sketchIndex] = ctx->sketchMove[ctx->battlerIdTarget];
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[sketchIndex] = ctx->unk_334.moveData[ctx->sketchMove[ctx->battlerIdTarget]].pp;
            BattleController_EmitBattleMonToPartyMonCopy(bsys, ctx, ctx->battlerIdAttacker);
            ctx->moveWork = ctx->sketchMove[ctx->battlerIdTarget];
            if (ctx->moveWork == MOVE_LAST_RESORT) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;
            }
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }
    }

    return FALSE;
}

BOOL BtlCmd_TrySleepTalk(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex, nonSelectableMoves;
    
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    nonSelectableMoves = 0;

    for (moveIndex = 0; moveIndex < LEARNED_MOVES_MAX; moveIndex++) {
        if (ov12_02252698(ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex]) ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_FOCUS_PUNCH ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_UPROAR ||
            ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex] == MOVE_CHATTER ||
            ov12_022525AC(ctx, ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex])) {
            nonSelectableMoves |= MaskOfFlagNo(moveIndex);
        }
    }

    nonSelectableMoves = ov12_022517EC(bsys, ctx, ctx->battlerIdAttacker, nonSelectableMoves, ~2);

    if (nonSelectableMoves == 15) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        do {
            moveIndex = BattleSys_Random(bsys) % 4;
        } while (MaskOfFlagNo(moveIndex) & nonSelectableMoves);
        ctx->moveWork = ctx->battleMons[ctx->battlerIdAttacker].moves[moveIndex];
    }
    

    return FALSE;
}

extern u8 sFlailDamageTable[6][2];

BOOL BtlCmd_FlailDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;
    int unkA;

    BattleScriptIncrementPointer(ctx, 1);

    unkA = sub_02088068(ctx->battleMons[ctx->battlerIdAttacker].hp, ctx->battleMons[ctx->battlerIdAttacker].maxHp, 64);
    for (i = 0; i < sizeof(sFlailDamageTable) / sizeof(sFlailDamageTable[0]); i++) {
        if (unkA <= sFlailDamageTable[i][0]) {
            break;
        }
    }
    
    ctx->movePower = sFlailDamageTable[i][1];

    return FALSE;
}

BOOL BtlCmd_TrySpite(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int moveIndex, ppLoss;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battlerMovePrev[ctx->battlerIdTarget]) {
        moveIndex = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdTarget], ctx->battlerMovePrev[ctx->battlerIdTarget]);
        if (moveIndex == LEARNED_MOVES_MAX || ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] == 0) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else {
            ppLoss = 4;
            if (ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] < ppLoss) {
                ppLoss = ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex];
            }
            ctx->moveWork = ctx->battlerMovePrev[ctx->battlerIdTarget];
            ctx->msgWork = ppLoss;
            ctx->battleMons[ctx->battlerIdTarget].movePPCur[moveIndex] -= ppLoss;
            ov12_02250C40(bsys, ctx, ctx->battlerIdTarget);
        }
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_HealBell(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 battleType = BattleSys_GetBattleType(bsys);
    int battlerId;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->calcWork = 0;

    if (ctx->moveNoCur == MOVE_HEAL_BELL) {
        ctx->moveWork = ctx->moveNoCur;
        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_SOUNDPROOF) {
            ctx->battleMons[ctx->battlerIdAttacker].status = 0;
            ctx->battleMons[ctx->battlerIdAttacker].status2 &= 0xf7ffffff;
        } else {
            ctx->calcWork |= 5;
        }

        if (battleType & 2) { 
            battlerId = GetBattlerIDBySide(bsys, ctx, B_SIDE_16);
            if (!(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
                if (!CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF)) {
                    ctx->battleMons[battlerId].status = 0;
                    ctx->battleMons[battlerId].status2 &= 0xf7ffffff;
                } else {
                    ctx->battlerIdWork = battlerId;
                    ctx->calcWork |= 10; 
                }
            }
        } else {
            ctx->calcWork |= 8;
        }
    } else { //aromatherapy
        ctx->battleMons[ctx->battlerIdAttacker].status = 0;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= 0xf7ffffff;
        if (battleType & 2) {
            battlerId = GetBattlerIDBySide(bsys, ctx, B_SIDE_16);
            if (!(ctx->unk_3108 & MaskOfFlagNo(battlerId))) {
                ctx->battleMons[battlerId].status = 0;
                ctx->battleMons[battlerId].status2 &= 0xf7ffffff;     
            }
        } else {
            ctx->calcWork |= 8;
        }
    }

    BattleControl_EmitPartyStatusHeal(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur);

    return FALSE;
}

BOOL BtlCmd_TryThief(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs1 = BattleScriptReadWord(ctx);
    int adrs2 = BattleScriptReadWord(ctx);

    u32 battleType = BattleSys_GetBattleType(bsys);
    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker) && !(battleType & 132)) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->fieldSideConditionData[fieldSide].unk0_17 & MaskOfFlagNo(ctx->unk_219C[ctx->battlerIdAttacker])) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_MULTITYPE || GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_MULTITYPE) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].item == ITEM_GRISEOUS_ORB) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else if (ctx->battleMons[ctx->battlerIdTarget].unk88.unk4_2C || ctx->battleMons[ctx->battlerIdTarget].unk88.unk4_2D) {
        BattleScriptIncrementPointer(ctx, adrs1);
    } else {
        if (ctx->battleMons[ctx->battlerIdTarget].item && CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ABILITY_STICKY_HOLD) == TRUE) {
            BattleScriptIncrementPointer(ctx, adrs2);
        } else if (ctx->battleMons[ctx->battlerIdAttacker].item || ov12_02252700(bsys, ctx, ctx->battlerIdTarget) == FALSE) {
            BattleScriptIncrementPointer(ctx, adrs1);
        }
    }

    return FALSE;
}

extern u16 sProtectSuccessChance[4];

BOOL BtlCmd_TryProtect(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int flag;

    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_PROTECT && ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_DETECT && ctx->moveNoProtect[ctx->battlerIdAttacker] != MOVE_ENDURE) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns = 0;
    }

    if (ctx->unk_3150 == 1) {
        flag = FALSE;
    } else {
        flag = TRUE;
    }

    if (sProtectSuccessChance[ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns] >= (u32) BattleSys_Random(bsys) && flag) {
        if (ctx->unk_334.moveData[ctx->moveNoCur].effect == 111) {
            ctx->turnData[ctx->battlerIdAttacker].protectFlag = TRUE;
            ctx->buffMsg.unk2 = 282;
        }
        if (ctx->unk_334.moveData[ctx->moveNoCur].effect == 116) {
            ctx->turnData[ctx->battlerIdAttacker].unk0_9 = TRUE;
            ctx->buffMsg.unk2 = 442;
            
        }
        ctx->buffMsg.unk1 = 2;
        ctx->buffMsg.unk4[0] = ov12_022522E0(ctx, ctx->battlerIdAttacker);

        if (ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns < NELEMS(sProtectSuccessChance) - 1) {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns++;
        }

    } else {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.protectSuccessTurns = 0;
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TrySubstitute(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int subHp = ov12_02253178(ctx->battleMons[ctx->battlerIdAttacker].maxHp, 4);

    if (ctx->battleMons[ctx->battlerIdAttacker].hp <= subHp) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->hpCalcWork = -subHp;
        ctx->battleMons[ctx->battlerIdAttacker].unk88.substituteHp = subHp;
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= 0xffff1fff;
    }

    return FALSE;
}

BOOL BtlCmd_TryWhirlwind(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    u32 battleType = BattleSys_GetBattleType(bsys);

    if (battleType & BATTLE_TYPE_TRAINER) {
        PARTY *party;
        POKEMON *mon;
        int partySize;
        int cnt = 0;
        int cntMax;
        int index0, indexEnd, monIndex, maxRand;
        int monIndexA, monIndexB;

        party = ov12_0223A7F4(bsys, ctx->battlerIdTarget);
        partySize = ov12_0223A834(bsys, ctx->battlerIdTarget); 

        if (battleType & 8 || battleType & 16 && BattleSys_GetFieldSide(bsys, ctx->battlerIdTarget)) {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 1;
            monIndexA = ctx->unk_219C[ctx->battlerIdTarget];
            monIndexB = ctx->unk_219C[ctx->battlerIdTarget];
        } else if (battleType & 2) {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 2;
            monIndexA = ctx->unk_219C[ctx->battlerIdTarget];
            monIndexB = ctx->unk_219C[ov12_0223AB6C(bsys, ctx->battlerIdTarget)];
        } else {
            index0 = 0;
            indexEnd = partySize;
            maxRand = partySize;
            cntMax = 1;
            monIndexA = ctx->unk_219C[ctx->battlerIdTarget];
            monIndexB = ctx->unk_219C[ctx->battlerIdTarget];          
        }

        for (monIndex = index0; monIndex < indexEnd; monIndex++) {
            mon = GetPartyMonByIndex(party, monIndex);
            if (GetMonData(mon, 5, 0) && !GetMonData(mon, 76, 0) && GetMonData(mon, 163, 0)) {
                cnt++;
            }
        }

        if (cnt <= cntMax) {
            BattleScriptIncrementPointer(ctx, adrs);
        } else if (ov12_0225277C(bsys, ctx)) {
            do {
                do {
                    monIndex = (BattleSys_Random(bsys) % maxRand);
                    monIndex += index0;
                } while (monIndex == monIndexA || monIndex == monIndexB);
                mon = GetPartyMonByIndex(party, monIndex);
            } while (!GetMonData(mon, 5, 0) || GetMonData(mon, 76, 0) == 1 || !GetMonData(mon, 163, 0));
            ctx->unk_21A0[ctx->battlerIdTarget] = monIndex;
        } else {
            BattleScriptIncrementPointer(ctx, adrs);
        }

    } else if (ov12_0225277C(bsys, ctx) == FALSE) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_Transform(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    u32 i;
    u8 *src, *dest;

    BattleScriptIncrementPointer(ctx, 1);

    ctx->battleMons[ctx->battlerIdAttacker].status2 |= (1 << 21);
    ctx->battleMons[ctx->battlerIdAttacker].unk88.disabledMove = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.disabledTurns = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.transformPersonality = ctx->battleMons[ctx->battlerIdTarget].personality;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.transformGender = ctx->battleMons[ctx->battlerIdTarget].gender;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.mimicedMoveIndex = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.lastResortCount = 0;

    src = (u8 *)&ctx->battleMons[ctx->battlerIdAttacker];
    dest = (u8 *)&ctx->battleMons[ctx->battlerIdTarget];

    for (i = 0; i < 40; i++) {
        src[i] = dest[i];
    }

    ctx->battleMons[ctx->battlerIdAttacker].unk28_0 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk28_1 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].traceFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].downloadFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk28_4 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk28_5 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk28_8 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk28_9 = 0;
    ctx->battleMons[ctx->battlerIdAttacker].pressureFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.unk0_1D = ctx->totalTurns & 1;
    ctx->battleMons[ctx->battlerIdAttacker].unk88.slowStartTurns = ctx->totalTurns + 1;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartFlag = 0;
    ctx->battleMons[ctx->battlerIdAttacker].slowStartEnded = 0;

    for (i = 0; (int) i < LEARNED_MOVES_MAX; i++) {
        if (ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp < 5) {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = ctx->unk_334.moveData[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].pp;
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].movePPCur[i] = 5;
        }
    }
    
    return FALSE;
}

BOOL BtlCmd_TrySpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker)^1;

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers == 3) {
        ctx->selfTurnData[ctx->battlerIdAttacker].unk0_0 = 1;
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= 4;
        ctx->fieldSideConditionData[fieldSide].spikesLayers++;
    }

    return FALSE;
}

BOOL BtlCmd_CheckSpikes(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int side = BattleScriptReadWord(ctx);
    int adrs = BattleScriptReadWord(ctx);
    int battlerId = GetBattlerIDBySide(bsys, ctx, side);
    int fieldSide = BattleSys_GetFieldSide(bsys, battlerId);

    if (ctx->fieldSideConditionData[fieldSide].spikesLayers && ctx->battleMons[battlerId].hp) {
        ctx->hpCalcWork = (5 - ctx->fieldSideConditionData[fieldSide].spikesLayers) * 2;
        ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp * -1, ctx->hpCalcWork);
    } else {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_TryPerishSong(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int maxBattlers = BattleSys_GetMaxBattlers(bsys);
    
    ctx->calcWork = maxBattlers;

    int cnt = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->battleMons[battlerId].unk7C & 32 || ctx->battleMons[battlerId].hp == 0 || CheckBattlerAbilityIfNotIgnored(ctx, ctx->battlerIdAttacker, battlerId, ABILITY_SOUNDPROOF) == TRUE) {
            cnt++;
        } else {
            ctx->battleMons[battlerId].unk7C |= 32;
            ctx->battleMons[battlerId].unk88.perishSongTurns = 3;
        }
    }
    if (cnt == maxBattlers) {
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_SetTurnOrderBySpeed(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    
    u32 *unkPtr = BattleScriptGetVarPointer(bsys, ctx, BattleScriptReadWord(ctx));

    *unkPtr = ctx->unk_21EC[ctx->unk_3104];

    return FALSE;
}

BOOL BtlCmd_JumpIfValidBattlerVar(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);
    u32 unkB = BattleScriptReadWord(ctx);
    u32 *unkPtr = BattleScriptGetVarPointer(bsys, ctx, unkA);

    if (*unkPtr < BattleSys_GetMaxBattlers(bsys)) {
        BattleScriptIncrementPointer(ctx, unkB);
    }

    return FALSE;
}

BOOL BtlCmd_WeatherDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 battlerId = GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx));

    ctx->tempWork = 0;
    ctx->hpCalcWork = 0;

    u32 type1 = GetBattlerVar(ctx, battlerId, 27, 0);
    u32 type2 = GetBattlerVar(ctx, battlerId, 28, 0);

    if (ov12_02252324(bsys, ctx, 8, 0, ABILITY_CLOUD_NINE) == 0 && ov12_02252324(bsys, ctx, 8, 0, ABILITY_AIR_LOCK) == 0) {
        if (ctx->unk_180 & 12) {
            if (type1 != TYPE_ROCK && type2 != TYPE_ROCK &&
                type1 != TYPE_STEEL && type2 != TYPE_STEEL &&
                type1 != TYPE_GROUND && type2 != TYPE_GROUND &&
                ctx->battleMons[battlerId].hp && GetBattlerAbility(ctx, battlerId) != ABILITY_SAND_VEIL &&
                !(ctx->battleMons[battlerId].unk7C & 0x40080)) {
                    ctx->moveWork = MOVE_SANDSTORM;
                    ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp * -1, 16);
            }
        }
        if (ctx->unk_180 & 48) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].unk7C & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN || GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp * -1, 8);
                }
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_SOLAR_POWER) {
                    ctx->tempWork = 2;
                }
            }
        }
        if (ctx->unk_180 & 192) {
            if (ctx->battleMons[battlerId].hp && !(ctx->battleMons[battlerId].unk7C & 0x40080)) {
                if (GetBattlerAbility(ctx, battlerId) == ABILITY_ICE_BODY) {
                    if (ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp) {
                        ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp, 16);
                    }
                } else if (type1 != TYPE_ICE && type2 != TYPE_ICE && 
                           GetBattlerAbility(ctx, battlerId) != ABILITY_SNOW_CLOAK) {
                    ctx->moveWork = MOVE_HAIL;
                    ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp * -1, 16);

                }
            }
        }
        if (ctx->unk_180 & 3) {
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp &&
                GetBattlerAbility(ctx, battlerId) == ABILITY_RAIN_DISH) {
                ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp, 16);
            } 
            if (ctx->battleMons[battlerId].hp && ctx->battleMons[battlerId].hp < ctx->battleMons[battlerId].maxHp &&
                GetBattlerAbility(ctx, battlerId) == ABILITY_DRY_SKIN) {
                ctx->hpCalcWork = ov12_02253178(ctx->battleMons[battlerId].maxHp, 8);
            } 
            if (ctx->battleMons[battlerId].hp && (u8)ctx->battleMons[battlerId].status && 
                GetBattlerAbility(ctx, battlerId) == ABILITY_HYDRATION) {
                if (ctx->battleMons[battlerId].status & 7) { //sleep
                    ctx->msgWork = 0;
                } else if (ctx->battleMons[battlerId].status & 0xf88) { //poison and toxic
                    ctx->msgWork = 1;
                } else if (ctx->battleMons[battlerId].status & 16) { //burn
                    ctx->msgWork = 2;
                } else if (ctx->battleMons[battlerId].status & (1 << 6)) { //para
                    ctx->msgWork = 3;
                } else {
                    ctx->msgWork = 4;
                }
                ctx->tempWork = 1;
            }
        }
    }

    return FALSE;
}

BOOL BtlCmd_RolloutDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i, j;
    BattleScriptIncrementPointer(ctx, 1);

    ctx->selfTurnData[ctx->battlerIdAttacker].rolloutCount = ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    if (!(ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 12))) {
        ov12_02250C70(bsys, ctx, ctx->battlerIdAttacker);
        ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount = 5;
    }

    if (--ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount == 0) {
        ov12_02250CA0(bsys, ctx, ctx->battlerIdAttacker);
    }

    ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;

    j = 5 - ctx->battleMons[ctx->battlerIdAttacker].unk88.rolloutCount;

    for (i = 1; i < j; i++) {
        ctx->movePower *= 2;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].status2 & (1 << 30)) { //defence curl
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_FuryCutterDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int i;

    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount < 5) {
        ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount++;
    }

    ctx->movePower = ctx->unk_334.moveData[ctx->moveNoCur].power;

    for (i = 1; i < ctx->battleMons[ctx->battlerIdAttacker].unk88.furyCutterCount; i++) {
        ctx->movePower *= 2;
    }

    return FALSE;
}

BOOL BtlCmd_TryAttract(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    if (ctx->battleMons[ctx->battlerIdWork].gender == ctx->battleMons[ctx->battlerIdStatChange].gender ||
        ctx->battleMons[ctx->battlerIdStatChange].status2 & (15 << 16) || 
        ctx->battleMons[ctx->battlerIdWork].gender == 2 || ctx->battleMons[ctx->battlerIdStatChange].gender == 2) {
        BattleScriptIncrementPointer(ctx, adrs);
    } else {
        ctx->battleMons[ctx->battlerIdStatChange].status2 |= MaskOfFlagNo(ctx->battlerIdWork) << 16;
    }

    return FALSE;
}

BOOL BtlCmd_TrySafeguard(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);
    int fieldSide = BattleSys_GetFieldSide(bsys, ctx->battlerIdAttacker);

    if (ctx->fieldSideConditionFlags[fieldSide] & 8) {
        BattleScriptIncrementPointer(ctx, adrs);
        ctx->unk_216C |= 64;
    } else {
        ctx->fieldSideConditionFlags[fieldSide] |= 8;
        ctx->fieldSideConditionData[fieldSide].safeguardTurns = 5;
        ctx->fieldSideConditionData[fieldSide].safeguardBattler = ctx->battlerIdAttacker;
        ctx->buffMsg.unk1 = 1;
        ctx->buffMsg.unk4[0] = ctx->battlerIdAttacker;
        ctx->buffMsg.unk2 = 198;
    }

    return FALSE;
}

BOOL BtlCmd_Present(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);
    int adrs = BattleScriptReadWord(ctx);
    int rand = (u8)BattleSys_Random(bsys);

    if (rand < 102) {
        ctx->movePower = 40;
    } else if (rand < 178) {
        ctx->movePower = 80;
    } else if (rand < 204) {
        ctx->movePower = 120;
    } else {
        ctx->hpCalcWork = ov12_02253178(ctx->battleMons[ctx->battlerIdTarget].maxHp, 4);
        BattleScriptIncrementPointer(ctx, adrs);
    }

    return FALSE;
}

BOOL BtlCmd_MagnitudeDamageCalc(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    if (ctx->magnitude == 0) {
        ctx->magnitude = BattleSys_Random(bsys) % 100; 
        if (ctx->magnitude < 5) {
            ctx->movePower = 10;
            ctx->magnitude = 4;
        } else if (ctx->magnitude < 15) {
            ctx->movePower = 30;
            ctx->magnitude = 5;
        } else if (ctx->magnitude < 35) {
            ctx->movePower = 50;
            ctx->magnitude = 6;
        } else if (ctx->magnitude < 65) {
            ctx->movePower = 70;
            ctx->magnitude = 7;
        } else if (ctx->magnitude < 85) {
            ctx->movePower = 90;
            ctx->magnitude = 8;
        } else if (ctx->magnitude < 95) {
            ctx->movePower = 110;
            ctx->magnitude = 9;
        } else {
            ctx->movePower = 150;
            ctx->magnitude = 10;
        }
    }

    ctx->msgWork = ctx->magnitude;

    return FALSE;
}
