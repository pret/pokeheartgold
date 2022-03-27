#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "heap.h"

struct PhoneBookEntry {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 trainerClass;
    u16 trainerId;
    u16 unk6;
    u8 unk8[7];
    u8 unkF;
    u8 unk10[4];
};

struct PhoneBook {
    int count;
    struct PhoneBookEntry * entries;
};

struct UnkFsysSub_114 {
    u8 filler_00[0x1C];
    struct PhoneBookEntry entry;
};

struct PhoneBook *AllocAndReadPhoneBook(HeapID heapId);
void FreePhoneBook(struct PhoneBook *phoneBook);
u8 LoadPhoneBookEntryI(u16 idx, struct PhoneBookEntry *dest, HeapID heapId);
int GetPhoneMessageGmm(int idx);
BOOL sub_02095FF8(int x);

#endif //POKEHEARTGOLD_GEAR_PHONE_H
