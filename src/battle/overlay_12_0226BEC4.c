#include "global.h"
#include "battle/overlay_12_0226BEC4.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_02266024.h"
#include "heap.h"
#include "unk_0201F79C.h"
#include "unk_02005D10.h"

static void ov12_0226BF04(SysTask *task, void *data);

SysTask *ov12_0226BEC4(BattleSystem *bsys) {
    UnkBattleStruct_0226BEC4 *unk;
    unk = AllocFromHeap(HEAP_ID_BATTLE, sizeof(UnkBattleStruct_0226BEC4));
    MI_CpuFill8(unk, 0, sizeof(UnkBattleStruct_0226BEC4));
    unk->bsys = bsys;
    return CreateSysTask(ov12_0226BF04, unk, 1000);
}

void ov12_0226BEF0(SysTask *task) {
    FreeToHeap(sub_0201F988(task));
    DestroySysTask(task);
}

static void ov12_0226BF04(SysTask *task, void *_data) {
    UnkBattleStruct_0226BEC4 *data = _data;
    u32 *unkPtr = ov12_0223A900(data->bsys);
    
    switch (data->state) {
    case 0:
        GF_ASSERT(unkPtr != NULL);
        {
            NARC *bgHandleNarc = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
            NARC *objHandleNarc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);
            ov12_02266508(bgHandleNarc, objHandleNarc, unkPtr, 18, FALSE, NULL);
            NARC_Delete(bgHandleNarc);
            NARC_Delete(objHandleNarc);
        }
        data->state++;
        break;
    case 1:
        if (ov12_02266C64(unkPtr) == TRUE) {
            data->state++;
        }
        break;
    case 2:
        if (ov12_0223C080(data->bsys) == TRUE && ov12_02266B78(unkPtr) == TRUE) {
            PlaySE(1501);
            data->state++;
        }
        break;
    case 3:
        data->delay++;
        if (data->delay > 8) {
            ov12_0223BFFC(data->bsys, 0);
            data->state++;
        }
        break;
    case 4:
        break;
    }
}
