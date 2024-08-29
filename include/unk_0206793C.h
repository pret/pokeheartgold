#ifndef POKEHEARTGOLD_UNK_0206793C_H
#define POKEHEARTGOLD_UNK_0206793C_H

#include "npc_trade.h"
#include "script.h"

typedef struct UnkStruct_0206793C UnkStruct_0206793C;

void FieldSystem_ClearFollowingTrainer(FieldSystem *fieldSystem);
void sub_02067AE4(FieldSystem *fieldSystem);
void sub_02067A88(FieldSystem *fieldSystem);
void sub_02067B88(FieldSystem *fieldSystem);
void sub_02067BA4(FieldSystem *fieldSystem);
void sub_02067BC0(FieldSystem *fieldSystem);
void sub_02067BE8(FieldSystem *fieldSystem);
BOOL sub_02068CCC(UnkStruct_0206793C *unk);
void CallTask_NPCTrade(TaskManager *taskManager, NPCTradeAppData *tradeWork, u16 arg, HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0206793C_H
