#ifndef POKEHEARTGOLD_UNK_02054E00_H
#define POKEHEARTGOLD_UNK_02054E00_H

#include "script.h"
#include "field_system.h"
#include "field_types_def.h"

BOOL MapModel_IsHeadbuttTree(u32 mapModelNo);
u16 MapCoordToMatrixIndex(FieldSystem* fieldSystem, int coordX, int coordY);
void sub_02054EB0(FieldSystem *fieldSystem, int a1, BOOL a2);

#endif // POKEHEARTGOLD_UNK_02054E00_H
