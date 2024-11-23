#ifndef POKEHEARTGOLD_OV_01_021E6880_H
#define POKEHEARTGOLD_OV_01_021E6880_H

#include "field_system.h"

void FieldInput_Update(FieldInput *a0, FieldSystem *fieldSystem, u16 newKeys, u16 heldKeys);
int FieldInput_Process(FieldInput *a0, FieldSystem *fieldSystem);
BOOL FieldInput_Process_Colosseum(FieldInput *a0, FieldSystem *fieldSystem);
BOOL FieldInput_Process_UnionRoom(FieldInput *a0, FieldSystem *fieldSystem);
BOOL FieldInput_Process_BattleTower(FieldInput *a0, FieldSystem *fieldSystem);
void ov01_021E7F00(FieldSystem *fieldSystem, BOOL a1);

#endif
