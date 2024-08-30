#ifndef POKEHEARTGOLD_UNK_0203170C_H
#define POKEHEARTGOLD_UNK_0203170C_H

#include "save.h"

typedef struct {
    char unk0[0x33];
    u8 unk33;
    u32 unk34;
    u16 unk38;
    u16 unk3a;
    u32 unk3c;
} Unk0203170C;

typedef struct {
    u8 version;
    u8 language;
    u8 unk2;
    u8 unk3;
    u32 otId;
    u16 name[PLAYER_NAME_LENGTH + 1];
    u32 unk18;
    u8 unk1c[0x8];
    char unk24[0x33];
    u8 unk57[0x5];
    u32 unk5c;
    u16 unk60;
    u16 unk62;
} Unk020317F4;

u32 sub_0203170C(void);
void sub_02031710(Unk0203170C *a0);
void sub_02031734(SaveData *saveData);
BOOL sub_02031744(SaveData *saveData);
void sub_0203175C(SaveData *saveData, char *a1);
Unk0203170C *sub_02031774(SaveData *saveData);
void sub_02031780(SaveData *saveData, u32 a1, u32 a2);
u32 sub_020317BC(SaveData *saveData, u32 a1);
s32 sub_0203186C(SaveData *saveData, Unk020317F4 *a1);
void sub_0203189C(SaveData *saveData, Unk020317F4 *a1);

#endif // POKEHEARTGOLD_UNK_0203170C_H
