#include "scrcmd.h"

extern void ov03_02256D34(TaskManager *taskManager, FieldSystem *fsys, const u16 *items, int kind, int buy_sell, int deco_which, int a6);

extern const u16 _020FBF22[][2];
extern const u16 *_0210FA3C[];
extern const u16 *_0210F9CC[];
extern const u16 *_0210F9E8[];

BOOL ScrCmd_MartBuy(SCRIPTCONTEXT *ctx) {
    u16 unused;
    u8 badge_count;
    u8 i;
    u8 tier;
    u8 nitems;
    u16 items[64];

    unused = ScriptGetVar(ctx);

    nitems = 0;
    badge_count = 0;
    for (i = 0; i < 16; i++) {
        if (PlayerProfile_TestBadgeFlag(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata), i) == TRUE) {
            badge_count++;
        }
    }
    switch (badge_count) {
    case 0:
        tier = 1;
        break;
    case 1:
    case 2:
        tier = 2;
        break;
    case 3:
    case 4:
        tier = 3;
        break;
    case 5:
    case 6:
        tier = 4;
        break;
    case 7:
        tier = 5;
        break;
    case 8:
        tier = 6;
        break;
    default:
        tier = 6;
        break;
    }
    for (i = 0; i < 19; i++) {
        if (tier >= _020FBF22[i][1]) {
            items[nitems] = _020FBF22[i][0];
            nitems++;
        }
    }
    items[nitems] = 0xFFFF;
    ov03_02256D34(ctx->taskman, ctx->fsys, items, 0, 0, 0, 0);
    return TRUE;
}

BOOL ScrCmd_MartSell(SCRIPTCONTEXT *ctx) {
    u16 dummy[1];

    dummy[0] = 0xFFFF;
    ov03_02256D34(ctx->taskman, ctx->fsys, dummy, 0, 1, 0, 0);
    return TRUE;
}

BOOL ScrCmd_SpecialMartBuy(SCRIPTCONTEXT *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    ov03_02256D34(ctx->taskman, ctx->fsys, _0210FA3C[which], 0, 0, 0, 0);
    return TRUE;
}

// Sinnoh leftover, unused in HGSS
BOOL ScrCmd_DecorationMart(SCRIPTCONTEXT *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    ov03_02256D34(ctx->taskman, ctx->fsys, _0210F9CC[which], 1, 0, which <= 1 ? 1 : 0, 0);
    return TRUE;
}

BOOL ScrCmd_SealMart(SCRIPTCONTEXT *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    ov03_02256D34(ctx->taskman, ctx->fsys, _0210F9E8[which], 2, 0, 0, 0);
    return TRUE;
}
