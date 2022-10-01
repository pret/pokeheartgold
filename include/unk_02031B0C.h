#ifndef POKEHEARTGOLD_UNK_02031B0C_H
#define POKEHEARTGOLD_UNK_02031B0C_H

#include "save.h"

typedef struct SaveApricornBox SaveApricornBox;

SaveApricornBox *Save_ApricornBox_get(SAVEDATA *saveData);
void sub_02031CCC(SaveApricornBox *, int);
int ApricornBox_CountApricorn(SaveApricornBox *apricornBox, u32 a1);
void ApricornBox_GiveApricorn(SaveApricornBox *apricornBox, u16 a1, u8 a2);

#endif //POKEHEARTGOLD_UNK_02031B0C_H
