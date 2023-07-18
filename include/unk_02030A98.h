#ifndef POKEHEARTGOLD_UNK_02030A98_H
#define POKEHEARTGOLD_UNK_02030A98_H

#include "save.h"

struct UnkStruct_02030A98 {
    u8 filler_000[0xBA0];
}; // size = 0xBA0

void sub_02030AA4(u32, u32, u8, u8*);
int sub_02030C5C(SaveData*);
int sub_02030CA0(int, int, u8, int, int);
int sub_02030AE8(SaveData*);
void sub_02030C6C(u32, u32, u32, u32, u8*);
void sub_02030CC8(SaveData *saveData);
u32 sub_02030E08(SaveData *saveData);
void sub_02030E18(u32, u32, u32, u32, u8*);
u32 sub_02030E58(u32, u32, u8, u32, u32);
void sub_02030B04(SaveData*);
void *sub_02030E88(SaveData *saveData);
void *sub_02030FA0(SaveData *saveData);
void sub_02030FB0(void*, u32, u32, u32, u8*);
u32 sub_02030FE4(void*, u32, u8, u32, u32);
void *sub_0203107C(SaveData *saveData);
void sub_020310A0(SaveData *saveData);
int sub_020310BC(void*, int, int);
void sub_02031084(SaveData *saveData);
void sub_02031108(void*, int, int, int);
u32 *sub_020312C4(SaveData *saveData, u32 a1, u32 *out);
u32 sub_020312E0(SaveData *saveData, u32 *a1, u32 a2, u32 a3);

#endif //POKEHEARTGOLD_UNK_02030A98_H
