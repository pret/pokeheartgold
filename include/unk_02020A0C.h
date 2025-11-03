#ifndef POKEHEARTGOLD_UNK_02020A0C_H
#define POKEHEARTGOLD_UNK_02020A0C_H

#include "heap.h"

typedef struct UnkStruct_02020A0C {
    u8 left;
    u8 top;
    u8 width;
    u8 height;
    u8 buttonUp;
    u8 buttonDown;
    u8 buttonLeft;
    u8 buttonRight;
} UnkStruct_02020A0C;

void sub_02020A0C(const UnkStruct_02020A0C *a0, u8 *px, u8 *py);
void sub_02020A18(const UnkStruct_02020A0C *a0, u8 *pw, u8 *ph);
u8 sub_02020A24(const UnkStruct_02020A0C *a0, u8 *px, u8 *py, u8 *pw, u8 *ph, u8 partyMonIndex, u8 direction);

#endif // POKEHEARTGOLD_UNK_02020A0C_H
