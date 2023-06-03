#include "unk_0200E320.h"
#include "overlay_12_0226BEC4.h"
#include "heap.h"

void ov12_0226BF04(SysTask *task, void *data);

SysTask *ov12_0226BEC4(BattleSystem *bsys) {
    UnkBattleStruct_0226BEC4 *unk;
    unk = AllocFromHeap(HEAP_ID_BATTLE, sizeof(UnkBattleStruct_0226BEC4));
    MI_CpuFill8(unk, 0, sizeof(UnkBattleStruct_0226BEC4));
    unk->bsys = bsys;
    return CreateSysTask(ov12_0226BF04, unk, 1000);
}
