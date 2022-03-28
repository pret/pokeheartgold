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

#endif //POKEHEARTGOLD_GEAR_PHONE_H
