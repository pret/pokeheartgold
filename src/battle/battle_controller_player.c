#include "battle_controller_player.h"
#include "overlay_12_0224E4FC.h"
#include "heap.h"

BATTLECONTEXT *BattleContext_New(BattleSystem *bsys) {
    BATTLECONTEXT *ctx = (BATTLECONTEXT *) AllocFromHeap(HEAP_ID_BATTLE, sizeof(BATTLECONTEXT));
    MIi_CpuClearFast(0, (u32 *)ctx, sizeof(BATTLECONTEXT));
    
    BattleContext_Init(ctx);
    ov12_02251038(bsys, ctx);
    ov12_0224E384(bsys, ctx);
    LoadMoveTbl(ctx->unk_334.moveData);
    ctx->unk_334.itemData = LoadAllItemData(HEAP_ID_BATTLE);
    
    return ctx;
}