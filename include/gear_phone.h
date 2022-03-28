#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "constants/phone_contacts.h"

typedef struct PhoneContacts {
    u8 contacts[NUM_PHONE_CONTACTS];
} PhoneContacts;

typedef struct PhoneRematch {
    u16 unk_0_2:6;
    u16 unk_0_1:1;
    u16 unk_0_0:1;
    u16 unk_2;
} PhoneRematch; // size=0x4

typedef struct MomsSavings {
    PhoneRematch rematches[NUM_PHONE_CONTACTS];
    u16 unk_12C[5][2];
    u32 bankBalance; // 140
    u16 unk_144;
    u8 unk_146:7;
    u8 unk_14E[2];
    u8 unk_147[7];
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

typedef struct SavePokegear {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u32 unk_4_0:18;
    u32 unk_4_18:7;
    u32 unk_4_25:2;
    u32 unk_4_27:2;
    UnkPokegearSub8 unk_8[100];
    u32 unk_4_29:3;
    MomsSavings momsSavings; // 4B8
    PhoneContacts phoneContacts; // 60C
} SavePokegear;

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
    u32 count;
    struct PhoneBookEntry * entries;
};

#endif //POKEHEARTGOLD_GEAR_PHONE_H
