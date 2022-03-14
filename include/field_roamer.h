#ifndef POKEHEARTGOLD_FIELD_ROAMER_H
#define POKEHEARTGOLD_FIELD_ROAMER_H

#include "roamer.h"

void RoamerLocationUpdateRand(ROAMER_SAVE *roamer, u8 roamer_idx);
void Save_RandomizeRoamersLocation(ROAMER_SAVE *roamer);
void Save_UpdateRoamersLocation(ROAMER_SAVE *roamer);
u32 GetRoamMapByLocationIdx(u8 idx);
void UpdatePlayerLocationHistoryIfAnyRoamersActive(ROAMER_SAVE *roamers, u32 location);
void Save_CreateRoamerByID(SAVEDATA *saveData, u8 idx);
u8 SpeciesToRoamerIdx(u16 species);

#endif //POKEHEARTGOLD_FIELD_ROAMER_H
