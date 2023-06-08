#include "scrcmd.h"

static const u16 sDPPlGameCornerPrizeMap[][2] = {
    { ITEM_SILK_SCARF, 1000 },
    { ITEM_WIDE_LENS, 1000 },
    { ITEM_ZOOM_LENS, 1000 },
    { ITEM_METRONOME, 1000 },
    { ITEM_TM90, 2000 },
    { ITEM_TM58, 2000 },
    { ITEM_TM75, 4000 },
    { ITEM_TM32, 4000 },
    { ITEM_TM44, 6000 },
    { ITEM_TM89, 6000 },
    { ITEM_TM10, 6000 },
    { ITEM_TM27, 8000 },
    { ITEM_TM21, 8000 },
    { ITEM_TM35, 10000 },
    { ITEM_TM24, 10000 },
    { ITEM_TM13, 10000 },
    { ITEM_TM29, 10000 },
    { ITEM_TM74, 15000 },
    { ITEM_TM68, 20000 },
};

BOOL ScrCmd_GetDPPlPrizeItemIdAndCost(ScriptContext* ctx) {
    u16 prize_id = ScriptGetVar(ctx);
    u16* prize_item_id = ScriptGetVarPointer(ctx);
    u16* prize_cost = ScriptGetVarPointer(ctx);

    *prize_item_id = sDPPlGameCornerPrizeMap[prize_id][0];
    *prize_cost = sDPPlGameCornerPrizeMap[prize_id][1];

    return FALSE;
}
