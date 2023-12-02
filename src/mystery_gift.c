#include "global.h"
#include "mystery_gift.h"
#include "save.h"
#include "constants/save_arrays.h"

extern MYSTERY_GIFT_SAVE* sMysteryGiftData;

BOOL MysteryGiftTagIsValid(u32 tag);
MysteryGift* SaveMysteryGift_GetByIdx(MYSTERY_GIFT_SAVE* mg, int index);

u32 Save_MysteryGift_sizeof(void) {
    return sizeof(MYSTERY_GIFT_SAVE);
}

void Save_MysteryGift_Init(MYSTERY_GIFT_SAVE* mg) {
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

BOOL MysteryGiftTagIsValid(u32 tag) {
    return tag != MG_TAG_invalid && tag < MG_TAG_max;
}

MysteryGift* SaveMysteryGift_GetByIdx(MYSTERY_GIFT_SAVE* mg, int index) {
    if (index >= 0 && index < NUM_SAVED_MYSTERY_GIFTS) {
        MysteryGift* ret = &mg->gifts[index];
        if (MysteryGiftTagIsValid(ret->tag)) {
            return ret;
        }
    }

    return NULL;
}

WonderCard* SaveMysteryGift_CardGetByIdx(MYSTERY_GIFT_SAVE* mg, int index) {
    if (index >= 0 && index < NUM_SAVED_WONDER_CARDS) {
        WonderCard* ret = &mg->cards[index];
        if (MysteryGiftTagIsValid(ret->tag)) {
            return ret;
        }
    } else if (index == RECEIVED_WONDER_CARD_IDX) {
        return &mg->receivedCard;
    }

    return NULL;
}

BOOL sub_0202DC2C(MYSTERY_GIFT_SAVE* mg, const MysteryGift* src, int flag) {
    BOOL ret = FALSE;
    int i;
    
    if (!SaveMysteryGift_FindAvailable(mg)) {
        return FALSE;
    }

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (!MysteryGiftTagIsValid(mg->gifts[i].tag)) {
            MI_CpuCopy8(src, &mg->gifts[i], sizeof(MysteryGift));
            mg->gifts[i].flag = flag;
            ret = TRUE;
            break;
        }
    }

    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return ret;
}
