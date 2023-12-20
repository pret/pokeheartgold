#include "global.h"
#include "mystery_gift.h"
#include "save.h"
#include "save_arrays.h"
#include "constants/save_arrays.h"

BOOL MysteryGiftTagIsValid(u32 tag);
MysteryGift* SaveMysteryGift_GetByIdx(MysteryGiftSave* mg, int index);
BOOL SaveMysteryGift_SetReceivedByIdx(MysteryGiftSave* mg, int index);
void SaveMysteryGift_ReceivedFlagClear(MysteryGiftSave* mg, int index);
void SaveMysteryGift_SetReceivedByCardId(MysteryGiftSave* mg, int index);
BOOL SaveMysteryGift_TagAtIndexIsValid(const MysteryGiftSave* mg, int index);
void SaveMysteryGift_ReceivedFlagClear(MysteryGiftSave* mg, int index);

u32 Save_MysteryGift_sizeof(void) {
    return sizeof(MysteryGiftSave);
}

void Save_MysteryGift_Init(MysteryGiftSave* mg) {
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

BOOL MysteryGiftTagIsValid(u32 tag) {
    return tag != MG_TAG_INVALID && tag < MG_TAG_MAX;
}

MysteryGift* SaveMysteryGift_GetByIdx(MysteryGiftSave* mg, int index) {
    if (index >= 0 && index < NUM_SAVED_MYSTERY_GIFTS) {
        MysteryGift* ret = &mg->gifts[index];
        if (MysteryGiftTagIsValid(ret->tag)) {
            return ret;
        }
    }

    return NULL;
}

WonderCard* SaveMysteryGift_CardGetByIdx(MysteryGiftSave* mg, int index) {
    if (index >= 0 && index < NUM_SAVED_WONDER_CARDS) {
        WonderCard* ret = &mg->cards[index];
        if (MysteryGiftTagIsValid(ret->tag)) {
            return ret;
        }
    } else if (index == RECEIVED_WONDER_CARD_IDX) {
        return &mg->specialWonderCard;
    }

    return NULL;
}

BOOL SaveMysteryGift_TryInsertGift(MysteryGiftSave* mg, const MysteryGift* src, int cardIdx) {
    BOOL ret = FALSE;
    int i;

    if (!SaveMysteryGift_FindAvailable(mg)) {
        return FALSE;
    }

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (!MysteryGiftTagIsValid(mg->gifts[i].tag)) {
            MI_CpuCopy8(src, &mg->gifts[i], sizeof(MysteryGift));
            mg->gifts[i].flag = cardIdx;
            ret = TRUE;
            break;
        }
    }

    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return ret;
}

BOOL SaveMysteryGift_TryInsertCard(MysteryGiftSave* mg, const WonderCard* src) {
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
                SaveMysteryGift_TryInsertGift(mg, (const MysteryGift*)src, i);
            }
            ret = TRUE;
            break;
        }
    }

    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return ret;
}

BOOL SaveMysteryGift_TrySetSpecialCard(MysteryGiftSave* mg, const WonderCard* src) {
    if (MysteryGiftTagIsValid(mg->specialWonderCard.tag) == TRUE) {
        return FALSE;
    }

    MI_CpuCopy8(src, &mg->specialWonderCard, sizeof(WonderCard));
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return FALSE;
}

BOOL SaveMysteryGift_SetReceivedByIdx(MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_MYSTERY_GIFTS);
    mg->gifts[index].tag = MG_TAG_INVALID;
    mg->gifts[index].flag = 0;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL SaveMysteryGift_ReceiveGiftAndClearCardByIndex(MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);
    mg->cards[index].tag = MG_TAG_INVALID;
    SaveMysteryGift_ReceivedFlagClear(mg, mg->cards[index].unk104.id);
    SaveMysteryGift_SetReceivedByCardId(mg, index);
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL SaveMysteryGift_DeleteWonderCardByIndex(MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);
    mg->cards[index].tag = MG_TAG_INVALID;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
    return TRUE;
}

BOOL SaveMysteryGift_FindAvailable(const MysteryGiftSave* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (!MysteryGiftTagIsValid(mg->gifts[i].tag)) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL SaveMysteryGift_CardFindAvailable(const MysteryGiftSave* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_WONDER_CARDS; ++i) {
        if (!MysteryGiftTagIsValid(mg->cards[i].tag)) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL SaveMysteryGift_TagAtIndexIsValid(const MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_MYSTERY_GIFTS);

    return MysteryGiftTagIsValid(mg->gifts[index].tag) != FALSE;
}

BOOL SaveMysteryGift_CardTagIsValid(const MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_SAVED_WONDER_CARDS);

    return MysteryGiftTagIsValid(mg->cards[index].tag) != FALSE;
}

BOOL SaveMysteryGift_SpecialCardTagIsValid(const MysteryGiftSave* mg) {
    return MysteryGiftTagIsValid(mg->specialWonderCard.tag) != FALSE;
}

BOOL SaveMysteryGift_HasAnyCard(const MysteryGiftSave* mg) {
    int i;

    for (i = 0; i < NUM_SAVED_WONDER_CARDS; ++i) {
        if (SaveMysteryGift_CardTagIsValid(mg, i) == TRUE) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL SaveMysteryGift_HasAnyGift(const MysteryGiftSave* mg, int a1) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (MysteryGiftTagIsValid(mg->gifts[i].tag) && a1 == mg->gifts[i].flag) {
            return TRUE;
        }
    }

    return FALSE;
}

void SaveMysteryGift_SetReceivedByCardId(MysteryGiftSave* mg, int a1) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (MysteryGiftTagIsValid(mg->gifts[i].tag) && a1 == mg->gifts[i].flag) {
            SaveMysteryGift_SetReceivedByIdx(mg, i);
            break;
        }
    }
}

BOOL SaveMysteryGift_ReceivedFlagTest(const MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_MYSTERY_GIFT_RECV_FLAGS);
    return mg->receivedFlags[index / 8] & (1 << (index & 7)) ? TRUE : FALSE;
}

void SaveMysteryGift_ReceivedFlagSet(MysteryGiftSave* mg, int index) {
    GF_ASSERT(index < NUM_MYSTERY_GIFT_RECV_FLAGS);
    mg->receivedFlags[index / 8] |= (1 << (index & 7));
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

void SaveMysteryGift_ReceivedFlagClear(MysteryGiftSave* mg, int index) {
    u8 mask = ~(1 << (index & 7));
    GF_ASSERT(index < NUM_MYSTERY_GIFT_RECV_FLAGS);
    mg->receivedFlags[index / 8] &= mask;
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

BOOL SaveMysteryGift_TestFlagx7FF(const MysteryGiftSave* mg) {
    return SaveMysteryGift_ReceivedFlagTest(mg, 0x7FF);
}

void SaveMysteryGift_SetFlagx7FF(MysteryGiftSave* mg) {
    SaveMysteryGift_ReceivedFlagSet(mg, 0x7FF);
}

// ======================================

static MysteryGiftSave* sMysteryGiftSaveData;

void SaveMGDataPtr_Begin(SaveData* saveData) {
    if (sMysteryGiftSaveData == NULL) {
        sMysteryGiftSaveData = Save_MysteryGift_Get(saveData);
    }
    SaveSubstruct_UpdateCRC(SAVE_MYSTERY_GIFT);
}

void SaveMGDataPtr_End(void) {
    if (sMysteryGiftSaveData != NULL) {
        sMysteryGiftSaveData = NULL;
    }
}

int SaveMGDataPtr_GetFirstGiftIndex(void) {
    int i;

    for (i = 0; i < NUM_SAVED_MYSTERY_GIFTS; ++i) {
        if (SaveMysteryGift_TagAtIndexIsValid(sMysteryGiftSaveData, i) == TRUE) {
            return i;
        }
    }

    return -1;
}

u16 SaveMGDataPtr_GetTagByIndex(int index) {
    MysteryGift* gift = SaveMysteryGift_GetByIdx(sMysteryGiftSaveData, index);
    if (gift != NULL) {
        return gift->tag;
    }

    return MG_TAG_INVALID;
}

MysteryGiftData* SaveMGDataPtr_GetDataByIndex(int index) {
    MysteryGift* gift = SaveMysteryGift_GetByIdx(sMysteryGiftSaveData, index);
    if (gift != NULL) {
        return &gift->data;
    }

    return NULL;
}

void SaveMGDataPtr_SetReceivedByIndex(int index) {
    SaveMysteryGift_SetReceivedByIdx(sMysteryGiftSaveData, index);
}
