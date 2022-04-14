#ifndef POKEHEARTGOLD_UNK_0206793C_H
#define POKEHEARTGOLD_UNK_0206793C_H

#include "script.h"
#include "npc_trade.h"

typedef struct UnkStruct_0206793C UnkStruct_0206793C;

void Fsys_ClearFollowingTrainer(FieldSystem *fsys);
void sub_02067AE4(FieldSystem *fsys);
void sub_02067A88(FieldSystem *fsys);
void sub_02067B88(FieldSystem *fsys);
void sub_02067BA4(FieldSystem *fsys);
void sub_02067BC0(FieldSystem *fsys);
void sub_02067BE8(FieldSystem *fsys);
BOOL sub_02068CCC(UnkStruct_0206793C *unk);
void Field_CreateTask_TradeAnim(TaskManager *taskManager, NPC_TRADE_WORK *tradeWork, u16 arg, HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0206793C_H
