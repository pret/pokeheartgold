#ifndef POKEHEARTGOLD_UNK_020648EC_H
#define POKEHEARTGOLD_UNK_020648EC_H

#include "field_system.h"

void Gymmick_Init(FieldSystem *fieldSystem);
void Gymmick_Free(FieldSystem *fieldSystem);
BOOL Gymmick_CheckCollision(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, u32 isColliding);

#endif // POKEHEARTGOLD_UNK_020648EC_H
