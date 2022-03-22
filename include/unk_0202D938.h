#ifndef POKEHEARTGOLD_UNK_0202D938_H
#define POKEHEARTGOLD_UNK_0202D938_H

#include "save.h"

typedef struct UnkSavStruct20 {
    u8 filler_00[14];
} UnkSavStruct20;

u32 sub_0202D938(void);
void sub_0202D93C(UnkSavStruct20* argP);
UnkSavStruct20* sub_0202D95C(SAVEDATA* data);

#endif //POKEHEARTGOLD_UNK_0202D938_H
