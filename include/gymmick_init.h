#ifndef POKEHEARTGOLD_GYMMICK_INIT_H
#define POKEHEARTGOLD_GYMMICK_INIT_H

#include "script.h"

void InitEcruteakGym(FieldSystem *fieldSystem);
void InitCianwoodGym(FieldSystem *fieldSystem);
void InitVermilionGym(FieldSystem *fieldSystem);
void PlaceVermilionGymSwitches(FieldSystem *fieldSystem);
void InitVioletGym(FieldSystem *fieldSystem);
void InitAzaleaGym(FieldSystem *fieldSystem);
void InitBlackthornGym(FieldSystem *fieldSystem);
void InitFuchsiaGym(FieldSystem *fieldSystem);
void InitViridianGym(FieldSystem *fieldSystem);
BOOL FieldSystem_IsSaveGymmickTypeEqualTo(FieldSystem *fieldSystem, int kind);

#endif // POKEHEARTGOLD_GYMMICK_INIT_H
