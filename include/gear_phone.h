#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "heap.h"

#define CONTACTS_SORT_TITLE    0
#define CONTACTS_SORT_ALPHABET 1
#define CONTACTS_SORT_LOCATION 2
#define CONTACTS_SORT_MOVE     3

typedef struct PhoneBookEntry {
    u8 id;                  // 0x00
    u8 type;                // 0x01
    u8 unk2;                // 0x02
    u8 trainerClass;        // 0x03
    u16 trainerId;          // 0x04
    u16 mapId;              // 0x06
    u16 gift;               // 0x08
    u16 phoneScriptIfLocal; // 0x0A
    u8 unkC;                // 0x0C
    u8 rematchWeekday;      // 0x0D
    u8 rematchTimeOfDay;    // 0xE
    u8 unkF;                // 0x0F
    u8 sortParam[4];        // 0x10
} PhoneBookEntry;

typedef struct PhoneBook {
    int count;
    struct PhoneBookEntry *entries;
} PhoneBook;

#endif // POKEHEARTGOLD_GEAR_PHONE_H
