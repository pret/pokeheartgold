#ifndef POKEHEARTGOLD_FIELD_ROAMER_H
#define POKEHEARTGOLD_FIELD_ROAMER_H

#include "roamer.h"

void RoamerLocationUpdateRand(RoamerSaveData *roamer, u8 roamer_idx);
void Save_RandomizeRoamersLocation(RoamerSaveData *roamer);
void Save_UpdateRoamersLocation(RoamerSaveData *roamer);
u32 GetRoamMapByLocationIdx(u8 idx);
void UpdatePlayerLocationHistoryIfAnyRoamersActive(RoamerSaveData *roamers, u32 location);
void Save_CreateRoamerByID(SaveData *saveData, u8 idx);
u8 SpeciesToRoamerIdx(u16 species);

#endif // POKEHEARTGOLD_FIELD_ROAMER_H
