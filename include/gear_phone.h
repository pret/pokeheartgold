#ifndef POKEHEARTGOLD_GEAR_PHONE_H
#define POKEHEARTGOLD_GEAR_PHONE_H

#include "save.h"

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

struct UnkFsysSub_114 {
    u8 Unk_var0;
	u8 Unk_var1;
	u8 Unk_var2;
	u8 Unk_var3;
	u8 Unk_var4;
	u8 Unk_arr5[2];
	u8 Unk_var7;
	int Unk_var8;
	int Unk_varC;
	s16 Unk_var10;
	u16 Unk_var12;
	int Unk_var14;
	int Unk_var18;
    struct PhoneBookEntry entry; //0x1c
	int Unk_var30;
	int Unk_var34;
	SAVEDATA* data;
	u32 Unk_filler3c;
	void *Unk_ptr40;
	u8 Unk_var44;
};

#endif //POKEHEARTGOLD_GEAR_PHONE_H
