#ifndef POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H
#define POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H

#include "save.h"
#include "constants/phone_contacts.h"
#include "constants/pokegear_card.h"

#define MOMS_BALANCE_GET      0
#define MOMS_BALANCE_SET      1
#define MOMS_BALANCE_ADD      2
#define MOMS_BALANCE_SUB      3

#define MOMS_BALANCE_MAX 999999

typedef struct PhoneContact {
    u8 id;
} PhoneContact;

typedef struct PhoneRematch {
    u16 seeking:1;
    u16 hasGift:1;
    u16 unk_0_2:6;
    u16 giftItem;
} PhoneRematch; // size=0x4

typedef struct MomsSavings {
    PhoneRematch rematches[NUM_PHONE_CONTACTS];
    u16 unk_12C[5][2];
    u32 bankBalance; // 140
    u16 unk_144;
    u8 unk_146_0:7;
    u8 unk_146_7:1;
    u8 unk_147;
    u8 unk_148[6];
    u8 unk_14E[2];
    u8 filler_150[4];
} MomsSavings; // size=0x154

typedef struct UnkPokegearSub8 {
    u16 unk_0;
    u16 unk_2_0:4;
    u16 unk_2_4:4;
    u16 unk_2_8:4;
    u16 unk_2_C:4;
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
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u32 unk_4_0:9;
    u32 unk_4_9:9;
    u32 unk_4_18:7;
    u32 registeredCards:2;
    u32 unk_4_27:2;
    u32 unk_4_29:3;
    UnkPokegearSub8List unk_8;
    MomsSavings momsSavings; // 4B8
    PhoneContact phoneContacts[NUM_PHONE_CONTACTS]; // 60C
} SavePokegear; // size=0x658

u32 SaveData_GSPlayerMisc_sizeof(void);
SavePokegear *SaveData_GSPlayerMisc_Get(SaveData *saveData);
MomsSavings *SaveData_GetMomsSavingsAddr(SaveData *saveData);
void SaveData_GSPlayerMisc_Init(SavePokegear *pokegear);
UnkPokegearSub8List *sub_0202EDF4(SavePokegear *pokegear);
u8 sub_0202EDF8(SavePokegear *pokegear);
void sub_0202EDFC(SavePokegear *pokegear, u8 a1);
void Pokegear_RegisterCard(SavePokegear *pokegear, int card);
u8 Pokegear_GetRegisteredCardsArray(SavePokegear *pokegear);
void sub_0202EE58(SavePokegear *pokegear, u8 a1);
u8 sub_0202EE70(SavePokegear *pokegear);
u32 sub_0202EE7C(SavePokegear *pokegear);
void sub_0202EE84(SavePokegear *pokegear, u32 a1);
u16 sub_0202EE98(SavePokegear *pokegear);
u8 sub_0202EEA4(SavePokegear *pokegear);
void sub_0202EEA8(SavePokegear *pokegear, u8 a1);
void sub_0202EEAC(SavePokegear *pokegear, u16 a1, u16 a2);
void sub_0202EEB4(SavePokegear *pokegear, u16 *a1, u16 *a2);
u8 GSPlayerMisc_FindEmptyGearPhonebookSlot(SavePokegear *pokegear);
u8 GSPlayerMisc_IsGearNumberRegistered(SavePokegear *pokegear, u8 contact);
void RegisterPhoneNumberInPokeGear(SavePokegear *pokegear, u8 contact);
PhoneContact *GSPlayerMisc_AllocAndCopyPhonebook(SavePokegear *pokegear, HeapID heapId);
void GSPlayerMisc_SetPhonebookFromBuffer(SavePokegear *pokegear, PhoneContact *contacts, u8 num);
void sub_0202F01C(MomsSavings *momsSavings, u8 idx);
void sub_0202F050(MomsSavings *momsSavings, u8 idx);
BOOL sub_0202F08C(MomsSavings *momsSavings, u8 idx);
void PhoneRematches_SetSeeking(MomsSavings *momsSavings, u8 idx, BOOL state);
BOOL PhoneRematches_IsSeeking(MomsSavings *momsSavings, u8 idx);
void PhoneRematches_GiftItemIdSet(MomsSavings *momsSavings, u8 idx, u16 itemId);
u16 PhoneRematches_GiftItemIdGet(MomsSavings *momsSavings, u8 idx);
u32 MomSavingsBalanceAction(MomsSavings *momsSavings, int action, u32 operand);
void sub_0202F198(MomsSavings *momsSavings, u8 idx);
BOOL sub_0202F1B4(MomsSavings *momsSavings, u8 idx);
void sub_0202F1C4(MomsSavings *momsSavings, u16 a1, u16 a2);
void sub_0202F1F4(MomsSavings *momsSavings);
u16 sub_0202F224(MomsSavings *momsSavings, u8 a1, u16 *a2);
BOOL sub_0202F240(MomsSavings *momsSavings);
void sub_0202F254(MomsSavings *momsSavings, BOOL a1);
BOOL sub_0202F274(MomsSavings *momsSavings);
int sub_0202F284(MomsSavings *momsSavings);
void sub_0202F294(MomsSavings *momsSavings, int a1);
void sub_0202F300(MomsSavings *momsSavings, u8 *a1, u8 a2);
u8 *sub_0202F340(MomsSavings *momsSavings, u8 *a1, HeapID heapId);
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

#endif //POKEHEARTGOLD_SAVE_GS_PLAYER_MISC_H
