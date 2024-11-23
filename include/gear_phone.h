#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "heap.h"

typedef struct PhoneBookEntry {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 trainerClass;
    u16 trainerId;
    u16 mapId;
    u16 gift;
    u8 unkA[5];
    u8 unkF;
    u8 unk10[4];
} PhoneBookEntry;

typedef struct PhoneBook {
    int count;
    struct PhoneBookEntry *entries;
} PhoneBook;

#endif // POKEHEARTGOLD_GEAR_PHONE_H
