#ifndef POKEHEARTGOLD_UNK_02097D3C_H
#define POKEHEARTGOLD_UNK_02097D3C_H

#include "field_types_def.h"
#include "save.h"

typedef struct UnkStruct_02097D56 {
    u16 unk_0;
    u16 unk_2;
    SaveData *saveData;
} UnkStruct_02097D56;

typedef struct UnkStruct_02097D48 {
    u32 state;
    UnkStruct_02097D56 *args;
} UnkStruct_02097D48;

void sub_02097D3C(FieldSystem *fieldSystem, u8 a1, u8 a2);

#endif //POKEHEARTGOLD_UNK_02097D3C_H
