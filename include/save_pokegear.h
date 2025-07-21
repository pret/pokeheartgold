#ifndef POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H
#define POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H

#include "constants/phone_contacts.h"
#include "constants/pokegear_card.h"

#include "save.h"

#define MOMS_BALANCE_GET 0
#define MOMS_BALANCE_SET 1
#define MOMS_BALANCE_ADD 2
#define MOMS_BALANCE_SUB 3

#define MOMS_BALANCE_MAX 999999

typedef struct PhoneContact {
    u8 id;
} PhoneContact;

typedef struct PhoneRematch {
    u16 seeking : 1;
    u16 hasGift : 1;
    u16 unk_0_2 : 6;
    u16 giftItem;
} PhoneRematch; // size=0x4

typedef struct PhoneCallPersistentState {
    PhoneRematch rematches[NUM_PHONE_CONTACTS];
    u16 momGiftQueue[5][2];
    u32 bankBalance; // 140
    u16 unk_144;
    u8 kenjiWaitDays : 7;
    u8 kenjiActive : 1;
    u8 numSafariAreas;
    u8 safariAreas[6];
    u8 unk_14E[2];
    u8 filler_150[4];
} PhoneCallPersistentState; // size=0x154

typedef struct UnkPokegearSub8 {
    u16 unk_0;
    u16 unk_2_0 : 4;
    u16 unk_2_4 : 4;
    u16 unk_2_8 : 4;
    u16 unk_2_C : 4;
    u16 unk_4[4];
} UnkPokegearSub8;

typedef struct UnkPokegearSub8List {
    UnkPokegearSub8 list[100];
} UnkPokegearSub8List;

struct UnkStruct_0202F3DC {
    u32 unk_0;
    u8 unk_4[4];
    u16 unk_8[4];
};

typedef struct SavePokegear {
    u8 lastUsedApp;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u32 unk_4_0 : 9;
    u32 unk_4_9 : 9;
    u32 backgroundStyle : 7;
    u32 registeredCards : 2;
    // mapUnlockLevel
    // 0: only Johto
    // 1: add Routes 26-28, Victory Road, and Indigo Plateau
    // 2: the rest of Kanto
    u32 mapUnlockLevel : 2;
    u32 unk_4_29 : 3;
    UnkPokegearSub8List unk_8;
    PhoneCallPersistentState callPersistentState;   // 4B8
    PhoneContact phoneContacts[NUM_PHONE_CONTACTS]; // 60C
} SavePokegear;                                     // size=0x658

u32 SaveData_Pokegear_sizeof(void);
SavePokegear *SaveData_Pokegear_Get(SaveData *saveData);
PhoneCallPersistentState *SaveData_GetPhoneCallPersistentState(SaveData *saveData);
void SaveData_Pokegear_Init(SavePokegear *pokegear);
UnkPokegearSub8List *sub_0202EDF4(SavePokegear *pokegear);
u8 SavePokegear_GetLastUsedApp(SavePokegear *pokegear);
void SavePokegear_SetLastUsedApp(SavePokegear *pokegear, u8 appID);
void SavePokegear_RegisterCard(SavePokegear *pokegear, int card);
u8 Pokegear_GetRegisteredCardsArray(SavePokegear *pokegear);
void Pokegear_SetMapUnlockLevel(SavePokegear *pokegear, u8 mapUnlockMenu);
u8 Pokegear_GetMapUnlockLevel(SavePokegear *pokegear);
u32 Pokegear_GetBackgroundStyle(SavePokegear *pokegear);
void Pokegear_SetBackgroundStyle(SavePokegear *pokegear, u32 a1);
u16 sub_0202EE98(SavePokegear *pokegear);
u8 sub_0202EEA4(SavePokegear *pokegear);
void sub_0202EEA8(SavePokegear *pokegear, u8 a1);
void Pokegear_SetRadioCursorCoords(SavePokegear *pokegear, u8 x, u8 y);
void Pokegear_GetRadioCursorCoords(SavePokegear *pokegear, s16 *px, s16 *py);
u8 SavePokegear_FindEmptyPhonebookSlot(SavePokegear *pokegear);
u8 SavePokegear_IsNumberRegistered(SavePokegear *pokegear, u8 contact);
void SavePokegear_RegisterPhoneNumber(SavePokegear *pokegear, u8 contact);
PhoneContact *SavePokegear_AllocAndCopyPhonebook(SavePokegear *pokegear, HeapID heapId);
void SavePokegear_SetPhonebookFromBuffer(SavePokegear *pokegear, PhoneContact *contacts, u8 num);

void sub_0202F01C(PhoneCallPersistentState *callPersistentState, u8 idx);
void sub_0202F050(PhoneCallPersistentState *callPersistentState, u8 idx);
BOOL sub_0202F08C(PhoneCallPersistentState *callPersistentState, u8 idx);
void PhoneCallPersistentState_PhoneRematches_SetSeeking(PhoneCallPersistentState *callPersistentState, u8 idx, BOOL state);
BOOL PhoneCallPersistentState_PhoneRematches_IsSeeking(PhoneCallPersistentState *callPersistentState, u8 idx);
void PhoneCallPersistentState_PhoneRematches_GiftItemIdSet(PhoneCallPersistentState *callPersistentState, u8 idx, u16 itemId);
u16 PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(PhoneCallPersistentState *callPersistentState, u8 idx);
u32 PhoneCallPersistentState_MomSavings_BalanceAction(PhoneCallPersistentState *callPersistentState, int action, u32 operand);
void sub_0202F198(PhoneCallPersistentState *callPersistentState, u8 idx);
BOOL sub_0202F1B4(PhoneCallPersistentState *callPersistentState, u8 idx);
void PhoneCallPersistentState_MomGiftQueue_Put(PhoneCallPersistentState *callPersistentState, u16 itemID, u16 quantity);
void PhoneCallPersistentState_MomGiftQueue_Get(PhoneCallPersistentState *callPersistentState);
u16 PhoneCallPersistentState_MomGiftQueue_Peek(PhoneCallPersistentState *callPersistentState, u8 idx, u16 *pItemID);
BOOL PhoneCallPersistentState_MomGiftQueue_IsFull(PhoneCallPersistentState *callPersistentState);
void PhoneCallPersistentState_BlackBeltKenji_SetActiveFlag(PhoneCallPersistentState *callPersistentState, BOOL flag);
BOOL PhoneCallPersistentState_BlackBeltKenji_GetActiveFlag(PhoneCallPersistentState *callPersistentState);
int PhoneCallPersistentState_BlackBeltKenji_GetWaitDays(PhoneCallPersistentState *callPersistentState);
void sub_0202F294(PhoneCallPersistentState *callPersistentState, int a1);
void PhoneCallPersistentState_SafariZoneArrangement_Set(PhoneCallPersistentState *callPersistentState, u8 *areas, u8 numAreas);
u8 *PhoneCallPersistentState_SafariZoneArrangement_AllocAndGet(PhoneCallPersistentState *callPersistentState, u8 *numAreasRet, HeapID heapId);

BOOL sub_0202F370(UnkPokegearSub8 *unk);
void sub_0202F388(UnkPokegearSub8 *unk);
void sub_0202F3DC(struct UnkStruct_0202F3DC *unk);
BOOL sub_0202F400(struct UnkStruct_0202F3DC *unk);
void sub_0202F434(struct UnkStruct_0202F3DC *src, UnkPokegearSub8 *dest);
void sub_0202F4B0(UnkPokegearSub8 *src, struct UnkStruct_0202F3DC *dest);
BOOL sub_0202F4E8(UnkPokegearSub8List *list, u8 a1);
void sub_0202F500(UnkPokegearSub8List *list, u8 a1);
BOOL sub_0202F514(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2);
BOOL sub_0202F53C(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2, BOOL a3);

#endif // POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H
