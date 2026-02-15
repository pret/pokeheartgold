#ifndef POKEHEARTGOLD_UNK_020318C8_H
#define POKEHEARTGOLD_UNK_020318C8_H

#include "save.h"

struct UnkStruct_020318C8 {
    u32 unk_0;
    u32 unk_4;
};

u32 sub_020318C8(void);
void sub_020318CC(struct UnkStruct_020318C8 *a0);
struct UnkStruct_020318C8 *sub_020318E8(SaveData *save);
u32 sub_020318F4(struct UnkStruct_020318C8 *a0);
u32 sub_020318F8(struct UnkStruct_020318C8 *a0);
void sub_020318FC(struct UnkStruct_020318C8 *a0, u32 a1);
void sub_02031900(struct UnkStruct_020318C8 *a0, u32 a1);

#endif // POKEHEARTGOLD_UNK_020318C8_H
