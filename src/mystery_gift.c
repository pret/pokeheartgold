#include "global.h"
#include "mystery_gift.h"
#include "save.h"
#include "save_arrays.h"
#include "constants/save_arrays.h"

BOOL MysteryGiftTagIsValid(u32 tag);
MysteryGift* SaveMysteryGift_GetByIdx(MYSTERY_GIFT_SAVE* mg, int index);
BOOL SaveMysteryGiftI_SetReceived(MYSTERY_GIFT_SAVE* mg, int index);
void sub_0202DFDC(MYSTERY_GIFT_SAVE* mg, int index);
void sub_0202DF38(MYSTERY_GIFT_SAVE* mg, int index);
BOOL SaveMysteryGiftI_TagIsValid(MYSTERY_GIFT_SAVE* mg, int index);
void sub_0202DFDC(MYSTERY_GIFT_SAVE* mg, int a1);

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

BOOL sub_0202DCAC(MYSTERY_GIFT_SAVE* mg, const WonderCard* src) {
    BOOL ret = FALSE;
    int i;

    if (!SaveMysteryGift_CardFindAvailable(mg)) {
        return FALSE;
    }

    if (src->unk104.unk8E_3 == 1 && !SaveMysteryGift_FindAvailable(mg)) {
        return FALSE;
    }

    for (i = 0; i < NUM_SAVED_WONDER_CARDS; ++i) {
        if (!MysteryGiftTagIsValid(mg->cards[i].tag)) {
            MI_CpuCopy8(src, &mg->cards[i], sizeof(WonderCard));
            if (src->unk104.unk8E_3 == 1) {
                sub_0202DC2C(mg, (const MysteryGift*)src, i);
            }
            ret = TRUE;
            break;
        }
    }

    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return ret;
}

BOOL sub_0202DD48(MYSTERY_GIFT_SAVE* mg, const WonderCard* src) {
    if (MysteryGiftTagIsValid(mg->receivedCard.tag) == TRUE) {
        return FALSE;
    }

    MI_CpuCopy8(src, &mg->receivedCard, sizeof(WonderCard));
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return FALSE;
}

BOOL SaveMysteryGiftI_SetReceived(MYSTERY_GIFT_SAVE* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_MYSTERY_GIFTS);
    mg->gifts[index].tag = MG_TAG_invalid;
    mg->gifts[index].flag = 0;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL sub_0202DDB0(MYSTERY_GIFT_SAVE* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);
    mg->cards[index].tag = MG_TAG_invalid;
    sub_0202DFDC(mg, mg->cards[index].unk104.id);
    sub_0202DF38(mg, index);
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL sub_0202DDEC(MYSTERY_GIFT_SAVE* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);
    mg->cards[index].tag = MG_TAG_invalid;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL SaveMysteryGift_FindAvailable(MYSTERY_GIFT_SAVE* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (!MysteryGiftTagIsValid(mg->gifts[i].tag)) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL SaveMysteryGift_CardFindAvailable(MYSTERY_GIFT_SAVE* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_WONDER_CARDS; ++i) {
        if (!MysteryGiftTagIsValid(mg->cards[i].tag)) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL SaveMysteryGiftI_TagIsValid(MYSTERY_GIFT_SAVE* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_MYSTERY_GIFTS);
    
    if (MysteryGiftTagIsValid(mg->gifts[index].tag)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_0202DE90(MYSTERY_GIFT_SAVE* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);
    
    if (MysteryGiftTagIsValid(mg->cards[index].tag)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_0202DEBC(MYSTERY_GIFT_SAVE* mg) {
    if (MysteryGiftTagIsValid(mg->receivedCard.tag)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_0202DED8(MYSTERY_GIFT_SAVE* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_WONDER_CARDS; ++i) {
        if (sub_0202DE90(mg, i) == TRUE) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL sub_0202DEF8(MYSTERY_GIFT_SAVE* mg, int a1) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (MysteryGiftTagIsValid(mg->gifts[i].tag) && a1 == mg->gifts[i].flag) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_0202DF38(MYSTERY_GIFT_SAVE* mg, int a1) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (MysteryGiftTagIsValid(mg->gifts[i].tag) && a1 == mg->gifts[i].flag) {
            SaveMysteryGiftI_SetReceived(mg, i);
            break;
        }
    }
}

BOOL sub_0202DF7C(MYSTERY_GIFT_SAVE* mg, int a1) {
    GF_ASSERT(a1 < 2048);
    return mg->filler_000[a1 / 8] & (1 << (a1 & 7)) ? TRUE : FALSE;
}

void sub_0202DFAC(MYSTERY_GIFT_SAVE* mg, int a1) {
    GF_ASSERT(a1 < 2048);
    mg->filler_000[a1 / 8] |= (1 << (a1 & 7));
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

void sub_0202DFDC(MYSTERY_GIFT_SAVE* mg, int a1) {
    u8 mask = ~(1 << (a1 & 7));
    GF_ASSERT(a1 < 2048);
    mg->filler_000[a1 / 8] &= mask;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

BOOL sub_0202E014(MYSTERY_GIFT_SAVE* mg) {
    return sub_0202DF7C(mg, 0x7FF);
}

void sub_0202E024(MYSTERY_GIFT_SAVE* mg) {
    sub_0202DFAC(mg, 0x7FF);
}

static MYSTERY_GIFT_SAVE* sMysteryGiftData;

void GetStaticPointerToSaveMysteryGift(SaveData* saveData) {
    if (sMysteryGiftData == NULL) {
        sMysteryGiftData = Save_MysteryGift_Get(saveData);
    }
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

void DeleteStaticPointerToMysteryGift(void) {
    if (sMysteryGiftData != NULL) {
        sMysteryGiftData = NULL;
    }
}

int GetFirstQueuedMysteryGiftIdx(void) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (SaveMysteryGiftI_TagIsValid(sMysteryGiftData, i) == TRUE) {
            return i;
        }
    }

    return -1;
}

u16 GetMysteryGiftTagByIdx(int index) {
    MysteryGift* gift = SaveMysteryGift_GetByIdx(sMysteryGiftData, index);
    if (gift != NULL) {
        return gift->tag;
    }

    return MG_TAG_invalid;
}

MysteryGiftTag* GetMysteryGiftDataByIdx(int index) {
    MysteryGift* gift = SaveMysteryGift_GetByIdx(sMysteryGiftData, index);
    if (gift != NULL) {
        return &gift->data;
    }

    return NULL;
}

void SetMysteryGiftReceivedByIdx(int index) {
    SaveMysteryGiftI_SetReceived(sMysteryGiftData, index);
}
