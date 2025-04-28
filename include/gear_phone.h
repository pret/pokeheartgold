#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "heap.h"

typedef struct PhoneBookEntry {
    u8 unk0;         // 0x00
    u8 unk1;         // 0x01
    u8 unk2;         // 0x02
    u8 trainerClass; // 0x03
    u16 trainerId;   // 0x04
    u16 mapId;       // 0x06
    u16 gift;        // 0x08
    u16 unkA;        // 0x0A
    u8 unkC;         // 0x0C
    u8 unkD;         // 0x0D
    u8 unkE;         // 0xE
    u8 unkF;         // 0x0F
    u8 unk10[4];     // 0x10
} PhoneBookEntry;

typedef struct PhoneBook {
    int count;
    struct PhoneBookEntry *entries;
} PhoneBook;

#endif // POKEHEARTGOLD_GEAR_PHONE_H
