#ifndef POKEHEARTGOLD_UNK_02031B0C_H
#define POKEHEARTGOLD_UNK_02031B0C_H

#include "save.h"

typedef struct UnkStruct_02031CEC {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u32 unk4;
} UnkStruct_02031CEC; // size: 0x8

typedef struct SaveApricornBox SaveApricornBox;

SaveApricornBox *Save_ApricornBox_Get(SaveData *saveData);
void sub_02031CCC(SaveApricornBox *, int);
BOOL sub_02031CEC(SaveApricornBox *apricornBox, u16 a1, UnkStruct_02031CEC *a2);
int sub_02031D80(UnkStruct_02031CEC *a0);
String *sub_020322AC(SaveApricornBox *apricornBox, u16 a1, u32 a2);
String *sub_02032308(SaveApricornBox *apricornBox, u16 a1, u32 a2);
int ApricornBox_CountApricorn(SaveApricornBox *apricornBox, u32 a1);
void ApricornBox_GiveApricorn(SaveApricornBox *apricornBox, u16 a1, u8 a2);
int ApricornBox_GetKurtQuantity(SaveApricornBox *apricornBox);
void ApricornBox_SetKurtApricorn(SaveApricornBox *apricornBox, u32 a0, u32 a1);
int ApricornBox_GetKurtBall(SaveApricornBox *apricornBox);

#endif // POKEHEARTGOLD_UNK_02031B0C_H
