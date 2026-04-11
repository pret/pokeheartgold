#ifndef POKEHEARTGOLD_UNK_020318C8_H
#define POKEHEARTGOLD_UNK_020318C8_H

#include "save.h"

typedef struct {
    u32 activityId;
    u32 rank;
} UnkStruct_020318C8;

u32 UnkStruct_020318C8_Sizeof(void);
void UnkStruct_020318C8_Init(UnkStruct_020318C8 *data);
UnkStruct_020318C8 *UnkStruct_020318C8_Get(SaveData *saveData);
u32 UnkStruct_020318C8_GetActivityId(UnkStruct_020318C8 *data);
u32 UnkStruct_020318C8_GetRank(UnkStruct_020318C8 *data);
void UnkStruct_020318C8_SetActivityId(UnkStruct_020318C8 *data, u32 activityId);
void UnkStruct_020318C8_SetRank(UnkStruct_020318C8 *data, u32 rank);

#endif // POKEHEARTGOLD_UNK_020318C8_H
