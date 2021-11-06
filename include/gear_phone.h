#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

struct PhoneBookEntry {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u16 unk4;
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
