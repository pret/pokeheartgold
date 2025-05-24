#include "save_pokegear.h"

#include "global.h"

#include "constants/items.h"

#include "math_util.h"

static void SavePokegear_Init_Internal(SavePokegear *pokegear);
static void SavePokegear_PhonebookInit(SavePokegear *pokegear);
static PhoneCallPersistentState *SavePokegear_GetPhoneCallPersistentState(SavePokegear *pokegear);
static void PhoneRematch_Init(PhoneRematch *rematch);
static void PhoneCallPersistentState_Init(PhoneCallPersistentState *callPersistentState);

u32 SaveData_Pokegear_sizeof(void) {
    return sizeof(SavePokegear);
}

SavePokegear *SaveData_Pokegear_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEGEAR);
}

PhoneCallPersistentState *SaveData_GetPhoneCallPersistentState(SaveData *saveData) {
    SavePokegear *pokegear = SaveArray_Get(saveData, SAVE_POKEGEAR);
    return SavePokegear_GetPhoneCallPersistentState(pokegear);
}

static void SavePokegear_Init_Internal(SavePokegear *pokegear) {
    MI_CpuClear8(pokegear, sizeof(SavePokegear));
    pokegear->lastUsedApp = 3;
    pokegear->backgroundStyle = 0;
    pokegear->unk_1 = 0;
    pokegear->unk_3 = 128;
    pokegear->unk_2 = pokegear->unk_3;
    pokegear->registeredCards = 0;
    pokegear->mapUnlockLevel = 0;
    SavePokegear_PhonebookInit(pokegear);
    PhoneCallPersistentState_Init(&pokegear->callPersistentState);
}

void SaveData_Pokegear_Init(SavePokegear *pokegear) {
    SavePokegear_Init_Internal(pokegear);
}

UnkPokegearSub8List *sub_0202EDF4(SavePokegear *pokegear) {
    return &pokegear->unk_8;
}

u8 SavePokegear_GetLastUsedApp(SavePokegear *pokegear) {
    return pokegear->lastUsedApp;
}

void SavePokegear_SetLastUsedApp(SavePokegear *pokegear, u8 app) {
    pokegear->lastUsedApp = app;
}

void SavePokegear_RegisterCard(SavePokegear *pokegear, int card) {
    switch (card) {
    case GEARCARD_PHONE:
        pokegear->registeredCards = 0;
        break;
    case GEARCARD_MAP:
        pokegear->registeredCards |= GEARCARD_MAP;
        break;
    case GEARCARD_RADIO:
        pokegear->registeredCards |= GEARCARD_RADIO;
        break;
    }
}

u8 Pokegear_GetRegisteredCardsArray(SavePokegear *pokegear) {
    return pokegear->registeredCards;
}

void Pokegear_SetMapUnlockLevel(SavePokegear *pokegear, u8 mapUnlockLevel) {
    if (mapUnlockLevel < 3) {
        pokegear->mapUnlockLevel = mapUnlockLevel;
    }
}

u8 Pokegear_GetMapUnlockLevel(SavePokegear *pokegear) {
    return pokegear->mapUnlockLevel;
}

u32 Pokegear_GetBackgroundStyle(SavePokegear *pokegear) {
    return pokegear->backgroundStyle;
}

void Pokegear_SetBackgroundStyle(SavePokegear *pokegear, u32 newStyle) {
    pokegear->backgroundStyle = newStyle;
}

u16 sub_0202EE98(SavePokegear *pokegear) {
    return pokegear->unk_4_0;
}

u8 sub_0202EEA4(SavePokegear *pokegear) {
    return pokegear->unk_1;
}

void sub_0202EEA8(SavePokegear *pokegear, u8 a1) {
    pokegear->unk_1 = a1;
}

void sub_0202EEAC(SavePokegear *pokegear, u16 a1, u16 a2) {
    pokegear->unk_2 = a1;
    pokegear->unk_3 = a2;
}

void sub_0202EEB4(SavePokegear *pokegear, u16 *a1, u16 *a2) {
    *a1 = pokegear->unk_2;
    *a2 = pokegear->unk_3;
}

u8 SavePokegear_FindEmptyPhonebookSlot(SavePokegear *pokegear) {
    u8 i;

    for (i = 0; i < NUM_PHONE_CONTACTS; i++) {
        if (pokegear->phoneContacts[i].id == PHONE_CONTACT_NONE) {
            return i;
        }
    }

    return NUM_PHONE_CONTACTS;
}

u8 SavePokegear_IsNumberRegistered(SavePokegear *pokegear, u8 contact) {
    u8 i;

    for (i = 0; i < NUM_PHONE_CONTACTS; i++) {
        if (pokegear->phoneContacts[i].id == contact) {
            return i;
        }
        if (pokegear->phoneContacts[i].id == PHONE_CONTACT_NONE) {
            return 0xFF;
        }
    }

    return 0xFF;
}

void SavePokegear_RegisterPhoneNumber(SavePokegear *pokegear, u8 contact) {
    u8 slot;

    if (contact >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }

    if (SavePokegear_IsNumberRegistered(pokegear, contact) == 0xFF) {
        slot = SavePokegear_FindEmptyPhonebookSlot(pokegear);
        pokegear->phoneContacts[slot].id = contact;
    }
}

PhoneContact *SavePokegear_AllocAndCopyPhonebook(SavePokegear *pokegear, HeapID heapId) {
    u8 num = SavePokegear_FindEmptyPhonebookSlot(pokegear);
    PhoneContact *ret = AllocFromHeap(heapId, num * sizeof(PhoneContact));
    MI_CpuCopy8(pokegear->phoneContacts, ret, num * sizeof(PhoneContact));
    return ret;
}

void SavePokegear_SetPhonebookFromBuffer(SavePokegear *pokegear, PhoneContact *contacts, u8 num) {
    MI_CpuFill8(pokegear->phoneContacts, PHONE_CONTACT_NONE, NUM_PHONE_CONTACTS * sizeof(PhoneContact));
    if (num >= NUM_PHONE_CONTACTS) {
        num = NUM_PHONE_CONTACTS;
    }
    MI_CpuCopy8(contacts, pokegear->phoneContacts, num * sizeof(PhoneContact));
}

static void SavePokegear_PhonebookInit(SavePokegear *pokegear) {
    MI_CpuFill8(pokegear->phoneContacts, PHONE_CONTACT_NONE, NUM_PHONE_CONTACTS * sizeof(PhoneContact));
    pokegear->phoneContacts[0].id = PHONE_CONTACT_MOTHER;
}

static PhoneCallPersistentState *SavePokegear_GetPhoneCallPersistentState(SavePokegear *pokegear) {
    return &pokegear->callPersistentState;
}

static void PhoneRematch_Init(PhoneRematch *rematch) {
    rematch->seeking = 0;
    rematch->hasGift = 0;
    rematch->unk_0_2 = 1;
    rematch->giftItem = 0;
}

static void PhoneCallPersistentState_Init(PhoneCallPersistentState *callPersistentState) {
    int i;

    MI_CpuClear8(callPersistentState, sizeof(PhoneCallPersistentState));
    for (i = 0; i < NUM_PHONE_CONTACTS; i++) {
        PhoneRematch_Init(&callPersistentState->rematches[i]);
    }
    callPersistentState->kenjiWaitDays = 7;
}

void sub_0202F01C(PhoneCallPersistentState *callPersistentState, u8 idx) {
    u8 byteno;
    u8 flagno;
    if (idx >= 13) {
        GF_ASSERT(0);
        return;
    }
    byteno = idx / 8;
    flagno = idx % 8;
    callPersistentState->unk_14E[byteno] |= (1 << flagno);
}

void sub_0202F050(PhoneCallPersistentState *callPersistentState, u8 idx) {
    u8 byteno;
    u8 mask;
    if (idx >= 13) {
        GF_ASSERT(0);
        return;
    }
    byteno = idx / 8;
    mask = 1 << (idx % 8);
    if (callPersistentState->unk_14E[byteno] & mask) {
        callPersistentState->unk_14E[byteno] ^= mask;
    }
}

BOOL sub_0202F08C(PhoneCallPersistentState *callPersistentState, u8 idx) {
    u8 byteno;
    u8 flagno;
    if (idx >= 13) {
        GF_ASSERT(0);
        return FALSE;
    }
    byteno = idx / 8;
    flagno = idx % 8;
    return (callPersistentState->unk_14E[byteno] >> flagno) & 1;
}

void PhoneCallPersistentState_PhoneRematches_SetSeeking(PhoneCallPersistentState *callPersistentState, u8 idx, BOOL state) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }
    callPersistentState->rematches[idx].seeking = state;
}

BOOL PhoneCallPersistentState_PhoneRematches_IsSeeking(PhoneCallPersistentState *callPersistentState, u8 idx) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return FALSE;
    }
    return callPersistentState->rematches[idx].seeking;
}

void PhoneCallPersistentState_PhoneRematches_GiftItemIdSet(PhoneCallPersistentState *callPersistentState, u8 idx, u16 itemId) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }
    callPersistentState->rematches[idx].giftItem = itemId;
    if (itemId == ITEM_NONE) {
        callPersistentState->rematches[idx].hasGift = FALSE;
    } else {
        callPersistentState->rematches[idx].hasGift = TRUE;
    }
}

u16 PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(PhoneCallPersistentState *callPersistentState, u8 idx) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return ITEM_NONE;
    }
    if (callPersistentState->rematches[idx].hasGift) {
        return callPersistentState->rematches[idx].giftItem;
    } else {
        return ITEM_NONE;
    }
}

u32 PhoneCallPersistentState_MomSavings_BalanceAction(PhoneCallPersistentState *callPersistentState, int action, u32 operand) {
    switch (action) {
    case MOMS_BALANCE_SET:
        callPersistentState->bankBalance = operand;
        break;
    case MOMS_BALANCE_ADD:
        callPersistentState->bankBalance += operand;
        if (callPersistentState->bankBalance > MOMS_BALANCE_MAX) {
            callPersistentState->bankBalance = MOMS_BALANCE_MAX;
        }
        break;
    case MOMS_BALANCE_SUB:
        if (callPersistentState->bankBalance < operand) {
            callPersistentState->bankBalance = 0;
        } else {
            callPersistentState->bankBalance -= operand;
        }
        break;
    }
    return callPersistentState->bankBalance;
}

void sub_0202F198(PhoneCallPersistentState *callPersistentState, u8 idx) {
    if (idx < 9) {
        callPersistentState->unk_144 |= (1 << idx);
    }
}

BOOL sub_0202F1B4(PhoneCallPersistentState *callPersistentState, u8 idx) {
    return (callPersistentState->unk_144 >> idx) & 1;
}

void PhoneCallPersistentState_MomGiftQueue_Put(PhoneCallPersistentState *callPersistentState, u16 itemID, u16 quantity) {
    int i;

    for (i = 0; i < 5; i++) {
        if (callPersistentState->momGiftQueue[i][1] == 0) {
            callPersistentState->momGiftQueue[i][0] = itemID;
            callPersistentState->momGiftQueue[i][1] = quantity;
            break;
        }
    }
}

void PhoneCallPersistentState_MomGiftQueue_Get(PhoneCallPersistentState *callPersistentState) {
    int i;
    for (i = 0; i < 4; i++) {
        callPersistentState->momGiftQueue[i][0] = callPersistentState->momGiftQueue[i + 1][0];
        callPersistentState->momGiftQueue[i][1] = callPersistentState->momGiftQueue[i + 1][1];
    }
    callPersistentState->momGiftQueue[4][0] = 0;
    callPersistentState->momGiftQueue[4][1] = 0;
}

u16 PhoneCallPersistentState_MomGiftQueue_Peek(PhoneCallPersistentState *callPersistentState, u8 idx, u16 *pItemID) {
    if (idx >= 5) {
        *pItemID = 0;
        return 0;
    } else {
        *pItemID = callPersistentState->momGiftQueue[idx][0];
        return callPersistentState->momGiftQueue[idx][1];
    }
}

BOOL PhoneCallPersistentState_MomGiftQueue_IsFull(PhoneCallPersistentState *callPersistentState) {
    return callPersistentState->momGiftQueue[4][1] != 0;
}

void PhoneCallPersistentState_BlackBeltKenji_SetActiveFlag(PhoneCallPersistentState *callPersistentState, BOOL state) {
    callPersistentState->kenjiActive = state;
}

BOOL PhoneCallPersistentState_BlackBeltKenji_GetActiveFlag(PhoneCallPersistentState *callPersistentState) {
    return callPersistentState->kenjiActive;
}

int PhoneCallPersistentState_BlackBeltKenji_GetWaitDays(PhoneCallPersistentState *callPersistentState) {
    return callPersistentState->kenjiWaitDays;
}

void sub_0202F294(PhoneCallPersistentState *callPersistentState, int days) {
    callPersistentState->kenjiActive = FALSE;
    PhoneCallPersistentState_PhoneRematches_GiftItemIdSet(callPersistentState, PHONE_CONTACT_KENJI, ITEM_NONE);
    PhoneCallPersistentState_PhoneRematches_SetSeeking(callPersistentState, PHONE_CONTACT_KENJI, FALSE);

    if (days > 0 && callPersistentState->kenjiWaitDays >= days) {
        callPersistentState->kenjiWaitDays -= days;
    } else {
        callPersistentState->kenjiWaitDays = (LCRandom() % 6) + 1;
    }
}

void PhoneCallPersistentState_SafariZoneArrangement_Set(PhoneCallPersistentState *callPersistentState, u8 *areas, u8 numAreas) {
    MI_CpuClear8(callPersistentState->safariAreas, 6);
    if (areas == NULL) {
        callPersistentState->numSafariAreas = 0;
    } else {
        if (numAreas >= 6) {
            numAreas = 6;
        }
        MI_CpuCopy8(areas, callPersistentState->safariAreas, numAreas);
        callPersistentState->numSafariAreas = numAreas;
    }
}

u8 *PhoneCallPersistentState_SafariZoneArrangement_AllocAndGet(PhoneCallPersistentState *callPersistentState, u8 *numAreasRet, HeapID heapId) {
    u8 *ret = AllocFromHeap(heapId, callPersistentState->numSafariAreas);
    MI_CpuCopy8(callPersistentState->safariAreas, ret, callPersistentState->numSafariAreas);
    *numAreasRet = callPersistentState->numSafariAreas;
    return ret;
}

BOOL sub_0202F370(UnkPokegearSub8 *unk) {
    if (unk->unk_0 == 0 || unk->unk_0 >= 540) {
        return FALSE;
    } else {
        return TRUE;
    }
}

void sub_0202F388(UnkPokegearSub8 *unk) {
    int i;

    unk->unk_0 = 0;
    unk->unk_2_0 = 15;
    unk->unk_2_4 = 15;
    unk->unk_2_8 = 15;
    unk->unk_2_C = 15;
    for (i = 0; i < 4; i++) {
        unk->unk_4[i] = 0xFFFF;
    }
}

void sub_0202F3DC(struct UnkStruct_0202F3DC *unk) {
    int i;

    unk->unk_0 = 0;
    for (i = 0; i < 4; i++) {
        unk->unk_4[i] = 0xF;
        unk->unk_8[i] = 0xFFFF;
    }
}

BOOL sub_0202F400(struct UnkStruct_0202F3DC *unk) {
    int i;

    for (i = 0; i < 4; i++) {
        if (unk->unk_4[i] != 0xF || unk->unk_8[i] != 0xFFFF) {
            return TRUE;
        }
    }

    unk->unk_0 = 0;
    return FALSE;
}

void sub_0202F434(struct UnkStruct_0202F3DC *src, UnkPokegearSub8 *dest) {
    int i;
    dest->unk_0 = src->unk_0;
    // The explicit masks are required to match
    dest->unk_2_0 = src->unk_4[0] & 0xF;
    dest->unk_2_4 = src->unk_4[1] & 0xF;
    dest->unk_2_8 = src->unk_4[2] & 0xF;
    dest->unk_2_C = src->unk_4[3] & 0xF;
    for (i = 0; i < 4; i++) {
        dest->unk_4[i] = src->unk_8[i];
    }
}

void sub_0202F4B0(UnkPokegearSub8 *src, struct UnkStruct_0202F3DC *dest) {
    int i;
    dest->unk_0 = src->unk_0;
    dest->unk_4[0] = src->unk_2_0;
    dest->unk_4[1] = src->unk_2_4;
    dest->unk_4[2] = src->unk_2_8;
    dest->unk_4[3] = src->unk_2_C;
    for (i = 0; i < 4; i++) {
        dest->unk_8[i] = src->unk_4[i];
    }
}

BOOL sub_0202F4E8(UnkPokegearSub8List *list, u8 a1) {
    if (a1 >= 100) {
        return FALSE;
    } else {
        return sub_0202F370(&list->list[a1]);
    }
}

void sub_0202F500(UnkPokegearSub8List *list, u8 a1) {
    if (a1 < 100) {
        sub_0202F388(&list->list[a1]);
    }
}

BOOL sub_0202F514(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2) {
    if (a2 >= 100) {
        sub_0202F3DC(a1);
        return FALSE;
    } else {
        sub_0202F4B0(&list->list[a2], a1);
        return sub_0202F370(&list->list[a2]);
    }
}

BOOL sub_0202F53C(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2, BOOL a3) {
    if (a2 >= 100) {
        return FALSE;
    }
    if (!a3) {
        if (sub_0202F370(&list->list[a2]) == TRUE) {
            return FALSE;
        }
    }
    sub_0202F434(a1, &list->list[a2]);
    return TRUE;
}
