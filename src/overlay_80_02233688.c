#include "global.h"
#include "battle/battle_setup.h"
#include "frontier/overlay_80_02233688.h"
#include "frontier/overlay_80_022340E8.h"
#include "unk_020965A4.h"

//Alloc
BOOL ov80_02233688(FrontierContext *ctx) {
    u32 spC = ov80_0222BE10(ctx); //these look suspiciously like reading data from scripts
    u32 r4 = ov80_0222BE10(ctx);
    u32 sp10 = ov80_0222BE10(ctx);
    u32 r6 = ov80_0222BE10(ctx);
    u32 r7 = ov80_0222BE10(ctx);
    u32 sp14 = ov80_0222BDF4(ctx);

    UnkStruct_02096808 *unk = sub_02096808(ctx->unk0->unk0);

    sub_02096818(ctx->unk0->unk0, ov80_022340E8(unk->saveData, spC, r4, sp10, r6, r7, sp14));

    return FALSE;
}

//Init
BOOL ov80_022336EC(FrontierContext  *ctx) {
    u32 arg1 = ov80_0222BE10(ctx);
    u32 arg0 = sub_02096810(ctx->unk0->unk0);
    ov80_0223437C(arg0, arg1);
    return FALSE;
}

//free
BOOL ov80_02233708(FrontierContext *ctx) {
    ov80_02234520(sub_02096810(ctx->unk0->unk0));
    return FALSE;
}

extern OVY_MGR_TEMPLATE ov80_0223BE78;
extern void ov80_02233A1C(void);

BOOL ov80_0223371C(FrontierContext *ctx) {
    UnkStruct_02096808 *unk0 = sub_02096808(ctx->unk0->unk0);
    u32 unk1 = sub_02096810(ctx->unk0->unk0);
    GAME_BOARD_ARGS *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(GAME_BOARD_ARGS));
    MI_CpuFill8(args, 0, sizeof(GAME_BOARD_ARGS));
    args->saveData = unk0->saveData;
    ov80_02233944(args, unk1);
    sub_02096820(ctx->unk0->unk0, &ov80_0223BE78, args, 0, ov80_02233A1C);

    return TRUE;
}
