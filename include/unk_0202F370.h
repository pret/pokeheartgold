#ifndef POKEHEARTGOLD_UNK_0202F370_H
#define POKEHEARTGOLD_UNK_0202F370_H

#include "global.h"

typedef struct UnkStruct_0202F3DC {
    u32 unk_0;
    u8 unk_4[4];
    u16 unk_8[4];
} UnkStruct_0202F3DC;

typedef struct UnkPokegearSub8 {
    u16 unk_0;
    u16 unk_2_0 : 4;
    u16 unk_2_4 : 4;
    u16 unk_2_8 : 4;
    u16 unk_2_C : 4;
    u16 unk_4[4];
} UnkPokegearSub8;

typedef struct UnkPokegearSub8List {
    UnkPokegearSub8 list[100];
} UnkPokegearSub8List;

BOOL sub_0202F370(UnkPokegearSub8 *unk);
void sub_0202F388(UnkPokegearSub8 *unk);
void sub_0202F3DC(struct UnkStruct_0202F3DC *unk);
BOOL sub_0202F400(struct UnkStruct_0202F3DC *unk);
void sub_0202F434(struct UnkStruct_0202F3DC *src, UnkPokegearSub8 *dest);
void sub_0202F4B0(UnkPokegearSub8 *src, struct UnkStruct_0202F3DC *dest);
BOOL sub_0202F4E8(UnkPokegearSub8List *list, u8 a1);
void sub_0202F500(UnkPokegearSub8List *list, u8 a1);
BOOL sub_0202F514(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2);
BOOL sub_0202F53C(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2, BOOL a3);

#endif // POKEHEARTGOLD_UNK_0202F370_H
