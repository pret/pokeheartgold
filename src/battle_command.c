#include "assert.h"
#include "battle.h"
#include "battle_controller.h"
#include "battle_system.h"
#include "item.h"
#include "pokemon.h"
#include "system.h"
#include "unk_0200E320.h"
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
    } while(ctx->unk_3154 == 0 && (ov12_0223A7E0(bsys) & 4) == 0);
    
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
        if (ov12_0223A7E0(bsys) & 16) {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                opponentData = BattleSys_GetOpponentDataByBattlerId(bsys, battlerId);
                if (opponentData->unk195 != 4) {
                    ov12_02262974(bsys, battlerId);
                }
            }
        } else {
            for (battlerId = 0; battlerId < battlersMax; battlerId++) {
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2) &&
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
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
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
            if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                (ov12_0223A7E0(bsys) & 2) &&
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
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
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
    int battlerId;
    int battlersMax = BattleSys_GetMaxBattlers(bsys);
    OpponentData *opponentData;

    BattleScriptIncrementPointer(ctx, 1);

    u32 unkB = BattleScriptReadWord(ctx);

    switch (unkB) {
    case 0:
    default:
        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                (ov12_0223A7E0(bsys) & 2) &&
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
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
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
                if ((ov12_0223A7E0(bsys) & 8) == 0 &&
                    (ov12_0223A7E0(bsys) & 16) == 0 &&
                    (ov12_0223A7E0(bsys) & 2)) {
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
            if ((ov12_0223A7E0(bsys) & 2) && (battlerId > 1)) {
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
                if ((ov12_0223A7E0(bsys) & 2)) {
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
                if ((ov12_0223A7E0(bsys) & 2)) {
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
        type = ctx->unk_334.unkA8[ctx->moveNoCur].moveType;
    }

    ctx->damage = ov12_02256FF8(bsys, ctx, ctx->moveNoCur, ctx->fieldSideConditionFlags[ov12_0223AB1C(bsys, ctx->battlerIdTarget)], ctx->unk_180, ctx->movePower, type, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->criticalMultiplier);

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
        move = ctx->unk_124;
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
        move = ctx->unk_124;
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

    if (!(ov12_0223A7E0(bsys) & 4)) {
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

    ov12_02245518(ctx, 30, ctx->unk_334.unkA8[ctx->moveNoCur].unk0);

    return FALSE;
}

BOOL BtlCmd_JumpToEffectScript(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    u32 unkA = BattleScriptReadWord(ctx);

    ctx->unk_213C &= ~1;
    ctx->unk_213C &= 0xffffbfff;

    ctx->moveNoCur = ctx->unk_124;

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
        ov12_02245518(ctx, 0, ctx->moveNoCur);
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
        if (ov12_0223A7E0(bsys) == 7) {
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
        ctx->unk_138 = 13;
    } else if (ctx->unk_8C >= 39) {
        stat = ctx->unk_8C - 39;
        change = 2;
        ctx->unk_138 = 12;
    } else if (ctx->unk_8C >= 22) {
        stat = ctx->unk_8C - 22;
        change = -1;
        ctx->unk_138 = 13;
    } else {
        stat = ctx->unk_8C - 15;
        change = 1;
        ctx->unk_138 = 12;
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
                if(ctx->fieldSideConditionData[ov12_0223AB1C(bsys, ctx->battlerIdStatChange)].mistTurns) {
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
                } else if (ctx->battleMons[ctx->battlerIdStatChange].unk6C &  (1 << 24)){
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

    ctx->unk_134 = BattleSys_Random(bsys) % modulo + x0;

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
    int unkA = ov12_0223A7E0(bsys);

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
        ctx->field74_0x188[ctx->battlerIdAttacker].unk0_0 = 1;
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
        ctx->battleMons[battlerId].unk6C &= 0xffefffff;
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
        ctx->unk_130 = prizeMoney;
    } else {
        ctx->unk_130 = 0;
    }

    ctx->unk_138 = bsys->unk2474_1;

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

    BattleController_EmitPrintTrainerMessage(bsys, GetBattlerIDBySide(bsys, ctx, BattleScriptReadWord(ctx)), ctx->unk_130);

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
            moveType = ctx->unk_334.unkA8[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].moveType;
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
            moveType = ctx->unk_334.unkA8[ctx->battleMons[ctx->battlerIdAttacker].moves[i]].moveType;
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
        ctx->unk_130 = moveType;
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

    ctx->unk_130 = ctx->unk_14C * ctx->unk_2168;

    if (ctx->unk_130 > 0xFFFF) {
        ctx->unk_130 = 0xFFFF;
    }

    PlayerProfile_AddMoney(BattleSys_GetPlayerProfile(bsys, 0), ctx->unk_130);

    return FALSE;
}

BOOL BtlCmd_TryLightScreen(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    BattleScriptIncrementPointer(ctx, 1);

    int adrs = BattleScriptReadWord(ctx);

    int unkA = ov12_0223AB1C(bsys, ctx->battlerIdAttacker);

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

    int unkA = ov12_0223AB1C(bsys, ctx->battlerIdAttacker);

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

    int unkA = ov12_0223AB1C(bsys, ctx->battlerIdAttacker);

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
