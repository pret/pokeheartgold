#ifndef POKEHEARTGOLD_UNK_0203BA5C_H
#define POKEHEARTGOLD_UNK_0203BA5C_H

#include "script.h"

u16 GetMomSpawnId(void);
void GetDeathWarpData(u16 spawnId, Location *dest);
void GetSpecialSpawnWarpData(u16 spawnId, Location *dest);
u32 MapHeader_GetSpawnIdForDeathWarp(u32 mapId);

#endif // POKEHEARTGOLD_UNK_0203BA5C_H
