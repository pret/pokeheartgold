#ifndef POKEHEARTGOLD_UNK_020318C8_H
#define POKEHEARTGOLD_UNK_020318C8_H

#include "save.h"

typedef struct {
    u32 unk_0;
    u32 unk_4;
} UnkStruct_020318C8;

u32 UnkStruct_020318C8_Sizeof(void);
void UnkStruct_020318C8_Init(UnkStruct_020318C8 *a0);
UnkStruct_020318C8 *UnkStruct_020318C8_Get(SaveData *saveData);
u32 UnkStruct_020318C8_GetUnk0(UnkStruct_020318C8 *a0);
u32 UnkStruct_020318C8_GetUnk4(UnkStruct_020318C8 *a0);
void UnkStruct_020318C8_SetUnk0(UnkStruct_020318C8 *a0, u32 a1);
void UnkStruct_020318C8_SetUnk4(UnkStruct_020318C8 *a0, u32 a1);

#endif // POKEHEARTGOLD_UNK_020318C8_H
