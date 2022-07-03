#ifndef POKEHEARTGOLD_GYMMICK_ECRUTEAK_H
#define POKEHEARTGOLD_GYMMICK_ECRUTEAK_H

#include "fieldmap.h"

void InitEcruteakGymPuzzleGimmick(FieldSystem *fsys);
void DeleteEcruteakGymPuzzleGimmick(FieldSystem *fsys);
void Fsys_EcruteakGymEyeTrainerApproachCarryCandleEffectBegin(FieldSystem *fsys);
void Fsys_EcruteakGymTrainerApproachCarryCandleEffectEnd(FieldSystem *fsys);
void Fsys_EcruteakGymExtinguishCandle(FieldSystem *fsys, enum ScriptEnvField a1);

#endif //POKEHEARTGOLD_GYMMICK_ECRUTEAK_H
