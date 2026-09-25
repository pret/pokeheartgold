#ifndef POKEHEARTGOLD_MART_H
#define POKEHEARTGOLD_MART_H

#include "script.h"

struct MartItem {
    u16 item_id;
    u16 cost;
};

void Mart_Init(TaskManager *taskManager, FieldSystem *fieldSystem, const u16 *items, int kind, u8 buy_sell, int deco_which, const struct MartItem *price_overrides);

#endif // POKEHEARTGOLD_MART_H
