#include "global.h"
#include "save_pokegear.h"
#include "math_util.h"
#include "constants/items.h"

static void InitGSPlayerMiscInternal(SavePokegear *pokegear);
static void GSPlayerMisc_PhonebookInit(SavePokegear *pokegear);
static MomsSavings *GSPlayerMisc_GetMomSavingsAddr(SavePokegear *pokegear);
static void sub_0202EFC4(PhoneRematch *rematch);
static void MomsSavingsInit(MomsSavings *momsSavings);

u32 SaveData_GSPlayerMisc_sizeof(void) {
    return sizeof(SavePokegear);
}

SavePokegear *SaveData_GSPlayerMisc_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEGEAR);
}

MomsSavings *SaveData_GetMomsSavingsAddr(SaveData *saveData) {
    SavePokegear *pokegear = SaveArray_Get(saveData, SAVE_POKEGEAR);
    return GSPlayerMisc_GetMomSavingsAddr(pokegear);
}

static void InitGSPlayerMiscInternal(SavePokegear *pokegear) {
    MI_CpuClear8(pokegear, sizeof(SavePokegear));
    pokegear->unk_0 = 3;
    pokegear->unk_4_18 = 0;
    pokegear->unk_1 = 0;
    pokegear->unk_3 = 128;
    pokegear->unk_2 = pokegear->unk_3;
    pokegear->registeredCards = 0;
    pokegear->unk_4_27 = 0;
    GSPlayerMisc_PhonebookInit(pokegear);
    MomsSavingsInit(&pokegear->momsSavings);
}

void SaveData_GSPlayerMisc_Init(SavePokegear *pokegear) {
    InitGSPlayerMiscInternal(pokegear);
}

UnkPokegearSub8List *sub_0202EDF4(SavePokegear *pokegear) {
    return &pokegear->unk_8;
}

u8 sub_0202EDF8(SavePokegear *pokegear) {
    return pokegear->unk_0;
}

void sub_0202EDFC(SavePokegear *pokegear, u8 a1) {
    pokegear->unk_0 = a1;
}

void Pokegear_RegisterCard(SavePokegear *pokegear, int card) {
    switch (card) {
    case GEARCARD_PHONE:
        pokegear->registeredCards = 0;
        break;
    case GEARCARD_MAP:
        pokegear->registeredCards |= 1;
        break;
    case GEARCARD_RADIO:
        pokegear->registeredCards |= 2;
        break;
    }
}

u8 Pokegear_GetRegisteredCardsArray(SavePokegear *pokegear) {
    return pokegear->registeredCards;
}

void sub_0202EE58(SavePokegear *pokegear, u8 a1) {
    if (a1 < 3) {
        pokegear->unk_4_27 = a1;
    }
}

u8 sub_0202EE70(SavePokegear *pokegear) {
    return pokegear->unk_4_27;
}

u32 sub_0202EE7C(SavePokegear *pokegear) {
    return pokegear->unk_4_18;
}

void sub_0202EE84(SavePokegear *pokegear, u32 a1) {
    pokegear->unk_4_18 = a1;
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

u8 GSPlayerMisc_FindEmptyGearPhonebookSlot(SavePokegear *pokegear) {
    u8 i;

    for (i = 0; i < NUM_PHONE_CONTACTS; i++) {
        if (pokegear->phoneContacts[i].id == PHONE_CONTACT_NONE) {
            return i;
        }
    }

    return NUM_PHONE_CONTACTS;
}

u8 GSPlayerMisc_IsGearNumberRegistered(SavePokegear *pokegear, u8 contact) {
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

void RegisterPhoneNumberInPokeGear(SavePokegear *pokegear, u8 contact) {
    u8 slot;

    if (contact >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }

    if (GSPlayerMisc_IsGearNumberRegistered(pokegear, contact) == 0xFF) {
        slot = GSPlayerMisc_FindEmptyGearPhonebookSlot(pokegear);
        pokegear->phoneContacts[slot].id = contact;
    }
}

PhoneContact *GSPlayerMisc_AllocAndCopyPhonebook(SavePokegear *pokegear, HeapID heapId) {
    u8 num = GSPlayerMisc_FindEmptyGearPhonebookSlot(pokegear);
    PhoneContact *ret = AllocFromHeap(heapId, num * sizeof(PhoneContact));
    MI_CpuCopy8(pokegear->phoneContacts, ret, num * sizeof(PhoneContact));
    return ret;
}

void GSPlayerMisc_SetPhonebookFromBuffer(SavePokegear *pokegear, PhoneContact *contacts, u8 num) {
    MI_CpuFill8(pokegear->phoneContacts, PHONE_CONTACT_NONE, NUM_PHONE_CONTACTS * sizeof(PhoneContact));
    if (num >= NUM_PHONE_CONTACTS) {
        num = NUM_PHONE_CONTACTS;
    }
    MI_CpuCopy8(contacts, pokegear->phoneContacts, num * sizeof(PhoneContact));
}

static void GSPlayerMisc_PhonebookInit(SavePokegear *pokegear) {
    MI_CpuFill8(pokegear->phoneContacts, PHONE_CONTACT_NONE, NUM_PHONE_CONTACTS * sizeof(PhoneContact));
    pokegear->phoneContacts[0].id = PHONE_CONTACT_MOTHER;
}

static MomsSavings *GSPlayerMisc_GetMomSavingsAddr(SavePokegear *pokegear) {
    return &pokegear->momsSavings;
}

static void sub_0202EFC4(PhoneRematch *rematch) {
    rematch->seeking = 0;
    rematch->hasGift = 0;
    rematch->unk_0_2 = 1;
    rematch->giftItem = 0;
}

static void MomsSavingsInit(MomsSavings *momsSavings) {
    int i;

    MI_CpuClear8(momsSavings, sizeof(MomsSavings));
    for (i = 0; i < NUM_PHONE_CONTACTS; i++) {
        sub_0202EFC4(&momsSavings->rematches[i]);
    }
    momsSavings->unk_146_0 = 7;
}

void sub_0202F01C(MomsSavings *momsSavings, u8 idx) {
    u8 byteno;
    u8 flagno;
    if (idx >= 13) {
        GF_ASSERT(0);
        return;
    }
    byteno = idx / 8;
    flagno = idx % 8;
    momsSavings->unk_14E[byteno] |= (1 << flagno);
}

void sub_0202F050(MomsSavings *momsSavings, u8 idx) {
    u8 byteno;
    u8 mask;
    if (idx >= 13) {
        GF_ASSERT(0);
        return;
    }
    byteno = idx / 8;
    mask = 1 << (idx % 8);
    if (momsSavings->unk_14E[byteno] & mask) {
        momsSavings->unk_14E[byteno] ^= mask;
    }
}

BOOL sub_0202F08C(MomsSavings *momsSavings, u8 idx) {
    u8 byteno;
    u8 flagno;
    if (idx >= 13) {
        GF_ASSERT(0);
        return FALSE;
    }
    byteno = idx / 8;
    flagno = idx % 8;
    return (momsSavings->unk_14E[byteno] >> flagno) & 1;
}

void PhoneRematches_SetSeeking(MomsSavings *momsSavings, u8 idx, BOOL state) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }
    momsSavings->rematches[idx].seeking = state;
}

BOOL PhoneRematches_IsSeeking(MomsSavings *momsSavings, u8 idx) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return FALSE;
    }
    return momsSavings->rematches[idx].seeking;
}

void PhoneRematches_GiftItemIdSet(MomsSavings *momsSavings, u8 idx, u16 itemId) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return;
    }
    momsSavings->rematches[idx].giftItem = itemId;
    if (itemId == ITEM_NONE) {
        momsSavings->rematches[idx].hasGift = FALSE;
    } else {
        momsSavings->rematches[idx].hasGift = TRUE;
    }
}

u16 PhoneRematches_GiftItemIdGet(MomsSavings *momsSavings, u8 idx) {
    if (idx >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(0);
        return ITEM_NONE;
    }
    if (momsSavings->rematches[idx].hasGift) {
        return momsSavings->rematches[idx].giftItem;
    } else {
        return ITEM_NONE;
    }
}

u32 MomSavingsBalanceAction(MomsSavings *momsSavings, int action, u32 operand) {
    switch (action) {
    case MOMS_BALANCE_SET:
        momsSavings->bankBalance = operand;
        break;
    case MOMS_BALANCE_ADD:
        momsSavings->bankBalance += operand;
        if (momsSavings->bankBalance > MOMS_BALANCE_MAX) {
            momsSavings->bankBalance = MOMS_BALANCE_MAX;
        }
        break;
    case MOMS_BALANCE_SUB:
        if (momsSavings->bankBalance < operand) {
            momsSavings->bankBalance = 0;
        } else {
            momsSavings->bankBalance -= operand;
        }
        break;
    }
    return momsSavings->bankBalance;
}

void sub_0202F198(MomsSavings *momsSavings, u8 idx) {
    if (idx < 9) {
        momsSavings->unk_144 |= (1 << idx);
    }
}

BOOL sub_0202F1B4(MomsSavings *momsSavings, u8 idx) {
    return (momsSavings->unk_144 >> idx) & 1;
}

void sub_0202F1C4(MomsSavings *momsSavings, u16 a1, u16 a2) {
    int i;

    for (i = 0; i < 5; i++) {
        if (momsSavings->unk_12C[i][1] == 0) {
            momsSavings->unk_12C[i][0] = a1;
            momsSavings->unk_12C[i][1] = a2;
            break;
        }
    }
}

void sub_0202F1F4(MomsSavings *momsSavings) {
    int i;
    for (i = 0; i < 4; i++) {
        momsSavings->unk_12C[i][0] = momsSavings->unk_12C[i + 1][0];
        momsSavings->unk_12C[i][1] = momsSavings->unk_12C[i + 1][1];
    }
    momsSavings->unk_12C[4][0] = 0;
    momsSavings->unk_12C[4][1] = 0;
}

u16 sub_0202F224(MomsSavings *momsSavings, u8 a1, u16 *a2) {
    if (a1 >= 5) {
        *a2 = 0;
        return 0;
    } else {
        *a2 = momsSavings->unk_12C[a1][0];
        return momsSavings->unk_12C[a1][1];
    }
}

BOOL sub_0202F240(MomsSavings *momsSavings) {
    return momsSavings->unk_12C[4][1] != 0;
}

void sub_0202F254(MomsSavings *momsSavings, BOOL a1) {
    momsSavings->unk_146_7 = a1;
}

BOOL sub_0202F274(MomsSavings *momsSavings) {
    return momsSavings->unk_146_7;
}

int sub_0202F284(MomsSavings *momsSavings) {
    return momsSavings->unk_146_0;
}

void sub_0202F294(MomsSavings *momsSavings, int a1) {
    momsSavings->unk_146_7 = FALSE;
    PhoneRematches_GiftItemIdSet(momsSavings, PHONE_CONTACT_KENJI, ITEM_NONE);
    PhoneRematches_SetSeeking(momsSavings, PHONE_CONTACT_KENJI, FALSE);

    if (a1 > 0 && momsSavings->unk_146_0 >= a1) {
        momsSavings->unk_146_0 -= a1;
    } else {
        momsSavings->unk_146_0 = (LCRandom() % 6) + 1;
    }
}

void sub_0202F300(MomsSavings *momsSavings, u8 *a1, u8 a2) {
    MI_CpuClear8(momsSavings->unk_148, 6);
    if (a1 == NULL) {
        momsSavings->unk_147 = 0;
    } else {
        if (a2 >= 6) {
            a2 = 6;
        }
        MI_CpuCopy8(a1, momsSavings->unk_148, a2);
        momsSavings->unk_147 = a2;
    }
}

u8 *sub_0202F340(MomsSavings *momsSavings, u8 *a1, HeapID heapId) {
    u8 *ret = AllocFromHeap(heapId, momsSavings->unk_147);
    MI_CpuCopy8(momsSavings->unk_148, ret, momsSavings->unk_147);
    *a1 = momsSavings->unk_147;
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
