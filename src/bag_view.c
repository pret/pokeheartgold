#include "global.h"
#include "bag_view.h"
#include "heap.h"
#include "save.h"
#include "coins.h"
#include "player_data.h"
#include "capsule.h"

// Unknown object

BAG_VIEW *BagView_New(u8 heap_id) {
    BAG_VIEW *ret = AllocFromHeap(heap_id, sizeof(BAG_VIEW));
    memset(ret, 0, sizeof(BAG_VIEW));
    return ret;
}

u32 BagView_sizeof(void) {
    return sizeof(BAG_VIEW);
}

void sub_02077894(BAG_VIEW *a0, u8 a1) {
    a0->unk_65 = a1;
}

void sub_0207789C(BAG_VIEW *a0, SAVEDATA *a1, u8 a2, BAG_CURSOR *a3, u32 a4) {
    sub_02077894(a0, a2);
    a0->saveData = a1;
    a0->unk_78 = a4;
    a0->unk_6C = a3;
    a0->unk_66 = 0;
}

void BagView_SetItem(BAG_VIEW *bagView, ITEM_SLOT *slots, u8 pocketId, u8 position) {
    // Bug: position was likely intended to force a particular display order.
    // Likely intended as an index to bagView->pockets.
    // However, this variable is unused.
#pragma unused(position)
    bagView->pockets[pocketId].slots = slots;
    bagView->pockets[pocketId].pocketId = pocketId;
}

void sub_020778C8(BAG_VIEW *bagView) {
    bagView->unk_76_0 = TRUE;
}

void sub_020778DC(BAG_VIEW *bagView, void *a1) {
    bagView->unk_70 = a1;
}

void sub_020778E0(BAG_VIEW *bagView, u8 a1) {
    bagView->unk_74 = a1;
}

void sub_020778E8(BAG_VIEW *bagView, u16 a1) {
    bagView->unk_76_1 = a1;
}

u16 sub_02077904(BAG_VIEW *bagView) {
    return bagView->unk_66;
}

u16 sub_0207790C(BAG_VIEW *bagView) {
    return bagView->unk_68;
}

u8 sub_02077914(BAG_VIEW *bagView) {
    return bagView->unk_74;
}

u8 sub_0207791C(BAG_VIEW *bagView) {
    return bagView->unk_75;
}

/*static*/ u16 sub_02077924(SAVEDATA *saveData) {
    return CheckCoins(Sav2_PlayerData_GetCoinsAddr(saveData));
}

/*static*/ int sub_02077930(SAVEDATA *saveData) {
    int i, total;
    SEALCASE *sealCase = Sav2_SealCase_get(saveData);
    total = 0;
    for (i = CAPSULE_MIN; i <= CAPSULE_MAX; i++) {
        total += sub_0202CD94(sealCase, i);
    }
    return total;
}
