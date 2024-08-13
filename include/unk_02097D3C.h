#ifndef POKEHEARTGOLD_UNK_02097D3C_H
#define POKEHEARTGOLD_UNK_02097D3C_H

typedef struct UnkStruct_02097D56 {
    u16 unk00;
    u16 unk02;
    SaveData *saveData;
} UnkStruct_02097D56;

typedef struct UnkStruct_02097D48 {
    u32 unk00;
    UnkStruct_02097D56 *unk04;
} UnkStruct_02097D48;

typedef struct UnkStruct_02097D8E {
    u32 state;
    UnkStruct_02097D48 *unk04;
} UnkStruct_02097D8E;

void sub_02097D3C(FieldSystem *fieldSystem, u8 a1, u8 a2);

#endif //POKEHEARTGOLD_UNK_02097D3C_H
